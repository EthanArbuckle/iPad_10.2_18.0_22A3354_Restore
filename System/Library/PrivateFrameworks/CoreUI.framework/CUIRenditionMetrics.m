@implementation CUIRenditionMetrics

- (BOOL)hasAlignmentEdgeMargins
{
  BOOL v2;

  v2 = self->_edgeBottomLeftMargin.height != 0.0 || self->_edgeTopRightMargin.height != 0.0;
  if (self->_edgeBottomLeftMargin.width != 0.0)
    return 1;
  if (self->_edgeTopRightMargin.width == 0.0)
    return v2;
  return 1;
}

- (id)initWithImageSize:(int)a3 defaultImageSize:(double)a4 edgeBottomLeft:(double)a5 edgeTopRight:(double)a6 contentBottomLeft:(double)a7 contentTopRight:(double)a8 baseline:(double)a9 auxiliary1BottomLeft:(double)a10 auxiliary1TopRight:(double)a11 auxiliary2BottomLeft:(uint64_t)a12 auxiliary2TopRight:(uint64_t)a13 scalesVertically:(uint64_t)a14 scalesHorizontally:(uint64_t)a15 scale:(uint64_t)a16
{
  __int16 v40;
  __int16 v41;
  objc_super v42;

  if (result)
  {
    v42.receiver = result;
    v42.super_class = (Class)CUIRenditionMetrics;
    result = objc_msgSendSuper2(&v42, sel_init);
    if (result)
    {
      *((double *)result + 1) = a4;
      *((double *)result + 2) = a5;
      *((double *)result + 3) = a6;
      *((double *)result + 4) = a7;
      *((double *)result + 5) = a8;
      *((double *)result + 6) = a9;
      *((double *)result + 7) = a10;
      *((double *)result + 8) = a11;
      *((_QWORD *)result + 9) = a17;
      *((_QWORD *)result + 10) = a18;
      *((_QWORD *)result + 11) = a19;
      *((_QWORD *)result + 12) = a20;
      *((_QWORD *)result + 13) = a21;
      *((_QWORD *)result + 14) = a22;
      *((_QWORD *)result + 15) = a23;
      *((_QWORD *)result + 16) = a24;
      *((_QWORD *)result + 17) = a25;
      *((_QWORD *)result + 18) = a26;
      *((_QWORD *)result + 19) = a27;
      *((_QWORD *)result + 20) = a28;
      v40 = *((_WORD *)result + 92) & 0xFFFC;
      *((_QWORD *)result + 21) = a29;
      *((_QWORD *)result + 22) = a30;
      if (a3)
        v41 = 2;
      else
        v41 = 0;
      *((_WORD *)result + 92) = v41 | a2 | v40;
    }
  }
  return result;
}

- (CGSize)edgeTopRightMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_edgeTopRightMargin.width;
  height = self->_edgeTopRightMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)edgeBottomLeftMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_edgeBottomLeftMargin.width;
  height = self->_edgeBottomLeftMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)initwithImageSize:(double)a3 scale:(double)a4
{
  objc_super v7;

  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)CUIRenditionMetrics;
    result = (double *)objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
      result[3] = a2;
      result[4] = a3;
      result[22] = a4;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class(self, a2));
  *(CGSize *)((char *)result + 8) = self->_imageSize;
  *(CGSize *)((char *)result + 24) = self->_defaultImageSize;
  *(CGSize *)((char *)result + 40) = self->_edgeBottomLeftMargin;
  *(CGSize *)((char *)result + 56) = self->_edgeTopRightMargin;
  *(CGSize *)((char *)result + 72) = self->_contentBottomLeftMargin;
  *(CGSize *)((char *)result + 88) = self->_contentTopRightMargin;
  *((_QWORD *)result + 13) = *(_QWORD *)&self->_baseline;
  *((_OWORD *)result + 7) = self->_auxiliary1BottomLeftMargin;
  *((_OWORD *)result + 8) = self->_auxiliary1TopRightMargin;
  *((_OWORD *)result + 9) = self->_auxiliary2BottomLeftMargin;
  *((_OWORD *)result + 10) = self->_auxiliary2TopRightMargin;
  *((_QWORD *)result + 22) = *(_QWORD *)&self->_scale;
  *((_DWORD *)result + 46) = self->_crmFlags;
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)defaultImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultImageSize.width;
  height = self->_defaultImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentBottomLeftMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_contentBottomLeftMargin.width;
  height = self->_contentBottomLeftMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentTopRightMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_contentTopRightMargin.width;
  height = self->_contentTopRightMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)baseline
{
  return self->_baseline;
}

