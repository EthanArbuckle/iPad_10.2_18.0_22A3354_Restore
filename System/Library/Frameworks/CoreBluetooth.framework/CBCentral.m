@implementation CBCentral

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CBPeer identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier = %@, MTU = %lu>"), v4, self, v6, -[CBCentral maximumUpdateValueLength](self, "maximumUpdateValueLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUInteger)maximumUpdateValueLength
{
  unint64_t v2;

  v2 = -[CBPeer mtuLength](self, "mtuLength");
  if (v2 - 3 >= 0x200)
    return 512;
  else
    return v2 - 3;
}

@end
