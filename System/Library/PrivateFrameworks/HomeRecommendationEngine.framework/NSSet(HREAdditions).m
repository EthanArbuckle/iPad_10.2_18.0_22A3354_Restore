@implementation NSSet(HREAdditions)

- (id)hre_filteredToClass:()HREAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__NSSet_HREAdditions__hre_filteredToClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "na_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
