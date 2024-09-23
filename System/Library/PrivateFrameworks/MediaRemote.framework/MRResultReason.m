@implementation MRResultReason

- (MRResultReason)initWithResult:(BOOL)a3 reason:(id)a4
{
  id v7;
  MRResultReason *v8;
  MRResultReason *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRResultReason;
  v8 = -[MRResultReason init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_reason, a4);
  }

  return v9;
}

- (MRResultReason)initWithResult:(BOOL)a3 format:(id)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  MRResultReason *v9;
  uint64_t v11;

  v4 = a3;
  if (a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a4;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v11);

  }
  else
  {
    v8 = 0;
  }
  v9 = -[MRResultReason initWithResult:reason:](self, "initWithResult:reason:", v4, v8);

  return v9;
}

- (BOOL)result
{
  return self->_result;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
