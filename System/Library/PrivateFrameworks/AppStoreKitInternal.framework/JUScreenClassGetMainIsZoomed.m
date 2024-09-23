@implementation JUScreenClassGetMainIsZoomed

void __JUScreenClassGetMainIsZoomed_block_invoke()
{
  double v0;
  double v1;
  const __CFData *v2;
  double v3;
  double v4;
  const __CFData *v5;
  const UInt8 *BytePtr;
  unint64_t Length;
  const UInt8 *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  BOOL v22;
  id v23;

  v1 = *MEMORY[0x1E0C9D820];
  v0 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v2 = (const __CFData *)MGCopyAnswer();
  v3 = v0;
  v4 = v1;
  if (v2)
  {
    v5 = v2;
    BytePtr = CFDataGetBytePtr(v2);
    Length = CFDataGetLength(v5);
    v3 = v0;
    v4 = v1;
    if (Length >= 0x10)
    {
      v8 = &BytePtr[Length & 0xFFFFFFFFFFFFFFF0];
      v4 = *((double *)v8 - 2);
      v3 = *((double *)v8 - 1);
    }
    CFRelease(v5);
  }
  if (v4 == v1 && v3 == v0)
  {
    JUScreenClassGetMainIsZoomed_isZoomed = 0;
  }
  else
  {
    v10 = (void *)MGCopyAnswer();
    if (v10)
    {
      v23 = v10;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("zoomed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "count") >= 4)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v17 = v16;
        objc_msgSend(v13, "floatValue");
        v1 = (float)(v17 * v18);
        objc_msgSend(v14, "floatValue");
        v20 = v19;
        objc_msgSend(v15, "floatValue");
        v0 = (float)(v20 * v21);

      }
      v10 = v23;
    }
    v22 = v4 == v1;
    if (v3 != v0)
      v22 = 0;
    JUScreenClassGetMainIsZoomed_isZoomed = v22;

  }
}

@end
