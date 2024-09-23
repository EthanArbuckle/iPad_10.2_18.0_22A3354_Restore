@implementation ZN29GPUDebugArgumentEncoderLayoutC2EP13MTLStructTypeP17MTLGPUDebugDevice

id *___ZN29GPUDebugArgumentEncoderLayoutC2EP13MTLStructTypeP17MTLGPUDebugDevice_block_invoke(uint64_t a1, MTLStructType *a2, unsigned int a3)
{
  uint64_t v5;
  GPUDebugArgumentEncoderLayout *v6;
  id *result;
  uint64_t v8;
  GPUDebugArgumentEncoderLayout *v9;
  unsigned int v10;

  v5 = *(_QWORD *)(a1 + 40);
  v10 = a3;
  v6 = (GPUDebugArgumentEncoderLayout *)operator new();
  GPUDebugArgumentEncoderLayout::GPUDebugArgumentEncoderLayout(v6, a2, *(MTLGPUDebugDevice **)(a1 + 32));
  v9 = v6;
  std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>>>::__emplace_unique_key_args<unsigned int,unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>(v5 + 8, &v10, &v10, (uint64_t *)&v9);
  result = (id *)v9;
  v9 = 0;
  if (result)
  {
    GPUDebugArgumentEncoderLayout::~GPUDebugArgumentEncoderLayout(result);
    return (id *)MEMORY[0x22E309118](v8);
  }
  return result;
}

@end
