@implementation CUINamedSolidLayerImage

- (CUINamedSolidLayerImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedSolidLayerImage *v7;
  uint64_t v8;
  CUINamedSolidLayerImage *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CUINamedSolidLayerImage;
  v7 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:](&v26, sel_initWithName_usingRenditionKey_fromTheme_, a3);
  v9 = v7;
  if (v7)
  {
    v7->_opacity = 1.0;
    v7->_blendMode = 0;
    v10 = (void *)_LookupStructuredThemeProvider(a5, v8);
    v11 = objc_msgSend(a4, "copy");
    v12 = objc_msgSend(a4, "copy");
    objc_msgSend(v11, "setThemeElement:", 41);
    objc_msgSend(v11, "setThemePart:", 0);
    objc_msgSend(v11, "setThemeDimension1:", 1);
    objc_msgSend(v11, "setThemeDimension2:", 0);
    objc_msgSend(v12, "setThemeElement:", 41);
    objc_msgSend(v12, "setThemePart:", 0);
    objc_msgSend(v12, "setThemeDimension1:", 2);
    objc_msgSend(v12, "setThemeDimension2:", 0);
    if (objc_msgSend(v10, "canGetRenditionWithKey:", objc_msgSend(v11, "keyList")))
      v9->_edgeTexture = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedTexture alloc], "initWithName:usingRenditionKey:fromTheme:", -[CUINamedLookup name](v9, "name"), v11, a5);
    else
      _CUILog(4, (uint64_t)"CoreUI: %s can't find edgeTexture", v13, v14, v15, v16, v17, v18, (uint64_t)"-[CUINamedSolidLayerImage initWithName:usingRenditionKey:fromTheme:]");
    if (objc_msgSend(v10, "canGetRenditionWithKey:", objc_msgSend(v12, "keyList")))
      v9->_gradientTexture = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedTexture alloc], "initWithName:usingRenditionKey:fromTheme:", -[CUINamedLookup name](v9, "name"), v12, a5);
    else
      _CUILog(4, (uint64_t)"CoreUI: %s can't find edgeTexture", v19, v20, v21, v22, v23, v24, (uint64_t)"-[CUINamedSolidLayerImage initWithName:usingRenditionKey:fromTheme:]");

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedSolidLayerImage;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (double)opacity
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUINamedSolidLayerImage;
  -[CUINamedImage opacity](&v5, sel_opacity);
  return v3 * self->_opacity;
}

- (int)blendMode
{
  int result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUINamedSolidLayerImage;
  result = -[CUINamedImage blendMode](&v4, sel_blendMode);
  if (self->_blendMode > 0)
    return self->_blendMode;
  return result;
}

- (id)edgeDefinitionTextureWithBufferAllocator:(id)a3
{
  CUINamedTexture *edgeTexture;
  TXRTexture *edgeTXR;
  TXRTexture *v7;
  TXRTexture *v8;

  edgeTexture = self->_edgeTexture;
  if (edgeTexture)
    return -[CUINamedTexture textureWithBufferAllocator:](edgeTexture, "textureWithBufferAllocator:", a3);
  edgeTXR = self->_edgeTXR;
  if (edgeTXR)
  {
    CUICurrentPlatform();
    -[CUINamedImage image](self, "image");
    v7 = (TXRTexture *)CUICreateSDFEdgeTextureFromImage();
    self->_edgeTXR = v7;
    v8 = v7;
    edgeTXR = self->_edgeTXR;
  }
  return edgeTXR;
}

- (id)gradientTextureWithBufferAllocator:(id)a3
{
  CUINamedTexture *gradientTexture;
  TXRTexture *gradientTXR;
  TXRTexture *v7;
  TXRTexture *v8;

  gradientTexture = self->_gradientTexture;
  if (gradientTexture)
    return -[CUINamedTexture textureWithBufferAllocator:](gradientTexture, "textureWithBufferAllocator:", a3);
  gradientTXR = self->_gradientTXR;
  if (gradientTXR)
  {
    CUICurrentPlatform();
    -[CUINamedImage image](self, "image");
    v7 = (TXRTexture *)CUICreateSDFGradientTextureFromImage();
    self->_gradientTXR = v7;
    v8 = v7;
    gradientTXR = self->_gradientTXR;
  }
  return gradientTXR;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

@end
