@implementation NTPBSectionDisplayDescriptor(NTAdditions)

- (void)setActionURL:()NTAdditions
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setActionURLString:", v4);

}

- (id)nameActionURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "nameActionURLString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)actionURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "actionURLString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setNameActionURL:()NTAdditions
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNameActionURLString:", v4);

}

@end
