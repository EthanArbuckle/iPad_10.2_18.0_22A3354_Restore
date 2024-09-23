@implementation NSArray(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__NSArray_CMSCoding__cmsCoded__block_invoke;
  v6[3] = &unk_24E1CC988;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);
  if (objc_msgSend(v3, "count"))
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

@end
