@implementation HFSimpleFormatter

- (HFSimpleFormatter)initWithFormatterBlock:(id)a3
{
  id v5;
  HFSimpleFormatter *v6;
  uint64_t v7;
  id formatterBlock;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleFormatter.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatterBlock"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFSimpleFormatter;
  v6 = -[HFSimpleFormatter init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    formatterBlock = v6->_formatterBlock;
    v6->_formatterBlock = (id)v7;

  }
  return v6;
}

- (HFSimpleFormatter)initWithAttributedFormatterBlock:(id)a3
{
  id v5;
  HFSimpleFormatter *v6;
  uint64_t v7;
  id attributedFormatterBlock;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleFormatter.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatterBlock"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFSimpleFormatter;
  v6 = -[HFSimpleFormatter init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    attributedFormatterBlock = v6->_attributedFormatterBlock;
    v6->_attributedFormatterBlock = (id)v7;

  }
  return v6;
}

- (HFSimpleFormatter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithFormatterBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleFormatter.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSimpleFormatter init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFSimpleFormatter *v4;
  void *v5;
  HFSimpleFormatter *v6;

  v4 = +[HFSimpleFormatter allocWithZone:](HFSimpleFormatter, "allocWithZone:", a3);
  -[HFSimpleFormatter formatterBlock](self, "formatterBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFSimpleFormatter initWithFormatterBlock:](v4, "initWithFormatterBlock:", v5);

  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;

  v4 = a3;
  -[HFSimpleFormatter formatterBlock](self, "formatterBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFSimpleFormatter formatterBlock](self, "formatterBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  -[HFSimpleFormatter attributedFormatterBlock](self, "attributedFormatterBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFSimpleFormatter attributedFormatterBlock](self, "attributedFormatterBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD, _QWORD), id, _QWORD))v6[2])(v6, v4, MEMORY[0x1E0C9AA70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[HFSimpleFormatter attributedFormatterBlock](self, "attributedFormatterBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HFSimpleFormatter attributedFormatterBlock](self, "attributedFormatterBlock");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
      v11 = v7;
    else
      v11 = (id)MEMORY[0x1E0C9AA70];
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)formatterBlock
{
  return self->_formatterBlock;
}

- (id)attributedFormatterBlock
{
  return self->_attributedFormatterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attributedFormatterBlock, 0);
  objc_storeStrong(&self->_formatterBlock, 0);
}

@end
