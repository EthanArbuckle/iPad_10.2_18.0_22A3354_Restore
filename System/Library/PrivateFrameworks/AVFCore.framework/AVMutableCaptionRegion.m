@implementation AVMutableCaptionRegion

- (AVMutableCaptionRegion)initWithFigMutableCaptionRegion:(OpaqueFigCaptionRegion *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion initWithFigCaptionRegion:](&v4, sel_initWithFigCaptionRegion_, a3);
}

- (AVMutableCaptionRegion)initWithIdentifier:(NSString *)identifier
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion initWithIdentifier:](&v4, sel_initWithIdentifier_, identifier);
}

- (AVMutableCaptionRegion)init
{
  AVMutableCaptionRegion *v3;

  v3 = 0;
  if (!FigCaptionRegionCreateMutable())
    return -[AVMutableCaptionRegion initWithFigMutableCaptionRegion:](self, "initWithFigMutableCaptionRegion:", 0);
  return v3;
}

- (AVCaptionPosition)position
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion position](&v3, sel_position);
}

- (AVCaptionPosition)endPosition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion endPosition](&v3, sel_endPosition);
}

- (AVCaptionLength)height
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion height](&v3, sel_height);
}

- (AVCaptionRegionScroll)scroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion scroll](&v3, sel_scroll);
}

- (AVCaptionRegionDisplayAlignment)displayAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion displayAlignment](&v3, sel_displayAlignment);
}

- (AVCaptionRegionWritingMode)writingMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaptionRegion;
  return -[AVCaptionRegion writingMode](&v3, sel_writingMode);
}

- (AVCaptionPoint)origin
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaptionRegion;
  return (AVCaptionPoint *)-[AVCaptionPoint origin](&v4, sel_origin);
}

- (void)setOrigin:(AVCaptionPoint *)origin
{
  AVCaptionDimension y;
  _OWORD v4[2];

  y = origin->y;
  v4[0] = origin->x;
  v4[1] = y;
  -[AVCaptionRegion _setOrigin:](self, "_setOrigin:", v4);
}

- (AVCaptionSize)size
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaptionRegion;
  return (AVCaptionSize *)-[AVCaptionSize size](&v4, sel_size);
}

- (void)setSize:(AVCaptionSize *)size
{
  AVCaptionDimension height;
  _OWORD v4[2];

  height = size->height;
  v4[0] = size->width;
  v4[1] = height;
  -[AVCaptionRegion _setSize:](self, "_setSize:", v4);
}

@end
