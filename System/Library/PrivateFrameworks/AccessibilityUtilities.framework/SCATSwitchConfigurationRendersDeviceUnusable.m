@implementation SCATSwitchConfigurationRendersDeviceUnusable

void __SCATSwitchConfigurationRendersDeviceUnusable_block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("SwitchSourceScreen"));

  if (v4)
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  if (objc_msgSend(v5, "action") == 104 || objc_msgSend(v5, "action") == 105)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (objc_msgSend(v5, "action") == 103 || objc_msgSend(v5, "action") == 109)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

}

@end
