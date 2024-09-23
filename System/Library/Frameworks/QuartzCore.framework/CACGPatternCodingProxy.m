@implementation CACGPatternCodingProxy

- (CACGPatternCodingProxy)initWithObject:(id)a3
{
  CACGPatternCodingProxy *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CACGPatternCodingProxy;
  v4 = -[CACGPatternCodingProxy init](&v6, sel_init);
  if (v4)
    v4->_pattern = CGPatternRetain((CGPatternRef)a3);
  return v4;
}

- (id)decodedObject
{
  return self->_pattern;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Image;
  CGPattern *pattern;
  CGColorSpace *v13;
  CA::Render::Texture *pattern_image;
  unsigned int *v20;
  CGImage *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  __int128 v25;
  _QWORD v26[2];
  double v27[4];
  _OWORD v28[3];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!CGPatternGetType())
  {
    memset(v28, 0, sizeof(v28));
    objc_msgSend(a3, "encodeObject:forKey:", CFSTR("tiling"), CFSTR("CGPatternType"));
    CGPatternGetMatrix();
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v28, 6, CFSTR("CGPatternMatrix"));
    CGPatternGetBounds();
    v27[0] = v5;
    v27[1] = v6;
    v27[2] = v7;
    v27[3] = v8;
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v27, 4, CFSTR("CGPatternBounds"));
    CGPatternGetStep();
    v26[0] = v9;
    v26[1] = v10;
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v26, 2, CFSTR("CGPatternStep"));
    objc_msgSend(a3, "encodeInt:forKey:", CGPatternGetTiling(), CFSTR("CGPatternTiling"));
    objc_msgSend(a3, "encodeInt:forKey:", CGPatternIsColored(), CFSTR("CGPatternColored"));
    Image = CGPatternGetImage();
    if (Image)
      goto LABEL_3;
    pattern = self->_pattern;
    v13 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    __asm { FMOV            V0.2D, #1.0 }
    v25 = _Q0;
    pattern_image = CA::Render::create_pattern_image((uint64_t)pattern, v13, (CGFloat *)&v25, v27);
    if (!pattern_image)
    {
LABEL_3:
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", Image, CFSTR("CGPatternImage"), 0);
    }
    else
    {
      v20 = (unsigned int *)pattern_image;
      v21 = CA::Render::Image::copy_cgimage(pattern_image);
      v22 = v20 + 2;
      do
      {
        v23 = __ldaxr(v22);
        v24 = v23 - 1;
      }
      while (__stlxr(v24, v22));
      if (!v24)
        (*(void (**)(unsigned int *))(*(_QWORD *)v20 + 16))(v20);
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v21, CFSTR("CGPatternImage"), 0);
      CGImageRelease(v21);
    }
  }
}

- (CACGPatternCodingProxy)initWithCoder:(id)a3
{
  CACGPatternCodingProxy *v4;
  __int128 v5;
  CGSize v6;
  CGPatternTiling v7;
  int v8;
  void *v9;
  void *v10;
  CFTypeID v11;
  double width;
  double height;
  CGPatternRef v14;
  CGAffineTransform v16[2];
  objc_super v17;
  __int128 v18;
  CGRect v19;
  CGAffineTransform v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(&v20, 0, sizeof(v20));
  memset(&v19, 0, sizeof(v19));
  v18 = 0uLL;
  v17.receiver = self;
  v17.super_class = (Class)CACGPatternCodingProxy;
  v4 = -[CACGPatternCodingProxy init](&v17, sel_init);
  if (v4
    && objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CGPatternType")), "isEqualToString:", CFSTR("tiling")))
  {
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v20, 6, CFSTR("CGPatternMatrix")) & 1) == 0)
    {
      v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v20.c = v5;
      *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v19, 4, CFSTR("CGPatternBounds")) & 1) == 0)
    {
      v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v19.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v19.size = v6;
    }
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v18, 2, CFSTR("CGPatternStep")) & 1) == 0)
      v18 = *MEMORY[0x1E0C9D820];
    v7 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CGPatternTiling"));
    v8 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CGPatternColored"));
    v9 = (void *)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("CGPatternImage"));
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == CGImageGetTypeID())
      {
        if (v19.origin.x == 0.0
          && v19.origin.y == 0.0
          && (width = v19.size.width, width == (double)CGImageGetWidth((CGImageRef)v10))
          && (height = v19.size.height, height == (double)CGImageGetHeight((CGImageRef)v10))
          && *(double *)&v18 == v19.size.width
          && *((double *)&v18 + 1) == v19.size.height
          && (v8 != 0) != CGImageIsMask((CGImageRef)v10))
        {
          v16[1] = v20;
          v4->_pattern = (CGPattern *)CGPatternCreateWithImage2();
        }
        else
        {
          v16[0] = v20;
          v14 = CGPatternCreate(v10, v19, v16, *(CGFloat *)&v18, *((CGFloat *)&v18 + 1), v7, v8 != 0, &pattern_callbacks);
          v4->_pattern = v14;
          if (v14)
            CGImageRetain((CGImageRef)v10);
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CGPatternRelease(self->_pattern);
  v3.receiver = self;
  v3.super_class = (Class)CACGPatternCodingProxy;
  -[CACGPatternCodingProxy dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
