@implementation TDCustomAssetImportInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDCustomAssetImportInfo;
  -[TDCustomAssetImportInfo dealloc](&v3, sel_dealloc);
}

- (int64_t)renditionSubtype
{
  unint64_t v3;
  _QWORD *v4;

  if (-[TDCustomAssetImportInfo resizingMode](self, "resizingMode"))
  {
    if (-[TDCustomAssetImportInfo resizingMode](self, "resizingMode") == 1)
    {
      v3 = -[TDCustomAssetImportInfo renditionType](self, "renditionType");
      if (v3 < 4)
      {
        v4 = &unk_226EC09C8;
        return v4[v3];
      }
    }
  }
  else
  {
    v3 = -[TDCustomAssetImportInfo renditionType](self, "renditionType");
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
  return (unint64_t)(-[TDCustomAssetImportInfo templateRenderingMode](self, "templateRenderingMode") - 1) < 2;
}

- (void)setIsTemplate:(BOOL)a3
{
  -[TDCustomAssetImportInfo setTemplateRenderingMode:](self, "setTemplateRenderingMode:", a3);
}

- (CUIRenditionKey)renditionKey
{
  return self->_renditionKey;
}

- (void)setRenditionKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)elementName
{
  return self->_elementName;
}

- (void)setElementName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TDCustomAssetSource)customAsset
{
  return (TDCustomAssetSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCustomAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
