@implementation IDSDuplicatedMessageMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSDuplicatedMessage");
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (IDSDuplicatedMessageMetric)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSDuplicatedMessageMetric;
  return -[IDSDuplicatedMessageMetric init](&v3, sel_init);
}

@end
