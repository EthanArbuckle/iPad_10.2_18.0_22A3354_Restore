@implementation CSIGenerator

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_class *v16;
  int v17;
  uint64_t v18;
  BOOL v19;

  v19 = 0;
  __SetBoolConfigFromEnvironment((BOOL *)&__coreThemeLoggingEnabled, "CoreThemeLoggingEnabled");
  __SetBoolConfigFromEnvironment((BOOL *)&__loggingEnabled, "CoreUI_LogCompressionStats");
  if (getenv("CoreUI_USELZVN"))
  {
    __SetBoolConfigFromEnvironment(&v19, "CoreUI_USELZVN");
    if (getenv("CoreUI_USELZVN"))
      _CUILog(1, (uint64_t)"CoreUI: CoreUI_USELZVN is depreciated use the environment variable CoreUI_COMPRESSION instead", v2, v3, v4, v5, v6, v7, v18);
    __environmentRequestedCompression = v19;
  }
  else
  {
    v8 = getenv("CoreUI_COMPRESSION");
    if (v8)
    {
      v9 = v8;
      if (!strncasecmp(v8, "lzw", 3uLL))
      {
        __environmentRequestedCompression = 0;
      }
      else
      {
        if (!strncasecmp(v9, "lzvn", 4uLL))
        {
          v16 = &OBJC_METACLASS___CUINamedSolidLayerStack;
          v17 = 1;
        }
        else
        {
          if (strncasecmp(v9, "lzfse", 5uLL))
          {
            _CUILog(4, (uint64_t)"CoreUI: Unknown value passed to environment variable '%s' ignoring", v10, v11, v12, v13, v14, v15, (uint64_t)"CoreUI_COMPRESSION");
            return;
          }
          v16 = &OBJC_METACLASS___CUINamedSolidLayerStack;
          v17 = 2;
        }
        LODWORD(v16[98].isa) = v17;
      }
    }
  }
}

+ (void)setFileEncoding:(int)a3
{
  if (!getenv("CoreUI_USELZVN") && !getenv("CoreUI_COMPRESSION"))
    __environmentRequestedCompression = a3;
}

+ (int)fileEncoding
{
  return __environmentRequestedCompression;
}

- (CSIGenerator)initWithCanvasSize:(CGSize)a3 sliceCount:(unsigned int)a4 layout:(signed __int16)a5
{
  int v5;
  CGFloat height;
  CGFloat width;
  CSIGenerator *v9;
  CSIGenerator *v10;
  objc_super v12;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  v9 = -[CSIGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_size.width = width;
    v9->_size.height = height;
    v9->_layout = v5;
    if (v5 != 6)
    {
      v9->_slices = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a4);
      v10->_bitmaps = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
      v10->_metrics = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    }
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_blendMode = 0;
    v10->_opacity = 1.0;
    v10->_pixelFormat = 1095911234;
    *(_WORD *)&v10->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
  }
  return v10;
}

- (CSIGenerator)initWithShapeEffectPreset:(id)a3 forScaleFactor:(unsigned int)a4
{
  CSIGenerator *v6;
  CSIGenerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSIGenerator;
  v6 = -[CSIGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_size = NSZeroSize;
    v6->_layout = 7;
    v6->_scaleFactor = a4;
    -[CSIGenerator setEffectPreset:](v6, "setEffectPreset:", a3);
    v7->_blendMode = 0;
    v7->_opacity = 1.0;
    v7->_pixelFormat = 1095911234;
    *(_WORD *)&v7->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v7->_allowsPaletteImageCompression = 0;
  }
  return v7;
}

- (CSIGenerator)initWithNameList:(id)a3
{
  CSIGenerator *v4;
  CSIGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSIGenerator;
  v4 = -[CSIGenerator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_layout = 1005;
    v4->_scaleFactor = 1;
    v4->_containedNamedElements = (NSArray *)a3;
  }
  return v5;
}

- (CSIGenerator)initWithRawData:(id)a3 pixelFormat:(unsigned int)a4 layout:(signed __int16)a5
{
  int v9;
  CSIGenerator *v10;
  CSIGenerator *v11;
  objc_super v13;

  if ((int)a4 <= 1246774598)
  {
    if (a4 == 1145132097)
      goto LABEL_9;
    v9 = 1212500294;
  }
  else
  {
    if (a4 == 1246774599 || a4 == 1346651680)
      goto LABEL_9;
    v9 = 1398163232;
  }
  if (a4 != v9)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSIGenerator.m"), 284, CFSTR("initWithRawData is only supported for SVG/PDF/JPEG/HEIGF and Raw data for now"));
LABEL_9:
  v13.receiver = self;
  v13.super_class = (Class)CSIGenerator;
  v10 = -[CSIGenerator init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_layout = a5;
    v10->_scaleFactor = 0;
    v10->_pixelFormat = a4;
    v10->_rawData = (NSData *)a3;
    *(_WORD *)&v11->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v11->_allowsPaletteImageCompression = 0;
    v11->_opacity = 1.0;
    if (a4 == 1246774599 || a4 == 1212500294)
    {
      v11->_slices = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v11->_bitmaps = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v11->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
  }
  return v11;
}

- (CSIGenerator)initWithExternalReference:(id)a3 tags:(id)a4
{
  CSIGenerator *v6;
  CSIGenerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSIGenerator;
  v6 = -[CSIGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_size = NSZeroSize;
    v6->_layout = 1001;
    v6->_blendMode = 0;
    v6->_opacity = 1.0;
    v6->_pixelFormat = 1095911234;
    *(_WORD *)&v6->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v6->_allowsPaletteImageCompression = 0;
    v6->_assetPackIdentifier = (NSString *)a3;
    v7->_externalTags = (NSSet *)a4;
  }
  return v7;
}

- (CSIGenerator)initWithLayerStackData:(id)a3 withCanvasSize:(CGSize)a4
{
  return -[CSIGenerator initWithLayerStackData:type:withCanvasSize:](self, "initWithLayerStackData:type:withCanvasSize:", a3, 1002, a4.width, a4.height);
}

- (CSIGenerator)initWithLayerStackData:(id)a3 type:(int64_t)a4 withCanvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  signed __int16 v7;
  CSIGenerator *v9;
  CSIGenerator *v10;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  v9 = -[CSIGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_size.width = width;
    v9->_size.height = height;
    v9->_layout = v7;
    v9->_blendMode = 0;
    v9->_opacity = 1.0;
    v9->_pixelFormat = 1145132097;
    *(_WORD *)&v9->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v9->_allowsPaletteImageCompression = 0;
    v9->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_rawData = (NSData *)a3;
  }
  return v10;
}

- (CSIGenerator)initWithTextureForPixelFormat:(int64_t)a3
{
  CSIGenerator *v4;
  CSIGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSIGenerator;
  v4 = -[CSIGenerator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_layout = 1007;
    v4->_textureFormat = a3;
    v4->_pixelFormat = 1095911234;
    v4->_opacity = 1.0;
    *(_WORD *)&v4->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v4->_allowsPaletteImageCompression = 0;
    v4->_mipReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v5;
}

- (CSIGenerator)initWithTextureImageWithSize:(CGSize)a3 forPixelFormat:(int64_t)a4 cubeMap:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CSIGenerator *v9;
  CSIGenerator *v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CSIGenerator;
  v9 = -[CSIGenerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_size.width = width;
    v9->_size.height = height;
    v9->_layout = 1008;
    v9->_textureFormat = a4;
    v9->_pixelFormat = 1095911234;
    v9->_opacity = 1.0;
    v9->_isCubeMap = v5;
    v11 = objc_alloc((Class)NSMutableArray);
    if (v5)
      v12 = 6;
    else
      v12 = 1;
    v10->_bitmaps = (NSMutableArray *)objc_msgSend(v11, "initWithCapacity:", v12);
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
  }
  return v10;
}

- (CSIGenerator)initWithInternalReferenceRect:(CGRect)a3 layout:(signed __int16)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CSIGenerator *v9;
  CSIGenerator *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[CSIGenerator initWithCanvasSize:sliceCount:layout:](self, "initWithCanvasSize:sliceCount:layout:", 1, 1003, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_externalReferenceFrame.origin.x = x;
    v9->_externalReferenceFrame.origin.y = y;
    v9->_externalReferenceFrame.size.width = width;
    v9->_externalReferenceFrame.size.height = height;

    v10->_slices = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_blendMode = 0;
    v10->_opacity = 1.0;
    v10->_pixelFormat = 1095911234;
    *(_WORD *)&v10->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
    v10->_linkLayout = a4;
  }
  return v10;
}

- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5
{
  signed __int16 v6;
  CSIGenerator *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSIGenerator;
  v8 = -[CSIGenerator init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_colorComponents = (NSArray *)a5;
    v8->_colorSpaceID = v6;
    v8->_layout = 1009;
  }
  return v8;
}

- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5 linkedToSystemColorWithName:(id)a6
{
  signed __int16 v8;
  CSIGenerator *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  v10 = -[CSIGenerator init](&v12, sel_init);
  if (v10)
  {
    v10->_name = (NSString *)a3;
    v10->_colorComponents = (NSArray *)a5;
    v10->_colorSpaceID = v8;
    v10->_layout = 1009;
    v10->_systemColorName = (NSString *)a6;
  }
  return v10;
}

