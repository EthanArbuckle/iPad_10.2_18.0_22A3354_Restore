@implementation PDFPage

- (id)imageWithBox:(int64_t)a3
{
  return -[PDFPage _imageWithBox:resolution:offset:wantThumbnail:](self, "_imageWithBox:resolution:offset:wantThumbnail:", a3, 0, 144.0, 144.0, CGPointZero.x, CGPointZero.y);
}

- (id)_imageWithBox:(int64_t)a3 resolution:(CGSize)a4 offset:(CGPoint)a5 wantThumbnail:(BOOL)a6
{
  _BOOL8 v6;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSInteger v19;
  double v20;
  double v21;
  CGColorSpace *v22;
  CGColorSpace *v23;
  unint64_t v24;
  size_t NumberOfComponents;
  size_t AlignedBytesPerRow;
  CGContext *v27;
  CGContext *v28;
  CGImageRef Image;
  __int128 v31;
  CGRect v32;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4.width / 72.0;
  v12 = a4.height / 72.0;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0x3FF0000000000000, 0x3FF0000000000000, 0x3FF0000000000000, unk_10006E118);
  v16 = floor(v15 + v11 * v13) - ceil(v15);
  v18 = floor(v17 + v12 * v14) - ceil(v17);
  v19 = -[PDFPage rotation](self, "rotation");
  if (v19 == 180)
    v20 = v18;
  else
    v20 = v16;
  if (v19 == 180)
    v21 = v16;
  else
    v21 = v18;
  if (v19)
  {
    v18 = v20;
    v16 = v21;
  }
  v22 = CGColorSpaceCreateWithName(kCGColorSpaceAdobeRGB1998);
  if (v22)
  {
    v23 = v22;
    v24 = (unint64_t)v16;
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v22);
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(v24 + v24 * NumberOfComponents);
    v27 = CGBitmapContextCreate(0, (unint64_t)v16, (unint64_t)v18, 8uLL, AlignedBytesPerRow, v23, 0x2002u);
    if (v27)
    {
      v28 = v27;
      CGContextSetAllowsAntialiasing(v27, 1);
      CGContextSetAllowsFontSmoothing(v28, 1);
      CGContextSetAllowsFontSubpixelPositioning(v28, 1);
      CGContextSetAllowsFontSubpixelQuantization(v28, 1);
      CGContextSetFillColor(v28, (const CGFloat *)&v31);
      v32.size.width = (double)v24;
      v32.size.height = (double)(unint64_t)v18;
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      CGContextFillRect(v28, v32);
      CGContextTranslateCTM(v28, x, y);
      CGContextScaleCTM(v28, v11, v12);
      CGContextSetShouldAntialias(v28, 1);
      CGContextSetShouldSubpixelPositionFonts(v28, 1);
      CGContextSetShouldSubpixelQuantizeFonts(v28, 1);
      -[PDFPage drawWithBox:inContext:isThumbnail:](self, "drawWithBox:inContext:isThumbnail:", a3, v28, v6);
      Image = CGBitmapContextCreateImage(v28);
      CGContextRelease(v28);
    }
    else
    {
      Image = 0;
    }
    CGColorSpaceRelease(v23);
  }
  else
  {
    Image = 0;
  }
  return objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:", Image);
}

@end
