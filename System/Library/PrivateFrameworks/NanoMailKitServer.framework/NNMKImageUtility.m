@implementation NNMKImageUtility

+ (void)scaleImageFromData:(id)a3 destinationData:(id)a4 maxWidth:(float)a5
{
  objc_msgSend(a1, "scaleImageFromURL:imageData:destinationURL:destinationData:maxWidth:", 0, a3, 0, a4);
}

+ (void)scaleImageFromData:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5
{
  objc_msgSend(a1, "scaleImageFromURL:imageData:destinationURL:destinationData:maxWidth:", 0, a3, a4, 0);
}

+ (void)scaleImageFromURL:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5
{
  objc_msgSend(a1, "scaleImageFromURL:imageData:destinationURL:destinationData:maxWidth:", a3, 0, a4, 0);
}

+ (void)scaleImageFromURL:(id)a3 imageData:(id)a4 destinationURL:(id)a5 destinationData:(id)a6 maxWidth:(float)a7
{
  const __CFURL *v11;
  const __CFData *v12;
  const __CFURL *v13;
  __CFData *v14;
  CGImageSource *v15;
  CGImageSource *v16;
  const __CFDictionary *v17;
  double v18;
  const __CFDictionary *v19;
  const __CFNumber *Value;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFDictionary *v26;
  size_t Count;
  const __CFString *Type;
  CGImageDestinationRef v29;
  CGImageDestination *v30;
  size_t i;
  double v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v11 = (const __CFURL *)a3;
  v12 = (const __CFData *)a4;
  v13 = (const __CFURL *)a5;
  v14 = (__CFData *)a6;
  if (v12)
    v15 = CGImageSourceCreateWithData(v12, 0);
  else
    v15 = CGImageSourceCreateWithURL(v11, 0);
  v16 = v15;
  if (v15)
  {
    v17 = CGImageSourceCopyPropertiesAtIndex(v15, 0, 0);
    if (v17)
    {
      v19 = v17;
      Value = (const __CFNumber *)CFDictionaryGetValue(v17, (const void *)*MEMORY[0x24BDD96C8]);
      if (Value)
      {
        v32 = 0.0;
        CFNumberGetValue(Value, kCFNumberCGFloatType, &v32);
        if (v32 < a7)
          a7 = v32;
      }
      CFRelease(v19);
    }
    v21 = (void *)MEMORY[0x24BDBCED8];
    v22 = *MEMORY[0x24BDD97D0];
    v34[0] = MEMORY[0x24BDBD1C0];
    v23 = *MEMORY[0x24BDD9218];
    v33[0] = v22;
    v33[1] = v23;
    *(float *)&v18 = a7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = *MEMORY[0x24BDD9220];
    v34[1] = v24;
    v34[2] = &unk_24FA10B70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithDictionary:", v25);
    v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    Count = CGImageSourceGetCount(v16);
    Type = CGImageSourceGetType(v16);
    if (v14)
      v29 = CGImageDestinationCreateWithData(v14, Type, Count, 0);
    else
      v29 = CGImageDestinationCreateWithURL(v13, Type, Count, 0);
    v30 = v29;
    if (v29)
    {
      if (Count)
      {
        for (i = 0; i != Count; ++i)
          CGImageDestinationAddImageFromSource(v30, v16, i, v26);
      }
      CGImageDestinationFinalize(v30);
      CFRelease(v30);
    }

    CFRelease(v16);
  }

}

@end
