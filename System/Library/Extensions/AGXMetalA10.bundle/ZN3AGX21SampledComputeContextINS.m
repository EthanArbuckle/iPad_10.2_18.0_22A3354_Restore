@implementation ZN3AGX21SampledComputeContextINS

uint64_t *___ZN3AGX21SampledComputeContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesENS1_28EncoderComputeServiceClassesEE24duplicateShaderAddressesEv_block_invoke(uint64_t a1)
{
  uint64_t *result;
  uint64_t v3;

  result = *(uint64_t **)(a1 + 32);
  v3 = result[2];
  if (!v3
    || ((*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(result[2]), (result = *(uint64_t **)(a1 + 32)) != 0))
  {
    AGX::ComputePipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::~ComputePipeline(result);
    JUMPOUT(0x234927ECCLL);
  }
  return result;
}

@end
