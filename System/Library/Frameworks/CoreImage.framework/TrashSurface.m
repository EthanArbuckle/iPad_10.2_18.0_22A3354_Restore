@implementation TrashSurface

void *__TrashSurface_block_invoke(int a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return memset(__b, 191, a6 * a5);
}

@end
