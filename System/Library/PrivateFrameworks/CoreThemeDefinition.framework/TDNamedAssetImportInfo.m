@implementation TDNamedAssetImportInfo

- (id)copyWithZone:(_NSZone *)a3
{
  TDNamedAssetImportInfo *v4;

  v4 = -[TDNamedAssetImportInfo init](+[TDNamedAssetImportInfo allocWithZone:](TDNamedAssetImportInfo, "allocWithZone:", a3), "init");
  -[TDNamedAssetImportInfo setName:](v4, "setName:", -[TDNamedAssetImportInfo name](self, "name"));
  -[TDNamedAssetImportInfo setNameIdentifier:](v4, "setNameIdentifier:", -[TDNamedAssetImportInfo nameIdentifier](self, "nameIdentifier"));
  -[TDNamedAssetImportInfo setFileURL:](v4, "setFileURL:", -[TDNamedAssetImportInfo fileURL](self, "fileURL"));
  -[TDNamedAssetImportInfo setModificationDate:](v4, "setModificationDate:", -[TDNamedAssetImportInfo modificationDate](self, "modificationDate"));
  -[TDNamedAssetImportInfo setIdiom:](v4, "setIdiom:", -[TDNamedAssetImportInfo idiom](self, "idiom"));
  -[TDNamedAssetImportInfo setSubtype:](v4, "setSubtype:", -[TDNamedAssetImportInfo subtype](self, "subtype"));
  -[TDNamedAssetImportInfo setScaleFactor:](v4, "setScaleFactor:", -[TDNamedAssetImportInfo scaleFactor](self, "scaleFactor"));
  -[TDNamedAssetImportInfo sliceInsets](self, "sliceInsets");
  -[TDNamedAssetImportInfo setSliceInsets:](v4, "setSliceInsets:");
  -[TDNamedAssetImportInfo setRenditionType:](v4, "setRenditionType:", -[TDNamedAssetImportInfo renditionType](self, "renditionType"));
  -[TDNamedAssetImportInfo setResizingMode:](v4, "setResizingMode:", -[TDNamedAssetImportInfo resizingMode](self, "resizingMode"));
  -[TDNamedAssetImportInfo resizableSliceSize](self, "resizableSliceSize");
  -[TDNamedAssetImportInfo setResizableSliceSize:](v4, "setResizableSliceSize:");
  -[TDNamedAssetImportInfo setPreservesVectorRepresentation:](v4, "setPreservesVectorRepresentation:", -[TDNamedAssetImportInfo preservesVectorRepresentation](self, "preservesVectorRepresentation"));
  -[TDNamedAssetImportInfo setIsTemplate:](v4, "setIsTemplate:", -[TDNamedAssetImportInfo isTemplate](self, "isTemplate"));
  -[TDNamedAssetImportInfo setTemplateRenderingMode:](v4, "setTemplateRenderingMode:", -[TDNamedAssetImportInfo templateRenderingMode](self, "templateRenderingMode"));
  -[TDNamedAssetImportInfo setOptOutOfThinning:](v4, "setOptOutOfThinning:", -[TDNamedAssetImportInfo optOutOfThinning](self, "optOutOfThinning"));
  -[TDNamedAssetImportInfo setPreserveForArchiveOnly:](v4, "setPreserveForArchiveOnly:", -[TDNamedAssetImportInfo preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  -[TDNamedAssetImportInfo alignmentRect](self, "alignmentRect");
  -[TDNamedAssetImportInfo setAlignmentRect:](v4, "setAlignmentRect:");
  -[TDNamedAssetImportInfo setSizeClassHorizontal:](v4, "setSizeClassHorizontal:", -[TDNamedAssetImportInfo sizeClassHorizontal](self, "sizeClassHorizontal"));
  -[TDNamedAssetImportInfo setSizeClassVertical:](v4, "setSizeClassVertical:", -[TDNamedAssetImportInfo sizeClassVertical](self, "sizeClassVertical"));
  -[TDNamedAssetImportInfo setDisplayGamut:](v4, "setDisplayGamut:", -[TDNamedAssetImportInfo displayGamut](self, "displayGamut"));
  -[TDNamedAssetImportInfo setLayoutDirection:](v4, "setLayoutDirection:", -[TDNamedAssetImportInfo layoutDirection](self, "layoutDirection"));
  -[TDNamedAssetImportInfo setIsFlippable:](v4, "setIsFlippable:", -[TDNamedAssetImportInfo isFlippable](self, "isFlippable"));
  -[TDNamedAssetImportInfo setMemoryClass:](v4, "setMemoryClass:", -[TDNamedAssetImportInfo memoryClass](self, "memoryClass"));
  -[TDNamedAssetImportInfo setGraphicsFeatureSetClass:](v4, "setGraphicsFeatureSetClass:", -[TDNamedAssetImportInfo graphicsFeatureSetClass](self, "graphicsFeatureSetClass"));
  -[TDNamedAssetImportInfo setCompressionType:](v4, "setCompressionType:", -[TDNamedAssetImportInfo compressionType](self, "compressionType"));
  -[TDNamedAssetImportInfo lossyCompressionQuality](self, "lossyCompressionQuality");
  -[TDNamedAssetImportInfo setLossyCompressionQuality:](v4, "setLossyCompressionQuality:");
  -[TDNamedAssetImportInfo setTags:](v4, "setTags:", -[TDNamedAssetImportInfo tags](self, "tags"));
  -[TDNamedAssetImportInfo setUniversalTypeIdentifier:](v4, "setUniversalTypeIdentifier:", -[TDNamedAssetImportInfo universalTypeIdentifier](self, "universalTypeIdentifier"));
  -[TDNamedAssetImportInfo setContainedImageNames:](v4, "setContainedImageNames:", (id)-[NSArray copy](-[TDNamedAssetImportInfo containedImageNames](self, "containedImageNames"), "copy"));
  -[TDNamedAssetImportInfo canvasSize](self, "canvasSize");
  -[TDNamedAssetImportInfo setCanvasSize:](v4, "setCanvasSize:");
  -[TDNamedAssetImportInfo physicalSizeInMeters](self, "physicalSizeInMeters");
  -[TDNamedAssetImportInfo setPhysicalSizeInMeters:](v4, "setPhysicalSizeInMeters:");
  -[TDNamedAssetImportInfo setLayerReferences:](v4, "setLayerReferences:", -[TDNamedAssetImportInfo layerReferences](self, "layerReferences"));
  -[TDNamedAssetImportInfo setTextureWidth:](v4, "setTextureWidth:", -[TDNamedAssetImportInfo textureWidth](self, "textureWidth"));
  -[TDNamedAssetImportInfo setTextureHeight:](v4, "setTextureHeight:", -[TDNamedAssetImportInfo textureHeight](self, "textureHeight"));
  -[TDNamedAssetImportInfo setTextureDepth:](v4, "setTextureDepth:", -[TDNamedAssetImportInfo textureDepth](self, "textureDepth"));
  -[TDNamedAssetImportInfo setCubeMap:](v4, "setCubeMap:", -[TDNamedAssetImportInfo cubeMap](self, "cubeMap"));
  -[TDNamedAssetImportInfo setArrayIndex:](v4, "setArrayIndex:", -[TDNamedAssetImportInfo arrayIndex](self, "arrayIndex"));
  -[TDNamedAssetImportInfo setTexturePixelFormat:](v4, "setTexturePixelFormat:", -[TDNamedAssetImportInfo texturePixelFormat](self, "texturePixelFormat"));
  -[TDNamedAssetImportInfo setTextureInterpretation:](v4, "setTextureInterpretation:", -[TDNamedAssetImportInfo textureInterpretation](self, "textureInterpretation"));
  -[TDNamedAssetImportInfo setTextureInfos:](v4, "setTextureInfos:", (id)-[NSArray copy](-[TDNamedAssetImportInfo textureInfos](self, "textureInfos"), "copy"));
  -[TDNamedAssetImportInfo setColorSpaceID:](v4, "setColorSpaceID:", -[TDNamedAssetImportInfo colorSpaceID](self, "colorSpaceID"));
  -[TDNamedAssetImportInfo setColorComponents:](v4, "setColorComponents:", -[TDNamedAssetImportInfo colorComponents](self, "colorComponents"));
  -[TDNamedAssetImportInfo setIconSize:](v4, "setIconSize:", (id)-[NSValue copy](-[TDNamedAssetImportInfo iconSize](self, "iconSize"), "copy"));
  -[TDNamedAssetImportInfo setFontName:](v4, "setFontName:", -[TDNamedAssetImportInfo fontName](self, "fontName"));
  -[TDNamedAssetImportInfo setForegroundColorName:](v4, "setForegroundColorName:", -[TDNamedAssetImportInfo foregroundColorName](self, "foregroundColorName"));
  -[TDNamedAssetImportInfo setBackgroundColorName:](v4, "setBackgroundColorName:", -[TDNamedAssetImportInfo backgroundColorName](self, "backgroundColorName"));
  -[TDNamedAssetImportInfo setBackgroundColorSpaceID:](v4, "setBackgroundColorSpaceID:", -[TDNamedAssetImportInfo backgroundColorSpaceID](self, "backgroundColorSpaceID"));
  -[TDNamedAssetImportInfo setBackgroundColorComponents:](v4, "setBackgroundColorComponents:", -[TDNamedAssetImportInfo backgroundColorComponents](self, "backgroundColorComponents"));
  -[TDNamedAssetImportInfo setTextAlignment:](v4, "setTextAlignment:", -[TDNamedAssetImportInfo textAlignment](self, "textAlignment"));
  -[TDNamedAssetImportInfo setScalingStyle:](v4, "setScalingStyle:", -[TDNamedAssetImportInfo scalingStyle](self, "scalingStyle"));
  -[TDNamedAssetImportInfo maxPointSize](self, "maxPointSize");
  -[TDNamedAssetImportInfo setMaxPointSize:](v4, "setMaxPointSize:");
  -[TDNamedAssetImportInfo minPointSize](self, "minPointSize");
  -[TDNamedAssetImportInfo setMinPointSize:](v4, "setMinPointSize:");
  -[TDNamedAssetImportInfo setAppearanceName:](v4, "setAppearanceName:", -[TDNamedAssetImportInfo appearanceName](self, "appearanceName"));
  -[TDNamedAssetImportInfo setAppearanceIdentifier:](v4, "setAppearanceIdentifier:", -[TDNamedAssetImportInfo appearanceIdentifier](self, "appearanceIdentifier"));
  -[TDNamedAssetImportInfo setLocalizationName:](v4, "setLocalizationName:", -[TDNamedAssetImportInfo localizationName](self, "localizationName"));
  -[TDNamedAssetImportInfo setLocalizationIdentifier:](v4, "setLocalizationIdentifier:", -[TDNamedAssetImportInfo localizationIdentifier](self, "localizationIdentifier"));
  -[TDNamedAssetImportInfo transformation](self, "transformation");
  -[TDNamedAssetImportInfo setTransformation:](v4, "setTransformation:");
  -[TDNamedAssetImportInfo setObjectVersion:](v4, "setObjectVersion:", -[TDNamedAssetImportInfo objectVersion](self, "objectVersion"));
  return v4;
}

- (TDNamedAssetImportInfo)init
{
  TDNamedAssetImportInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TDNamedAssetImportInfo;
  v2 = -[TDNamedAssetImportInfo init](&v4, sel_init);
  -[TDNamedAssetImportInfo setResizingMode:](v2, "setResizingMode:", 1);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDNamedAssetImportInfo;
  -[TDNamedAssetImportInfo dealloc](&v3, sel_dealloc);
}

- (void)verify
{
  if (-[TDNamedAssetImportInfo preserveForArchiveOnly](self, "preserveForArchiveOnly"))
  {
    if (-[TDNamedAssetImportInfo renditionType](self, "renditionType") == 1007)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDNamedAssetImportInfo.m"), 130, CFSTR("Can't have Texture and preservation %@"), self);
    if (-[TDNamedAssetImportInfo renditionType](self, "renditionType") == 1017)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDNamedAssetImportInfo.m"), 131, CFSTR("Can't have VectorGlyphs and preservation %@"), self);
    if (-[TDNamedAssetImportInfo renditionType](self, "renditionType") == 1002)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDNamedAssetImportInfo.m"), 132, CFSTR("Can't have LayerStacks and preservation %@"), self);
    if (-[TDNamedAssetImportInfo renditionType](self, "renditionType") == 1018)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDNamedAssetImportInfo.m"), 133, CFSTR("Can't have SolidLayerStacks and preservation %@"), self);
    if (-[TDNamedAssetImportInfo renditionType](self, "renditionType") == 1004)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDNamedAssetImportInfo.m"), 134, CFSTR("Can't have Packed and preservation %@"), self);
  }
}

- (int64_t)renditionSubtype
{
  unint64_t v3;
  _QWORD *v4;

  if (-[TDNamedAssetImportInfo resizingMode](self, "resizingMode"))
  {
    if (-[TDNamedAssetImportInfo resizingMode](self, "resizingMode") == 1)
    {
      v3 = -[TDNamedAssetImportInfo renditionType](self, "renditionType");
      if (v3 < 4)
      {
        v4 = &unk_226EC09C8;
        return v4[v3];
      }
    }
  }
  else
  {
    v3 = -[TDNamedAssetImportInfo renditionType](self, "renditionType");
    if (v3 < 4)
    {
      v4 = &unk_226EC09A8;
      return v4[v3];
    }
  }
  return 0;
}

- (BOOL)isTemplate
{
  return (unint64_t)(-[TDNamedAssetImportInfo templateRenderingMode](self, "templateRenderingMode") - 1) < 2;
}

- (void)setIsTemplate:(BOOL)a3
{
  -[TDNamedAssetImportInfo setTemplateRenderingMode:](self, "setTemplateRenderingMode:", a3);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  const __CFString *v8;
  int64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  NSArray *v19;
  uint64_t v20;
  NSString *v21;
  double v22;
  uint64_t v23;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  int64_t v34;
  int64_t v35;
  NSString *v36;
  _BOOL4 v37;
  int64_t v38;
  _BOOL4 v39;
  _BOOL4 v40;
  int64_t v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  int64_t v45;
  NSString *v46;
  uint64_t v47;
  int64_t v48;
  NSString *v49;
  const __CFString *v50;
  int64_t v51;
  NSString *v52;
  const __CFString *v53;
  int64_t v54;
  NSString *v55;
  void *v56;
  NSString *v57;
  uint64_t v58;
  id v59;
  objc_super v60;
  NSSize v61;
  NSSize v62;
  NSRect v63;

  v60.receiver = self;
  v60.super_class = (Class)TDNamedAssetImportInfo;
  v59 = -[TDNamedAssetImportInfo description](&v60, sel_description);
  -[TDNamedAssetImportInfo sliceInsets](self, "sliceInsets");
  v58 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nEdge insets top: %f left: %f bottom: %f right: %f"), v3, v4, v5, v6);
  -[TDNamedAssetImportInfo resizableSliceSize](self, "resizableSliceSize");
  v57 = NSStringFromSize(v61);
  v7 = -[TDNamedAssetImportInfo displayGamut](self, "displayGamut");
  if (-[TDNamedAssetImportInfo layoutDirection](self, "layoutDirection") == 5)
  {
    v8 = CFSTR("Left to Right");
  }
  else
  {
    v9 = -[TDNamedAssetImportInfo layoutDirection](self, "layoutDirection");
    v8 = CFSTR("Any direction");
    if (v9 == 4)
      v8 = CFSTR("Right to Left");
  }
  v53 = v8;
  v10 = CFSTR("P3");
  if (!v7)
    v10 = CFSTR("sRGB");
  v50 = v10;
  v56 = (void *)MEMORY[0x24BDD17C8];
  v55 = -[TDNamedAssetImportInfo name](self, "name");
  v54 = -[TDNamedAssetImportInfo nameIdentifier](self, "nameIdentifier");
  v52 = -[TDNamedAssetImportInfo appearanceName](self, "appearanceName");
  v51 = -[TDNamedAssetImportInfo appearanceIdentifier](self, "appearanceIdentifier");
  v49 = -[TDNamedAssetImportInfo localizationName](self, "localizationName");
  v48 = -[TDNamedAssetImportInfo localizationIdentifier](self, "localizationIdentifier");
  v47 = -[NSURL description](-[TDNamedAssetImportInfo fileURL](self, "fileURL"), "description");
  v46 = -[NSDate description](-[TDNamedAssetImportInfo modificationDate](self, "modificationDate"), "description");
  v45 = -[TDNamedAssetImportInfo idiom](self, "idiom");
  v44 = -[TDNamedAssetImportInfo subtype](self, "subtype");
  v43 = -[TDNamedAssetImportInfo scaleFactor](self, "scaleFactor");
  v42 = -[TDNamedAssetImportInfo renditionType](self, "renditionType");
  v41 = -[TDNamedAssetImportInfo resizingMode](self, "resizingMode");
  v40 = -[TDNamedAssetImportInfo isTemplate](self, "isTemplate");
  v39 = -[TDNamedAssetImportInfo preservesVectorRepresentation](self, "preservesVectorRepresentation");
  v38 = -[TDNamedAssetImportInfo templateRenderingMode](self, "templateRenderingMode");
  v37 = -[TDNamedAssetImportInfo optOutOfThinning](self, "optOutOfThinning");
  -[TDNamedAssetImportInfo alignmentRect](self, "alignmentRect");
  v36 = NSStringFromRect(v63);
  v35 = -[TDNamedAssetImportInfo sizeClassHorizontal](self, "sizeClassHorizontal");
  v34 = -[TDNamedAssetImportInfo sizeClassVertical](self, "sizeClassVertical");
  v33 = -[TDNamedAssetImportInfo isFlippable](self, "isFlippable");
  v32 = -[TDNamedAssetImportInfo memoryClass](self, "memoryClass");
  v31 = -[TDNamedAssetImportInfo graphicsFeatureSetClass](self, "graphicsFeatureSetClass");
  v30 = -[TDNamedAssetImportInfo compressionType](self, "compressionType");
  -[TDNamedAssetImportInfo lossyCompressionQuality](self, "lossyCompressionQuality");
  v12 = v11;
  v29 = -[NSSet description](-[TDNamedAssetImportInfo tags](self, "tags"), "description");
  v28 = -[TDNamedAssetImportInfo universalTypeIdentifier](self, "universalTypeIdentifier");
  v27 = -[NSArray description](-[TDNamedAssetImportInfo containedImageNames](self, "containedImageNames"), "description");
  -[TDNamedAssetImportInfo canvasSize](self, "canvasSize");
  v26 = NSStringFromSize(v62);
  v25 = -[NSArray description](-[TDNamedAssetImportInfo layerReferences](self, "layerReferences"), "description");
  v13 = -[TDNamedAssetImportInfo renditionSubtype](self, "renditionSubtype");
  v14 = -[TDNamedAssetImportInfo compressionType](self, "compressionType");
  v15 = -[TDNamedAssetImportInfo cubeMap](self, "cubeMap");
  v16 = -[TDNamedAssetImportInfo textureWidth](self, "textureWidth");
  v17 = -[TDNamedAssetImportInfo textureHeight](self, "textureHeight");
  v18 = -[TDNamedAssetImportInfo texturePixelFormat](self, "texturePixelFormat");
  v19 = -[TDNamedAssetImportInfo textureInfos](self, "textureInfos");
  v20 = -[NSValue description](-[TDNamedAssetImportInfo iconSize](self, "iconSize"), "description");
  v21 = -[TDNamedAssetImportInfo fontName](self, "fontName");
  -[TDNamedAssetImportInfo fontSize](self, "fontSize");
  v23 = objc_msgSend(v56, "stringWithFormat:", CFSTR("\n\tname: %@ \n\tnameIdentifier: %d \n\tappearance: %@ \n\tappearanceIdentifier: %d \n\tlocalization: %@ \n\tlocalizationIdentifier: %d \n\tfileURL: %@ \n\tmodificationDate: %@   \n\tidiom: %d \n\tsubtype: %d \n\tscaleFactor: %d \n\tsliceInsets: %@ \n\trenditionType: %d  \n\tresizingMode: %d \n\tresizableSliceSize: %@    \n\tisTemplate: %d \n\tpreservesVectorRepresentation: %d\n\ttemplateRenderingMode: %d \n\toptOutOfThinning: %d \n\talignmentRect: %@ \n\tsizeClassHorizontal: %d \n\tsizeClassVertical: %d  \n\tdisplayGamut: %@ \n\tlayoutDirection: %@   \n\tisFlippable: %d   \n\tmemoryClass: %d \n\tgraphicsFeatureSetClass: %d \n\tcompressionType: %d \n\tlossyCompressionQuality: %f    \n\ttags: %@ \n\tuniversalTypeIdentifier: %@ \n\tcontainedImageNames: %@    \n\tcanvasSize: %@ \n\tlayerReferences: %@ \n\trenditionSubtype: %d \n\tcompressionType: %d\n\tcubeMap: %d\n\ttextureWidth: %d\n\ttextureHeight: %d\n\ttexturePixelFormat: %d textureImportInfos:%@ \n\ticonSize: %@\n\tfontName: %@\n\tfontSize: %d"), v55, v54, v52, v51, v49, v48, v47, v46, v45, v44, v43, v58, v42, v41, v57, v40,
          v39,
          v38,
          v37,
          v36,
          v35,
          v34,
          v50,
          v53,
          v33,
          v32,
          v31,
          v30,
          v12,
          v29,
          v28,
          v27,
          v26,
          v25,
          v13,
          v14,
          v15,
          v16,
          v17,
          v18,
          v19,
          v20,
          v21,
          (int)v22);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@  %@"), v59, v23);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)nameIdentifier
{
  return self->_nameIdentifier;
}

- (void)setNameIdentifier:(int64_t)a3
{
  self->_nameIdentifier = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiom = a3;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_scaleFactor = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)sliceInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_sliceInsets.top;
  left = self->_sliceInsets.left;
  bottom = self->_sliceInsets.bottom;
  right = self->_sliceInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (void)setSliceInsets:(id)a3
{
  self->_sliceInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (int64_t)renditionType
{
  return self->_renditionType;
}

- (void)setRenditionType:(int64_t)a3
{
  self->_renditionType = a3;
}

- (int64_t)resizingMode
{
  return self->_resizingMode;
}

- (void)setResizingMode:(int64_t)a3
{
  self->_resizingMode = a3;
}

- (CGSize)resizableSliceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_resizableSliceSize.width;
  height = self->_resizableSliceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResizableSliceSize:(CGSize)a3
{
  self->_resizableSliceSize = a3;
}

- (BOOL)preservesVectorRepresentation
{
  return self->_preservesVectorRepresentation;
}

- (void)setPreservesVectorRepresentation:(BOOL)a3
{
  self->_preservesVectorRepresentation = a3;
}

- (signed)autoscalingType
{
  return self->_autoscalingType;
}

- (void)setAutoscalingType:(signed __int16)a3
{
  self->_autoscalingType = a3;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
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

- (CGRect)alignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alignmentRect.origin.x;
  y = self->_alignmentRect.origin.y;
  width = self->_alignmentRect.size.width;
  height = self->_alignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlignmentRect:(CGRect)a3
{
  self->_alignmentRect = a3;
}

- (int64_t)sizeClassHorizontal
{
  return self->_sizeClassHorizontal;
}

- (void)setSizeClassHorizontal:(int64_t)a3
{
  self->_sizeClassHorizontal = a3;
}

- (int64_t)sizeClassVertical
{
  return self->_sizeClassVertical;
}

- (void)setSizeClassVertical:(int64_t)a3
{
  self->_sizeClassVertical = a3;
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

- (void)setDisplayGamut:(int64_t)a3
{
  self->_displayGamut = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (BOOL)isFlippable
{
  return self->_isFlippable;
}

- (void)setIsFlippable:(BOOL)a3
{
  self->_isFlippable = a3;
}

- (unint64_t)memoryClass
{
  return self->_memoryClass;
}

- (void)setMemoryClass:(unint64_t)a3
{
  self->_memoryClass = a3;
}

- (unint64_t)graphicsClass
{
  return self->_graphicsClass;
}

- (void)setGraphicsClass:(unint64_t)a3
{
  self->_graphicsClass = a3;
}

- (int64_t)graphicsFeatureSetClass
{
  return self->_graphicsFeatureSetClass;
}

- (void)setGraphicsFeatureSetClass:(int64_t)a3
{
  self->_graphicsFeatureSetClass = a3;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  self->_compressionType = a3;
}

- (double)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (void)setLossyCompressionQuality:(double)a3
{
  self->_lossyCompressionQuality = a3;
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)universalTypeIdentifier
{
  return self->_universalTypeIdentifier;
}

- (void)setUniversalTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)containedImageNames
{
  return self->_containedImageNames;
}

- (void)setContainedImageNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
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

- (__n128)transformation
{
  return a1[33];
}

- (__n128)setTransformation:(__n128)a3
{
  result[33] = a2;
  result[34] = a3;
  result[35] = a4;
  result[36] = a5;
  return result;
}

- (int)objectVersion
{
  return self->_objectVersion;
}

- (void)setObjectVersion:(int)a3
{
  self->_objectVersion = a3;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_vectorGlyphRenderingMode;
}

- (void)setVectorGlyphRenderingMode:(int64_t)a3
{
  self->_vectorGlyphRenderingMode = a3;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSArray)layerReferences
{
  return self->_layerReferences;
}

- (void)setLayerReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unint64_t)textureWidth
{
  return self->_textureWidth;
}

- (void)setTextureWidth:(unint64_t)a3
{
  self->_textureWidth = a3;
}

- (unint64_t)textureHeight
{
  return self->_textureHeight;
}

- (void)setTextureHeight:(unint64_t)a3
{
  self->_textureHeight = a3;
}

- (unint64_t)textureDepth
{
  return self->_textureDepth;
}

- (void)setTextureDepth:(unint64_t)a3
{
  self->_textureDepth = a3;
}

- (BOOL)cubeMap
{
  return self->_cubeMap;
}

- (void)setCubeMap:(BOOL)a3
{
  self->_cubeMap = a3;
}

- (unint64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (void)setArrayIndex:(unint64_t)a3
{
  self->_arrayIndex = a3;
}

- (int64_t)texturePixelFormat
{
  return self->_texturePixelFormat;
}

- (void)setTexturePixelFormat:(int64_t)a3
{
  self->_texturePixelFormat = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (NSArray)textureInfos
{
  return self->_textureInfos;
}

- (void)setTextureInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (int64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(int64_t)a3
{
  self->_colorSpaceID = a3;
}

- (NSArray)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)foregroundColorName
{
  return self->_foregroundColorName;
}

- (void)setForegroundColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)backgroundColorName
{
  return self->_backgroundColorName;
}

- (void)setBackgroundColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (int64_t)backgroundColorSpaceID
{
  return self->_backgroundColorSpaceID;
}

- (void)setBackgroundColorSpaceID:(int64_t)a3
{
  self->_backgroundColorSpaceID = a3;
}

- (NSArray)backgroundColorComponents
{
  return self->_backgroundColorComponents;
}

- (void)setBackgroundColorComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (int64_t)scalingStyle
{
  return self->_scalingStyle;
}

- (void)setScalingStyle:(int64_t)a3
{
  self->_scalingStyle = a3;
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

- (NSValue)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)appearanceName
{
  return self->_appearanceName;
}

- (void)setAppearanceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int64_t)appearanceIdentifier
{
  return self->_appearanceIdentifier;
}

- (void)setAppearanceIdentifier:(int64_t)a3
{
  self->_appearanceIdentifier = a3;
}

- (NSString)localizationName
{
  return self->_localizationName;
}

- (void)setLocalizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (int64_t)localizationIdentifier
{
  return self->_localizationIdentifier;
}

- (void)setLocalizationIdentifier:(int64_t)a3
{
  self->_localizationIdentifier = a3;
}

@end
