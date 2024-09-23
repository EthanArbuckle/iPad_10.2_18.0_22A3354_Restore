@implementation MSVGzipCompressFile

uint64_t __MSVGzipCompressFile_block_invoke(uint64_t a1, id a2)
{
  gzFile_s *v3;
  id v4;
  const void *v5;
  unsigned int v6;
  uint64_t result;

  v3 = *(gzFile_s **)(a1 + 40);
  v4 = objc_retainAutorelease(a2);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  result = gzwrite(v3, v5, v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

intptr_t __MSVGzipCompressFile_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __MSVGzipCompressFile_block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
