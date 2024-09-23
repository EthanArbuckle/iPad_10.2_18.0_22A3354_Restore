@implementation _NS128bitWrapper

- (char)initWithBytes:(char *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NS128bitWrapper;
    result = (char *)objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      if (a2)
      {
        *(_OWORD *)(result + 8) = *a2;
      }
      else
      {

        return 0;
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->bits.high64 == *((_QWORD *)a3 + 1)
      && self->bits.low64 == *((_QWORD *)a3 + 2);
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NS128bitWrapper *v4;

  v4 = self;
  return self;
}

- (id)description
{
  _double_quad_uint bits;
  uuid_string_t out;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bits = self->bits;
  uuid_unparse((const unsigned __int8 *)&bits, out);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
}

- (int64_t)compare:(id)a3
{
  int64_t high64;
  int64_t v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;

  high64 = self->bits.high64;
  v4 = *((_QWORD *)a3 + 1);
  if (high64 == v4)
  {
    high64 = self->bits.low64;
    v4 = *((_QWORD *)a3 + 2);
  }
  v5 = high64 < v4;
  v6 = high64 > v4;
  v7 = v5;
  return v6 - v7;
}

@end
