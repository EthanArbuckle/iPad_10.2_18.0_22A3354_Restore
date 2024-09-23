@implementation TDFlattenedImageRenditionSpec

- (void)drawFlattenedImageIntoContext:(CGContext *)a3 document:(id)a4
{
  unsigned int v7;
  double Width;
  double Height;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  CGImage *v21;
  float v22;
  double v23;
  CGImage *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
  CGContextSaveGState(a3);
  Width = (double)CGBitmapContextGetWidth(a3);
  Height = (double)CGBitmapContextGetHeight(a3);
  CGContextTranslateCTM(a3, (Width - (double)(int)-[TDFlattenedImageRenditionSpec width](self, "width")) * 0.5, (Height - (double)(int)-[TDFlattenedImageRenditionSpec height](self, "height")) * 0.5);
  v10 = (double)(int)-[TDFlattenedImageRenditionSpec width](self, "width");
  v11 = (double)(int)-[TDFlattenedImageRenditionSpec height](self, "height");
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v10;
  v31.size.height = v11;
  CGContextClipToRect(a3, v31);
  if (objc_msgSend((id)-[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"), "count"))
  {
    v12 = (double)v7;
    CGContextScaleCTM(a3, (double)v7, (double)v7);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = (void *)-[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences", 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      v17 = Height / v12;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v20 = (void *)objc_msgSend(v19, "reference");
          v21 = (CGImage *)objc_msgSend(v20, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(v20, "asset"), "fileURLWithDocument:", a4), a4, 0, 0);
          CGContextSetBlendMode(a3, (CGBlendMode)objc_msgSend((id)objc_msgSend(v19, "blendMode"), "integerValue"));
          objc_msgSend((id)objc_msgSend(v19, "opacity"), "floatValue");
          CGContextSetAlpha(a3, v22);
          objc_msgSend(v19, "frameRect");
          v32.origin.y = v17 - v32.size.height - v23;
          CGContextDrawImage(a3, v32, v21);
          CGImageRelease(v21);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }
  }
  else if (-[TDFlattenedImageRenditionSpec asset](self, "asset"))
  {
    v24 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a4), a4, 0, 0);
    CGContextSetBlendMode(a3, kCGBlendModeNormal);
    CGContextSetAlpha(a3, 1.0);
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    v33.size.width = v10;
    v33.size.height = v11;
    CGContextDrawImage(a3, v33, v24);
    CGImageRelease(v24);
  }
  CGContextRestoreGState(a3);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  _BOOL8 v7;
  id result;
  int v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  if (-[TDFlattenedImageRenditionSpec asset](self, "asset")
    || (result = (id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"), "count")) != 0)
  {
    v11 = objc_msgSend(a5, "allowsExtendedRangePixelFormats");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithCanvasSize:sliceCount:layout:", 0, 0, (double)(int)-[TDFlattenedImageRenditionSpec width](self, "width"), (double)(int)-[TDFlattenedImageRenditionSpec height](self, "height"));
    if (objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") == 1)v13 = 3;
    else
      v13 = a4;
    if (v11)
    {
      if (v13 == 3)
      {
        if (-[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"))
          v16 = 1195454774;
        else
          v16 = 1380401751;
        objc_msgSend(v12, "setPixelFormat:", v16);
        if (-[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"))
          LOWORD(a4) = 6;
        else
          LOWORD(a4) = 4;
      }
      else if (v13 == 1)
      {
        if (-[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"))
          v14 = 1195456544;
        else
          v14 = 1095911234;
        objc_msgSend(v12, "setPixelFormat:", v14);
        LOWORD(a4) = 1;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDFlattenedImageRenditionSpec.m"), 99, CFSTR("Flattened image %@ got passed an unexpected colorValue '%d'"), objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec production](self, "production"), "name"), "name"), v13);
      }
    }
    else
    {
      if (-[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"))
        v15 = 1195456544;
      else
        v15 = 1095911234;
      objc_msgSend(v12, "setPixelFormat:", v15);
      LOWORD(a4) = v13;
    }
    objc_msgSend(v12, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ZZZZFlattenedImage-%d.%d.%d-gamut%d"), objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), -[TDFlattenedImageRenditionSpec opaque](self, "opaque"), -[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"), objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier")));
    objc_msgSend(v12, "setColorSpaceID:", (__int16)a4);
    objc_msgSend(v12, "setScaleFactor:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    objc_msgSend(v12, "addSliceRect:", *MEMORY[0x24BDD1408], *(double *)(MEMORY[0x24BDD1408] + 8), *(double *)(MEMORY[0x24BDD1408] + 16), *(double *)(MEMORY[0x24BDD1408] + 24));
    objc_msgSend(v12, "setBlendMode:", 0);
    objc_msgSend(v12, "setOpacity:", 1.0);
    if (objc_msgSend((id)-[TDFlattenedImageRenditionSpec compressionType](self, "compressionType"), "identifier"))objc_msgSend(v12, "setCompressionType:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec compressionType](self, "compressionType"), "identifier"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C18]), "initWithPixelWidth:pixelHeight:", -[TDFlattenedImageRenditionSpec width](self, "width"), -[TDFlattenedImageRenditionSpec height](self, "height"));
    objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
    if (-[TDFlattenedImageRenditionSpec opaque](self, "opaque"))
      v18 = 6;
    else
      v18 = 2;
    objc_msgSend(v17, "setSourceAlphaInfo:", v18);
    objc_msgSend(v17, "setColorSpaceID:", (int)objc_msgSend(v12, "colorSpaceID"));
    objc_msgSend(v12, "addBitmap:", v17);
    -[TDFlattenedImageRenditionSpec drawFlattenedImageIntoContext:document:](self, "drawFlattenedImageIntoContext:document:", objc_msgSend(v17, "bitmapContext"), a5);
    v19 = (void *)objc_msgSend(v12, "CSIRepresentationWithCompression:", v7);

    return v19;
  }
  return result;
}

- (void)addLayerReferencesObject:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithOrderedSet:", -[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"));
  objc_msgSend(v5, "addObject:", a3);
  -[TDFlattenedImageRenditionSpec setLayerReferences:](self, "setLayerReferences:", v5);
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

@end
