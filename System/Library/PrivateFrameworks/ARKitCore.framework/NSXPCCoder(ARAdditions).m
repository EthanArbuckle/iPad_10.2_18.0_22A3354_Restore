@implementation NSXPCCoder(ARAdditions)

- (CVPixelBufferRef)ar_decodePixelBufferForKey:()ARAdditions
{
  id v4;
  __IOSurface *v5;
  CVReturn v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  CVPixelBufferRef v10;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  CVReturn v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pixelBufferOut = 0;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0, &pixelBufferOut);
    if (v6)
    {
      _ARLogGeneral_17();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = v9;
        v15 = 2048;
        v16 = a1;
        v17 = 1024;
        v18 = v6;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to decode pixel buffer - status: %d", buf, 0x1Cu);

      }
    }
  }
  v10 = pixelBufferOut;

  return v10;
}

- (void)ar_encodePixelBuffer:()ARAdditions forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  CVPixelBufferGetIOSurface(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

@end
