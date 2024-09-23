@implementation PFCloudKitContainerProvider

- (id)containerWithIdentifier:(id)a3
{
  return (id)objc_msgSend((Class)getCloudKitCKContainerClass[0](), "containerWithIdentifier:", a3);
}

- (id)containerWithIdentifier:(id)a3 options:(id)a4
{
  id result;

  result = -[PFCloudKitContainerProvider containerWithIdentifier:](self, "containerWithIdentifier:", a3);
  if (result)
  {
    if (a4)
      return (id)objc_msgSend(objc_alloc((Class)getCloudKitCKContainerClass[0]()), "initWithContainerID:options:", objc_msgSend(result, "containerID"), a4);
  }
  return result;
}

@end
