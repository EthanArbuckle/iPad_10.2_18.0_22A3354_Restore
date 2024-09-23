@implementation ARPixelBufferCopy

void __ARPixelBufferCopy_block_invoke(uint64_t a1)
{
  CVReturn v1;
  CVReturn v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    v2 = v1;
    _ARLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = v2;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "ARPixelBufferCopy: Error unlocking source buffer: %d", (uint8_t *)v4, 8u);
    }

  }
}

void __ARPixelBufferCopy_block_invoke_46(uint64_t a1)
{
  CVReturn v1;
  CVReturn v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    v2 = v1;
    _ARLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = v2;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "ARPixelBufferCopy: Error unlocking destination buffer: %d", (uint8_t *)v4, 8u);
    }

  }
}

@end
