@implementation MAFloatMatrix

- (MAFloatMatrix)init
{
  MAFloatMatrix *v2;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v3;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *wrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAFloatMatrix;
  v2 = -[MAFloatMatrix init](&v6, sel_init);
  if (v2)
  {
    v3 = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass"));
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;

  }
  return v2;
}

- (MAFloatMatrix)initWithWrapper:(id)a3
{
  id v5;
  MAFloatMatrix *v6;
  MAFloatMatrix *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatMatrix;
  v6 = -[MAFloatMatrix init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrapper, a3);

  return v7;
}

- (MAFloatMatrix)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  MAFloatMatrix *v8;
  uint64_t v9;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *wrapper;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MAFloatMatrix;
  v8 = -[MAFloatMatrix init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithFloats:rows:columns:", a3, a4, a5);
    wrapper = v8->_wrapper;
    v8->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)v9;

  }
  return v8;
}

- (MAFloatMatrix)initWithArray:(id)a3
{
  id v4;
  MAFloatMatrix *v5;
  uint64_t v6;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *wrapper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatMatrix;
  v5 = -[MAFloatMatrix init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithRows:", v4);
    wrapper = v5->_wrapper;
    v5->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)v6;

  }
  return v5;
}

- (MAFloatMatrix)initWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  id v8;
  void *v9;
  MAFloatMatrix *v10;

  v8 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "wrapperWithData:rows:columns:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MAFloatMatrix initWithWrapper:](self, "initWithWrapper:", v9);
  return v10;
}

- (int64_t)rows
{
  void *v2;
  int64_t v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rows");

  return v3;
}

- (int64_t)columns
{
  void *v2;
  int64_t v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columns");

  return v3;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (float)sum
{
  void *v2;
  float v3;
  float v4;

  -[MAFloatMatrix wrapper](self, "wrapper");
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

  -[MAFloatMatrix wrapper](self, "wrapper");
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

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mean");
  v4 = v3;

  return v4;
}

- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4
{
  void *v6;
  float v7;
  float v8;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatAtRow:column:", a3, a4);
  v8 = v7;

  return v8;
}

- (id)row:(int64_t)a3
{
  MAFloatVector *v5;
  void *v6;
  void *v7;
  MAFloatVector *v8;

  v5 = [MAFloatVector alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "row:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v7);

  return v8;
}

- (id)array
{
  void *v2;
  void *v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)data
{
  void *v2;
  void *v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)matrixBySubtractingMatrix:(id)a3
{
  id v4;
  MAFloatMatrix *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatMatrix *v9;

  v4 = a3;
  v5 = [MAFloatMatrix alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "matrixBySubtractingMatrix:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatMatrix initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)matrixBySubtractingScalar:(float)a3
{
  MAFloatMatrix *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatMatrix *v9;

  v5 = [MAFloatMatrix alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "matrixBySubtractingScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatMatrix initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)matrixByAddingScalar:(float)a3
{
  MAFloatMatrix *v5;
  void *v6;
  double v7;
  void *v8;
  MAFloatMatrix *v9;

  v5 = [MAFloatMatrix alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "matrixByAddingScalar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatMatrix initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)matrixByAppendingRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAFloatMatrix *v8;

  v4 = a3;
  -[MAFloatMatrix wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendRow:", v7);
  v8 = -[MAFloatMatrix initWithWrapper:]([MAFloatMatrix alloc], "initWithWrapper:", v6);

  return v8;
}

- (id)matrixByAppendingColumn:(id)a3
{
  id v4;
  MAFloatMatrix *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatMatrix *v9;

  v4 = a3;
  v5 = [MAFloatMatrix alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "matrixByAppendingColumnVector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatMatrix initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)matrixByAppendingColumnsOfMatrix:(id)a3
{
  id v4;
  MAFloatMatrix *v5;
  void *v6;
  void *v7;
  void *v8;
  MAFloatMatrix *v9;

  v4 = a3;
  v5 = [MAFloatMatrix alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "matrixByAppendingColumnsOfMatrix:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAFloatMatrix initWithWrapper:](v5, "initWithWrapper:", v8);

  return v9;
}

- (id)sumAlongAxis:(unint64_t)a3
{
  MAFloatVector *v5;
  void *v6;
  void *v7;
  MAFloatVector *v8;

  v5 = [MAFloatVector alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sumAlongAxis:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v7);

  return v8;
}

- (id)meanAlongAxis:(unint64_t)a3
{
  MAFloatVector *v5;
  void *v6;
  void *v7;
  MAFloatVector *v8;

  v5 = [MAFloatVector alloc];
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meanAlongAxis:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAFloatVector initWithWrapper:](v5, "initWithWrapper:", v7);

  return v8;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  MAFloatMatrix *v4;
  MAFloatMatrix *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MAFloatMatrix *)a3;
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
      -[MAFloatMatrix wrapper](self, "wrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatMatrix wrapper](v5, "wrapper");
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
  MAFloatMatrix *v6;
  MAFloatMatrix *v7;
  void *v8;
  void *v9;
  double v10;
  char v11;

  v6 = (MAFloatMatrix *)a3;
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
      -[MAFloatMatrix wrapper](self, "wrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatMatrix wrapper](v7, "wrapper");
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
  MAFloatMatrix *v4;
  MAFloatMatrix *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MAFloatMatrix *)a3;
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
      -[MAFloatMatrix wrapper](self, "wrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAFloatMatrix wrapper](v5, "wrapper");
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

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MAMutableFloatMatrix *v4;
  void *v5;
  void *v6;
  MAMutableFloatMatrix *v7;

  v4 = +[MAMutableFloatMatrix allocWithZone:](MAMutableFloatMatrix, "allocWithZone:", a3);
  -[MAFloatMatrix wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = -[MAFloatMatrix initWithWrapper:](v4, "initWithWrapper:", v6);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)wrapper
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

+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "zerosWithRows:columns:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWrapper:", v4);

  return v5;
}

+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "onesWithRows:columns:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWrapper:", v4);

  return v5;
}

@end
