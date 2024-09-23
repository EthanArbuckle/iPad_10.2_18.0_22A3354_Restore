@implementation _CUIThemeSVGRendition

- (double)vectorGlyphCapLine
{
  return self->_capline;
}

- (double)vectorGlyphBaseline
{
  return self->_baseline;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_renderingMode;
}

- (double)vectorGlyphReferencePointSize
{
  unint64_t v2;

  LODWORD(v2) = self->_standardPointSize;
  return (double)v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets
{
  double v3;
  double right;
  double v5;
  double bottom;
  double left;
  double top;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (self->_isAlignmentRect)
  {
    -[_CUIThemeSVGRendition canvasSize](self, "canvasSize");
    right = (self->_alignmentRectInsets.right - v3) * 0.5;
    bottom = (self->_alignmentRectInsets.top - v5) * 0.5;
    left = right;
    top = bottom;
  }
  else
  {
    top = self->_alignmentRectInsets.top;
    left = self->_alignmentRectInsets.left;
    bottom = self->_alignmentRectInsets.bottom;
    right = self->_alignmentRectInsets.right;
  }
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (CGSize)canvasSize
{
  CGSize *p_canvasSize;
  double width;
  double height;
  CGSize result;

  p_canvasSize = &self->_canvasSize;
  width = self->_canvasSize.width;
  if (width == 0.0 || (height = self->_canvasSize.height, height == 0.0))
  {
    width = CGSVGDocumentGetCanvasSize(-[_CUIThemeSVGRendition svgDocument](self, "svgDocument"));
    p_canvasSize->width = width;
    p_canvasSize->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (CGSVGDocument)svgDocument
{
  CGSVGDocument *svgDocument;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  svgDocument = self->_svgDocument;
  if (svgDocument)
    goto LABEL_2;
  v5 = -[_CUIThemeSVGRendition rawData](self, "rawData");
  if (v5)
  {
    svgDocument = (CGSVGDocument *)CGSVGDocumentCreateFromData(v5, 0);
    self->_svgDocument = svgDocument;
    if (!svgDocument)
    {
      -[CUIThemeRendition name](self, "name");
      _CUILog(4, (uint64_t)"CoreUI: %s '%@' couldn't create SVGDocument (%f) from data", v6, v7, v8, v9, v10, v11, (uint64_t)"-[_CUIThemeSVGRendition svgDocument]");
      return self->_svgDocument;
    }
LABEL_2:
    CFRetain(svgDocument);
    CFAutorelease(self->_svgDocument);
    return self->_svgDocument;
  }
  -[CUIThemeRendition name](self, "name");
  _CUILog(4, (uint64_t)"CoreUI: %s '%@' couldn't create SVGDocument from null data", v12, v13, v14, v15, v16, v17, (uint64_t)"-[_CUIThemeSVGRendition svgDocument]");
  return 0;
}

- (float)vectorGlyphTemplateVersion
{
  return self->_templateVersion;
}

- (signed)containsMulticolorLayers
{
  return self->_containsMulticolorLayers;
}

- (void)dealloc
{
  CGSVGDocument *svgDocument;
  objc_super v4;

  svgDocument = self->_svgDocument;
  if (svgDocument)
  {
    CGSVGDocumentRelease(svgDocument, a2);
    self->_svgDocument = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_CUIThemeSVGRendition;
  -[CUIThemeRendition dealloc](&v4, sel_dealloc);
}

- (BOOL)isInterpolatable
{
  return self->_templateVersion >= 3.0 && self->_isInterpolatable;
}

- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10;
  uint64_t var0;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  float v11;
  float v12;
  NSArray *v13;
  unsigned int v14;
  float v15;
  unsigned int v16;
  int v17;
  unint64_t v18;
  unsigned int *v19;
  id v20;
  unsigned int v21;
  id v22;
  BOOL v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_CUIThemeSVGRendition;
  -[CUIThemeRendition _initalizeMetadataFromCSIData:version:](&v25, sel__initalizeMetadataFromCSIData_version_);
  var10 = a3->var10;
  var0 = a3->var11.var0;
  self->_containsMulticolorLayers = -1;
  self->_containsHierarchicalLayers = -1;
  if ((_DWORD)var10)
  {
    v8 = &a3->var11.var1[var0 + 1];
    v9 = (unsigned int *)((char *)v8 + var10);
    do
    {
      v10 = v8[1];
      if (*v8 == 1019)
      {
        v16 = v8[2];
        self->_renderingMode = v8[3];
        if (v16)
        {
          self->_containsMulticolorLayers = v8[4] & 1;
          v17 = (*((unsigned __int16 *)v8 + 8) >> 1) & 1;
        }
        else
        {
          LOWORD(v17) = -1;
          self->_containsMulticolorLayers = -1;
        }
        v23 = v10 == 12 || a4 >= 0x34F;
        self->_containsHierarchicalLayers = v17;
        if (!v23)
          v10 = 12;
      }
      else if (*v8 == 1018)
      {
        self->_standardPointSize = v8[3];
        v11 = *((float *)v8 + 5);
        self->_baseline = *((float *)v8 + 4);
        self->_capline = v11;
        *(float64x2_t *)&self->_alignmentRectInsets.left = vcvtq_f64_f32(*(float32x2_t *)(v8 + 7));
        v12 = *((float *)v8 + 10);
        self->_alignmentRectInsets.right = *((float *)v8 + 9);
        self->_alignmentRectInsets.top = v12;
        self->_isAlignmentRect = (v8[2] & 1) == 0;
        v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        v14 = v8[2];
        if ((v14 & 0x12) != 0)
        {
          v15 = *((float *)v8 + 6);
          self->_templateVersion = v15;
          if (v15 >= 3.0)
            self->_isInterpolatable = (v14 & 4) != 0;
        }
        else
        {
          self->_templateVersion = 1.0;
        }
        if (v8[11])
        {
          v18 = 0;
          v19 = v8 + 13;
          do
          {
            v20 = objc_alloc((Class)NSNumber);
            v21 = *v19;
            v19 += 2;
            v22 = objc_msgSend(v20, "initWithInt:", v21);
            -[NSArray addObject:](v13, "addObject:", v22);

            ++v18;
          }
          while (v18 < v8[11]);
        }
        self->_vectorSizes = v13;
      }
      v8 = (unsigned int *)((char *)v8 + v10 + 8);
    }
    while (v8 < v9);
  }
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _DWORD *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CUIThemeSVGRendition;
  v5 = -[CUIThemeRendition _initWithCSIHeader:version:](&v17, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v6 = v5;
  v5[85] = 0;
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  v10 = *((_DWORD *)v8 + 2);
  v11 = bswap32(v10);
  if (v9 == 1146569042)
    v12 = v11;
  else
    v12 = v10;
  v13 = v8 - (_BYTE *)objc_msgSend(objc_msgSend(v5, "srcData"), "bytes") + 12;
  v14 = *((_DWORD *)v8 + 1) != 0;
  v15 = (unsigned int *)objc_msgSend(v6, "renditionFlags");
  *v15 = *v15 & 0xFFFFFFC3 | (16 * v14);
  v6[28] = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", objc_msgSend(v6, "srcData"), v13, v12);
  return v6;
}

- (id)rawData
{
  NSData *fileData;
  NSData *v4;
  cuithemerenditionrenditionflags *v5;

  if ((*(_DWORD *)-[CUIThemeRendition renditionFlags](self, "renditionFlags") & 0x3C) == 0x10)
  {
    fileData = self->_fileData;
    self->_fileData = (NSData *)CUIUncompressDataWithLZFSE((const __CFData *)fileData);
    v4 = fileData;
    v5 = -[CUIThemeRendition renditionFlags](self, "renditionFlags");
    *(_DWORD *)v5 &= 0xFFFFFFC3;
  }
  return self->_fileData;
}

- (id)vectorGlyphAvailableSizes
{
  return self->_vectorSizes;
}

- (int)pixelFormat
{
  return 1398163232;
}

- (id)metrics
{
  return 0;
}

- (signed)containsHierarchicalLayers
{
  return self->_containsHierarchicalLayers;
}

@end
