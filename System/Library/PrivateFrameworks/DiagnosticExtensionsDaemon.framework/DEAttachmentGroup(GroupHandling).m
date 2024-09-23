@implementation DEAttachmentGroup(GroupHandling)

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "rootURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachmentItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Group: (rootURL %@) (items %@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
