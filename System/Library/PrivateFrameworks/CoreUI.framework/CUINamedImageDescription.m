@implementation CUINamedImageDescription

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (void)setSizeClassVertical:(int64_t)a3
{
  self->_sizeClassVertical = a3;
}

- (void)setSizeClassHorizontal:(int64_t)a3
{
  self->_sizeClassHorizontal = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setResizingMode:(int64_t)a3
{
  self->_resizingMode = a3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setImageType:(int64_t)a3
{
  self->_imageType = a3;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiom = a3;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (void)setDisplayGamut:(int64_t)a3
{
  self->_displayGamut = a3;
}

- (void)setAlignmentEdgeInsets:(id)a3
{
  self->_alignmentEdgeInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (void)dealloc
{
  objc_super v3;

  -[CUINamedImageDescription setAppearanceName:](self, "setAppearanceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CUINamedImageDescription;
  -[CUINamedImageDescription dealloc](&v3, sel_dealloc);
}

- (void)setAppearanceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (int64_t)sizeClassVertical
{
  return self->_sizeClassVertical;
}

- (int64_t)sizeClassHorizontal
{
  return self->_sizeClassHorizontal;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

- (NSString)appearanceName
{
  return self->_appearanceName;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (int64_t)resizingMode
{
  return self->_resizingMode;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (int)blendMode
{
  return self->_blendMode;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_alignmentEdgeInsets.top;
  left = self->_alignmentEdgeInsets.left;
  bottom = self->_alignmentEdgeInsets.bottom;
  right = self->_alignmentEdgeInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (void)setIsTemplate:(BOOL)a3
{
  self->_templateRenderingMode = a3;
}

- (BOOL)isTemplate
{
  return (unint64_t)(self->_templateRenderingMode - 1) < 2;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CUINamedImageDescription %p> (s:%f i:%d subtype:%d scH:%d scV:%d bM:%d template:%d iT:%d rm:%d exif:%d appearanceName:%@)"), self, *(_QWORD *)&self->_scale, self->_idiom, self->_subtype, self->_sizeClassHorizontal, self->_sizeClassVertical, self->_blendMode, self->_templateRenderingMode, self->_imageType, self->_resizingMode, self->_exifOrientation, self->_appearanceName);
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (void)setEdgeInsets:(id)a3
{
  self->_edgeInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

@end
