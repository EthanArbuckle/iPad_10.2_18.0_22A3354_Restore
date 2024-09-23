@implementation ZN8Espresso13launch

const char *___ZN8Espresso13launch_chunksEmmRU15__autoreleasingKU13block_pointerFvmE_block_invoke()
{
  const char *result;

  result = getenv("ESPRESSO_CPU_FORCE_CHUNK_SIZE");
  if (result)
  {
    result = (const char *)atoi(result);
    Espresso::launch_chunks(unsigned long,unsigned long,void({block_pointer} const {__autoreleasing}&)(unsigned long))::force_chunk_size = (int)result;
  }
  return result;
}

@end
