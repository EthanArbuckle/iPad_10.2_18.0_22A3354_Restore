@implementation BBCommunicationContext(testing)

- (id)imageDataForContentURL
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BEBF560];
  objc_msgSend(a1, "contentURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageDataForContentURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
