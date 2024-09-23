@implementation NSObject

void __78__NSObject_AXPrivResponse__accessibilityIsSeekEnabledInDirection_forResponse___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BEDCDF0], "_accessibilitySkipIntervalInDirection:forResponse:", a1[7], a1[5]);
  objc_msgSend(v2, "jumpByInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3 != 0;

}

@end
