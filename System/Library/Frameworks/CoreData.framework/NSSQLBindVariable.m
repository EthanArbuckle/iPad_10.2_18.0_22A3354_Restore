@implementation NSSQLBindVariable

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[NSSQLBindVariable dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5 allowCoercion:(BOOL)a6
{
  _BOOL4 v6;
  int v8;
  NSSQLBindVariable *v10;
  id v11;
  id v12;
  objc_super v14;

  v6 = a6;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSSQLBindVariable;
  v10 = -[NSSQLBindVariable init](&v14, sel_init);
  if (v10)
  {
    if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == a3)
      v11 = 0;
    else
      v11 = a3;
    if (v8 == 6 && v11)
    {
      if ((objc_msgSend(v11, "isNSString") & 1) == 0)
        a3 = (id)objc_msgSend(v11, "description");
    }
    else
    {
      a3 = v11;
    }
    v12 = a3;
    v10->_sqlType = v8;
    v10->_value = v12;
    v10->_propertyDescription = (NSPropertyDescription *)a5;
    v10->_flags = v6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_value = 0;
  self->_propertyDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBindVariable;
  -[NSSQLBindVariable dealloc](&v3, sel_dealloc);
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (BOOL)hasObjectValue
{
  return self->_int64 == 0;
}

- (id)value
{
  id result;

  result = self->_value;
  if (!result)
  {
    if (self->_int64)
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    else
      return 0;
  }
  return result;
}

- (int64_t)int64
{
  id value;

  value = self->_value;
  if (value)
    return objc_msgSend(value, "longLongValue");
  else
    return self->_int64;
}

- (BOOL)allowsCoercion
{
  return self->_flags != 0;
}

- (id)tombstonedPropertyDescription
{
  return self->_tombstonedPropertyDescription;
}

- (void)setTombstonedPropertyDescription:(id)a3
{
  self->_tombstonedPropertyDescription = (NSPropertyDescription *)a3;
}

- (NSSQLBindVariable)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setValue:(id)a3
{
  id value;

  value = self->_value;
  if (value != a3)
  {

    self->_value = a3;
  }
}

- (NSSQLBindVariable)initWithInt64:(int64_t)a3 sqlType:(unsigned __int8)a4
{
  NSSQLBindVariable *v5;
  NSSQLBindVariable *v6;

  v5 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](self, "initWithValue:sqlType:propertyDescription:", 0, a4, 0);
  v6 = v5;
  if (a3 && v5)
    -[NSSQLBindVariable setInt64:](v5, "setInt64:", a3);
  return v6;
}

- (void)setInt64:(int64_t)a3
{
  self->_int64 = a3;
}

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5
{
  return -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:allowCoercion:](self, "initWithValue:sqlType:propertyDescription:allowCoercion:", a3, a4, a5, 0);
}

- (NSSQLBindVariable)initWithUnsignedInt:(unsigned int)a3 sqlType:(unsigned __int8)a4
{
  uint64_t v4;
  NSSQLBindVariable *v5;
  NSSQLBindVariable *v6;

  v4 = *(_QWORD *)&a3;
  v5 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](self, "initWithValue:sqlType:propertyDescription:", 0, a4, 0);
  v6 = v5;
  if ((_DWORD)v4 && v5)
    -[NSSQLBindVariable setUnsignedInt:](v5, "setUnsignedInt:", v4);
  return v6;
}

- (void)setUnsignedInt:(unsigned int)a3
{
  self->_int64 = a3;
}

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

- (unsigned)unsignedInt
{
  id value;

  value = self->_value;
  if (value)
    return objc_msgSend(value, "unsignedIntValue");
  else
    return self->_int64;
}

- (void)setSQLType:(unsigned __int8)a3
{
  self->_sqlType = a3;
}

@end
