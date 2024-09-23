@implementation HFFormatterTransformer

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v4 = a3;
  -[HFFormatterTransformer sourceFormatter](self, "sourceFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForObjectValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFFormatterTransformer transformBlock](self, "transformBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFFormatterTransformer transformBlock](self, "transformBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v6, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (NSFormatter)sourceFormatter
{
  return self->_sourceFormatter;
}

- (HFFormatterTransformer)initWithSourceFormatter:(id)a3 transformBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HFFormatterTransformer *v10;
  HFFormatterTransformer *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFFormatterTransformer.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceFormatter && transformBlock"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HFFormatterTransformer;
  v10 = -[HFFormatterTransformer init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[HFFormatterTransformer setSourceFormatter:](v10, "setSourceFormatter:", v7);
    -[HFFormatterTransformer setTransformBlock:](v11, "setTransformBlock:", v9);
  }

  return v11;
}

- (void)setTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSourceFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_sourceFormatter, 0);
}

- (HFFormatterTransformer)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSourceFormatter_transformBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFFormatterTransformer.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFFormatterTransformer init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFFormatterTransformer sourceFormatter](self, "sourceFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFFormatterTransformer transformBlock](self, "transformBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSourceFormatter:transformBlock:", v5, v6);

  return v7;
}

@end
