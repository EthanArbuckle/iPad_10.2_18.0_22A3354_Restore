@implementation UnreadBubbleCount

+ (int)initImageCache
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;

  if (qword_2550F4DB0)
    return 0;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  qword_2550F4DB0 = (uint64_t)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v7, (uint64_t)CFSTR("UnreadBubble"), v6);
  if (!qword_2550F4DB0)
    return -6729;
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = objc_opt_class();
  v11 = objc_msgSend_bundleForClass_(v8, v10, v9);
  qword_2550F4DB8 = (uint64_t)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v12, (uint64_t)CFSTR("UnreadBubbleSelected"), v11);
  if (qword_2550F4DB8)
    return 0;
  else
    return -6729;
}

+ (void)deallocImageCache
{

  qword_2550F4DB0 = 0;
  qword_2550F4DB8 = 0;
}

- (UnreadBubbleCount)initWithFrame:(CGRect)a3
{
  const char *v3;
  uint64_t v4;
  UnreadBubbleCount *v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UnreadBubbleCount;
  v5 = -[UnreadBubbleCount initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend_initImageCache(UnreadBubbleCount, v3, v4);
    objc_msgSend_setOpaque_(v5, v6, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UnreadBubbleCount;
  -[UnreadBubbleCount dealloc](&v2, sel_dealloc);
}

- (void)setCount:(int64_t)a3
{
  const char *v4;
  uint64_t v5;

  if (self->_count != a3)
  {
    self->_count = a3;
    objc_msgSend_calculateTextMetrics(self, a2, a3);
    objc_msgSend_setNeedsDisplay(self, v4, v5);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  MEMORY[0x24BEDD108](self, sel_setIsSelected_, a3);
}

- (BOOL)isHighlighted
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    objc_msgSend_setNeedsDisplay(self, a2, a3);
  }
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double MinX;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  float v23;
  const char *v24;
  uint64_t v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)UnreadBubbleCount;
  -[UnreadBubbleCount layoutSubviews](&v26, sel_layoutSubviews);
  objc_msgSend_frame(self, v3, v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend_frame(self, v9, v10);
  MinX = CGRectGetMinX(v27);
  objc_msgSend_frame(self, v12, v13);
  v15 = v14;
  objc_msgSend_frame(self, v16, v17);
  v19 = v18;
  objc_msgSend_bounds(self, v20, v21);
  v23 = (v19 - v22) * 0.5;
  objc_msgSend_setFrame_(self, v24, v25, MinX, v15 + roundf(v23), v6, v8);
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v3;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGColor *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  float v26;
  float v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  double v49;
  float v50;
  double v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  _QWORD v57[2];
  _QWORD v58[3];

  v58[2] = *MEMORY[0x24BDAC8D0];
  if (self->_count >= 1)
  {
    if (self->_isSelected)
    {
      v5 = (void *)objc_msgSend_resizableImageWithCapInsets_((void *)qword_2550F4DB8, a2, v3, 0.0, 9.0, 0.0, 9.0);
      v6 = 0.122;
      v7 = 0.357;
      v8 = 0.906;
    }
    else
    {
      v5 = (void *)objc_msgSend_resizableImageWithCapInsets_((void *)qword_2550F4DB0, a2, v3, 0.0, 9.0, 0.0, 9.0);
      v6 = 1.0;
      v7 = 1.0;
      v8 = 1.0;
    }
    v9 = sub_21A71CA30(v6, v7, v8, 1.0);
    objc_msgSend_frame(self, v10, v11);
    v13 = v12;
    objc_msgSend_frame(self, v14, v15);
    objc_msgSend_drawInRect_(v5, v16, v17, 0.0, 0.0, v13);
    v20 = (void *)objc_msgSend_boldSystemFontOfSize_(MEMORY[0x24BDF6A70], v18, v19, 17.0);
    v22 = (void *)sub_21A690C68(self->_count, v21);
    objc_msgSend_bounds(self, v23, v24);
    v26 = (v25 - self->_textSize.height) * 0.5;
    v27 = floorf(v26);
    objc_msgSend_leading(v20, v28, v29);
    v31 = v30;
    objc_msgSend_ascender(v20, v32, v33);
    v35 = v34;
    objc_msgSend_descender(v20, v36, v37);
    v39 = v31 - (v35 - v38);
    objc_msgSend_ascender(v20, v40, v41);
    v43 = v42;
    objc_msgSend_capHeight(v20, v44, v45);
    *(float *)&v46 = v39 + v43 - v46;
    *(float *)&v39 = v27 - floorf(*(float *)&v46);
    objc_msgSend_bounds(self, v47, v48);
    v50 = (v49 - self->_textSize.width) * 0.5;
    v51 = roundf(v50);
    v58[0] = v20;
    v52 = *MEMORY[0x24BDF6600];
    v57[0] = *MEMORY[0x24BDF65F8];
    v57[1] = v52;
    v58[1] = objc_msgSend_colorWithCGColor_(MEMORY[0x24BDF6950], v53, (uint64_t)v9);
    v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v54, (uint64_t)v58, v57, 2);
    objc_msgSend_drawAtPoint_withAttributes_(v22, v56, v55, v51, *(float *)&v39);
    CGColorRelease(v9);
  }
}

- (void)calculateTextMetrics
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  CGFloat v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  CGFloat v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (self->_count >= 1)
  {
    v4 = (void *)objc_msgSend_boldSystemFontOfSize_(MEMORY[0x24BDF6A70], a2, v2, 17.0);
    v6 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("%u"), self->_count);
    v9 = objc_msgSend_length(v6, v7, v8);
    v23 = *MEMORY[0x24BDF65F8];
    v24[0] = v4;
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v24, &v23, 1);
    objc_msgSend_sizeWithAttributes_(v6, v12, v11);
    v14 = v13;
    objc_msgSend_capHeight(v4, v15, v16);
    self->_textSize.width = v14;
    self->_textSize.height = v19;
    if (v9)
    {
      objc_msgSend_characterAtIndex_(v6, v17, 0);
      objc_msgSend_characterAtIndex_(v6, v20, v9 - 1);
    }
    objc_msgSend_size((void *)qword_2550F4DB0, v17, v18);
  }
  objc_msgSend_frame(self, a2, v2);
  objc_msgSend_setFrame_(self, v21, v22);
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

@end
