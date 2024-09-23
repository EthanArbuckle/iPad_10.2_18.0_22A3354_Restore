@implementation CGCFDataCreateWithContentsOfFileAtURL

void __CGCFDataCreateWithContentsOfFileAtURL_block_invoke_2(int a1, void *a2)
{
  free(a2);
}

void __CGCFDataCreateWithContentsOfFileAtURL_block_invoke(int a1, void *a2, size_t a3)
{
  char v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (char)a2;
  if (munmap(a2, a3) < 0)
  {
    v4 = __error();
    strerror(*v4);
    CGPostError((uint64_t)"Failed to unmap data (%p; 0x%lx): %s", v5, v6, v7, v8, v9, v10, v11, v3);
  }
}

@end
