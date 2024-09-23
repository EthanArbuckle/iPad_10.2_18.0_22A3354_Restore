@implementation ISGrayscaleConversion

- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:
{
  return 0.00000079472886;
}

- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:
{
  return 0.00000079472886;
}

- (BOOL)computeGrayscaleConversionColorWithCGImage:(CGImage *)a3 grayscaleConversion:
{
  _OWORD *v3;
  _OWORD *v4;
  CGDataProvider *DataProvider;
  const __CFData *v8;
  const __CFData *v9;
  const UInt8 *BytePtr;
  BOOL v11;
  const UInt8 *v12;
  size_t Width;
  __int128 v14;

  if (!a3)
    return 0;
  v4 = v3;
  if (CGImageGetBitsPerComponent(a3) != 8)
    return 0;
  if (CGImageGetBitsPerPixel(a3) != 32)
    return 0;
  DataProvider = CGImageGetDataProvider(a3);
  if (!DataProvider)
    return 0;
  v8 = CGDataProviderCopyData(DataProvider);
  if (!v8)
    return 0;
  v9 = v8;
  BytePtr = CFDataGetBytePtr(v8);
  v11 = BytePtr != 0;
  if (BytePtr)
  {
    v12 = BytePtr;
    Width = CGImageGetWidth(a3);
    -[ISGrayscaleConversion computeGrayscaleConversionColorWithWidth:height:ucharSamples:](self, "computeGrayscaleConversionColorWithWidth:height:ucharSamples:", Width, CGImageGetHeight(a3), v12);
    *v4 = v14;
  }
  CFRelease(v9);
  return v11;
}

@end
