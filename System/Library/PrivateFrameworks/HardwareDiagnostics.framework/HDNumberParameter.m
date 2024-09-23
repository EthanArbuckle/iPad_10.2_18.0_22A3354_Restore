@implementation HDNumberParameter

- (HDNumberParameter)init
{
  return -[HDNumberParameter initWithSummary:required:](self, "initWithSummary:required:", &stru_24F253950, 1);
}

- (HDNumberParameter)initWithSummary:(id)a3 required:(BOOL)a4
{
  id v7;
  HDNumberParameter *v8;
  HDNumberParameter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDNumberParameter;
  v8 = -[HDNumberParameter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_summary, a3);
    v9->_required = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HDNumberParameter summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSummary:", v7);

  objc_msgSend(v5, "setRequired:", -[HDNumberParameter required](self, "required"));
  return v5;
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  id v5;
  char isKindOfClass;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Expected Number value, not %@."), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    *a4 = v15;

  }
  return v7 & 1;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (BOOL)required
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
