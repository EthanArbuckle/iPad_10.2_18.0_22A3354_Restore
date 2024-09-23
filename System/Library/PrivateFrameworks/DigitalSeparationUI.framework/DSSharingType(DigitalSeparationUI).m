@implementation DSSharingType(DigitalSeparationUI)

- (id)iconForTable
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BE2CC80];
  objc_msgSend(a1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconForTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iconForDetail
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BE2CC80];
  objc_msgSend(a1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconForDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
