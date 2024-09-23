@implementation StateManagerRingBufferSize

void *GeoOfflineConfig_StateManagerRingBufferSize_Metadata_block_invoke_9()
{
  return &unk_1E1E81C88;
}

uint64_t GeoOfflineConfig_StateManagerRingBufferSize_Metadata_block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  v3 = 10;
  if (v2 > 0xA)
    v3 = v2;
  if (v3 >= 0x1F4)
    v4 = 500;
  else
    v4 = v3;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
}

@end
