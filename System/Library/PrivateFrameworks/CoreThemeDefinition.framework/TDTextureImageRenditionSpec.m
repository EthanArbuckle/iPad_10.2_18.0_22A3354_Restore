@implementation TDTextureImageRenditionSpec

- (TDTextureRenditionSpec)texture
{
  return (TDTextureRenditionSpec *)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "texture");
}

- (int64_t)textureFormat
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "texture"), "pixelFormat"), "identifier");
}

- (BOOL)isCubeMap
{
  return objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "texture"), "cubeMap");
}

- (id)textureFacesWithDocument:(id)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("textureLevelAssignment.texture = %@ AND textureLevelAssignment.level=%d"), -[TDTextureImageRenditionSpec texture](self, "texture"), (int)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "level"));
  v8[0] = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("textureLevelAssignment.face.identifier"), 1);
  v6 = (void *)objc_msgSend(a3, "objectsForEntity:withPredicate:sortDescriptors:withContext:error:", CFSTR("TextureImageRenditionSpec"), v5, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1), -[TDTextureImageRenditionSpec managedObjectContext](self, "managedObjectContext"), 0);
  objc_msgSend(v6, "count");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  return v6;
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id result;
  int v8;

  v3 = objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), "path");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);
  if (v5)
    v6 = (void *)objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  else
    v6 = 0;
  result = (id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C98]);
  if (result)
    v8 = 0;
  else
    v8 = v5;
  if (v8 == 1)
  {
    NSLog(CFSTR("-[TDTextureImageRenditionSpec associatedFileModificationDateWithDocument:] WARNING: %@ exists but has no modification date. Returning +[NSDate distantFuture]"), v3);
    return (id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  }
  return result;
}

- (int)_pixelFormatOfCGImage:(CGImage *)a3
{
  int v4;
  int BitsPerComponent;
  int v6;
  int v7;

  v4 = -[TDTextureImageRenditionSpec monochrome](self, "monochrome");
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (BitsPerComponent << 16 <= 983040)
    v6 = 1195456544;
  else
    v6 = 1195454774;
  if (BitsPerComponent << 16 <= 983040)
    v7 = 1095911234;
  else
    v7 = 1380401751;
  if (v4)
    return v6;
  else
    return v7;
}

- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(int *)a5
{
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  CGImage *v17;

  v10 = (void *)-[TDTextureImageRenditionSpec asset](self, "asset");
  v11 = (void *)objc_msgSend(a3, "pathExtension");
  if (!objc_msgSend(v11, "length")
    || objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("PNG"))
    && objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("JPG"))
    && objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("JPEG"))
    && objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("TIFF"))
    && objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("TGA")))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(a2);
    NSLog(CFSTR("-[%@ %@] Texture image asset %@ not in one of supported formats"), v13, v14, a3);
    return 0;
  }
  v15 = (void *)objc_msgSend(v10, "sourceImageWithDocument:", a4);
  v16 = objc_msgSend(v15, "image");
  if (!v15)
    return 0;
  v17 = (CGImage *)v16;
  if (a5)
    *a5 = -[TDTextureImageRenditionSpec _pixelFormatOfCGImage:](self, "_pixelFormatOfCGImage:", v16);
  CGImageRetain(v17);
  return v17;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  __int16 v14;
  CGImage *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  CGColorSpace *v21;
  size_t BitsPerComponent;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  CGImage *v31;
  uint64_t v32;
  void *v33;
  CGImage *image;
  _BOOL4 v36;
  id obj;
  TDTextureImageRenditionSpec *v38;
  int v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[2];
  double v46;
  double v47;
  unsigned int v48;
  _BYTE v49[128];
  uint64_t v50;

  v6 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)-[TDTextureImageRenditionSpec production](self, "production", a3, a4);
  v9 = (void *)-[TDTextureImageRenditionSpec asset](self, "asset");
  v48 = 1095911234;
  if (objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "face"), "identifier"))return 0;
  v11 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
  if (v11 == 1006)
  {
    v12 = objc_alloc(MEMORY[0x24BE28C20]);
    v13 = (void *)objc_msgSend(v12, "initWithCanvasSize:sliceCount:layout:", 0, 1006, *MEMORY[0x24BDD1410], *(double *)(MEMORY[0x24BDD1410] + 8));
    objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDTextureImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    v10 = (void *)objc_msgSend(v13, "CSIRepresentationWithCompression:", v6);

  }
  else
  {
    v14 = v11;
    v15 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", objc_msgSend(v9, "fileURLWithDocument:", a5), a5, &v48);
    v40 = -[TDTextureImageRenditionSpec width](self, "width");
    v39 = -[TDTextureImageRenditionSpec height](self, "height");
    if (objc_msgSend(v8, "renditionSubtype"))
      v14 = objc_msgSend((id)objc_msgSend(v8, "renditionSubtype"), "identifier");
    v36 = v6;
    if (-[TDTextureImageRenditionSpec parentRendition](self, "parentRendition"))
    {
      -[TDRenditionSpec packedPoint](self, "packedPoint");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithInternalReferenceRect:layout:", v14, v16, v17, (double)v40, (double)v39);
      v19 = objc_alloc_init(MEMORY[0x24BE28C70]);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
      objc_msgSend(v19, "setReferenceKey:", v20);
      objc_msgSend(v18, "addLayerReference:", v19);

    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithTextureImageWithSize:forPixelFormat:cubeMap:", -[TDTextureImageRenditionSpec textureFormat](self, "textureFormat"), -[TDTextureImageRenditionSpec isCubeMap](self, "isCubeMap"), (double)v40, (double)v39);
    }
    objc_msgSend(v18, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    objc_msgSend(v18, "setPixelFormat:", v48);
    objc_msgSend(v18, "setName:", objc_msgSend(v9, "name"));
    if (v15)
    {
      CGImageGetColorSpace(v15);
      v21 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
      BitsPerComponent = CGImageGetBitsPerComponent(v15);
      v23 = -[TDTextureImageRenditionSpec monochrome](self, "monochrome");
      objc_msgSend(a5, "allowsExtendedRangePixelFormats");
      if (objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") != 1|| (!CGColorSpaceEqualToColorSpace() || BitsPerComponent <= 8)&& (BitsPerComponent > 8 ? (v24 = v23) : (v24 = 0), (v24 & 1) == 0 && BitsPerComponent >= 9))
      {
        if (v23)
          v25 = 1195456544;
        else
          v25 = 1095911234;
        objc_msgSend(v18, "setPixelFormat:", v25);
      }
      CGColorSpaceRelease(v21);
    }
    objc_msgSend(v18, "setScaleFactor:", objc_msgSend(v9, "scaleFactor", v15));
    objc_msgSend(v18, "setExifOrientation:", objc_msgSend(v9, "exifOrientation"));
    objc_msgSend(v18, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
    memset(v45, 0, sizeof(v45));
    v46 = (double)v40;
    v47 = (double)v39;
    objc_msgSend(v18, "addMetrics:", v45);
    v38 = self;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = -[TDTextureImageRenditionSpec textureFacesWithDocument:](self, "textureFacesWithDocument:", a5);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v31 = (CGImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "asset"), "sourceImageWithDocument:", a5), "image");
          CGImageGetWidth(v31);
          CGImageGetHeight(v31);
          v32 = CGImageGetBitmapInfo(v31) & 0x1F;
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C18]), "initWithCGImage:width:height:texturePixelFormat:", v31, v40, v39, -[TDTextureImageRenditionSpec textureFormat](v38, "textureFormat"));
          objc_msgSend(v33, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
          objc_msgSend(v33, "setPixelFormat:", objc_msgSend(v18, "pixelFormat"));
          objc_msgSend(v33, "setColorSpaceID:", (int)objc_msgSend(v18, "colorSpaceID"));
          objc_msgSend(v33, "setSourceAlphaInfo:", v32);
          objc_msgSend(v33, "setTextureInterpretation:", objc_msgSend((id)objc_msgSend(v8, "textureInterpretation"), "identifier"));
          objc_msgSend(v33, "setExifOrientation:", objc_msgSend((id)objc_msgSend(v30, "asset"), "exifOrientation"));
          objc_msgSend(v33, "setFlipped:", objc_msgSend(v30, "flipped"));
          objc_msgSend(v18, "addBitmap:", v33);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v27);
    }
    objc_msgSend(v18, "setOptOutOfThinning:", objc_msgSend(v8, "optOutOfThinning"));
    v10 = (void *)objc_msgSend(v18, "CSIRepresentationWithCompression:", v36);

    CGImageRelease(image);
  }
  return v10;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  void *v5;
  CGImage *v6;
  int AlphaInfo;
  objc_super v10;
  int v11;

  v5 = (void *)-[TDTextureImageRenditionSpec asset](self, "asset");
  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)TDTextureImageRenditionSpec;
  -[TDRenditionSpec updatePackingPropertiesWithDocument:](&v10, sel_updatePackingPropertiesWithDocument_, a3);
  v6 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", objc_msgSend(v5, "fileURLWithDocument:", a3), a3, &v11);
  AlphaInfo = CUICGImageGetAlphaInfo();
  if (AlphaInfo == 5 || AlphaInfo == 0)
    -[TDTextureImageRenditionSpec setOpaque:](self, "setOpaque:", 1);
  if (CUIImageIsMonochrome())
    -[TDTextureImageRenditionSpec setMonochrome:](self, "setMonochrome:", 1);
  CGImageRelease(v6);
  return 1;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

@end
