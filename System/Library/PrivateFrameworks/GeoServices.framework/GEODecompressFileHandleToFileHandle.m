@implementation GEODecompressFileHandleToFileHandle

void __GEODecompressFileHandleToFileHandle_block_invoke(uint64_t a1)
{
  compression_stream_destroy((compression_stream *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  free(*(void **)(a1 + 40));
}

@end
