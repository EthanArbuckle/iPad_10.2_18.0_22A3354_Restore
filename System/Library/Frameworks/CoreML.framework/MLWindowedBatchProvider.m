@implementation MLWindowedBatchProvider

- (MLWindowedBatchProvider)initWithBatch:(id)a3 startIndex:(int64_t)a4 windowLength:(int64_t)a5 error:(id *)p_isa
{
  id v11;
  int64_t v12;
  int64_t v13;
  MLWindowedBatchProvider *v14;
  MLWindowedBatchProvider *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = objc_msgSend(v11, "count");
  v13 = v12;
  if (a4 < 0 || v12 <= a4 || a5 + a4 > v12)
  {
    if (p_isa)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 0, CFSTR("Invalid window starting at %@ of length %@ for batch size %@"), v16, v17, v18);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      p_isa = 0;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)MLWindowedBatchProvider;
    v14 = -[MLWindowedBatchProvider init](&v20, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_fullBatch, a3);
      v15->_startIndex = a4;
      v15->_windowLength = a5;
    }
    self = v15;
    p_isa = (id *)&self->super.isa;
  }

  return (MLWindowedBatchProvider *)p_isa;
}

- (int64_t)count
{
  return self->_windowLength;
}

- (id)featuresAtIndex:(int64_t)a3
{
  return (id)-[MLBatchProvider featuresAtIndex:](self->_fullBatch, "featuresAtIndex:", self->_startIndex + a3);
}

- (MLBatchProvider)fullBatch
{
  return self->_fullBatch;
}

- (void)setFullBatch:(id)a3
{
  objc_storeStrong((id *)&self->_fullBatch, a3);
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (int64_t)windowLength
{
  return self->_windowLength;
}

- (void)setWindowLength:(int64_t)a3
{
  self->_windowLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullBatch, 0);
}

@end
