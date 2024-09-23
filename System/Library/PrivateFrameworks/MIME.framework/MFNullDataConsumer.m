@implementation MFNullDataConsumer

- (int64_t)appendData:(id)a3
{
  return objc_msgSend(a3, "length");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Null data consumer %p>"), self);
}

@end
