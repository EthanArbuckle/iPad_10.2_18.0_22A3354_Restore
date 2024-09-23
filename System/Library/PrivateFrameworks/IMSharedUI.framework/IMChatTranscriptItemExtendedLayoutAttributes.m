@implementation IMChatTranscriptItemExtendedLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMChatTranscriptItemExtendedLayoutAttributes;
  result = -[IMChatTranscriptItemLayoutAttributes copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_OWORD *)result + 5) = self->_drawableSize;
  *((_QWORD *)result + 8) = self->_layoutOrientation;
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_topMargin;
  return result;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (CGSize)drawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawableSize.width;
  height = self->_drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDrawableSize:(CGSize)a3
{
  self->_drawableSize = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

@end