- (CSIGenerator)initWithTextStyleNamed:(id)a3 fontName:(id)a4 fontSize:(double)a5 maxPointSize:(double)a6 minPointSize:(double)a7 scalingStyle:(signed __int16)a8 alignment:(signed __int16)a9
{
  CSIGenerator *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CSIGenerator;
  v16 = -[CSIGenerator init](&v18, sel_init);
  if (v16)
  {
    v16->_name = (NSString *)a3;
    v16->_fontName = (NSString *)a4;
    v16->_fontSize = a5;
    v16->_maxPointSize = a6;
    v16->_minPointSize = a7;
    v16->_scalingStyle = a8;
    v16->_alignment = a9;
    v16->_layout = 1015;
  }
  return v16;
}

- (CSIGenerator)initWithMultisizeImageSetNamed:(id)a3 sizesByIndex:(id)a4
{
  CSIGenerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSIGenerator;
  v6 = -[CSIGenerator init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)a3;
    v6->_sizesByIndex = (NSDictionary *)a4;
    v6->_layout = 1010;
  }
  return v6;
}

- (CSIGenerator)initWithModelAsset:(id)a3
{
  CSIGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  v4 = -[CSIGenerator init](&v6, sel_init);
  if (v4)
  {
    v4->_modelAsset = (MDLAsset *)a3;
    v4->_layout = 1011;
    v4->_meshReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (CSIGenerator)initWithModelMesh:(id)a3
{
  CSIGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  v4 = -[CSIGenerator init](&v6, sel_init);
  if (v4)
  {
    v4->_modelMesh = (MDLMesh *)a3;
    v4->_layout = 1012;
    v4->_submeshReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (CSIGenerator)initWithModelSubmesh:(id)a3
{
  CSIGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  v4 = -[CSIGenerator init](&v6, sel_init);
  if (v4)
  {
    v4->_modelSubmesh = (MDLSubmesh *)a3;
    v4->_layout = 1016;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSIGenerator;
  -[CSIGenerator dealloc](&v3, sel_dealloc);
}

- (id)rawData
{
  return self->_rawData;
}

- (void)_shouldUseCompactCompressionForBitmap:(void *)result
{
  void *v3;
  _BOOL4 v4;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "compressionType") == (id)3 && objc_msgSend(v3, "pixelFormat") == 1095911234)
      v4 = objc_msgSend(a2, "sourceAlphaInfo") == 5
        || objc_msgSend(a2, "sourceAlphaInfo") == 6
        || objc_msgSend(a2, "sourceAlphaInfo") == 0;
    else
      v4 = 0;
    return (void *)(objc_msgSend(a2, "allowsCompactCompression") & v4);
  }
  return result;
}

- (id)_updateCompressionInfoFor:(id)result
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "compressionType") == (id)3)
    {
      v4 = objc_msgSend(v3, "allowsHevcCompression");
      if (objc_msgSend(v3, "pixelFormat") == 1195456544 && !v4)
      {
        v5 = 0;
LABEL_10:
        objc_msgSend(a2, "setCompressionType:", v5);
        objc_msgSend(a2, "setTargetPlatform:", objc_msgSend(v3, "targetPlatform"));
        objc_msgSend(v3, "compressionQuality");
        objc_msgSend(a2, "setCompressionQuality:");
        objc_msgSend(a2, "setAllowsPaletteImageCompression:", objc_msgSend(v3, "allowsPaletteImageCompression"));
        objc_msgSend(a2, "setAllowsHevcCompression:", objc_msgSend(v3, "allowsHevcCompression"));
        objc_msgSend(a2, "setAllowsDeepmapImageCompression:", objc_msgSend(v3, "allowsDeepmapImageCompression"));
        return objc_msgSend(a2, "setAllowsDeepmap2ImageCompression:", objc_msgSend(v3, "allowsDeepmap2ImageCompression"));
      }
    }
    else
    {
      objc_msgSend(v3, "pixelFormat");
    }
    if ((-[CSIGenerator _shouldUseCompactCompressionForBitmap:](v3, a2) & 1) != 0)
      v5 = 7;
    else
      v5 = (uint64_t)objc_msgSend(v3, "compressionType");
    goto LABEL_10;
  }
  return result;
}

- (void)addBitmap:(id)a3
{
  objc_msgSend(a3, "setName:", -[CSIGenerator name](self, "name"));
  -[CSIGenerator _updateCompressionInfoFor:](self, a3);
  -[NSMutableArray addObject:](self->_bitmaps, "addObject:", a3);
}

