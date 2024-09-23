@implementation NPAverage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPAverage)initWithSampleSize:(unint64_t)a3
{
  NPAverage *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPAverage;
  result = -[NPAverage init](&v6, sel_init);
  if (result)
  {
    v5 = 5;
    if (a3)
      v5 = a3;
    result->_size = v5;
  }
  return result;
}

- (NPAverage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NPAverage *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AverageSampleSize"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AverageSamples"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NPAverage initWithSampleSize:](self, "initWithSampleSize:", v5);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    -[NPAverage setSamples:](v10, "setSamples:", v11);

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPAverage size](self, "size"), CFSTR("AverageSampleSize"));
  -[NPAverage samples](self, "samples");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AverageSamples"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NPAverage *v4;
  void *v5;
  void *v6;

  v4 = -[NPAverage init](+[NPAverage allocWithZone:](NPAverage, "allocWithZone:", a3), "init");
  -[NPAverage setSize:](v4, "setSize:", -[NPAverage size](self, "size"));
  -[NPAverage samples](self, "samples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[NPAverage setSamples:](v4, "setSamples:", v6);

  return v4;
}

- (void)addSample:(unint64_t)a3
{
  NSMutableArray *samples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  samples = self->_samples;
  if (!samples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_samples;
    self->_samples = v6;

    samples = self->_samples;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](samples, "addObject:", v8);

  if (-[NSMutableArray count](self->_samples, "count") > self->_size)
    -[NSMutableArray removeObjectAtIndex:](self->_samples, "removeObjectAtIndex:", 0);
}

- (void)addSamples:(id)a3
{
  id v4;
  NSMutableArray *samples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  samples = self->_samples;
  v8 = v4;
  if (!samples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_samples;
    self->_samples = v6;

    v4 = v8;
    samples = self->_samples;
  }
  -[NSMutableArray addObjectsFromArray:](samples, "addObjectsFromArray:", v4);
  while (-[NSMutableArray count](self->_samples, "count") > self->_size)
    -[NSMutableArray removeObjectAtIndex:](self->_samples, "removeObjectAtIndex:", 0);

}

- (unint64_t)average
{
  NSMutableArray *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t k;
  void *v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_samples, "count"))
    return 0xFFFFFFFFLL;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v3 = self->_samples;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  v5 = 0.0;
  v6 = 0.0;
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v3);
        v6 = v6 + (double)(unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v7);
  }

  v10 = v6 / (double)(unint64_t)-[NSMutableArray count](self->_samples, "count");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = self->_samples;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    v5 = 0.0;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v16, "doubleValue");
        v18 = v17 - v10;
        objc_msgSend(v16, "doubleValue");
        v5 = v5 + v18 * (v19 - v10);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v13);
  }

  v20 = -[NSMutableArray count](self->_samples, "count");
  v21 = 1.0;
  if ((unint64_t)-[NSMutableArray count](self->_samples, "count") >= 5)
  {
    v21 = 2.0;
    if ((unint64_t)-[NSMutableArray count](self->_samples, "count") >= 5
      && (unint64_t)-[NSMutableArray count](self->_samples, "count") <= 9)
    {
      v21 = (double)(unint64_t)-[NSMutableArray count](self->_samples, "count") / 5.0;
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = self->_samples;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v35;
    v27 = sqrt(v5 / (double)v20) * v21;
    v28 = 0.0;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v22);
        v30 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
        objc_msgSend(v30, "doubleValue", (_QWORD)v34);
        if (vabdd_f64(v31, v10) <= v27)
        {
          objc_msgSend(v30, "doubleValue");
          v28 = v28 + v32;
          ++v25;
        }
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v24);

    if (v25)
      return (unint64_t)(v28 / (double)v25);
  }
  else
  {

  }
  return (unint64_t)v10;
}

- (BOOL)isLastValid
{
  void *v2;
  BOOL v3;

  -[NSMutableArray lastObject](self->_samples, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "unsignedIntegerValue") < 0xFFFFFFFF;

  return v3;
}

- (BOOL)isAnyValid
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](self->_samples, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

BOOL __23__NPAverage_isAnyValid__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "unsignedIntegerValue") < 0xFFFFFFFF;
}

- (id)description
{
  id v3;
  NSMutableArray *samples;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  samples = self->_samples;
  if (samples && -[NSMutableArray count](samples, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_samples;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "appendFormat:", CFSTR("%lu | "), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "unsignedIntegerValue"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("avg = %lu"), -[NPAverage average](self, "average"));
  }
  if (objc_msgSend(v3, "length"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)shortDescription
{
  id v3;
  NSMutableArray *samples;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  samples = self->_samples;
  if (samples && -[NSMutableArray count](samples, "count"))
  {
    -[NSMutableArray lastObject](self->_samples, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), objc_msgSend(v5, "unsignedIntegerValue"));

  }
  if (objc_msgSend(v3, "length"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSMutableArray)samples
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSamples:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
}

@end
