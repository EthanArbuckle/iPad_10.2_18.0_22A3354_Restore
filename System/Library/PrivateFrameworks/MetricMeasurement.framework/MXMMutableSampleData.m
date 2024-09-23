@implementation MXMMutableSampleData

- (void)appendAttributes:(id)a3
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
        -[MXMSampleData _appendAttribute:](self, "_appendAttribute:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)appendData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleData;
  -[MXMSampleData _appendData:](&v3, sel__appendData_, a3);
}

- (void)appendSet:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleData;
  -[MXMSampleData _appendSet:](&v3, sel__appendSet_, a3);
}

- (id)appendSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MXMMutableSampleSet *v8;
  void *v9;
  void *v10;
  void *v11;
  MXMMutableSampleSet *v12;
  double v13;
  double v14;
  void *v15;
  MXMMutableSampleData *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleData sampleSetWithTag:attributes:](self, "sampleSetWithTag:attributes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [MXMMutableSampleSet alloc];
    objc_msgSend(v4, "tag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MXMSampleSet initWithTag:unit:attributes:](v8, "initWithTag:unit:attributes:", v9, v10, v11);
    -[MXMSampleData _appendSet:](self, "_appendSet:", v12);

  }
  switch(objc_msgSend(v4, "valueType"))
  {
    case 0:
      objc_msgSend(v4, "floatValue");
      v14 = v13;
      objc_msgSend(v4, "tag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXMMutableSampleData appendDoubleValue:tag:timestamp:](self, "appendDoubleValue:tag:timestamp:", v15, objc_msgSend(v4, "timestamp"), v14);
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v17 = objc_msgSend(v4, "integerValue");
      objc_msgSend(v4, "tag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXMMutableSampleData appendIntegerValue:tag:timestamp:](self, "appendIntegerValue:tag:timestamp:", v17, v15, objc_msgSend(v4, "timestamp"));
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v18 = objc_msgSend(v4, "unsignedValue");
      objc_msgSend(v4, "tag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXMMutableSampleData appendUnsignedIntegerValue:tag:timestamp:](self, "appendUnsignedIntegerValue:tag:timestamp:", v18, v15, objc_msgSend(v4, "timestamp"));
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      self = v16;

      break;
    case 3:
      v20 = (id)objc_opt_new();
      objc_exception_throw(v20);
    default:
      break;
  }

  return self;
}

- (id)appendFloatValue:(float)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  void *v9;
  void *v10;
  double v11;
  void *v13;

  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  *(float *)&v11 = a3;
  objc_msgSend(v10, "appendFloatValue:timestamp:", a5, v11);
  return v10;
}

- (id)appendDoubleValue:(double)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v12;

  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  objc_msgSend(v10, "appendDoubleValue:timestamp:", a5, a3);
  return v10;
}

- (id)appendUnsignedIntValue:(unsigned int)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v12;

  v6 = *(_QWORD *)&a3;
  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  objc_msgSend(v10, "appendUnsignedIntValue:timestamp:", v6, a5);
  return v10;
}

- (id)appendIntValue:(int)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v12;

  v6 = *(_QWORD *)&a3;
  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  objc_msgSend(v10, "appendIntValue:timestamp:", v6, a5);
  return v10;
}

- (id)appendIntegerValue:(int64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v12;

  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  objc_msgSend(v10, "appendIntegerValue:timestamp:", a3, a5);
  return v10;
}

- (id)appendUnsignedIntegerValue:(unint64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v12;

  -[MXMSampleData sampleSetsWithTag:](self, "sampleSetsWithTag:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleData.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  objc_msgSend(v10, "appendUnsignedIntegerValue:timestamp:", a3, a5);
  return v10;
}

- (id)copy
{
  return -[MXMMutableSampleData copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleData;
  return -[MXMSampleData mutableCopyWithZone:](&v4, sel_mutableCopyWithZone_, a3);
}

@end