- (void)setCompressionQuality:(double)a3
{
  NSMutableArray *bitmaps;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_compressionQuality = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  bitmaps = self->_bitmaps;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(bitmaps);
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  NSMutableArray *bitmaps;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_compressionType = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  bitmaps = self->_bitmaps;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(bitmaps);
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setTargetPlatform:(int64_t)a3
{
  NSMutableArray *bitmaps;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  self->_targetPlatform = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  bitmaps = self->_bitmaps;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(bitmaps);
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)addSliceRect:(CGRect)a3
{
  -[NSMutableArray addObject:](self->_slices, "addObject:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
}

- (void)addMetrics:(id *)a3
{
  CGSize var1;
  NSSize v6[3];
  NSSize v7[3];

  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  v7[2] = a3->var2;
  v6[0] = (NSSize)CSIIllegalMetrics;
  v6[1] = (NSSize)unk_19EC72098;
  v6[2] = (NSSize)xmmword_19EC720A8;
  if (!CSIEqualMetrics(v7, v6))
    -[NSMutableArray addObject:](self->_metrics, "addObject:", +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", a3, "{?={CGSize=dd}{CGSize=dd}{CGSize=dd}}"));
}

- (void)addLayerReference:(id)a3
{
  -[NSMutableArray addObject:](self->_layerReferences, "addObject:", a3);
}

- (void)addMipReference:(id)a3
{
  -[NSMutableArray addObject:](self->_mipReferences, "addObject:", a3);
}

- (void)addMeshReference:(id)a3
{
  -[NSMutableArray addObject:](self->_meshReferences, "addObject:", a3);
}

- (void)addSubmeshReference:(id)a3
{
  -[NSMutableArray addObject:](self->_submeshReferences, "addObject:", a3);
}

- (unsigned)formatCSIHeader:(unsigned __int8 *)result
{
  unsigned __int8 *v3;
  id v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  double v9;
  unsigned int v10;
  void *v11;
  const char *v12;
  int v13;

  if (!result)
    return result;
  v3 = result;
  *(_QWORD *)a2 = 0x143545349;
  *(_DWORD *)(a2 + 8) = (4 * result[89]) | (2 * result[88]);
  *(_DWORD *)(a2 + 28) &= 0xFu;
  v4 = objc_msgSend(result, "templateRenderingMode");
  if (v4 == (id)1)
  {
    v5 = 8;
  }
  else
  {
    if (v4 != (id)2)
      goto LABEL_7;
    v5 = 16;
  }
  *(_DWORD *)(a2 + 8) |= v5;
LABEL_7:
  if (objc_msgSend(v3, "optOutOfThinning"))
    *(_DWORD *)(a2 + 8) |= 0x20u;
  if (objc_msgSend(v3, "preserveForArchiveOnly"))
    *(_DWORD *)(a2 + 8) |= 0x200u;
  if (objc_msgSend(v3, "preservedVectorRepresentation"))
    *(_DWORD *)(a2 + 8) |= 0x100u;
  if (objc_msgSend(v3, "isFlippable"))
    *(_DWORD *)(a2 + 8) |= 0x40u;
  if (objc_msgSend(v3, "isTintable"))
    *(_DWORD *)(a2 + 8) |= 0x80u;
  *(uint32x2_t *)(a2 + 12) = vcvt_u32_f32(vrndx_f32(vcvt_f32_f64(*(float64x2_t *)(v3 + 8))));
  *(_DWORD *)(a2 + 20) = 100 * *((_DWORD *)v3 + 35);
  *(_DWORD *)(a2 + 24) = *((_DWORD *)v3 + 48);
  v6 = *((_DWORD *)v3 + 48);
  if (v6 > 1195456543)
  {
    if (v6 == 1195456544)
    {
      v8 = *(_DWORD *)(a2 + 28) & 0xFFFFFFF0 | 2;
      goto LABEL_26;
    }
    v7 = 1380401751;
    goto LABEL_22;
  }
  if (v6 != 1095911234)
  {
    v7 = 1195454774;
LABEL_22:
    if (v6 != v7)
    {
      v8 = *(_DWORD *)(a2 + 28);
      goto LABEL_26;
    }
  }
  v8 = *(_DWORD *)(a2 + 28) & 0xFFFFFFF0 | *((_WORD *)v3 + 68) & 0xF;
LABEL_26:
  *(_DWORD *)(a2 + 28) = v8 & 0xF;
  if (objc_msgSend(v3, "modtime"))
  {
    objc_msgSend(objc_msgSend(v3, "modtime"), "timeIntervalSince1970");
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(a2 + 36) = *((unsigned __int16 *)v3 + 69);
  v11 = (void *)*((_QWORD *)v3 + 3);
  if (v11)
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
  else
    v12 = "CoreStructuredImage";
  strncpy((char *)(a2 + 40), v12, 0x7FuLL);
  *(_DWORD *)(a2 + 168) = 0;
  result = (unsigned __int8 *)objc_msgSend(*((id *)v3 + 8), "count");
  if (result <= 1)
    v13 = 1;
  else
    v13 = (int)result;
  *(_DWORD *)(a2 + 172) = v13;
  return result;
}

- (uint64_t)writeResourcesToData:(uint64_t)a1
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  unsigned int v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *i;
  float64_t v37;
  float64x2_t v38;
  float64_t v39;
  float64x2_t v40;
  unsigned int v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  int32x4_t v48;
  int32x2_t v49;
  int32x4_t v50;
  unsigned int v51;
  unsigned int v52;
  id v53;
  id v54;
  int v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *k;
  void *v63;
  float64_t v64;
  float64x2_t v65;
  float64_t v66;
  float64x2_t v67;
  float32x4_t v68;
  __int128 v69;
  double v70;
  unsigned int v71;
  id v72;
  int v73;
  uint64_t v74;
  double v75;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v77;
  int v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  CFIndex v83;
  int v84;
  void *v90;
  const __CFString *v91;
  __CFString *v92;
  CFIndex v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  CFTypeID v100;
  size_t NumberOfComponents;
  uint64_t *Components;
  int64x2_t v103;
  __int128 v104;
  uint64_t v105;
  id v107;
  double v108;
  double v109;
  uint64_t v110;
  float v111;
  float v112;
  int v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  uint64_t v118;
  void *v119;
  int v120;
  id v121;
  unint64_t v122;
  CFIndex v123;
  char *v124;
  id v125;
  unsigned int v126;
  int v127;
  id v128;
  id v129;
  uint64_t v130;
  int v131;
  int8x16_t v132;
  uint64_t m;
  id v134;
  id v135;
  __int128 v137;
  double v138;
  void *v139;
  id obj;
  id obja;
  double v142;
  char v143;
  double v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  double v148;
  uint64_t v149;
  _DWORD v150[2];
  _BYTE v151[52];
  float32x4_t v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  int32x4_t v162;
  int32x2_t v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  unsigned int v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  unsigned int v173;
  uint64_t v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];

  if (!a1)
    return 0;
  v3 = a1;
  v174 = 0;
  v173 = 0;
  if (objc_msgSend(*(id *)(a1 + 56), "count") != (id)9)
    goto LABEL_22;
  if (!objc_msgSend(*(id *)(v3 + 64), "count"))
    goto LABEL_22;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  if (v4 != (double)objc_msgSend(objc_msgSend(*(id *)(v3 + 64), "objectAtIndex:", 0), "width"))
    goto LABEL_22;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  if (v5 != (double)objc_msgSend(objc_msgSend(*(id *)(v3 + 64), "objectAtIndex:", 0), "height"))
    goto LABEL_22;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 0), "rectValue");
  v7 = v6;
  v9 = v8;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 1), "rectValue");
  v148 = v10;
  v12 = v11;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 2), "rectValue");
  v144 = v13;
  v146 = v14;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 3), "rectValue");
  obj = v15;
  v142 = v16;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 5), "rectValue");
  v138 = v17;
  v19 = v18;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 6), "rectValue");
  v21 = v20;
  v23 = v22;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 7), "rectValue");
  v25 = v24;
  v27 = v26;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 8), "rectValue");
  if (v9 != 0.0 && v7 != 0.0)
    goto LABEL_22;
  if ((v12 == 0.0 || v148 == 0.0)
    && (v146 == 0.0 || v144 == 0.0)
    && (v142 == 0.0 || *(double *)&obj == 0.0)
    && (v19 == 0.0 || v138 == 0.0)
    && (v23 == 0.0 || v21 == 0.0)
    && (v27 == 0.0 || v25 == 0.0)
    && (v29 == 0.0 || v28 == 0.0))
  {
    v30 = *(id *)(v3 + 56);
  }
  else
  {
LABEL_22:
    v30 = objc_msgSend(*(id *)(v3 + 56), "sortedArrayUsingFunction:context:", __sliceSort, 0);
  }
  v31 = objc_msgSend(v30, "count");
  v173 = v31;
  if (v31)
  {
    LODWORD(v174) = 1001;
    HIDWORD(v174) = (16 * v31) | 4;
    objc_msgSend(a2, "appendBytes:length:", &v174, 8);
    objc_msgSend(a2, "appendBytes:length:", &v173, 4);
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v170;
      v35 = 12;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v170 != v34)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)i), "rectValue");
          v38.f64[1] = v37;
          v40.f64[1] = v39;
          *(uint32x4_t *)v151 = vcvtq_u32_f32(vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v40), v38)));
          objc_msgSend(a2, "appendBytes:length:", v151, 16);
        }
        v35 += 16 * (_QWORD)v33;
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
      }
      while (v33);
    }
    else
    {
      v35 = 12;
    }
  }
  else
  {
    v35 = 0;
  }
  v168 = 0;
  v41 = objc_msgSend(*(id *)(v3 + 72), "count");
  v168 = v41;
  if (v41)
  {
    LODWORD(v174) = 1003;
    HIDWORD(v174) = (24 * v41) | 4;
    objc_msgSend(a2, "appendBytes:length:", &v174, 8);
    objc_msgSend(a2, "appendBytes:length:", &v168, 4);
    v35 += 12;
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v42 = *(void **)(v3 + 72);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v165;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(_QWORD *)v165 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)j);
          memset(v151, 0, 48);
          objc_msgSend(v47, "getValue:", v151);
          v48 = vcvtq_s32_f32(vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)v151), *(float64x2_t *)&v151[16])));
          v162 = vtrn1q_s32(v48, (int32x4_t)vextq_s8((int8x16_t)v48, (int8x16_t)v48, 0xCuLL));
          v49 = vcvt_s32_f32(vrndx_f32(vcvt_f32_f64(*(float64x2_t *)&v151[32])));
          v163 = v49;
          if (*(_BYTE *)(v3 + 400))
          {
            v50 = vmaxq_s32(v48, (int32x4_t)0);
            v162 = vtrn1q_s32(v50, (int32x4_t)vextq_s8((int8x16_t)v50, (int8x16_t)v50, 0xCuLL));
            v163 = vmax_s32(v49, 0);
          }
          objc_msgSend(a2, "appendBytes:length:", &v162, 24);
        }
        v35 += 24 * (_QWORD)v44;
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
      }
      while (v44);
    }
  }
  v51 = objc_msgSend(*(id *)(v3 + 80), "count");
  v52 = v51;
  v147 = v3;
  if (*(_WORD *)(v3 + 138) == 1003)
  {
    v53 = objc_alloc_init((Class)NSMutableData);
    *(_DWORD *)&v151[24] = 0;
    *(_WORD *)&v151[28] = 0;
    *(_QWORD *)v151 = 1229868107;
    *(int32x4_t *)&v151[8] = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 224)), (int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 240)));
    *(_WORD *)&v151[24] = *(_WORD *)(v3 + 256);
    if (v52 != 1)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_writeResourcesToData_, v3, CFSTR("CSIGenerator.m"), 890, CFSTR("We need to have at 1 and only 1 reference file here"));
    v54 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v3 + 80), "firstObject"), "referenceKey"), "keyList");
    v55 = CUIRenditionKeyTokenCount((uint64_t)v54);
    v56 = (4 * v55 + 4);
    *(_DWORD *)&v151[26] = 4 * v55 + 4;
    objc_msgSend(v53, "appendBytes:length:", v151, 30);
    objc_msgSend(v53, "appendBytes:length:", v54, v56);
    LODWORD(v174) = 1010;
    HIDWORD(v174) = objc_msgSend(v53, "length");
    objc_msgSend(a2, "appendBytes:length:", &v174, 8);
    objc_msgSend(a2, "appendData:", v53);
    v35 += (uint64_t)objc_msgSend(v53, "length") + 8;

  }
  else if (v51)
  {
    v57 = objc_alloc_init((Class)NSMutableData);
    v162.i64[0] = 0;
    v162.i32[0] = objc_msgSend(*(id *)(v3 + 80), "count");
    objc_msgSend(v57, "appendBytes:length:", &v162, 8);
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v58 = *(void **)(v3 + 80);
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v159;
      do
      {
        for (k = 0; k != v60; k = (char *)k + 1)
        {
          if (*(_QWORD *)v159 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * (_QWORD)k);
          memset(v151, 0, 32);
          objc_msgSend(v63, "frame");
          v65.f64[1] = v64;
          v67.f64[1] = v66;
          v68 = vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v67), v65));
          *(_QWORD *)&v69 = vcvtq_s32_f32(v68).u64[0];
          *((_QWORD *)&v69 + 1) = vcvtq_u32_f32(v68).i64[1];
          *(_OWORD *)&v151[4] = v69;
          objc_msgSend(v63, "opacity");
          *(float *)&v70 = v70;
          *(_DWORD *)&v151[24] = LODWORD(v70);
          *(_DWORD *)&v151[20] = objc_msgSend(v63, "blendMode");
          v71 = objc_msgSend(v63, "fixedFrame");
          *(_DWORD *)v151 = *(_DWORD *)v151 & 0xFFFFFFFE | v71;
          v72 = objc_msgSend(objc_msgSend(v63, "referenceKey"), "keyList");
          v73 = CUIRenditionKeyTokenCount((uint64_t)v72);
          v74 = (4 * v73 + 4);
          *(_DWORD *)&v151[28] = 4 * v73 + 4;
          objc_msgSend(v57, "appendBytes:length:", v151, 32);
          objc_msgSend(v57, "appendBytes:length:", v72, v74);
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
      }
      while (v60);
    }
    LODWORD(v174) = 1012;
    HIDWORD(v174) = objc_msgSend(v57, "length");
    objc_msgSend(a2, "appendBytes:length:", &v174, 8);
    objc_msgSend(a2, "appendData:", v57);
    v35 += (uint64_t)objc_msgSend(v57, "length") + 8;

    v3 = v147;
  }
  v174 = 0x8000003ECLL;
  objc_msgSend(a2, "appendBytes:length:", &v174, 8);
  v157 = 0;
  objc_msgSend((id)v3, "opacity");
  *(float *)&v75 = v75;
  HIDWORD(v157) = LODWORD(v75);
  LODWORD(v157) = objc_msgSend((id)v3, "blendMode");
  objc_msgSend(a2, "appendBytes:length:", &v157, 8);
  v139 = a2;
  if (objc_msgSend(*(id *)(v3 + 32), "length"))
  {
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)(v3 + 32));
    v77 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x69B0AC61uLL);
    CFStringGetFileSystemRepresentation(*(CFStringRef *)(v3 + 32), v77, MaximumSizeOfFileSystemRepresentation);
    v78 = strnlen(v77, MaximumSizeOfFileSystemRepresentation);
    *(_QWORD *)v151 = (v78 + 1);
    LODWORD(v174) = 1005;
    HIDWORD(v174) = v78 + 9;
    objc_msgSend(a2, "appendBytes:length:", &v174, 8);
    objc_msgSend(a2, "appendBytes:length:", v151, 8);
    objc_msgSend(a2, "appendBytes:length:", v77, *(unsigned int *)v151);
    v79 = v35 + *(unsigned int *)v151 + 32;
    free(v77);
  }
  else
  {
    v79 = v35 + 16;
  }
  v149 = v79;
  if (objc_msgSend(*(id *)(v3 + 448), "count"))
  {
    v80 = objc_msgSend(objc_msgSend(*(id *)(v3 + 448), "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    obja = v80;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v153, v175, 16);
    if (v81)
    {
      v82 = v81;
      v83 = 0;
      v84 = 0;
      v143 = 0;
      v145 = *(_QWORD *)v154;
      __asm { FMOV            V0.2D, #1.0 }
      v137 = _Q0;
      do
      {
        v90 = 0;
        do
        {
          if (*(_QWORD *)v154 != v145)
            objc_enumerationMutation(obja);
          v91 = *(const __CFString **)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)v90);
          v92 = (__CFString *)objc_msgSend(*(id *)(v3 + 448), "objectForKey:", v91, (_QWORD)v137);
          v93 = CFStringGetMaximumSizeOfFileSystemRepresentation(v91);
          v94 = (char *)malloc_type_malloc(v93, 0x6D829054uLL);
          CFStringGetFileSystemRepresentation(v91, v94, v93);
          v96 = objc_opt_class(NSString, v95);
          if ((objc_opt_isKindOfClass(v92, v96) & 1) != 0)
          {
            v83 = CFStringGetMaximumSizeOfFileSystemRepresentation(v92);
            v98 = (char *)malloc_type_malloc(v83, 0x35A8EC37uLL);
            CFStringGetFileSystemRepresentation(v92, v98, v83);
            v84 = 0;
LABEL_79:
            v3 = v147;
            goto LABEL_80;
          }
          v99 = objc_opt_class(NSNumber, v97);
          if ((objc_opt_isKindOfClass(v92, v99) & 1) != 0)
          {
            if (!strcmp((const char *)-[__CFString objCType](v92, "objCType"), "d"))
            {
              v98 = (char *)malloc_type_malloc(8uLL, 0x37A61F0FuLL);
              -[__CFString doubleValue](v92, "doubleValue");
              *(_QWORD *)v98 = v105;
              v84 = 2;
            }
            else
            {
              v98 = (char *)malloc_type_malloc(8uLL, 0xECC3607DuLL);
              *(_QWORD *)v98 = -[__CFString longLongValue](v92, "longLongValue");
              v84 = 1;
            }
            v83 = 8;
            goto LABEL_79;
          }
          v100 = CFGetTypeID(v92);
          if (v100 != CGColorGetTypeID())
          {
            v98 = 0;
            goto LABEL_79;
          }
          v98 = (char *)malloc_type_malloc(0x20uLL, 0x48E90669uLL);
          NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v92);
          Components = (uint64_t *)CGColorGetComponents((CGColorRef)v92);
          if (NumberOfComponents - 2 < 2)
          {
            v103 = *(int64x2_t *)Components;
            *((_QWORD *)&v104 + 1) = *((_QWORD *)&v137 + 1);
            *(_QWORD *)&v104 = Components[2];
          }
          else
          {
            if (NumberOfComponents != 4)
            {
              v103 = 0uLL;
              v104 = 0uLL;
              v3 = v147;
              if (NumberOfComponents == 1)
              {
                v103 = vdupq_lane_s64(*Components, 0);
                *((_QWORD *)&v104 + 1) = *((_QWORD *)&v137 + 1);
                *(_QWORD *)&v104 = *Components;
              }
              goto LABEL_92;
            }
            v103 = *(int64x2_t *)Components;
            v104 = *((_OWORD *)Components + 1);
          }
          v3 = v147;
LABEL_92:
          *(int64x2_t *)v98 = v103;
          *((_OWORD *)v98 + 1) = v104;
          v143 = 1;
          v84 = 3;
          v83 = 32;
LABEL_80:
          if (v93 < 1 || v83 < 1)
          {
            free(v94);
            if (v98)
              free(v98);
          }
          else
          {
            *(_DWORD *)&v151[8] = v83;
            *(_DWORD *)&v151[12] = v84;
            *(_DWORD *)&v151[16] = v143 & 0xF;
            *(_DWORD *)v151 = 0;
            *(_DWORD *)&v151[4] = v93;
            LODWORD(v174) = 1016;
            HIDWORD(v174) = v93 + v83 + 20;
            objc_msgSend(v139, "appendBytes:length:", &v174, 8);
            objc_msgSend(v139, "appendBytes:length:", v151, 20);
            objc_msgSend(v139, "appendBytes:length:", v94, v93);
            objc_msgSend(v139, "appendBytes:length:", v98, v83);
            v149 += *(unsigned int *)&v151[4] + (unint64_t)*(unsigned int *)&v151[8] + 28;
            free(v98);
            free(v94);
            v83 = 0;
          }
          v90 = (char *)v90 + 1;
        }
        while (v82 != v90);
        v107 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v153, v175, 16);
        v82 = v107;
      }
      while (v107);
    }
  }
  v109 = *(double *)(v3 + 40);
  v108 = *(double *)(v3 + 48);
  if (v109 == CGSizeZero.width && v108 == CGSizeZero.height)
  {
    v110 = v149;
  }
  else
  {
    v111 = v109;
    *(_DWORD *)v151 = 0;
    v112 = v108;
    *(float *)&v151[4] = v111;
    *(float *)&v151[8] = v112;
    v174 = 0xC000003F7;
    objc_msgSend(v139, "appendBytes:length:", &v174, 8);
    objc_msgSend(v139, "appendBytes:length:", v151, 12);
    v110 = v149 + 20;
  }
  v113 = *(_DWORD *)(v3 + 196);
  if (!v113)
  {
    v113 = 1;
    *(_DWORD *)(v3 + 196) = 1;
  }
  *(_DWORD *)v151 = v113;
  v174 = 0x4000003EELL;
  objc_msgSend(v139, "appendBytes:length:", &v174, 8);
  objc_msgSend(v139, "appendBytes:length:", v151, 4);
  v114 = *(float32x4_t *)(v3 + 464);
  v115 = *(float32x4_t *)(v3 + 480);
  v116 = *(float32x4_t *)(v3 + 496);
  v117 = *(float32x4_t *)(v3 + 512);
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqzq_f32(v115), (int8x16_t)vceqzq_f32(v114)), vandq_s8((int8x16_t)vceqzq_f32(v116), (int8x16_t)vceqzq_f32(v117)))) & 0x80000000) != 0)
  {
    v118 = v110 + 12;
  }
  else
  {
    *(_DWORD *)v151 = 0;
    *(float32x4_t *)&v151[4] = v114;
    *(float32x4_t *)&v151[20] = v115;
    *(float32x4_t *)&v151[36] = v116;
    v152 = v117;
    v174 = 0x44000003F9;
    objc_msgSend(v139, "appendBytes:length:", &v174, 8);
    objc_msgSend(v139, "appendBytes:length:", v151, 68);
    v118 = v110 + 88;
  }
  if (*(_QWORD *)(v3 + 200))
  {
    *(_DWORD *)v151 = *(_QWORD *)(v3 + 200);
    v174 = 0x4000003EFLL;
    v119 = v139;
    objc_msgSend(v139, "appendBytes:length:", &v174, 8);
    objc_msgSend(v139, "appendBytes:length:", v151, 4);
    v118 += 12;
  }
  else
  {
    v119 = v139;
  }
  if (!CGRectIsEmpty(*(CGRect *)(v3 + 280)))
  {
    *(_QWORD *)v151 = 1011;
    *(int32x4_t *)&v151[8] = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 264)), (int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 280)));
    *(int32x2_t *)&v151[24] = vmovn_s64((int64x2_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 296)));
    v174 = 0x20000003F3;
    objc_msgSend(v119, "appendBytes:length:", &v174, 8);
    objc_msgSend(v119, "appendBytes:length:", v151, 32);
    v118 += 40;
  }
  v120 = *(unsigned __int16 *)(v3 + 138);
  if (v120 == 1005)
  {
    v162.i32[0] = 0;
    v121 = objc_alloc_init((Class)NSMutableData);
    *(_QWORD *)v151 = objc_msgSend(*(id *)(v3 + 312), "count");
    objc_msgSend(v121, "appendBytes:length:", v151, 8);
    if (*(_DWORD *)v151)
    {
      v122 = 0;
      do
      {
        v123 = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)objc_msgSend(*(id *)(v3 + 312), "objectAtIndex:", v122));
        v124 = (char *)malloc_type_malloc(v123, 0xD91C2938uLL);
        CFStringGetFileSystemRepresentation((CFStringRef)objc_msgSend(*(id *)(v3 + 312), "objectAtIndex:", v122), v124, v123);
        v162.i32[0] = strnlen(v124, v123);
        objc_msgSend(v121, "appendBytes:length:", &v162, 4);
        objc_msgSend(v121, "appendBytes:length:", v124, v162.u32[0]);
        free(v124);
        ++v122;
      }
      while (v122 < *(unsigned int *)v151);
    }
    LODWORD(v174) = 1013;
    HIDWORD(v174) = objc_msgSend(v121, "length");
    objc_msgSend(v119, "appendBytes:length:", &v174, 8);
    objc_msgSend(v119, "appendData:", v121);
    v118 += (uint64_t)objc_msgSend(v121, "length") + 8;

    v120 = *(unsigned __int16 *)(v3 + 138);
  }
  if (v120 == 1007)
  {
    v125 = objc_alloc_init((Class)NSMutableData);
    v126 = objc_msgSend((id)v3, "textureInterpretation");
    v127 = *(unsigned __int8 *)(v3 + 368);
    *(_DWORD *)&v151[4] = v126;
    *(_DWORD *)&v151[8] = v127;
    *(_DWORD *)v151 = 0;
    objc_msgSend(v125, "appendBytes:length:", v151, 12);
    LODWORD(v174) = 1014;
    HIDWORD(v174) = objc_msgSend(v125, "length");
    objc_msgSend(v119, "appendBytes:length:", &v174, 8);
    objc_msgSend(v119, "appendData:", v125);
    v118 += (uint64_t)objc_msgSend(v125, "length") + 8;

  }
  if (objc_msgSend(*(id *)(v3 + 568), "count") || *(_DWORD *)(v3 + 576))
  {
    v128 = objc_alloc_init((Class)NSMutableData);
    v129 = objc_msgSend(*(id *)(v3 + 568), "count");
    v130 = (uint64_t)v129;
    v131 = *(_DWORD *)(v3 + 576);
    *(_DWORD *)v151 = 3;
    *(_DWORD *)&v151[4] = v131;
    *(_QWORD *)&v151[8] = *(_QWORD *)(v3 + 580);
    *(_DWORD *)&v151[16] = *(_DWORD *)(v3 + 588);
    v132 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v3 + 592)), *(float64x2_t *)(v3 + 608));
    *(int8x16_t *)&v151[20] = vextq_s8(v132, v132, 4uLL);
    if (*(_BYTE *)(v3 + 624))
      *(_DWORD *)v151 = 7;
    *(_DWORD *)&v151[36] = (_DWORD)v129;
    objc_msgSend(v128, "appendBytes:length:", v151, 40);
    if (v130 >= 1)
    {
      for (m = 0; m != v130; ++m)
      {
        v162.i64[0] = m;
        v162.i32[1] = objc_msgSend(objc_msgSend(*(id *)(v3 + 568), "objectAtIndex:", m), "intValue");
        objc_msgSend(v128, "appendBytes:length:", &v162, 8);
      }
    }
    LODWORD(v174) = 1018;
    HIDWORD(v174) = objc_msgSend(v128, "length");
    objc_msgSend(v119, "appendBytes:length:", &v174, 8);
    objc_msgSend(v119, "appendData:", v128);
    v134 = objc_msgSend(v128, "length");

    v135 = objc_alloc_init((Class)NSMutableData);
    v162.i32[1] = *(_QWORD *)(v3 + 104);
    v162.i32[0] = 1;
    v162.i32[2] = *(unsigned __int8 *)(v3 + 112) | (2 * *(unsigned __int8 *)(v3 + 113));
    objc_msgSend(v135, "appendBytes:length:", &v162, 12);
    v150[0] = 1019;
    v150[1] = objc_msgSend(v135, "length");
    objc_msgSend(v119, "appendBytes:length:", v150, 8);
    objc_msgSend(v119, "appendData:", v135);
    v118 += (uint64_t)objc_msgSend(v135, "length") + (_QWORD)v134 + 16;

  }
  return v118;
}

