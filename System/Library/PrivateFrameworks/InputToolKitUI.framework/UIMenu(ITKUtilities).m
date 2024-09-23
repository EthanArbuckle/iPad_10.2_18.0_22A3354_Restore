@implementation UIMenu(ITKUtilities)

+ (uint64_t)itk_menuWithItems:()ITKUtilities title:
{
  return objc_msgSend(a1, "itk_menuWithItems:title:subtitle:image:", a3, a4, 0, 0);
}

+ (uint64_t)itk_menuWithItems:()ITKUtilities title:subtitle:
{
  return objc_msgSend(a1, "itk_menuWithItems:title:subtitle:image:", a3, a4, a5, 0);
}

+ (id)itk_menuWithItems:()ITKUtilities title:subtitle:image:
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;

  v9 = a5;
  v10 = &stru_250FA1710;
  if (a4)
    v10 = a4;
  v11 = v10;
  v12 = a6;
  v13 = a3;
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", v11, v12, 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setSubtitle:", v9);

  return v14;
}

- (id)itk_addNonNilItems:()ITKUtilities
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "itk_addItems:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (void)itk_addNonNilItem:()ITKUtilities
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(a1, "itk_addItems:", v6, v9, v10);
  }
  return a1;
}

- (id)itk_addItems:()ITKUtilities
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a1;
  v5 = a3;
  objc_msgSend(v4, "children");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_msgSend(v9, "itk_arrayByAddingObjectsFromNonNilArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "menuByReplacingChildren:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
