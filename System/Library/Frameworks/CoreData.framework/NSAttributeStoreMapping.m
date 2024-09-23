@implementation NSAttributeStoreMapping

- (NSAttributeStoreMapping)initWithProperty:(id)a3
{
  NSAttributeStoreMapping *v3;
  NSAttributeStoreMapping *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSAttributeStoreMapping;
  v3 = -[NSPropertyStoreMapping initWithProperty:](&v6, sel_initWithProperty_, a3);
  v4 = v3;
  if (v3)
  {
    -[NSAttributeStoreMapping setExternalType:](v3, "setExternalType:", 0xFFFFFFFFLL);
    v4->_externalPrecision = 0;
    v4->_externalScale = 0;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int v6;
  unsigned int externalPrecision;
  int v8;
  int externalScale;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSAttributeStoreMapping;
  v5 = -[NSPropertyStoreMapping isEqual:](&v12, sel_isEqual_);
  if (v5)
  {
    v6 = -[NSAttributeStoreMapping externalType](self, "externalType");
    if (v6 != objc_msgSend(a3, "externalType"))
      goto LABEL_11;
    if (self)
    {
      externalPrecision = self->_externalPrecision;
      if (a3)
      {
LABEL_5:
        v8 = *((_DWORD *)a3 + 7);
        goto LABEL_6;
      }
    }
    else
    {
      externalPrecision = 0;
      if (a3)
        goto LABEL_5;
    }
    v8 = 0;
LABEL_6:
    if (externalPrecision == v8)
    {
      if (self)
      {
        externalScale = self->_externalScale;
        if (a3)
        {
LABEL_9:
          v10 = *((_DWORD *)a3 + 8);
LABEL_10:
          LOBYTE(v5) = externalScale == v10;
          return v5;
        }
      }
      else
      {
        externalScale = 0;
        if (a3)
          goto LABEL_9;
      }
      v10 = 0;
      goto LABEL_10;
    }
LABEL_11:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int)externalType
{
  return self->_externalType;
}

- (void)setExternalType:(int)a3
{
  self->_externalType = a3;
}

- (id)sqlType
{
  int v2;
  const __CFString *v3;

  v2 = -[NSAttributeStoreMapping externalType](self, "externalType");
  if (v2 <= 699)
  {
    if (v2 > 399)
    {
      if (v2 == 400)
        return CFSTR("NUMERIC");
      if (v2 == 500 || v2 == 600)
        return CFSTR("DOUBLE");
    }
    else
    {
      v3 = CFSTR("INTEGER");
      if (v2 == 100 || v2 == 200 || v2 == 300)
        return (id)v3;
    }
LABEL_27:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Undefined attribute type."), 0));
  }
  if (v2 > 999)
  {
    if (v2 <= 1199)
    {
      if (v2 != 1000 && v2 != 1100)
        goto LABEL_27;
      return CFSTR("BLOB");
    }
    if (v2 != 1200)
    {
      if (v2 != 1800)
        goto LABEL_27;
      return CFSTR("BLOB");
    }
    return CFSTR("TEXT");
  }
  if (v2 == 700)
    return CFSTR("TEXT");
  if (v2 == 800)
    return CFSTR("BOOLEAN");
  if (v2 != 900)
    goto LABEL_27;
  return CFSTR("TIMESTAMP");
}

@end
