@implementation BufferChomper

void __fpfs_BufferChomper_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {

    v2 = *(_QWORD **)(a1 + 32);
    v2[1] = 0;
  }
  free(v2);
}

@end
