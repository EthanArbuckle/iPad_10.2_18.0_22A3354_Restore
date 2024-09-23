@implementation BSAtomicFlag

- (BOOL)getFlag
{
  BOOL *p_flag;
  int v3;
  BOOL result;

  p_flag = &self->_flag;
  while (1)
  {
    v3 = __ldxr((unsigned __int8 *)p_flag);
    if (v3 != 1)
      break;
    result = 1;
    if (!__stxr(1u, (unsigned __int8 *)p_flag))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

- (BOOL)setFlag:(BOOL)a3
{
  BOOL *p_flag;
  int v4;
  BOOL result;

  p_flag = &self->_flag;
  while (1)
  {
    v4 = __ldxr((unsigned __int8 *)p_flag);
    if (v4 != !a3)
      break;
    if (!__stxr(a3, (unsigned __int8 *)p_flag))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

- (BSAtomicFlag)init
{
  return -[BSAtomicFlag initWithFlag:](self, "initWithFlag:", 0);
}

- (BSAtomicFlag)initWithFlag:(BOOL)a3
{
  BSAtomicFlag *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSAtomicFlag;
  result = -[BSAtomicFlag init](&v5, sel_init);
  if (result)
    atomic_store(a3, (unsigned __int8 *)&result->_flag);
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  BSAtomicFlag *v13;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __27__BSAtomicFlag_description__block_invoke;
  v11 = &unk_1E1EBE700;
  v4 = v3;
  v12 = v4;
  v13 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __27__BSAtomicFlag_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "getFlag"), 0);
}

@end
