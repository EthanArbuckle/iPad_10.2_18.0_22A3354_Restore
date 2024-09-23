@implementation CIFileSaverProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v8;
  __IOSurface *v9;
  uint64_t v10;
  void *v11;
  double Width;
  double Height;
  void *v14;
  uint64_t v15;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];

  v8 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v9 = (__IOSurface *)objc_msgSend(v8, "surface");
  v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("filename"));
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bmtl"), v10);
  printf("dumping surface for filename %s\n", (const char *)objc_msgSend(v11, "UTF8String"));
  Width = (double)IOSurfaceGetWidth(v9);
  Height = (double)IOSurfaceGetHeight(v9);
  SurfaceCroppedWriteBmtlToFile(v9, (const char *)objc_msgSend(v11, "UTF8String"), Width, Height);
  v14 = (void *)objc_msgSend((id)objc_msgSend(a5, "metalCommandBuffer"), "blitCommandEncoder");
  v15 = objc_msgSend(v8, "metalTexture");
  memset(v19, 0, sizeof(v19));
  v18[0] = objc_msgSend((id)objc_msgSend(v8, "metalTexture"), "width");
  v18[1] = objc_msgSend((id)objc_msgSend(v8, "metalTexture"), "height");
  v18[2] = 1;
  memset(v17, 0, sizeof(v17));
  objc_msgSend(v14, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v15, 0, 0, v19, v18, objc_msgSend(a5, "metalTexture"), 0, 0, v17);
  objc_msgSend(v14, "endEncoding");
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

@end