- (uint64_t)writeBitmap:(void *)a3 toData:(uint64_t)a4 compress:
{
  uint64_t v4;
  id v7;
  char *v8;
  int v9;
  id v10;
  id v11;
  unsigned int v12;
  char *v13;
  int v14;
  int v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;

  v4 = a1;
  if (a1)
  {
    v27 = 0;
    v24 = 0;
    v21 = 0;
    v7 = objc_msgSend(a2, "compressedData:usedEncoding:andRowChunkSize:", a4, (char *)&v21 + 4, &v21);
    v8 = (char *)objc_msgSend(v7, "count");
    v26 = 1128614989;
    v28 = HIDWORD(v21);
    v29 = 0;
    v22 = 1128416075;
    v23 = 0;
    v25 = 0;
    if (objc_msgSend((id)v4, "allowsMultiPassEncoding")
      && (!objc_msgSend(a2, "sourceAlphaInfo")
       || objc_msgSend(a2, "sourceAlphaInfo") == 6
       || objc_msgSend(a2, "sourceAlphaInfo") == 5))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }
    if ((unint64_t)v8 > 1)
    {
      v27 = v9 | 1;
      v29 = v8;
      v4 = 16;
      objc_msgSend(a3, "appendBytes:length:", &v26, 16);
      v13 = 0;
      v14 = v21;
      v15 = v21;
      do
      {
        v16 = objc_msgSend(v7, "objectAtIndex:", v13);
        v17 = objc_msgSend(v16, "length");
        v24 = v15;
        v25 = v17;
        objc_msgSend(a3, "appendBytes:length:", &v22, 20);
        objc_msgSend(a3, "appendData:", v16);
        v18 = v25;
        v19 = v14 + v15;
        if (v14 + v15 > (int)objc_msgSend(a2, "height"))
          v15 = objc_msgSend(a2, "height") - v14;
        v4 += v18 + 20;
        ++v13;
        v14 = v19;
      }
      while (v8 != v13);
    }
    else
    {
      v27 = v9;
      v10 = objc_msgSend(v7, "lastObject");
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, "length");
        v29 += v12;
        objc_msgSend(a3, "appendBytes:length:", &v26, 16);
        objc_msgSend(a3, "appendData:", v11);
        return v29 + 16;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

- (id)_addNodes:(uint64_t)a3 toNodeList:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  double v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  if (result)
  {
    v5 = result;
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v6 = objc_msgSend(a2, "objectAtIndex:", 0);
      v8 = objc_opt_class(NSNumber, v7);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
      {
        v9 = objc_msgSend(v6, "isColorStop");
        v10 = objc_msgSend(v6, "isOpacityStop");
        if ((v10 & 1) != 0 || (v9 & 1) != 0)
          goto LABEL_7;
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__addNodes_toNodeList_, v5, CFSTR("CSIGenerator.m"), 1439, CFSTR("Unsupported gradient nodes: %@"), a2);
      }
      v9 = 0;
      v10 = 0;
LABEL_7:
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!result)
        return result;
      v11 = result;
      v12 = 0;
      v13 = *(_QWORD *)v38;
      do
      {
        v14 = 0;
        v36 = v12;
        v15 = (_QWORD *)(a3 + 32 + 72 * v12);
        do
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(a2);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
          if (v9)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14), "colorLocation");
            v18 = v17;
            objc_msgSend(v16, "gradientColor");
            v20 = v19;
            v22 = v21;
            v24 = v23;
            v26 = v25;
            if ((objc_opt_respondsToSelector(v16, sel_leadOutColor) & 1) != 0)
            {
              objc_msgSend(v16, "leadOutColor");
              v31 = 1129270340;
              goto LABEL_22;
            }
            v31 = 1129270354;
          }
          else if (v10)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14), "opacityLocation");
            v18 = v32;
            objc_msgSend(v16, "opacity");
            v26 = v33;
            v20 = 0;
            if ((objc_opt_respondsToSelector(v16, sel_leadOutOpacity) & 1) != 0)
            {
              objc_msgSend(v16, "leadOutOpacity");
              v30 = v34;
              v31 = 1330660164;
              v22 = 0;
              v24 = 0;
              v27 = 0;
              v28 = 0;
              v29 = 0;
              goto LABEL_22;
            }
            v31 = 1330660180;
            v22 = 0;
            v24 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14), "floatValue");
            v18 = v35;
            v20 = 0;
            v22 = 0;
            v31 = 1296647248;
            v24 = 0;
            v26 = 0;
          }
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v30 = 0;
LABEL_22:
          *((_DWORD *)v15 - 8) = v31;
          *((float *)v15 - 7) = v18;
          *(v15 - 3) = v20;
          *(v15 - 2) = v22;
          *(v15 - 1) = v24;
          *v15 = v26;
          v15[1] = v27;
          v15[2] = v28;
          v14 = (char *)v14 + 1;
          v15[3] = v29;
          v15[4] = v30;
          v15 += 9;
        }
        while (v11 != v14);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v11 = result;
        v12 = (uint64_t)v14 + v36;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)writeGradientToData:(id *)a1
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;

  if (!a1)
    return 0;
  v3 = objc_msgSend(a1[18], "evaluator");
  v18 = objc_msgSend(v3, "colorStops");
  v19 = objc_msgSend(v3, "colorMidpointLocations");
  v20 = objc_msgSend(v3, "opacityStops");
  v21 = objc_msgSend(v3, "opacityMidpointLocations");
  v4 = objc_msgSend(v18, "count");
  v5 = objc_msgSend(v19, "count");
  v6 = objc_msgSend(v20, "count");
  v7 = objc_msgSend(v21, "count");
  v8 = 72 * (v5 + v4 + v6 + v7);
  v9 = v8 + 80;
  v10 = malloc_type_calloc(v8 + 80, 1uLL, 0x90559558uLL);
  *v10 = 1196572996;
  v10[4] = 2;
  v10[2] = v8;
  v10[3] = objc_msgSend(a1[18], "gradientStyle");
  objc_msgSend(a1[18], "drawingAngle");
  *(float *)&v11 = v11;
  v10[14] = LODWORD(v11);
  objc_msgSend(v3, "smoothingCoefficient");
  *(float *)&v12 = v12;
  v10[15] = LODWORD(v12);
  v10[1] = objc_msgSend(v3, "isDithered");
  objc_msgSend(v3, "fillColor");
  *((_QWORD *)v10 + 3) = v13;
  *((_QWORD *)v10 + 4) = v14;
  *((_QWORD *)v10 + 5) = v15;
  *((_QWORD *)v10 + 6) = v16;
  v10[5] = objc_msgSend(v3, "blendMode");
  v10[16] = v4;
  v10[17] = v5;
  v10[18] = v6;
  v10[19] = v7;
  -[CSIGenerator _addNodes:toNodeList:](a1, v18, (uint64_t)(v10 + 20));
  -[CSIGenerator _addNodes:toNodeList:](a1, v19, (uint64_t)&v10[18 * v4 + 20]);
  -[CSIGenerator _addNodes:toNodeList:](a1, v20, (uint64_t)&v10[18 * v5 + 20 + 18 * v4]);
  -[CSIGenerator _addNodes:toNodeList:](a1, v21, (uint64_t)&v10[18 * v5 + 20 + 18 * v4 + 18 * v6]);
  objc_msgSend(a2, "appendBytes:length:", v10, v8 + 80);
  free(v10);
  return v9;
}

