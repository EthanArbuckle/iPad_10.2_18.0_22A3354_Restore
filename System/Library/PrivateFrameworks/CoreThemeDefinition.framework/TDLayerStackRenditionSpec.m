@implementation TDLayerStackRenditionSpec

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)-[TDLayerStackRenditionSpec asset](self, "asset", a3, a4);
  if (-[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier") == 1002)
    v8 = 1002;
  else
    v8 = 1018;
  v9 = objc_msgSend(v7, "imageStackDataWithDocument:", a5);
  v10 = objc_alloc(MEMORY[0x24BE28C20]);
  -[TDLayerStackRenditionSpec canvasSize](self, "canvasSize");
  v11 = (void *)objc_msgSend(v10, "initWithLayerStackData:type:withCanvasSize:", v9, v8);
  objc_msgSend(v11, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v11, "setScaleFactor:", objc_msgSend(v7, "scaleFactor"));
  objc_msgSend(v11, "setUtiType:", CFSTR("public.layeredimage"));
  objc_msgSend(v11, "setName:", objc_msgSend(v7, "name"));
  v12 = (void *)-[TDLayerStackRenditionSpec layerReferences](self, "layerReferences");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "addLayerReference:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "cuiLayerReference"));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }
  objc_msgSend(v11, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  v17 = (void *)objc_msgSend(v11, "CSIRepresentationWithCompression:", 1);

  return v17;
}

- (void)setCanvasSize:(CGSize)a3
{
  double height;
  double width;
  NSSize v6;

  height = a3.height;
  width = a3.width;
  -[TDLayerStackRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("canvasSize"));
  -[TDLayerStackRenditionSpec setPrimitiveCanvasSize:](self, "setPrimitiveCanvasSize:", width, height);
  -[TDLayerStackRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("canvasSize"));
  v6.width = width;
  v6.height = height;
  -[TDLayerStackRenditionSpec setCanvasSizeString:](self, "setCanvasSizeString:", NSStringFromSize(v6));
}

- (CGSize)canvasSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TDLayerStackRenditionSpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("canvasSize"));
  -[TDLayerStackRenditionSpec primitiveCanvasSize](self, "primitiveCanvasSize");
  v4 = v3;
  v6 = v5;
  -[TDLayerStackRenditionSpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("canvasSize"));
  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)awakeFromFetch
{
  NSSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TDLayerStackRenditionSpec;
  -[TDLayerStackRenditionSpec awakeFromFetch](&v4, sel_awakeFromFetch);
  v3 = NSSizeFromString((NSString *)-[TDLayerStackRenditionSpec canvasSizeString](self, "canvasSizeString"));
  -[TDLayerStackRenditionSpec setPrimitiveCanvasSize:](self, "setPrimitiveCanvasSize:", v3.width, v3.height);
}

- (void)prepareForDeletion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDLayerStackRenditionSpec;
  -[TDLayerStackRenditionSpec prepareForDeletion](&v3, sel_prepareForDeletion);
  if (-[TDLayerStackRenditionSpec asset](self, "asset"))
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend((id)-[TDLayerStackRenditionSpec asset](self, "asset"), "renditions"), "count") <= 1)objc_msgSend((id)-[TDLayerStackRenditionSpec managedObjectContext](self, "managedObjectContext"), "deleteObject:", -[TDLayerStackRenditionSpec asset](self, "asset"));
  }
}

- (CGSize)primitiveCanvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->primitiveCanvasSize.width;
  height = self->primitiveCanvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPrimitiveCanvasSize:(CGSize)a3
{
  self->primitiveCanvasSize = a3;
}

@end
