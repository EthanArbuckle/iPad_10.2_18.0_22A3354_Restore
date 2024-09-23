@implementation SGSlice

- (SGSlice)initWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  SGSlice *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGSlice;
  result = -[SGSlice init](&v9, sel_init);
  if (result)
  {
    result->_type = ($1E121628F8A7D11AF7DA1A794335FF31)a3;
    result->_start = a4;
    result->_end = a5;
  }
  return result;
}

- (SGSlice)initWithType:(id)a3 range:(_NSRange)a4
{
  return -[SGSlice initWithType:start:end:](self, "initWithType:start:end:", *(unsigned int *)&a3, a4.location, a4.location + a4.length);
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger start;
  _NSRange result;

  v2 = self->_end - self->_start;
  start = self->_start;
  result.length = v2;
  result.location = start;
  return result;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unint64_t start;
  unint64_t v6;
  int64_t v7;
  unint64_t end;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  $1E121628F8A7D11AF7DA1A794335FF31 type;
  unsigned int v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;

  v4 = a3;
  start = self->_start;
  v6 = v4[2];
  if (start < v6)
    v7 = -1;
  else
    v7 = 1;
  if (start == v6)
  {
    end = self->_end;
    v9 = v4[3];
    v10 = end >= v9;
    v11 = end == v9;
    v12 = end > v9 ? 1 : v7;
    v7 = v10 ? v12 : -1;
    if (v11)
    {
      type = self->_type;
      v14 = *((_DWORD *)v4 + 2);
      v15 = *(_DWORD *)&type >= v14;
      v16 = type == v14;
      if (*(_DWORD *)&type > v14)
        v17 = 1;
      else
        v17 = v7;
      if (!v15)
        v17 = -1;
      if (v16)
        v7 = 0;
      else
        v7 = v17;
    }
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%s %lu-%lu>"), categoryDescriptions[self->_type.category], self->_start, self->_end);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)type
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_type;
}

- (unint64_t)start
{
  return self->_start;
}

- (unint64_t)end
{
  return self->_end;
}

+ (id)sliceWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  return -[SGSlice initWithType:start:end:]([SGSlice alloc], "initWithType:start:end:", *(unsigned int *)&a3, a4, a5);
}

+ (id)sliceWithType:(id)a3 range:(_NSRange)a4
{
  return -[SGSlice initWithType:range:]([SGSlice alloc], "initWithType:range:", *(unsigned int *)&a3, a4.location, a4.length);
}

@end