- (uint64_t)writeColorToData:(id *)a1
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  const char *v11;
  uint64_t v13;
  unsigned int v14;

  if (!a1)
    return 0;
  v4 = objc_msgSend(objc_msgSend(a1, "colorComponents"), "count");
  v5 = 8 * v4;
  v6 = v5 + 16;
  v7 = malloc_type_calloc(v5 + 16, 1uLL, 0x9BA78920uLL);
  v8 = *((unsigned __int8 *)v7 + 8);
  *(_QWORD *)v7 = 0x1434F4C52;
  v7[2] = v8;
  v7[3] = v4;
  if (v4)
  {
    for (i = 0; i != v4; *(_QWORD *)&v7[2 * i++ + 4] = v10)
      objc_msgSend(objc_msgSend(objc_msgSend(a1, "colorComponents"), "objectAtIndex:", i), "doubleValue");
  }
  *((_BYTE *)v7 + 8) = objc_msgSend(a1, "colorSpaceID");
  if (objc_msgSend(a1[48], "length"))
    v7[2] = v7[2] & 0xFFFFF8FF | 0x100;
  objc_msgSend(a2, "appendBytes:length:", v7, v5 + 16);
  free(v7);
  if (objc_msgSend(a1[48], "length"))
  {
    v11 = (const char *)objc_msgSend(a1[48], "UTF8String", 0x1434F4C52);
    v14 = strlen(v11);
    objc_msgSend(a2, "appendBytes:length:", &v13, 12);
    objc_msgSend(a2, "appendBytes:length:", v11, v14);
    return v5 + v14 + 28;
  }
  return v6;
}

