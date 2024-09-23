@implementation MFStringAccumulator

- (void)appendString:(id)a3
{
  id v4;
  NSMutableString *v5;
  NSMutableString *v6;
  NSMutableString *v7;
  NSString *v8;
  NSString *immutable;
  id v10;

  v4 = a3;
  v5 = self->_mutable;
  v10 = v4;
  if (v5)
  {
    -[NSMutableString appendString:](v5, "appendString:", v4);
  }
  else
  {
    if (self->_immutable)
    {
      v6 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@%@"), self->_immutable, v4);
      v7 = self->_mutable;
      self->_mutable = v6;

      v8 = 0;
    }
    else
    {
      v8 = (NSString *)v4;
    }
    immutable = self->_immutable;
    self->_immutable = v8;

  }
}

- (id)string
{
  NSMutableString *immutable;

  immutable = (NSMutableString *)self->_immutable;
  if (!immutable)
    immutable = self->_mutable;
  return immutable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutable, 0);
  objc_storeStrong((id *)&self->_mutable, 0);
}

@end
