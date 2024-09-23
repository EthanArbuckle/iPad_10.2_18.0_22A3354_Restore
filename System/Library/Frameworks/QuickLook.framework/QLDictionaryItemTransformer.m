@implementation QLDictionaryItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", a3, a4, a5);
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, a5);
}

@end