- (uint64_t)writeTextStyleToData:(CFStringRef *)a1
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  if (!a1)
    return 0;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1[51]);
  v5 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x69994CC9uLL);
  CFStringGetFileSystemRepresentation(a1[51], v5, MaximumSizeOfFileSystemRepresentation);
  v6 = strnlen(v5, MaximumSizeOfFileSystemRepresentation) + 1;
  v7 = v6 + 32;
  v8 = malloc_type_calloc(v6 + 32, 1uLL, 0xB5E70040uLL);
  *(_QWORD *)v8 = 0x15354594CLL;
  *((_DWORD *)v8 + 2) = -[CFStringRef scalingStyle](a1, "scalingStyle");
  -[CFStringRef fontSize](a1, "fontSize");
  *(float *)&v9 = v9;
  *((_DWORD *)v8 + 3) = LODWORD(v9);
  -[CFStringRef maxPointSize](a1, "maxPointSize");
  *(float *)&v10 = v10;
  *((_DWORD *)v8 + 4) = LODWORD(v10);
  -[CFStringRef minPointSize](a1, "minPointSize");
  *(float *)&v11 = v11;
  *((_DWORD *)v8 + 5) = LODWORD(v11);
  *((_DWORD *)v8 + 6) = -[CFStringRef alignment](a1, "alignment");
  *((_DWORD *)v8 + 7) = v6;
  strcpy((char *)v8 + 32, v5);
  objc_msgSend(a2, "appendBytes:length:", v8, v6 + 32);
  free(v5);
  free(v8);
  return v7;
}

- (size_t)writeMultisizeImageSetToData:(void *)a1
{
  id v4;
  unsigned int v5;
  size_t v6;
  _DWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  id v12;
  double v13;
  double v14;

  if (!a1)
    return 0;
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1, "sizesByIndex"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_2);
  v5 = objc_msgSend(v4, "count");
  v6 = 12 * v5 + 12;
  v7 = malloc_type_calloc(v6, 1uLL, 0x3C246F41uLL);
  v8 = v7;
  *(_QWORD *)v7 = 0x14D534953;
  v7[2] = v5;
  if (v5)
  {
    v9 = 0;
    v10 = v5;
    v11 = v7 + 5;
    do
    {
      v12 = objc_msgSend(v4, "objectAtIndex:", v9);
      objc_msgSend(objc_msgSend(objc_msgSend(a1, "sizesByIndex"), "objectForKey:", v12), "sizeValue");
      *(v11 - 2) = v13;
      *(v11 - 1) = v14;
      *v11 = objc_msgSend(v12, "integerValue");
      v11 += 3;
      ++v9;
    }
    while (v10 != v9);
  }
  objc_msgSend(a2, "appendBytes:length:", v8, v6);
  free(v8);
  return v6;
}

id __45__CSIGenerator_writeMultisizeImageSetToData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (uint64_t)writeRawDataToData:(uint64_t)result
{
  int v3;
  BOOL v4;
  int v5;
  BOOL v6;
  id *v7;
  CFDataRef v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  unsigned int v13;

  if (!result)
    return result;
  v12 = 1380013892;
  v3 = *(_DWORD *)(result + 192);
  v4 = v3 == 1398163232 || v3 == 1145132097;
  if (!v4
    || ((v5 = *(unsigned __int16 *)(result + 138), (v5 - 1000) <= 0x11)
      ? (v6 = ((1 << (v5 + 24)) & 0x24001) == 0)
      : (v6 = 1),
        (v6 || *(_QWORD *)(result + 328) != 2) && (v3 != 1398163232 || v5 != 9)))
  {
    v7 = (id *)(result + 152);
LABEL_19:
    v11 = 0;
    v9 = *v7;
    goto LABEL_20;
  }
  v7 = (id *)(result + 152);
  v8 = CUICompressedDataWithLZFSE(*(const __CFData **)(result + 152));
  v9 = v8;
  if (!v8 || (v10 = -[__CFData length](v8, "length", v12), v10 >= objc_msgSend(*v7, "length")))
  {

    goto LABEL_19;
  }
  v11 = 1;
LABEL_20:
  HIDWORD(v12) = v11;
  v13 = objc_msgSend(v9, "length", v12);
  objc_msgSend(a2, "appendBytes:length:", &v12, 12);
  objc_msgSend(a2, "appendData:", v9);
  if (v11)

  return v13 + 12;
}

