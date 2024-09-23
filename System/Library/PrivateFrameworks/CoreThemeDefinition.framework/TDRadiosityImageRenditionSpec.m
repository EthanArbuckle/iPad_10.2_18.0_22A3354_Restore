@implementation TDRadiosityImageRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6;
  _BOOL4 v7;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CGContext *v16;
  void *Data;
  size_t BytesPerRow;
  size_t BitsPerPixel;
  size_t Width;
  size_t Height;
  void *v22;
  CGImage *v23;
  id v24;
  void *v25;
  uint64_t v26;
  CGContext *v27;
  _BOOL4 v29;
  vImage_CGImageFormat format;
  vImage_Buffer buf;
  CGSize v32;
  char v33[9];
  CGRect v34;

  v6 = a4;
  v7 = a3;
  if (!objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "asset")
    && !objc_msgSend((id)objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "layerReferences"), "count"))
  {
    return 0;
  }
  v29 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithCanvasSize:sliceCount:layout:", 0, 0, (double)(int)-[TDRadiosityImageRenditionSpec width](self, "width"), (double)(int)-[TDRadiosityImageRenditionSpec height](self, "height"));
  v10 = objc_msgSend((id)objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  objc_msgSend(v9, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  if (-[TDRadiosityImageRenditionSpec monochrome](self, "monochrome"))
    v11 = 1195456544;
  else
    v11 = 1095911234;
  objc_msgSend(v9, "setPixelFormat:", v11);
  objc_msgSend(v9, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ZZZZRadiosityImage-%d.%d.%d"), objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), -[TDRadiosityImageRenditionSpec opaque](self, "opaque"), -[TDRadiosityImageRenditionSpec monochrome](self, "monochrome")));
  if (v10 == 1)
    v12 = 3;
  else
    v12 = v6;
  objc_msgSend(v9, "setColorSpaceID:", v12);
  objc_msgSend(v9, "setScaleFactor:", objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  objc_msgSend(v9, "addSliceRect:", *MEMORY[0x24BDD1408], *(double *)(MEMORY[0x24BDD1408] + 8), *(double *)(MEMORY[0x24BDD1408] + 16), *(double *)(MEMORY[0x24BDD1408] + 24));
  objc_msgSend(v9, "setBlendMode:", 0);
  objc_msgSend(v9, "setOpacity:", 1.0);
  objc_msgSend(v9, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  if (objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier")&& objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier") != 2)
  {
    v13 = objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier");
  }
  else
  {
    v13 = 6;
  }
  objc_msgSend(v9, "setCompressionType:", v13);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C18]), "initWithPixelWidth:pixelHeight:", -[TDRadiosityImageRenditionSpec width](self, "width"), -[TDRadiosityImageRenditionSpec height](self, "height"));
  objc_msgSend(v14, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v9, "pixelFormat"));
  if (-[TDRadiosityImageRenditionSpec opaque](self, "opaque"))
    v15 = 6;
  else
    v15 = 2;
  objc_msgSend(v14, "setSourceAlphaInfo:", v15);
  v16 = (CGContext *)objc_msgSend(v14, "bitmapContext");
  objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "drawFlattenedImageIntoContext:document:", v16, a5);
  Data = CGBitmapContextGetData(v16);
  BytesPerRow = CGBitmapContextGetBytesPerRow(v16);
  BitsPerPixel = CGBitmapContextGetBitsPerPixel(v16);
  Width = CGBitmapContextGetWidth(v16);
  Height = CGBitmapContextGetHeight(v16);
  v33[0] = 1;
  v32 = (CGSize)*MEMORY[0x24BDBF148];
  memset(&buf, 0, sizeof(buf));
  objc_msgSend(MEMORY[0x24BE28C48], "_doRadiosityBlurOnPixelBuffer:bytesPerRow:bitsPerPixel:width:height:scaleFactor:usesGaussianBlur:adjustedSize:", Data, BytesPerRow, BitsPerPixel, Width, Height, objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), v33, &v32);
  if (v33[0])
  {
    objc_msgSend(v9, "addBitmap:", v14);
    v22 = (void *)objc_msgSend(v9, "CSIRepresentationWithCompression:", v29);
  }
  else
  {
    format.bitsPerComponent = 8;
    format.bitsPerPixel = BitsPerPixel;
    format.colorSpace = CGBitmapContextGetColorSpace(v16);
    format.bitmapInfo = 8194;
    memset(&format.version, 0, 20);
    v23 = vImageCreateCGImageFromBuffer(&buf, &format, 0, 0, 0, 0);
    v24 = objc_alloc(MEMORY[0x24BE28C18]);
    v25 = (void *)objc_msgSend(v24, "initWithPixelWidth:pixelHeight:", v32.width, v32.height);
    objc_msgSend(v25, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    objc_msgSend(v25, "setPixelFormat:", objc_msgSend(v9, "pixelFormat"));
    if (-[TDRadiosityImageRenditionSpec opaque](self, "opaque"))
      v26 = 6;
    else
      v26 = 2;
    objc_msgSend(v25, "setSourceAlphaInfo:", v26);
    v27 = (CGContext *)objc_msgSend(v25, "bitmapContext");
    v34.size = v32;
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    CGContextDrawImage(v27, v34, v23);
    objc_msgSend(v9, "addBitmap:", v25);
    v22 = (void *)objc_msgSend(v9, "CSIRepresentationWithCompression:", v29);
    CGImageRelease(v23);

    free(buf.data);
  }

  return v22;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

@end
