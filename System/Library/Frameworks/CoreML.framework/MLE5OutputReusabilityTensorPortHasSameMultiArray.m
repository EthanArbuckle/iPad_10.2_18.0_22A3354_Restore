@implementation MLE5OutputReusabilityTensorPortHasSameMultiArray

uint64_t __MLE5OutputReusabilityTensorPortHasSameMultiArray_block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(result + 40) == a2;
  return result;
}

@end
