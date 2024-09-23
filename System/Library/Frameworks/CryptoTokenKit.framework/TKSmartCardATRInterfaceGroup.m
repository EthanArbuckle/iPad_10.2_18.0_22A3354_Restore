@implementation TKSmartCardATRInterfaceGroup

- (NSNumber)TA
{
  return self->_ABC[0];
}

- (NSNumber)TB
{
  return self->_ABC[1];
}

- (NSNumber)TC
{
  return self->_ABC[2];
}

- (TKSmartCardATRInterfaceGroup)initWithProtocol:(id)a3
{
  id v5;
  TKSmartCardATRInterfaceGroup *v6;
  TKSmartCardATRInterfaceGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardATRInterfaceGroup;
  v6 = -[TKSmartCardATRInterfaceGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_protocol, a3);

  return v7;
}

- (id)parseWithY:(char *)a3 toProtocol:(id *)a4 fromSource:(id)a5 hasNext:(BOOL *)a6
{
  uint64_t (**v10)(_QWORD);
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  Class *v14;
  Class v15;
  id v16;
  int v17;
  TKSmartCardATRInterfaceGroup *v18;

  v10 = (uint64_t (**)(_QWORD))a5;
  for (i = 0; i != 3; ++i)
  {
    if (((*a3 >> i) & 0x10) != 0)
    {
      v12 = v10[2](v10);
      if ((v12 & 0x80000000) != 0)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = &self->super.isa + i;
      v15 = v14[1];
      v14[1] = (Class)v13;

    }
  }
  if ((*a3 & 0x80000000) == 0)
  {
    v16 = 0;
    *a6 = 0;
    *a3 = 0;
LABEL_10:
    *a4 = v16;
    v18 = self;
    goto LABEL_12;
  }
  *a6 = 1;
  v17 = v10[2](v10);
  if ((v17 & 0x80000000) == 0)
  {
    *a3 = v17 & 0xF0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1 << (v17 & 0xF));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_protocol)
  {
    v4 = 0;
    while ((-[NSNumber unsignedIntegerValue](self->_protocol, "unsignedIntegerValue") & (1 << v4)) == 0)
    {
      v4 = (v4 + 1);
      if ((_DWORD)v4 == 16)
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("T=%d:"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
LABEL_7:
  for (i = 8; i != 32; i += 8)
  {
    v7 = *(Class *)((char *)&self->super.isa + i);
    if (v7)
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), objc_msgSend(v7, "unsignedCharValue"));
    else
      objc_msgSend(v3, "appendString:", CFSTR("-"));
  }
  return v3;
}

- (NSNumber)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_protocol, 0);
  v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
