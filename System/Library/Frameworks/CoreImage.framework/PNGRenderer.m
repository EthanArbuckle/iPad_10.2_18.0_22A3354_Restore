@implementation PNGRenderer

- (PNGRenderer)init
{
  PNGRenderer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PNGRenderer;
  v2 = -[CGRenderer init](&v4, sel_init);
  if (v2)
  {
    v2->background = CGColorCreateWithHex(0xFFFFFFFFuLL);
    v2->colorSpace = CGColorSpaceCreateDeviceRGB();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->background);
  CGColorSpaceRelease(self->colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PNGRenderer;
  -[CGRenderer dealloc](&v3, sel_dealloc);
}

- (void)setFileURL:(id)a3
{
  self->fullURL = (__CFURL *)objc_msgSend(a3, "URLByAppendingPathExtension:", CFSTR("png"));
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  CGContext *context;
  double v8;
  CGContext *v9;
  CGRect v11;

  context = self->super.context;
  if (context)
    CGContextRelease(context);
  v8 = (double)a3 + 40.0 + (double)a3 + 40.0;
  v9 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)((double)a4 + 40.0 + (double)a4 + 40.0), 8uLL, vcvtd_n_u64_f64(v8, 2uLL), self->colorSpace, 0x2002u);
  self->super.context = v9;
  if (v9)
  {
    CGContextSetFillColorWithColor(v9, self->background);
    CGContextSetAlpha(self->super.context, 1.0);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = (double)a3 + 40.0 + (double)a3 + 40.0;
    v11.size.height = (double)a4 + 40.0 + (double)a4 + 40.0;
    CGContextFillRect(self->super.context, v11);
    v9 = self->super.context;
  }
  CGContextScaleCTM(v9, 2.0, 2.0);
  CGContextTranslateCTM(self->super.context, 20.0, 20.0);
  return self->super.context != 0;
}

- (void)flushRender
{
  CGImageDestinationRef v3;
  CGImageDestination *v4;
  CGImage *v5;

  v3 = CGImageDestinationCreateWithURL(self->fullURL, CFSTR("public.png"), 1uLL, 0);
  if (v3)
  {
    v4 = v3;
    v5 = -[PNGRenderer cgimage](self, "cgimage");
    CGImageDestinationAddImage(v4, v5, 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
    CGImageRelease(v5);
  }
}

- (CGImage)cgimage
{
  CGImage *result;

  result = self->super.context;
  if (result)
    return CGBitmapContextCreateImage(result);
  return result;
}

@end
