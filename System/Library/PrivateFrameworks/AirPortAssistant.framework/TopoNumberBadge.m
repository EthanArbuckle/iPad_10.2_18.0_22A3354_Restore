@implementation TopoNumberBadge

+ (int)initImageCache
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  if (qword_2550F4DD0)
    return 0;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = (void *)objc_msgSend_imageNamed_inBundle_(ImageStore, v7, (uint64_t)CFSTR("TopoBadgeBG"), v6);
  if (v8
    && (qword_2550F4DD0 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v8, v9, v10, 0.0, 14.0, 0.0, 14.0)) != 0)
  {
    return 0;
  }
  else
  {
    return -6729;
  }
}

+ (void)deallocImageCache
{

  qword_2550F4DD0 = 0;
}

- (TopoNumberBadge)initWithOwningView:(id)a3
{
  TopoNumberBadge *v4;
  const char *v5;
  TopoNumberBadge *v6;
  const char *v7;
  uint64_t v8;
  UIFont *v9;
  UIFont *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TopoNumberBadge;
  v4 = -[TopoNumberBadge init](&v15, sel_init);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    v9 = (UIFont *)objc_msgSend_boldSystemFontOfSize_(MEMORY[0x24BDF6A70], v7, v8, 17.0);
    v6->_font = v9;
    v10 = v9;
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v11, 1);
    objc_msgSend_initImageCache(TopoNumberBadge, v12, v13);
  }
  return v6;
}

- (void)setOwningView:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_owningView = a3;
  v4 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (CGSize)preferredFrameSize
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

- (void)dealloc
{
  UIFont *font;
  objc_super v4;

  font = self->_font;
  if (font)

  self->_font = 0;
  v4.receiver = self;
  v4.super_class = (Class)TopoNumberBadge;
  -[TopoNumberBadge dealloc](&v4, sel_dealloc);
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    MEMORY[0x24BEDD108](self, sel_calculateBadgeMetrics, a3);
  }
}

- (void)layoutSublayers
{
  uint64_t v2;
  CGImage *v4;
  const char *v5;

  v4 = (CGImage *)objc_msgSend_newNumberBadge(self, a2, v2);
  objc_msgSend_setContents_(self, v5, (uint64_t)v4);
  CGImageRelease(v4);
}

- (void)calculateBadgeMetrics
{
  uint64_t v2;
  int64_t count;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  UIFont *font;
  const char *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  CGFloat v17;
  const char *v18;
  float v19;
  float v20;
  CGFloat v21;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  count = self->_count;
  if (count < 1)
  {
    _Q0 = (CGSize)*MEMORY[0x24BDBF148];
  }
  else
  {
    v5 = (void *)sub_21A690C68(count, a2);
    v8 = objc_msgSend_length(v5, v6, v7);
    font = self->_font;
    v27 = *MEMORY[0x24BDF65F8];
    v28[0] = font;
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v28, &v27, 1);
    objc_msgSend_sizeWithAttributes_(v5, v12, v11);
    v14 = v13;
    objc_msgSend_capHeight(self->_font, v15, v16);
    self->_textSize.width = v14;
    self->_textSize.height = v17;
    if (v8)
    {
      if (objc_msgSend_characterAtIndex_(v5, a2, 0) == 49)
        v14 = v14 + 1.0;
      if (objc_msgSend_characterAtIndex_(v5, v18, v8 - 1) == 49)
        v14 = v14 + -1.0;
    }
    v19 = v14 + 20.0;
    v20 = floorf(v19);
    if (v20 <= 23.0)
      v20 = 23.0;
    v21 = v20;
    __asm { FMOV            V0.2D, #31.0 }
    _Q0.width = v21;
  }
  self->_imageSize = _Q0;
  objc_msgSend_setNeedsLayout(self, a2, v2);
}

+ (id)imageBadgeForCount:(int64_t)a3
{
  void *v3;
  TopoNumberBadge *v4;
  const char *v5;
  TopoNumberBadge *v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  CGImage *v17;
  const char *v18;

  v3 = (void *)a3;
  if (a3)
  {
    v4 = objc_alloc_init(TopoNumberBadge);
    v6 = v4;
    if (v4)
    {
      objc_msgSend_setCount_(v4, v5, (uint64_t)v3);
      v7 = *MEMORY[0x24BDBEFB0];
      v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      objc_msgSend_preferredFrameSize(v6, v9, v10);
      objc_msgSend_setFrame_(v6, v11, v12, v7, v8, v13, v14);
      v17 = (CGImage *)objc_msgSend_newNumberBadge(v6, v15, v16);
      v3 = (void *)objc_msgSend_imageWithCGImage_(MEMORY[0x24BDF6AC8], v18, (uint64_t)v17);
      CGImageRelease(v17);
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v3;
}

- (CGImage)newNumberBadge
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  UIImage *ImageFromCurrentImageContext;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  const char *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  float v25;
  float v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  float v49;
  double v50;
  UIFont *font;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  CGImage *v60;
  _QWORD v62[2];
  _QWORD v63[3];
  CGSize v64;
  CGRect v65;

  v63[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_bounds(self, a2, v2);
  if (CGRectIsEmpty(v65))
    return 0;
  objc_msgSend_bounds(self, v4, v5);
  v8 = v7;
  v10 = v9;
  objc_msgSend_scale((void *)qword_2550F4DD0, v11, v12);
  v14 = v13;
  v64.width = v8;
  v64.height = v10;
  UIGraphicsBeginImageContextWithOptions(v64, 0, v14);
  v15 = (void *)qword_2550F4DD0;
  objc_msgSend_bounds(self, v16, v17);
  objc_msgSend_drawInRect_(v15, v18, v19);
  v21 = (void *)sub_21A690C68(self->_count, v20);
  objc_msgSend_bounds(self, v22, v23);
  v25 = (v24 - self->_textSize.height) * 0.5 + -4.0;
  v26 = floorf(v25);
  objc_msgSend_leading(self->_font, v27, v28);
  v30 = v29;
  objc_msgSend_ascender(self->_font, v31, v32);
  v34 = v33;
  objc_msgSend_descender(self->_font, v35, v36);
  v38 = v30 - (v34 - v37);
  objc_msgSend_ascender(self->_font, v39, v40);
  v42 = v41;
  objc_msgSend_capHeight(self->_font, v43, v44);
  *(float *)&v45 = v38 + v42 - v45;
  *(float *)&v38 = v26 - floorf(*(float *)&v45);
  objc_msgSend_bounds(self, v46, v47);
  v49 = (v48 - self->_textSize.width) * 0.5;
  v50 = roundf(v49);
  font = self->_font;
  v52 = *MEMORY[0x24BDF6600];
  v62[0] = *MEMORY[0x24BDF65F8];
  v62[1] = v52;
  v63[0] = font;
  v63[1] = objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v53, v54);
  v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)v63, v62, 2);
  objc_msgSend_drawAtPoint_withAttributes_(v21, v57, v56, v50, *(float *)&v38);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (ImageFromCurrentImageContext)
  {
    v60 = (CGImage *)objc_msgSend_CGImage(ImageFromCurrentImageContext, v58, v59);
    ImageFromCurrentImageContext = (UIImage *)v60;
    if (v60)
      CGImageRetain(v60);
  }
  return (CGImage *)ImageFromCurrentImageContext;
}

- (int64_t)count
{
  return self->_count;
}

@end
