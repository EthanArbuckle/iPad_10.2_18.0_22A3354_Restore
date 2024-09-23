@implementation DOCPostSearchInitializationBuffer

- (DOCPostSearchInitializationBuffer)init
{
  void *v3;
  void *v4;
  DOCPostSearchInitializationBuffer *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DOCPostSearchInitializationBuffer;
  v5 = -[DOCOperationBuffer initWithLabel:](&v7, sel_initWithLabel_, v4);

  return v5;
}

@end