- (uint64_t)writeExternalLinkToData:(uint64_t)a1
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  const __CFString *v12;
  CFIndex v13;
  char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  _BYTE v23[128];

  if (!a1)
    return 0;
  v20 = 1008;
  v21 = 1163414603;
  v22 = objc_msgSend(*(id *)(a1 + 216), "count");
  objc_msgSend(a2, "appendBytes:length:", &v21, 12);
  if (!objc_msgSend(*(id *)(a1 + 208), "length"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_writeExternalLinkToData_, a1, CFSTR("CSIGenerator.m"), 1697, CFSTR("We must have an assetpack identifier or none of this will work"));
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)(a1 + 208));
  v5 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x2E9439CBuLL);
  CFStringGetFileSystemRepresentation(*(CFStringRef *)(a1 + 208), v5, MaximumSizeOfFileSystemRepresentation);
  HIDWORD(v20) = strnlen(v5, MaximumSizeOfFileSystemRepresentation) + 1;
  objc_msgSend(a2, "appendBytes:length:", &v20, 8);
  objc_msgSend(a2, "appendBytes:length:", v5, HIDWORD(v20));
  v6 = HIDWORD(v20) + 20;
  free(v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(void **)(a1 + 216);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(const __CFString **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = CFStringGetMaximumSizeOfFileSystemRepresentation(v12);
        v14 = (char *)malloc_type_malloc(v13, 0xD566AAFuLL);
        CFStringGetFileSystemRepresentation(v12, v14, v13);
        LODWORD(v20) = 1008;
        HIDWORD(v20) = strnlen(v14, v13) + 1;
        objc_msgSend(a2, "appendBytes:length:", &v20, 8);
        objc_msgSend(a2, "appendBytes:length:", v14, HIDWORD(v20));
        v6 += HIDWORD(v20) + 8;
        free(v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v9);
  }
  return v6;
}

- (uint64_t)writeTextureToData:(uint64_t)a1
{
  __int16 v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  unsigned __int16 v23;
  _BYTE v24[128];

  if (!a1)
    return 0;
  v19 = 1415074898;
  v20 = *(_QWORD *)(a1 + 344);
  v21 = 0x100000001;
  if (*(_BYTE *)(a1 + 336))
    v4 = 5;
  else
    v4 = 1;
  v22 = v4;
  v23 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 360), "count");
  v5 = 24;
  objc_msgSend(a2, "appendBytes:length:", &v19, 24);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(void **)(a1 + 360);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v5 = 24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "keyList");
        v12 = 4 * CUIRenditionKeyTokenCount((uint64_t)v11) + 4;
        v14 = v12;
        objc_msgSend(a2, "appendBytes:length:", &v14, 8);
        objc_msgSend(a2, "appendBytes:length:", v11, v12);
        v5 += v12 + 8;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v8);
  }
  return v5;
}

- (uint64_t)writeRecognitionObjectToData:(uint64_t)result
{
  uint64_t v3;
  NSMutableData *v4;

  if (result)
  {
    v3 = result;
    v4 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)objc_msgSend(*(id *)(result + 152), "length") + 4);
    -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", v3 + 456, 4);
    -[NSMutableData appendData:](v4, "appendData:", *(_QWORD *)(v3 + 152));

    *(_QWORD *)(v3 + 152) = -[NSMutableData copy](v4, "copy");
    return -[CSIGenerator writeRawDataToData:](v3, a2);
  }
  return result;
}

- (id)CSIRepresentationWithCompression:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  int layout;
  int v8;
  int v9;
  id v10;
  int v11;
  _DWORD *v12;
  void *v13;
  unsigned int v14;
  _DWORD *v15;
  _DWORD *v16;
  char *v18;
  char *v19;
  size_t v20;
  int *v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  void *v26;
  int *v27;
  uint64_t v28;
  _DWORD *v29;
  unsigned int v30;
  signed __int16 v31;
  unsigned int v32;
  int v33;
  _DWORD *v34;
  int v35;
  _QWORD v36[2];
  NSMutableArray *bitmaps;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _OWORD v44[10];
  __int128 v45;

  v3 = a3;
  v5 = +[NSMutableData data](NSMutableData, "data");
  v45 = 0u;
  memset(v44, 0, sizeof(v44));
  -[CSIGenerator formatCSIHeader:]((unsigned __int8 *)self, (uint64_t)v44);
  if (self)
  {
    v6 = 4 * (HIDWORD(v45) + 1);
    objc_msgSend(v5, "appendBytes:length:", v44, 176);
    objc_msgSend(v5, "increaseLengthBy:", v6);
  }
  self->_rowbytes = 0;
  layout = self->_layout;
  switch(self->_layout)
  {
    case 0x3E8:
    case 0x3EA:
    case 0x3FA:
      goto LABEL_9;
    case 0x3E9:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeExternalLinkToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3EB:
    case 0x3ED:
    case 0x3EE:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      *((_QWORD *)objc_msgSend(v5, "mutableBytes") + 22) = 0;
      goto LABEL_22;
    case 0x3EC:
    case 0x3F0:
    case 0x3F5:
    case 0x3F9:
      goto LABEL_8;
    case 0x3EF:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeTextureToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3F1:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeColorToData:]((id *)&self->super.isa, v5);
      goto LABEL_18;
    case 0x3F2:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeMultisizeImageSetToData:](self, v5);
      goto LABEL_18;
    case 0x3F3:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v10 = -[_CUIThemeModelAssetRendition initForArchiving:withMeshRenditionKeys:]([_CUIThemeModelAssetRendition alloc], "initForArchiving:withMeshRenditionKeys:", self->_modelAsset, self->_meshReferences);
      goto LABEL_20;
    case 0x3F4:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v10 = -[_CUIThemeModelMeshRendition initForArchiving:withSubmeshRenditionKeys:]([_CUIThemeModelMeshRendition alloc], "initForArchiving:withSubmeshRenditionKeys:", self->_modelMesh, self->_submeshReferences);
      goto LABEL_20;
    case 0x3F6:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeRecognitionObjectToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3F7:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v9 = -[CSIGenerator writeTextStyleToData:]((CFStringRef *)self, v5);
      goto LABEL_18;
    case 0x3F8:
      v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      v10 = -[_CUIThemeModelSubmeshRendition initForArchiving:]([_CUIThemeModelSubmeshRendition alloc], "initForArchiving:", self->_modelSubmesh);
LABEL_20:
      v13 = v10;
      v14 = objc_msgSend(v10, "writeToData:", v5);

      v15 = objc_msgSend(v5, "mutableBytes");
      v15[44] = 0;
      v15[45] = v14;
      goto LABEL_22;
    default:
      if (layout == 7)
      {
        v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        objc_msgSend(v5, "appendData:", -[CUIShapeEffectPreset CUIEffectDataRepresentation](self->_effectPreset, "CUIEffectDataRepresentation"));
        v16 = objc_msgSend(v5, "mutableBytes");
        v16[44] = 0;
        v16[45] = objc_msgSend(v5, "length");
        goto LABEL_22;
      }
      if (layout == 6)
      {
        v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        v9 = -[CSIGenerator writeGradientToData:]((id *)&self->super.isa, v5);
LABEL_18:
        v11 = v9;
        v12 = objc_msgSend(v5, "mutableBytes");
        v12[44] = 0;
        v12[45] = v11;
LABEL_22:
        *((_DWORD *)objc_msgSend(v5, "mutableBytes") + 42) = v8;
        return v5;
      }
