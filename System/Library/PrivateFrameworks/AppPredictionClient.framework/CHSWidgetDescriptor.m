@implementation CHSWidgetDescriptor

uint64_t __59__CHSWidgetDescriptor_ATX__atx_hasHomeScreenWidgetFamilies__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CHSWidgetFamilyIsAccessory();
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __63__CHSWidgetDescriptor_ATX__atx_hasHomeScreenWidgetFamiliesOnly__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CHSWidgetFamilyIsAccessory();
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __62__CHSWidgetDescriptor_ATX__atx_hasAccessoryWidgetFamiliesOnly__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CHSWidgetFamilyIsAccessory();
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
