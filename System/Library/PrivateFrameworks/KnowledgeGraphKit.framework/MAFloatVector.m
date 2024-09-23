@implementation MAFloatVector

- (MAFloatVector)init
{
  MAFloatVector *v2;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v3;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *wrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAFloatVector;
  v2 = -[MAFloatVector init](&v6, sel_init);
  if (v2)
  {
    v3 = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass"));
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;

  }
  return v2;
}

- (MAFloatVector)initWithWrapper:(id)a3
{
  id v5;
  MAFloatVector *v6;
  MAFloatVector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatVector;
  v6 = -[MAFloatVector init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrapper, a3);

  return v7;
}

- (MAFloatVector)initWithFloats:(const float *)a3 count:(int64_t)a4
{
  MAFloatVector *v6;
  uint64_t v7;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *wrapper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MAFloatVector;
  v6 = -[MAFloatVector init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithFloats:count:", a3, a4);
    wrapper = v6->_wrapper;
    v6->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)v7;

  }
  return v6;
}

- (MAFloatVector)initWithArray:(id)a3
{
  id v4;
  MAFloatVector *v5;
  uint64_t v6;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *wrapper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatVector;
  v5 = -[MAFloatVector init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithArray:", v4);
    wrapper = v5->_wrapper;
    v5->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)v6;

  }
  return v5;
}

- (MAFloatVector)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[MAFloatVector initWithFloats:count:](self, "initWithFloats:count:", v5, v6 >> 2);
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (float)sum
{
  void *v2;
  float v3;
  float v4;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sum");
  v4 = v3;

  return v4;
}

- (float)sumOfSquares
{
  void *v2;
  float v3;
  float v4;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sumOfSquares");
  v4 = v3;

  return v4;
}

- (float)mean
{
  void *v2;
  float v3;
  float v4;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mean");
  v4 = v3;

  return v4;
}

- (float)standardDeviation
{
  void *v2;
  float v3;
  float v4;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standardDeviation");
  v4 = v3;

  return v4;
}

- (float)floatAtIndex:(int64_t)a3
{
  void *v4;
  float v5;
  float v6;

  -[MAFloatVector wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatAtIndex:", a3);
  v6 = v5;

  return v6;
}

- (id)array
{
  void *v2;
  void *v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)data
{
  void *v2;
  void *v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vectorBySubtractingVector:(id)a3
{
  id v4;
  MAFloatVector *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatVector *v9;

  v4 = a3;
  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vectorBySubtractingVector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByAddingVector:(id)a3
{
  id v4;
  MAFloatVector *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatVector *v9;

  v4 = a3;
  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vectorByAddingVector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorBySubtractingScalar:(float)a3
{
  MAFloatVector *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatVector *v9;

  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "vectorBySubtractingScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByAddingScalar:(float)a3
{
  MAFloatVector *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatVector *v9;

  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "vectorByAddingScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByMultiplyingByScalar:(float)a3
{
  MAFloatVector *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatVector *v9;

  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "vectorByMultiplyingByScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByDividingByScalar:(float)a3
{
  MAFloatVector *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatVector *v9;

  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "vectorByDividingByScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByElementwiseMultiplyingByVector:(id)a3
{
  id v4;
  MAFloatVector *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatVector *v9;

  v4 = a3;
  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vectorByElementwiseMultiplyingByWrapper:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (float)dotProductWithVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dotProductWithWrapper:", v6);
  v8 = v7;

  return v8;
}

- (id)vectorByElementwiseRaisingToExponent:(float)a3
{
  MAFloatVector *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatVector *v9;

  v5 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "vectorByElementwiseRaisingToExponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)vectorByElementwiseNaturalLogarithm
{
  MAFloatVector *v3;
  void *v4;
  void *v5;
  MAFloatVector *v6;

  v3 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalLogarithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAFloatVector initWithWrapper:](v3, "initWithWrapper:", v5);

  return v6;
}

- (id)vectorByElementwiseNaturalLogarithmIfPositive
{
  MAFloatVector *v3;
  void *v4;
  void *v5;
  MAFloatVector *v6;

  v3 = [MAFloatVector alloc];
  -[MAFloatVector wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalLogarithmIfPositive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAFloatVector initWithWrapper:](v3, "initWithWrapper:", v5);

  return v6;
}

- (id)vectorByAppendingFloat:(float)a3
{
  void *v4;
  void *v5;
  double v6;
  MAFloatVector *v7;

  -[MAFloatVector wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  *(float *)&v6 = a3;
  objc_msgSend(v5, "appendFloat:", v6);
  v7 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v5);

  return v7;
}

- (id)vectorByAppendingFloats:(const float *)a3 count:(int64_t)a4
{
  void *v6;
  void *v7;
  MAFloatVector *v8;

  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "appendFloats:count:", a3, a4);
  v8 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v7);

  return v8;
}

- (id)vectorByAppendingDoubles:(const double *)a3 count:(int64_t)a4
{
  void *v6;
  void *v7;
  MAFloatVector *v8;

  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "appendDoubles:count:", a3, a4);
  v8 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v7);

  return v8;
}

- (id)vectorByAppendingVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAFloatVector *v8;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendVector:", v7);
  v8 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v6);

  return v8;
}

- (id)vectorByAppendingArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MAFloatVector *v7;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "appendArray:", v4);
  v7 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v6);

  return v7;
}

- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4
{
  void *v6;
  void *v7;
  MAFloatVector *v8;

  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sliceFromStart:toEnd:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MAFloatVector initWithWrapper:]([MAFloatVector alloc], "initWithWrapper:", v7);
  return v8;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  MAFloatVector *v4;
  MAFloatVector *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MAFloatVector *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAFloatVector wrapper](self, "wrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatVector wrapper](v5, "wrapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isApproximatelyEqualTo:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  MAFloatVector *v6;
  MAFloatVector *v7;
  void *v8;
  void *v9;
  double v10;
  char v11;

  v6 = (MAFloatVector *)a3;
  if (v6 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[MAFloatVector wrapper](self, "wrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatVector wrapper](v7, "wrapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v10 = a4;
      v11 = objc_msgSend(v8, "isApproximatelyEqualTo:epsilon:", v9, v10);

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  MAFloatVector *v4;
  MAFloatVector *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MAFloatVector *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAFloatVector wrapper](self, "wrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatVector wrapper](v5, "wrapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MAMutableFloatVector *v4;
  void *v5;
  void *v6;
  MAMutableFloatVector *v7;

  v4 = +[MAMutableFloatVector allocWithZone:](MAMutableFloatVector, "allocWithZone:", a3);
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = -[MAFloatVector initWithWrapper:](v4, "initWithWrapper:", v6);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[MAFloatVector wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isArrayOfFloats:(id)a3
{
  id v3;
  id v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = strcmp("f", (const char *)objc_msgSend(v4, "objCType")) == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)wrapper
{
  return self->_wrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapper, 0);
}

+ (Class)wrapperClass
{
  return (Class)objc_opt_class();
}

+ (id)zerosOfCount:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_msgSend(a1, "wrapperClass"), "zerosOfCount:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithWrapper:", v6);

  return v7;
}

+ (id)onesOfCount:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_msgSend(a1, "wrapperClass"), "onesOfCount:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithWrapper:", v6);

  return v7;
}

+ (id)vectorRepeatingFloat:(float)a3 count:(int64_t)a4
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend(a1, "wrapperClass");
  *(float *)&v9 = a3;
  objc_msgSend(v8, "repeatingFloat:count:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithWrapper:", v10);

  return v11;
}

+ (id)meanVectorWithFloatVectors:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  +[MAFloatVector zerosOfCount:](MAMutableFloatVector, "zerosOfCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addVector:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  *(float *)&v13 = (float)v4;
  objc_msgSend(v7, "divideByScalar:", v13);

  return v7;
}

@end
