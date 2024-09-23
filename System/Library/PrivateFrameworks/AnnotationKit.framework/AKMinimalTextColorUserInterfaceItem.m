@implementation AKMinimalTextColorUserInterfaceItem

- (id)convertTextAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = *MEMORY[0x24BDF6600];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF6600]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMinimalColorChooserUserInterfaceItem color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v6, "akIsEqualToColor:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (v4)
    {
      v9 = (void *)objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
    objc_msgSend(v9, "setObject:forKey:", v7, v5);
  }
  if (v8)
    v10 = v8;
  else
    v10 = v4;
  v11 = v10;

  return v11;
}

@end