LABEL_8:
      if (self->_rawData)
      {
LABEL_9:
        v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        v9 = -[CSIGenerator writeRawDataToData:]((uint64_t)self, v5);
        goto LABEL_18;
      }
      v18 = (char *)-[NSMutableArray count](self->_bitmaps, "count");
      v36[1] = v36;
      v19 = v18 + 1;
      v20 = 8 * (_QWORD)(v18 + 1);
      v21 = (int *)((char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      v38 = +[NSMutableData data](NSMutableData, "data");
      bzero(v21, v20);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      bitmaps = self->_bitmaps;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (!v22)
      {
LABEL_32:
        self->_rowbytes = (unint64_t)objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject", v36[0]), "rowbytes");
        v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        objc_msgSend(v5, "appendData:", v38);
        v29 = objc_msgSend(v5, "mutableBytes");
        v30 = objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject"), "pixelFormat");
        v31 = (unsigned __int16)objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject"), "colorSpaceID");
        if (-[CSIGenerator colorSpaceID](self, "colorSpaceID") != v31
          || v30 != -[CSIGenerator pixelFormat](self, "pixelFormat"))
        {
          v32 = v29[7] & 0xFFFFFFF0 | v31 & 0xF;
          v29[6] = v30;
          v29[7] = v32;
        }
        if (v19)
        {
          v33 = 0;
          v34 = v29 + 44;
          do
          {
            *v34++ = v33;
            v35 = *v21;
            v21 += 2;
            v33 += v35;
            --v19;
          }
          while (v19);
        }
        goto LABEL_22;
      }
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v40;
LABEL_26:
      v26 = 0;
      v36[0] = v24;
      v27 = &v21[2 * (_QWORD)v24];
      while (1)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(bitmaps);
        v28 = -[CSIGenerator writeBitmap:toData:compress:]((uint64_t)self, *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v26), v38, v3);
        if (!v28)
          return 0;
        *(_QWORD *)&v27[2 * (_QWORD)v26] = v28;
        v26 = (char *)v26 + 1;
        if (v23 == v26)
        {
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bitmaps, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          v24 = (char *)v26 + v36[0];
          if (!v23)
            goto LABEL_32;
          goto LABEL_26;
        }
      }
  }
}

- (BOOL)vectorContainsMulticolorLayers
{
  return self->_vectorContainsMulticolorLayers;
}

- (void)setVectorContainsMulticolorLayers:(BOOL)a3
{
  self->_vectorContainsMulticolorLayers = a3;
}

- (BOOL)vectorContainsHierarchicalLayers
{
  return self->_vectorContainsHierarchicalLayers;
}

- (void)setVectorContainsHierarchicalLayers:(BOOL)a3
{
  self->_vectorContainsHierarchicalLayers = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)utiType
{
  return self->_utiType;
}

- (void)setUtiType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGSize)physicalSizeInMeters
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSizeInMeters.width;
  height = self->_physicalSizeInMeters.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPhysicalSizeInMeters:(CGSize)a3
{
  self->_physicalSizeInMeters = a3;
}

- (BOOL)isVectorBased
{
  return self->_isVectorBased;
}

- (void)setIsVectorBased:(BOOL)a3
{
  self->_isVectorBased = a3;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (BOOL)isExcludedFromContrastFilter
{
  return self->_isExcludedFromFilter;
}

- (void)setExcludedFromContrastFilter:(BOOL)a3
{
  self->_isExcludedFromFilter = a3;
}

- (signed)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(signed __int16)a3
{
  self->_colorSpaceID = a3;
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unsigned int)a3
{
  self->_scaleFactor = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (NSArray)layerReferences
{
  return &self->_layerReferences->super;
}

- (CUIShapeEffectPreset)effectPreset
{
  return self->_effectPreset;
}

- (void)setEffectPreset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (NSDate)modtime
{
  return self->_modtime;
}

- (void)setModtime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (CGSize)originalUncroppedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalUncroppedSize.width;
  height = self->_originalUncroppedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalUncroppedSize:(CGSize)a3
{
  self->_originalUncroppedSize = a3;
}

- (CGRect)alphaCroppedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alphaCroppedFrame.origin.x;
  y = self->_alphaCroppedFrame.origin.y;
  width = self->_alphaCroppedFrame.size.width;
  height = self->_alphaCroppedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlphaCroppedFrame:(CGRect)a3
{
  self->_alphaCroppedFrame = a3;
}

- (BOOL)allowsMultiPassEncoding
{
  return self->_allowsMultiPassEncoding;
}

- (void)setAllowsMultiPassEncoding:(BOOL)a3
{
  self->_allowsMultiPassEncoding = a3;
}

- (BOOL)allowsOptimalRowbytesPacking
{
  return self->_allowsOptimalRowbytesPacking;
}

- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3
{
  self->_allowsOptimalRowbytesPacking = a3;
}

- (BOOL)allowsPaletteImageCompression
{
  return self->_allowsPaletteImageCompression;
}

- (void)setAllowsPaletteImageCompression:(BOOL)a3
{
  self->_allowsPaletteImageCompression = a3;
}

- (BOOL)allowsHevcCompression
{
  return self->_allowsHevcCompression;
}

- (void)setAllowsHevcCompression:(BOOL)a3
{
  self->_allowsHevcCompression = a3;
}

- (BOOL)allowsDeepmapImageCompression
{
  return self->_allowsDeepmapImageCompression;
}

- (void)setAllowsDeepmapImageCompression:(BOOL)a3
{
  self->_allowsDeepmapImageCompression = a3;
}

- (BOOL)allowsDeepmap2ImageCompression
{
  return self->_allowsDeepmap2ImageCompression;
}

- (void)setAllowsDeepmap2ImageCompression:(BOOL)a3
{
  self->_allowsDeepmap2ImageCompression = a3;
}

- (BOOL)optOutOfThinning
{
  return self->_optOutOfThinning;
}

- (void)setOptOutOfThinning:(BOOL)a3
{
  self->_optOutOfThinning = a3;
}

- (BOOL)preserveForArchiveOnly
{
  return self->_preserveForArchiveOnly;
}

- (void)setPreserveForArchiveOnly:(BOOL)a3
{
  self->_preserveForArchiveOnly = a3;
}

- (BOOL)preservedVectorRepresentation
{
  return self->_preservedVectorRepresentation;
}

- (void)setPreservedVectorRepresentation:(BOOL)a3
{
  self->_preservedVectorRepresentation = a3;
}

- (BOOL)isFlippable
{
  return self->_isFlippable;
}

- (void)setIsFlippable:(BOOL)a3
{
  self->_isFlippable = a3;
}

- (BOOL)isTintable
{
  return self->_isTintable;
}

- (void)setIsTintable:(BOOL)a3
{
  self->_isTintable = a3;
}

- (BOOL)cubemap
{
  return self->_isCubeMap;
}

- (void)setCubemap:(BOOL)a3
{
  self->_isCubeMap = a3;
}

- (int64_t)textureFormat
{
  return self->_textureFormat;
}

- (void)setTextureFormat:(int64_t)a3
{
  self->_textureFormat = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (NSArray)mipReferences
{
  return &self->_mipReferences->super;
}

- (BOOL)textureOpaque
{
  return self->_textureOpaque;
}

- (void)setTextureOpaque:(BOOL)a3
{
  self->_textureOpaque = a3;
}

- (NSArray)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSDictionary)sizesByIndex
{
  return self->_sizesByIndex;
}

- (void)setSizesByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)clampMetrics
{
  return self->_clampMetrics;
}

- (void)setClampMetrics:(BOOL)a3
{
  self->_clampMetrics = a3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)maxPointSize
{
  return self->_maxPointSize;
}

- (void)setMaxPointSize:(double)a3
{
  self->_maxPointSize = a3;
}

- (double)minPointSize
{
  return self->_minPointSize;
}

- (void)setMinPointSize:(double)a3
{
  self->_minPointSize = a3;
}

- (signed)scalingStyle
{
  return self->_scalingStyle;
}

- (void)setScalingStyle:(signed __int16)a3
{
  self->_scalingStyle = a3;
}

- (signed)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(signed __int16)a3
{
  self->_alignment = a3;
}

- (NSDictionary)renditionProperties
{
  return self->_renditionProperties;
}

- (void)setRenditionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int)objectVersion
{
  return self->_objectVersion;
}

- (void)setObjectVersion:(int)a3
{
  self->_objectVersion = a3;
}

- (__n128)transformation
{
  return a1[29];
}

- (__n128)setTransformation:(__n128)a3
{
  result[29] = a2;
  result[30] = a3;
  result[31] = a4;
  result[32] = a5;
  return result;
}

- (MDLAsset)modelAsset
{
  return self->_modelAsset;
}

- (void)setModelAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSArray)meshReferences
{
  return &self->_meshReferences->super;
}

- (MDLMesh)modelMesh
{
  return self->_modelMesh;
}

- (void)setModelMesh:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSArray)submeshReferences
{
  return &self->_submeshReferences->super;
}

- (MDLSubmesh)modelSubmesh
{
  return self->_modelSubmesh;
}

- (void)setModelSubmesh:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSArray)vectorSizes
{
  return self->_vectorSizes;
}

- (void)setVectorSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (unsigned)standardVectorSize
{
  return self->_standardVectorSize;
}

- (void)setStandardVectorSize:(unsigned int)a3
{
  self->_standardVectorSize = a3;
}

- (float)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(float)a3
{
  self->_baseline = a3;
}

- (float)capHeight
{
  return self->_capHeight;
}

- (void)setCapHeight:(float)a3
{
  self->_capHeight = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (void)setAlignmentRectInsets:(id)a3
{
  self->_alignmentRectInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (float)templateVersion
{
  return self->_templateVersion;
}

- (void)setTemplateVersion:(float)a3
{
  self->_templateVersion = a3;
}

- (BOOL)isInterpolatable
{
  return self->_isInterpolatable;
}

- (void)setInterpolatable:(BOOL)a3
{
  self->_isInterpolatable = a3;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_vectorGlyphRenderingMode;
}

- (void)setVectorGlyphRenderingMode:(int64_t)a3
{
  self->_vectorGlyphRenderingMode = a3;
}

@end
