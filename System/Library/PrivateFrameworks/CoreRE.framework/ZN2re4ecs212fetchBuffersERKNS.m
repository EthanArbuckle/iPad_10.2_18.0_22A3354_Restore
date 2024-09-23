@implementation ZN2re4ecs212fetchBuffersERKNS

uint64_t *___ZN2re4ecs212fetchBuffersERKNS_13RenderManagerERKNS_12DynamicArrayIP10DRBuffer_sEERKNS4_INS0_21DirectParameterHandleEEERKNS_10FixedArrayINS_14LinkedFunctionEEERNS_11BucketArrayIN2NS9SharedPtrIN3MTL6BufferEEELm8EEERNSE_IPSN_EERNS4_INS_13TextureHandleEEERb_block_invoke_2(uint64_t *result, uint64_t a2)
{
  if (*((_BYTE *)result + 32))
  {
    result = re::globalAllocators((re *)result);
    if (a2)
      return (uint64_t *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)result[2] + 40))(result[2], *(_QWORD *)(a2 - 8));
  }
  return result;
}

@end