- (CGSize)auxiliary1BottomLeftMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_auxiliary1BottomLeftMargin.width;
  height = self->_auxiliary1BottomLeftMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)auxiliary1TopRightMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_auxiliary1TopRightMargin.width;
  height = self->_auxiliary1TopRightMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)auxiliary2BottomLeftMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_auxiliary2BottomLeftMargin.width;
  height = self->_auxiliary2BottomLeftMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)auxiliary2TopRightMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_auxiliary2TopRightMargin.width;
  height = self->_auxiliary2TopRightMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)scalesVertically
{
  return *(_WORD *)&self->_crmFlags & 1;
}

- (BOOL)scalesHorizontally
{
  return (*(_WORD *)&self->_crmFlags >> 1) & 1;
}

- (id)metricsByMirroringHorizontally
{
  CGFloat *v3;

  v3 = (CGFloat *)-[CUIRenditionMetrics copy](self, "copy");
  v3[5] = self->_edgeTopRightMargin.width;
  v3[7] = self->_edgeBottomLeftMargin.width;
  v3[9] = self->_contentTopRightMargin.width;
  v3[11] = self->_contentBottomLeftMargin.width;
  v3[14] = self->_auxiliary1TopRightMargin.width;
  v3[16] = self->_auxiliary1BottomLeftMargin.width;
  v3[18] = self->_auxiliary2TopRightMargin.width;
  v3[20] = self->_auxiliary2BottomLeftMargin.width;
  return v3;
}

- (CGRect)edgeRect
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_edgeBottomLeftMargin.width;
  height = self->_edgeBottomLeftMargin.height;
  v4 = self->_imageSize.width - width - self->_edgeTopRightMargin.width;
  v5 = self->_imageSize.height - height - self->_edgeTopRightMargin.height;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = height;
  result.origin.x = width;
  return result;
}

- (CGRect)contentRect
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_contentBottomLeftMargin.width;
  height = self->_contentBottomLeftMargin.height;
  v4 = self->_imageSize.width - width - self->_contentTopRightMargin.width;
  v5 = self->_imageSize.height - height - self->_contentTopRightMargin.height;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = height;
  result.origin.x = width;
  return result;
}

- (CGRect)insetRectWithMetrics:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x + a3.size.width - self->_edgeTopRightMargin.width - (a3.origin.x + self->_edgeBottomLeftMargin.width);
  v4 = a3.origin.y
     + a3.size.height
     - self->_edgeTopRightMargin.height
     - (a3.origin.y
      + self->_edgeBottomLeftMargin.height);
  v5 = a3.origin.x + self->_edgeBottomLeftMargin.width;
  v6 = a3.origin.y + self->_edgeBottomLeftMargin.height;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)insetContentRectWithMetrics:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x
     + a3.size.width
     - self->_contentTopRightMargin.width
     - (a3.origin.x
      + self->_contentBottomLeftMargin.width);
  v4 = a3.origin.y
     + a3.size.height
     - self->_contentTopRightMargin.height
     - (a3.origin.y
      + self->_contentBottomLeftMargin.height);
  v5 = a3.origin.x + self->_contentBottomLeftMargin.width;
  v6 = a3.origin.y + self->_contentBottomLeftMargin.height;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)hasOpaqueContentBounds
{
  return 1;
}

@end
