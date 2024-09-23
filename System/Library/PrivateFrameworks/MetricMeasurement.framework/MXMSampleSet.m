@implementation MXMSampleSet

- (MXMSample)min
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  double __C;

  if (-[MXMSampleSet length](self, "length"))
  {
    __C = 0.0;
    vDSP_minvD(-[MXMSampleSet doubleValues](self, "doubleValues"), 1, &__C, -[MXMSampleSet length](self, "length"));
    v3 = [MXMSample alloc];
    -[MXMSampleSet tag](self, "tag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __C;
    -[MXMSampleSet unit](self, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MXMSample)max
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  double __C;

  if (-[MXMSampleSet length](self, "length"))
  {
    __C = 0.0;
    vDSP_maxvD(-[MXMSampleSet doubleValues](self, "doubleValues"), 1, &__C, -[MXMSampleSet length](self, "length"));
    v3 = [MXMSample alloc];
    -[MXMSampleSet tag](self, "tag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __C;
    -[MXMSampleSet unit](self, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MXMSample)distance
{
  double *v4;
  double *v5;
  double *v6;
  double v7;
  MXMSample *v8;
  void *v9;
  void *v10;
  void *v11;
  MXMSample *v12;
  void *v14;

  if (-[MXMSampleSet length](self, "length") == 2)
  {
    v4 = -[MXMSampleSet firstDoubleValue](self, "firstDoubleValue");
    v5 = -[MXMSampleSet lastDoubleValue](self, "lastDoubleValue");
    v6 = v5;
    if (!v4 || !v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleSet+Stats.m"), 32, CFSTR("Length is correct (2), but failed to retrieve values from set. Internal Error."));

    }
    v7 = vabdd_f64(*v4, *v6);
    v8 = [MXMSample alloc];
    -[MXMSampleSet tag](self, "tag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet unit](self, "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v8, "initWithTag:attributes:doubleValue:unit:", v9, v10, v11, v7);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (MXMSampleSet)range
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  MXMSampleSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MXMSampleSet *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (-[MXMSampleSet length](self, "length"))
  {
    -[MXMSampleSet min](self, "min");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    v5 = v4;

    -[MXMSampleSet max](self, "max");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    v16[0] = v5;
    v16[1] = v8;
    v9 = [MXMSampleSet alloc];
    -[MXMSampleSet timeIndex](self, "timeIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet tag](self, "tag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet unit](self, "unit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSampleSet attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MXMSampleSet initWithTime:tag:unit:attributes:doubleValues:length:](v9, "initWithTime:tag:unit:attributes:doubleValues:length:", v10, v11, v12, v13, v16, 2);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (MXMSample)geoMean
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  uint64_t v10;
  double __Mean;

  __Mean = 0.0;
  vDSP_normalizeD(-[MXMSampleSet doubleValues](self, "doubleValues", 0), 1, 0, 0, &__Mean, (double *)&v10, -[MXMSampleSet length](self, "length"));
  v3 = [MXMSample alloc];
  -[MXMSampleSet tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = __Mean;
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  return v8;
}

- (MXMSample)standardDeviation
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  double v10;
  double __Mean;

  v10 = 0.0;
  __Mean = 0.0;
  vDSP_normalizeD(-[MXMSampleSet doubleValues](self, "doubleValues"), 1, 0, 0, &__Mean, &v10, -[MXMSampleSet length](self, "length"));
  v3 = [MXMSample alloc];
  -[MXMSampleSet tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  return v8;
}

- (MXMSample)relativeStandardDeviation
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  double v10;
  double __Mean;

  v10 = 0.0;
  __Mean = 0.0;
  vDSP_normalizeD(-[MXMSampleSet doubleValues](self, "doubleValues"), 1, 0, 0, &__Mean, &v10, -[MXMSampleSet length](self, "length"));
  v3 = [MXMSample alloc];
  -[MXMSampleSet tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10 / __Mean;
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  return v8;
}

- (MXMSample)sum
{
  MXMSample *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  MXMSample *v8;
  double __C;

  __C = 0.0;
  vDSP_sveD(-[MXMSampleSet doubleValues](self, "doubleValues"), 1, &__C, -[MXMSampleSet length](self, "length"));
  v3 = [MXMSample alloc];
  -[MXMSampleSet tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = __C;
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v3, "initWithTag:attributes:doubleValue:unit:", v4, v5, v7, v6);

  return v8;
}

- (double)lastDoubleValue
{
  double *v3;

  v3 = -[MXMSampleSet doubleValues](self, "doubleValues");
  return &v3[-[MXMSampleSet length](self, "length") - 1];
}

- (double)doubleValues
{
  return (double *)self->_underlyingBuffer;
}

- (NSArray)samples
{
  void *v3;
  NSArray **p_cachedSamples;
  NSArray *v5;
  NSArray *cachedSamples;
  unint64_t v7;
  NSArray *v8;
  MXMSample *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  MXMSample *v15;

  -[MXMSampleSet cachedSamples](self, "cachedSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    p_cachedSamples = &self->_cachedSamples;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_index->var1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    p_cachedSamples = &self->_cachedSamples;
    cachedSamples = self->_cachedSamples;
    self->_cachedSamples = v5;

    if (self->_index->var1)
    {
      v7 = 0;
      do
      {
        v8 = self->_cachedSamples;
        v9 = [MXMSample alloc];
        -[MXMSampleSet tag](self, "tag");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXMSampleSet attributes](self, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MXMSampleSet doubleValues](self, "doubleValues")[8 * v7];
        -[MXMSampleSet unit](self, "unit");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXMSampleSet timeIndex](self, "timeIndex");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MXMSample initWithTag:attributes:doubleValue:unit:timestamp:](v9, "initWithTag:attributes:doubleValue:unit:timestamp:", v10, v11, v13, (unint64_t)*(double *)(objc_msgSend(v14, "doubleValues") + 8 * v7), v12);
        -[NSArray addObject:](v8, "addObject:", v15);

        ++v7;
      }
      while (v7 < self->_index->var1);
    }
  }
  return *p_cachedSamples;
}

- (unint64_t)length
{
  return self->_index->var1;
}

- (NSSet)attributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[MXMSampleSet attributesMap](self, "attributesMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)attributeWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXMSampleSet attributesMap](self, "attributesMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MXMSampleSet)initWithTag:(id)a3 unit:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  MXMSampleTimeSeries *v11;
  MXMSampleSet *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(MXMSampleTimeSeries);
  v12 = -[MXMSampleSet initWithTime:tag:unit:attributes:](self, "initWithTime:tag:unit:attributes:", v11, v10, v9, v8);

  return v12;
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6
{
  return -[MXMSampleSet initWithTime:tag:unit:attributes:doubleValues:length:](self, "initWithTime:tag:unit:attributes:doubleValues:length:", a3, a4, a5, a6, 0, 0);
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 doubleValues:(double *)a7 length:(unint64_t)a8
{
  return -[MXMSampleSet initWithTime:tag:unit:attributes:values:length:valueSize:](self, "initWithTime:tag:unit:attributes:values:length:valueSize:", a3, a4, a5, a6, a7, a8, 8);
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 values:(void *)a7 length:(unint64_t)a8 valueSize:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  MXMSampleSet *v20;
  MXMSampleSet *v21;
  uint64_t v22;
  MXMSampleTag *tag;
  uint64_t v24;
  NSUnit *unit;
  uint64_t v26;
  NSMutableDictionary *attributesMap;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *v37;
  void *v38;
  id v40;
  id v41;
  const void *__src;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v48.receiver = self;
  v48.super_class = (Class)MXMSampleSet;
  v20 = -[MXMSampleSet init](&v48, sel_init);
  v21 = v20;
  if (v20)
  {
    __src = a7;
    v43 = v16;
    objc_storeStrong((id *)&v20->_timeIndex, a3);
    v41 = v17;
    v22 = objc_msgSend(v17, "copy");
    tag = v21->_tag;
    v21->_tag = (MXMSampleTag *)v22;

    v40 = v18;
    v24 = objc_msgSend(v18, "copy");
    unit = v21->_unit;
    v21->_unit = (NSUnit *)v24;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    attributesMap = v21->_attributesMap;
    v21->_attributesMap = (NSMutableDictionary *)v26;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v19;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v34 = (void *)objc_msgSend(v33, "copy");
          v35 = v21->_attributesMap;
          objc_msgSend(v33, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, v36);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v30);
    }

    v37 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v21->_index = v37;
    v37->var0 = a9;
    v37->var1 = a8;
    v21->_underlyingBufferLength = a9 * a8;
    v38 = malloc_type_malloc(a9 * a8, 0xF58C802EuLL);
    v21->_underlyingBuffer = v38;
    memcpy(v38, __src, v21->_index->var0 * a8);
    v16 = v43;
    v18 = v40;
    v17 = v41;
  }

  return v21;
}

- (id)sampleWithIndex:(unint64_t)a3
{
  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[MXMSampleSet samples](self, "samples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  MXMSampleSet *v4;
  id v5;

  v5 = a3;
  -[MXMSampleSet timeIndex](self, "timeIndex");
  v4 = (MXMSampleSet *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    objc_msgSend(v5, "encodeObject:forKey:", self->_timeIndex, CFSTR("_timeIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tag, CFSTR("_tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unit, CFSTR("_unit"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_index, 16, CFSTR("_index"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_underlyingBuffer, self->_index->var1 * self->_index->var0, CFSTR("_underlyingBuffer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributesMap, CFSTR("_attributesMap"));

}

- (MXMSampleSet)initWithCoder:(id)a3
{
  id v4;
  MXMSampleSet *v5;
  uint64_t v6;
  MXMSampleTimeSeries *timeIndex;
  uint64_t v8;
  MXMSampleTag *tag;
  uint64_t v10;
  NSUnit *unit;
  id v12;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *v13;
  unint64_t var1;
  unint64_t var0;
  size_t v16;
  id v17;
  const void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *attributesMap;
  MXMSampleSet *v25;
  uint64_t v27;
  unint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MXMSampleSet;
  v5 = -[MXMSampleSet init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeIndex"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeIndex = v5->_timeIndex;
    v5->_timeIndex = (MXMSampleTimeSeries *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tag"));
    v8 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_unit"));
    v10 = objc_claimAutoreleasedReturnValue();
    unit = v5->_unit;
    v5->_unit = (NSUnit *)v10;

    v5->_index = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v28 = 0;
    v12 = objc_retainAutorelease(v4);
    v13 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("_index"), &v28);
    if (v28 < 0x10)
      goto LABEL_7;
    *v5->_index = *v13;
    var0 = v5->_index->var0;
    var1 = v5->_index->var1;
    if (!is_mul_ok(var1, var0)
      || (v16 = var1 * var0,
          v5->_underlyingBuffer = malloc_type_malloc(var1 * var0, 0x90F1E023uLL),
          v27 = 0,
          v17 = objc_retainAutorelease(v12),
          v18 = (const void *)objc_msgSend(v17, "decodeBytesForKey:returnedLength:", CFSTR("_underlyingBuffer"), &v27),
          v16 != v27))
    {
LABEL_7:
      v25 = 0;
      goto LABEL_8;
    }
    memcpy(v5->_underlyingBuffer, v18, v16);
    v5->_underlyingBufferLength = v16;
    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "decodeObjectOfClasses:forKey:", v22, CFSTR("_attributesMap"));
    v23 = objc_claimAutoreleasedReturnValue();
    attributesMap = v5->_attributesMap;
    v5->_attributesMap = (NSMutableDictionary *)v23;

  }
  v25 = v5;
LABEL_8:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  return -[MXMSampleSet copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MXMSampleSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MXMSampleSet *v9;

  v4 = [MXMSampleSet alloc];
  -[MXMSampleSet timeIndex](self, "timeIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet tag](self, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MXMSampleSet initWithTime:tag:unit:attributes:values:length:valueSize:](v4, "initWithTime:tag:unit:attributes:values:length:valueSize:", v5, v6, v7, v8, self->_underlyingBuffer, self->_index->var1, self->_index->var0);

  return v9;
}

- (id)mutableCopy
{
  return -[MXMSampleSet mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MXMMutableSampleSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MXMMutableSampleSet *v9;

  v4 = [MXMMutableSampleSet alloc];
  -[MXMSampleSet timeIndex](self, "timeIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet tag](self, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleSet attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MXMSampleSet initWithTime:tag:unit:attributes:values:length:valueSize:](v4, "initWithTime:tag:unit:attributes:values:length:valueSize:", v5, v6, v7, v8, self->_underlyingBuffer, self->_index->var1, self->_index->var0);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_underlyingBuffer);
  free(self->_index);
  v3.receiver = self;
  v3.super_class = (Class)MXMSampleSet;
  -[MXMSampleSet dealloc](&v3, sel_dealloc);
}

- (void)_prepareUnderlyingBufferSizeWithAdditionalBytes:(unint64_t)a3
{
  MXMSampleSet *v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *index;
  unint64_t var0;
  unint64_t v7;
  size_t v8;
  void *v9;
  id v10;
  MXMSampleSet *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  index = obj->_index;
  var0 = index->var0;
  v7 = a3 + index->var1 * index->var0;
  if (v7 > obj->_underlyingBufferLength)
  {
    v8 = v7 + 10 * var0;
    obj->_underlyingBufferLength = v8;
    v9 = malloc_type_realloc(obj->_underlyingBuffer, v8, 0x2B8D194DuLL);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MetricMeasurement"), CFSTR("Failed to allocate more space for samples."), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    obj->_underlyingBuffer = v9;
    v4 = obj;
  }
  objc_sync_exit(v4);

}

- (void)_appendAttribute:(id)a3
{
  NSMutableDictionary *attributesMap;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;

  attributesMap = self->_attributesMap;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attributesMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleSet.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_attributesMap[attribute.name]"));

  }
  v9 = self->_attributesMap;
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v10);

  -[MXMSampleSet setCachedSamples:](self, "setCachedSamples:", 0);
}

- (void)_appendDoubleValue:(double)a3 timestamp:(unint64_t)a4
{
  MXMSampleSet *v6;
  void *v7;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *index;
  unint64_t var1;

  v6 = self;
  objc_sync_enter(v6);
  -[MXMSampleSet _prepareUnderlyingBufferSizeWithAdditionalBytes:](v6, "_prepareUnderlyingBufferSizeWithAdditionalBytes:", 8);
  -[MXMSampleSet timeIndex](v6, "timeIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_appendAbsoluteTime:", a4);

  index = v6->_index;
  var1 = index->var1;
  *((double *)v6->_underlyingBuffer + var1) = a3;
  index->var1 = var1 + 1;
  objc_sync_exit(v6);

  -[MXMSampleSet setCachedSamples:](v6, "setCachedSamples:", 0);
}

- (void)_appendSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MXMSampleSet _appendSample:](self, "_appendSample:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_appendSample:(id)a3
{
  double v4;
  id v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "valueType"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Not implemented"), CFSTR("Not implemented"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  objc_msgSend(v6, "floatValue");
  -[MXMSampleSet _appendDoubleValue:timestamp:](self, "_appendDoubleValue:timestamp:", objc_msgSend(v6, "timestamp"), v4);

}

- (MXMSampleTag)tag
{
  return (MXMSampleTag *)objc_getProperty(self, a2, 8, 1);
}

- (NSUnit)unit
{
  return (NSUnit *)objc_getProperty(self, a2, 16, 1);
}

- (MXMSampleTimeSeries)timeIndex
{
  return (MXMSampleTimeSeries *)objc_getProperty(self, a2, 24, 1);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)index
{
  return self->_index;
}

- (void)setIndex:(id *)a3
{
  self->_index = a3;
}

- (void)underlyingBuffer
{
  return self->_underlyingBuffer;
}

- (void)setUnderlyingBuffer:(void *)a3
{
  self->_underlyingBuffer = a3;
}

- (int64_t)underlyingBufferLength
{
  return self->_underlyingBufferLength;
}

- (void)setUnderlyingBufferLength:(int64_t)a3
{
  self->_underlyingBufferLength = a3;
}

- (NSArray)cachedSamples
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedSamples:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)attributesMap
{
  return self->_attributesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesMap, 0);
  objc_storeStrong((id *)&self->_cachedSamples, 0);
  objc_storeStrong((id *)&self->_timeIndex, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
