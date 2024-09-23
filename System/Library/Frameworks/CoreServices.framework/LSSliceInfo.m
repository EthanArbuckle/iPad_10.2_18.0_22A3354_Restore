@implementation LSSliceInfo

- (LSSliceInfo)initWithType:(int)a3 subtype:(int)a4
{
  LSSliceInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LSSliceInfo;
  result = -[LSSliceInfo init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_subtype = a4;
  }
  return result;
}

- (LSSliceInfo)initWithSliceDescData:(LSSliceData)a3
{
  return -[LSSliceInfo initWithType:subtype:](self, "initWithType:subtype:", a3, a3.var1);
}

- (LSSliceInfo)initWithCoder:(id)a3
{
  id v4;
  LSSliceInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LSSliceInfo;
  v5 = -[LSSliceInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v5->_subtype = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("subtype"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_subtype, CFSTR("subtype"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[LSSliceInfo type](self, "type"), v5 == objc_msgSend(v4, "type")))
  {
    v6 = -[LSSliceInfo subtype](self, "subtype");
    v7 = v6 == objc_msgSend(v4, "subtype");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (self->_type | (self->_type << 8)) ^ self->_subtype;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<LSSliceInfo@%p: t=%#x s=%#x>"), self, self->_type, self->_subtype);
}

- (LSSliceData)sliceValue
{
  return *(LSSliceData *)&self->_type;
}

- (int)type
{
  return self->_type;
}

- (int)subtype
{
  return self->_subtype;
}

@end
