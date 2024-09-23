@implementation HFMediaSystemAccessoryType

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaSystemType"));
}

@end
