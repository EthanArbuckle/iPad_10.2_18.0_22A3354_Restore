@implementation _UIKeyboardChangedInformationWithManualFence

+ (void)pushFence:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)_fenceList;
  v7 = v3;
  if (!_fenceList)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_fenceList;
    _fenceList = v5;

    v3 = v7;
    v4 = (void *)_fenceList;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)popFence
{
  objc_msgSend((id)_fenceList, "removeLastObject");
}

+ (id)animationFence
{
  return (id)objc_msgSend((id)_fenceList, "lastObject");
}

@end
