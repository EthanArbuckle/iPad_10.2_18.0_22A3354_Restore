@implementation ZN2CA6Render18LayerNodeAllocator10alloc

char *___ZN2CA6Render18LayerNodeAllocator10alloc_nodeEv_block_invoke()
{
  char *result;
  uint64_t v1;
  int16x8_t v2;
  int16x8_t v3;
  int16x8_t v4;
  vm_address_t v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  if (!vm_allocate(*MEMORY[0x1E0C83DA0], v5, (*MEMORY[0x1E0C85AD8] + 1146879) & -*MEMORY[0x1E0C85AD8], 1))
    CA::Render::LayerNodeAllocator::_data = v5[0];
  result = (char *)malloc_type_malloc(0x2000uLL, 0x1000040BDFB0063uLL);
  v1 = 0;
  CA::Render::LayerNodeAllocator::_free_offsets = (uint64_t)result;
  v2 = (int16x8_t)xmmword_18474E580;
  v3.i64[0] = 0xF000F000F000F000;
  v3.i64[1] = 0xF000F000F000F000;
  v4.i64[0] = 0x8000800080008;
  v4.i64[1] = 0x8000800080008;
  do
  {
    *(int16x8_t *)&result[v1] = vsubq_s16(v3, v2);
    v2 = vaddq_s16(v2, v4);
    v1 += 16;
  }
  while (v1 != 0x2000);
  CA::Render::LayerNodeAllocator::_free_offsets_count = 4096;
  return result;
}

@end
