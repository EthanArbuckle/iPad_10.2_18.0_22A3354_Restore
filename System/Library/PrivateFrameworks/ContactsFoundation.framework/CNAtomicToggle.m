@implementation CNAtomicToggle

- (CNAtomicToggle)init
{
  return -[CNAtomicToggle initWithState:](self, "initWithState:", 0);
}

- (CNAtomicToggle)initWithState:(BOOL)a3
{
  CNAtomicToggle *v4;
  CNAtomicToggle *v5;
  CNAtomicToggle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAtomicToggle;
  v4 = -[CNAtomicToggle init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    atomic_store(a3, (unsigned __int8 *)&v4->_state);
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = atomic_load((unsigned __int8 *)&self->_state);
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("state"), v4 & 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CNAtomicToggle *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v7;

  v4 = (CNAtomicToggle *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = atomic_load((unsigned __int8 *)&self->_state);
      v6 = atomic_load((unsigned __int8 *)&v4->_state);
      v7 = ((v5 & 1) == 0) ^ v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7 & 1;
}

- (unint64_t)hash
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_state);
  return (v2 & 1) + 527;
}

- (BOOL)trySetState:(BOOL)a3
{
  BOOL *p_state;
  int v4;
  BOOL result;

  p_state = &self->_state;
  while (1)
  {
    v4 = __ldaxr((unsigned __int8 *)p_state);
    if (v4 != !a3)
      break;
    if (!__stlxr(a3, (unsigned __int8 *)p_state))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

@end
