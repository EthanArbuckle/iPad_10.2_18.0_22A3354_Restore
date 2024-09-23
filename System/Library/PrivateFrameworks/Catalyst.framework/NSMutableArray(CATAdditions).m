@implementation NSMutableArray(CATAdditions)

- (void)cat_removeFirstObjectMatching:()CATAdditions
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__NSMutableArray_CATAdditions__cat_removeFirstObjectMatching___block_invoke;
  v7[3] = &unk_24C1C5948;
  v6 = v4;
  v8 = v6;
  v5 = objc_msgSend(a1, "indexOfObjectPassingTest:", v7);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "removeObjectAtIndex:", v5);

}

- (id)cat_popFirstObject
{
  void *v2;

  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

@end
