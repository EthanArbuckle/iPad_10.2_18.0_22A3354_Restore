@implementation NSSet(DC)

- (id)dc_objectPassingTest:()DC
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectsPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)dc_containsObjectPassingTest:()DC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "dc_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)dc_objectsOfClass:()DC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__NSSet_DC__dc_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
