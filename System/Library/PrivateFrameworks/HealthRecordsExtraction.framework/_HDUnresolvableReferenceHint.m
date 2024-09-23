@implementation _HDUnresolvableReferenceHint

- (_HDUnresolvableReferenceHint)initWithReference:(id)a3 hint:(unint64_t)a4
{
  id v6;
  _HDUnresolvableReferenceHint *v7;
  uint64_t v8;
  NSString *reference;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUnresolvableReferenceHint;
  v7 = -[_HDUnresolvableReferenceHint init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    reference = v7->_reference;
    v7->_reference = (NSString *)v8;

    v7->_hint = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_hint ^ -[NSString hash](self->_reference, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _HDUnresolvableReferenceHint *v4;
  _HDUnresolvableReferenceHint *v5;
  NSString *reference;
  void *v7;
  unint64_t hint;
  BOOL v9;

  v4 = (_HDUnresolvableReferenceHint *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      reference = self->_reference;
      -[_HDUnresolvableReferenceHint reference](v5, "reference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](reference, "isEqualToString:", v7))
      {
        hint = self->_hint;
        v9 = hint == -[_HDUnresolvableReferenceHint hint](v5, "hint");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)reference
{
  return self->_reference;
}

- (unint64_t)hint
{
  return self->_hint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
}

@end
