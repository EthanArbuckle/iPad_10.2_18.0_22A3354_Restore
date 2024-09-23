@implementation TDTextureRawRenditionSpec

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TextureRawRenditionSpec"));
}

- (id)textureWithDocument:(id)a3
{
  CGImage *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  SEL v11;
  TDTextureRawRenditionSpec *v12;
  uint64_t v13;
  int v15;

  v15 = 0;
  v6 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), a3, &v15);
  v7 = objc_msgSend((id)-[TDTextureRawRenditionSpec keySpec](self, "keySpec"), "dimension1");
  if (v7 == 2)
  {
    objc_msgSend(a3, "targetPlatform");
    v8 = (void *)CUICreateSDFGradientTextureFromImage();
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = CFSTR("CUICreateSDFGradientTextureFromImage() returned a NULL");
      v11 = a2;
      v12 = self;
      v13 = 32;
      goto LABEL_8;
    }
  }
  else
  {
    if (v7 != 1)
    {
LABEL_9:
      CGImageRelease(v6);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDTextureRawRenditionSpec+CoreDataClass.m"), 40, CFSTR("%s got a NULL texture"), "-[TDTextureRawRenditionSpec textureWithDocument:]");
      return 0;
    }
    objc_msgSend(a3, "targetPlatform");
    v8 = (void *)CUICreateSDFEdgeTextureFromImage();
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = CFSTR("CUICreateSDFEdgeTextureFromImage() returned a NULL");
      v11 = a2;
      v12 = self;
      v13 = 28;
LABEL_8:
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("TDTextureRawRenditionSpec+CoreDataClass.m"), v13, v10);
      goto LABEL_9;
    }
  }
  CGImageRelease(v6);
  return v8;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  unsigned int v24;
  _OWORD v25[2];
  double v26;
  double v27;

  v23 = a3;
  memset(v25, 0, sizeof(v25));
  v7 = -[TDTextureRawRenditionSpec textureWithDocument:](self, "textureWithDocument:", a5, a4);
  objc_msgSend(v7, "dimensions");
  v9 = v8;
  objc_msgSend(v7, "dimensions");
  v11 = v10;
  v24 = v9;
  v12 = (double)v10;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithTextureImageWithSize:forPixelFormat:cubeMap:", objc_msgSend(v7, "pixelFormat"), objc_msgSend(v7, "cubemap"), (double)v9, (double)v10);
  objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "scaleFactor"));
  v14 = a5;
  objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v13, "setPixelFormat:", 1095911234);
  objc_msgSend(v13, "setName:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "name"));
  v26 = (double)v9;
  v27 = v12;
  objc_msgSend(v13, "addMetrics:", v25);
  v15 = (void *)objc_msgSend((id)objc_msgSend(v7, "mipmapLevels"), "objectAtIndexedSubscript:", objc_msgSend((id)-[TDTextureRawRenditionSpec keySpec](self, "keySpec"), "dimension2"));
  if (objc_msgSend((id)objc_msgSend(v15, "elements"), "count"))
  {
    v16 = 0;
    do
    {
      v17 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "elements"), "objectAtIndexedSubscript:", v16), "faces"), "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_msgSend((id)objc_msgSend(v17, "buffer"), "map");
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C18]), "initWithCGImage:width:height:texturePixelFormat:", 0, v24, v11, objc_msgSend(v7, "pixelFormat"));
      objc_msgSend(v19, "setSourceAlphaInfo:", 0);
      objc_msgSend(v19, "setRowbytes:", objc_msgSend(v17, "bytesPerRow"));
      objc_msgSend(v19, "setTargetPlatform:", objc_msgSend(v14, "targetPlatform"));
      objc_msgSend(v19, "setPixelFormat:", objc_msgSend(v13, "pixelFormat"));
      objc_msgSend(v19, "setTextureInterpretation:", 0);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v17, "bytesPerImage"));
      objc_msgSend(v19, "setPixelData:", v20);

      objc_msgSend(v13, "addBitmap:", v19);
      ++v16;
    }
    while (v16 < objc_msgSend((id)objc_msgSend(v15, "elements"), "count"));
  }
  objc_msgSend(v13, "setOptOutOfThinning:", objc_msgSend((id)-[TDTextureRawRenditionSpec production](self, "production"), "optOutOfThinning"));
  objc_msgSend(v13, "setPreserveForArchiveOnly:", -[TDTextureRawRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v21 = (void *)objc_msgSend(v13, "CSIRepresentationWithCompression:", v23);

  return v21;
}

@end
