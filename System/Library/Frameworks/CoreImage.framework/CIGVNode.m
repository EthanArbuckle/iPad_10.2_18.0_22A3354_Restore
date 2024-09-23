@implementation CIGVNode

+ (__CFDictionary)textAttributesForTitle
{
  if (textAttributesForTitle_onceToken != -1)
    dispatch_once(&textAttributesForTitle_onceToken, &__block_literal_global_32);
  return (__CFDictionary *)textAttributesForTitle_attributes;
}

void __34__CIGVNode_textAttributesForTitle__block_invoke()
{
  CTFontRef UIFontForLanguage;
  CTParagraphStyleRef v1;
  uint64_t v2;
  char v3;
  _QWORD v4[2];
  _QWORD v5[2];
  CTParagraphStyleSetting settings;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontUserFixedPitch, 12.0, 0);
  v3 = 2;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v3;
  v1 = CTParagraphStyleCreate(&settings, 1uLL);
  v2 = *MEMORY[0x1E0CA85A0];
  v4[0] = *MEMORY[0x1E0CA8188];
  v4[1] = v2;
  v5[0] = UIFontForLanguage;
  v5[1] = v1;
  textAttributesForTitle_attributes = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  CFRetain((CFTypeRef)textAttributesForTitle_attributes);
  CFRelease(v1);
  CFRelease(UIFontForLanguage);
}

+ (__CFDictionary)textAttributesForLabel
{
  if (textAttributesForLabel_onceToken != -1)
    dispatch_once(&textAttributesForLabel_onceToken, &__block_literal_global_1);
  return (__CFDictionary *)textAttributesForLabel_attributes;
}

void __34__CIGVNode_textAttributesForLabel__block_invoke()
{
  CTFontRef UIFontForLanguage;
  CTParagraphStyleRef v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];
  _QWORD v5[2];
  CTParagraphStyleSetting settings;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontUserFixedPitch, 12.0, 0);
  v3 = 0x3FF4000000000000;
  settings.spec = kCTParagraphStyleSpecifierLineHeightMultiple;
  settings.valueSize = 8;
  settings.value = &v3;
  v1 = CTParagraphStyleCreate(&settings, 1uLL);
  v2 = *MEMORY[0x1E0CA85A0];
  v4[0] = *MEMORY[0x1E0CA8188];
  v4[1] = v2;
  v5[0] = UIFontForLanguage;
  v5[1] = v1;
  textAttributesForLabel_attributes = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  CFRetain((CFTypeRef)textAttributesForLabel_attributes);
  CFRelease(v1);
  CFRelease(UIFontForLanguage);
}

- (CIGVNode)init
{
  CIGVNode *v2;
  CIGVNode *v3;
  CGSize v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIGVNode;
  v2 = -[GVNode init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->color = 0;
    v2->shape = 0;
    v2->images = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3->rois = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->extent.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->extent.size = v4;
  }
  return v3;
}

- (CIGVNode)initWithCINode:(void *)a3 extent:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CIGVNode *v8;
  CIGVNode *v9;
  CGRect *p_extent;
  CGSize v11;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = -[CIGVNode init](self, "init", a3);
  v9 = v8;
  if (v8)
  {
    p_extent = &v8->extent;
    v13 = *(CGAffineTransform *)contentScale;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v15 = CGRectApplyAffineTransform(v14, &v13);
    *p_extent = v15;
    if (CGRectIsInfinite(v15))
    {
      v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      p_extent->origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v9->extent.size = v11;
    }
  }
  return v9;
}

- (void)dealloc
{
  __CFString *title;
  __CFString *label;
  objc_super v5;

  title = self->title;
  if (title)
    CFRelease(title);
  label = self->label;
  if (label)
    CFRelease(label);
  v5.receiver = self;
  v5.super_class = (Class)CIGVNode;
  -[GVNode dealloc](&v5, sel_dealloc);
}

- (CGRect)extent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->extent.origin.x;
  y = self->extent.origin.y;
  width = self->extent.size.width;
  height = self->extent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (__CFArray)images
{
  return (__CFArray *)self->images;
}

- (__CFArray)rois
{
  return (__CFArray *)self->rois;
}

- (void)setShape:(int)a3
{
  self->shape = a3;
  -[CIGVNode updateSize](self, "updateSize");
}

- (void)setColor:(int)a3
{
  self->color = a3;
}

- (void)setTitle:(__CFString *)a3
{
  __CFString *title;
  __CFString *v6;
  CGFloat v7;

  title = self->title;
  if (title)
    CFRelease(title);
  v6 = (__CFString *)CFRetain(a3);
  self->title = v6;
  self->titleSize.width = sizeForStringWithAttributes(v6, +[CIGVNode textAttributesForTitle](CIGVNode, "textAttributesForTitle"));
  self->titleSize.height = v7;
  -[CIGVNode updateBadgeSize](self, "updateBadgeSize");
}

- (void)setLabel:(__CFString *)a3
{
  __CFString *label;
  __CFString *v6;
  CGFloat v7;

  label = self->label;
  if (label)
    CFRelease(label);
  v6 = (__CFString *)CFRetain(a3);
  self->label = v6;
  self->labelSize.width = sizeForStringWithAttributes(v6, +[CIGVNode textAttributesForLabel](CIGVNode, "textAttributesForLabel"));
  self->labelSize.height = v7;
  -[CIGVNode updateContentSize](self, "updateContentSize");
}

- (void)addImage:(CGImage *)a3
{
  NSMutableArray *images;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  CGImage *v11;
  double v12;
  size_t Height;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableArray addObject:](self->images, "addObject:");
    images = self->images;
    v6 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(images);
          v11 = *(CGImage **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = (double)CGImageGetWidth(v11) * 0.5;
          Height = CGImageGetHeight(v11);
          v6 = v6 + v12;
          if (v5 <= (double)Height * 0.5)
            v5 = (double)Height * 0.5;
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    self->imagesSize.width = v6 + (double)(unint64_t)(-[NSMutableArray count](images, "count") - 1) * 5.0;
    self->imagesSize.height = v5;
    -[CIGVNode updateContentSize](self, "updateContentSize");
  }
}

- (void)addRoi:(CGRect)a3
{
  NSMutableArray *rois;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21 = *MEMORY[0x1E0C80C00];
  v20 = *(CGAffineTransform *)contentScale;
  v22 = CGRectApplyAffineTransform(a3, &v20);
  -[NSMutableArray addObject:](self->rois, "addObject:", valueWithRect(v22.origin.x, v22.origin.y, v22.size.width, v22.size.height));
  rois = self->rois;
  x = self->extent.origin.x;
  y = self->extent.origin.y;
  width = self->extent.size.width;
  height = self->extent.size.height;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rois, "countByEnumeratingWithState:objects:count:", &v16, &v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(rois);
        v25.origin.x = rectFromValue(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v25.origin.y = v13;
        v25.size.width = v14;
        v25.size.height = v15;
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v24 = CGRectUnion(v23, v25);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
        height = v24.size.height;
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rois, "countByEnumeratingWithState:objects:count:", &v16, &v20, 16);
    }
    while (v10);
  }
  self->roisSize.width = width;
  self->roisSize.height = height;
  -[CIGVNode updateContentSize](self, "updateContentSize");
}

- (CGRect)titleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double width;
  double height;
  double v13;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = (v3 - self->titleSize.width) * 0.5;
  v6 = v5 - self->badgeSize.height + (self->badgeSize.height - self->titleSize.height) * 0.5;
  -[GVNode origin](self, "origin");
  v8 = v4 + v7;
  -[GVNode origin](self, "origin");
  v10 = v9 + v6;
  width = self->titleSize.width;
  height = self->titleSize.height;
  v13 = v8;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v10;
  result.origin.x = v13;
  return result;
}

- (CGRect)badgeFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double width;
  double height;
  double v13;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = (v3 - self->badgeSize.width) * 0.5;
  v6 = v5 - self->badgeSize.height;
  -[GVNode origin](self, "origin");
  v8 = v4 + v7;
  -[GVNode origin](self, "origin");
  v10 = v6 + v9;
  width = self->badgeSize.width;
  height = self->badgeSize.height;
  v13 = v8;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v10;
  result.origin.x = v13;
  return result;
}

- (CGSize)contentInsertSize
{
  unsigned int shape;
  double v3;
  double width;
  double v5;
  CGSize result;

  shape = self->shape;
  v3 = 4.0;
  if (shape >= 3)
  {
    if (shape != 3)
      -[CIGVNode contentInsertSize].cold.1();
    width = self->contentSize.width;
    if (width >= self->contentSize.height)
      width = self->contentSize.height;
    v3 = width * 0.1 + 4.0;
  }
  v5 = 4.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)contentCornerSize
{
  int shape;
  double v3;
  double v4;
  double width;
  CGSize result;

  shape = self->shape;
  if ((shape - 1) < 2)
  {
    v3 = 8.0;
    v4 = 8.0;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    if (shape)
    {
      if (shape != 3)
        -[CIGVNode contentCornerSize].cold.1();
      width = self->contentSize.width;
      if (width >= self->contentSize.height)
        width = self->contentSize.height;
      v4 = width * 0.1;
      v3 = 4.0;
    }
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGRect)labelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double width;
  double height;
  double v14;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = v3;
  -[CIGVNode contentInsertSize](self, "contentInsertSize");
  v5 = (v4 - self->labelSize.width) * 0.5;
  v7 = v6 + 5.0;
  -[GVNode origin](self, "origin");
  v9 = v8 + v5;
  -[GVNode origin](self, "origin");
  v11 = v7 + v10;
  width = self->labelSize.width;
  height = self->labelSize.height;
  v14 = v9;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v11;
  result.origin.x = v14;
  return result;
}

- (CGRect)imagesFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double width;
  double height;
  double v14;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = v3;
  -[CIGVNode contentInsertSize](self, "contentInsertSize");
  v5 = (v4 - self->imagesSize.width) * 0.5;
  v7 = v6 + self->labelSize.height + 10.0;
  -[GVNode origin](self, "origin");
  v9 = v5 + v8;
  -[GVNode origin](self, "origin");
  v11 = v7 + v10;
  width = self->imagesSize.width;
  height = self->imagesSize.height;
  v14 = v9;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v11;
  result.origin.x = v14;
  return result;
}

- (CGRect)roisFrame
{
  double v3;
  double v4;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double height;
  double v14;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = v3;
  -[CIGVNode contentInsertSize](self, "contentInsertSize");
  width = self->roisSize.width;
  v7 = v6 + self->labelSize.height + 10.0;
  if (-[NSMutableArray count](self->images, "count"))
    v7 = v7 + self->imagesSize.height + 10.0;
  -[GVNode origin](self, "origin");
  v9 = (v4 - width) * 0.5 + v8;
  -[GVNode origin](self, "origin");
  v11 = v7 + v10;
  v12 = self->roisSize.width;
  height = self->roisSize.height;
  v14 = v9;
  result.size.height = height;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v14;
  return result;
}

- (CGRect)contentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[GVNode size](self, "size");
  v4 = v3;
  v6 = v5;
  -[GVNode origin](self, "origin");
  v8 = v7;
  -[GVNode origin](self, "origin");
  v10 = v6 + self->badgeSize.height * -0.5;
  v11 = v8;
  v12 = v4;
  result.size.height = v10;
  result.size.width = v12;
  result.origin.y = v9;
  result.origin.x = v11;
  return result;
}

- (void)updateSize
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  v3 = self->contentSize.width + 10.0;
  v4 = self->contentSize.height + self->badgeSize.height + 10.0;
  -[CIGVNode contentInsertSize](self, "contentInsertSize");
  -[GVNode setSize:](self, "setSize:", v3 + v5 * 2.0, v4 + v6 * 2.0);
}

- (void)updateBadgeSize
{
  self->badgeSize = self->titleSize;
  self->badgeSize = (CGSize)vaddq_f64((float64x2_t)self->badgeSize, (float64x2_t)xmmword_192494B80);
  -[CIGVNode updateSize](self, "updateSize");
}

- (void)updateContentSize
{
  CGSize *p_contentSize;
  double width;
  CGFloat v5;
  double v6;
  CGFloat v7;

  p_contentSize = &self->contentSize;
  self->contentSize = self->labelSize;
  if (-[NSMutableArray count](self->images, "count"))
  {
    width = self->imagesSize.width;
    if (p_contentSize->width > width)
      width = p_contentSize->width;
    v5 = p_contentSize->height + self->imagesSize.height + 10.0;
    p_contentSize->width = width;
    p_contentSize->height = v5;
  }
  if (-[NSMutableArray count](self->rois, "count"))
  {
    v6 = self->roisSize.width;
    if (p_contentSize->width > v6)
      v6 = p_contentSize->width;
    v7 = p_contentSize->height + self->roisSize.height + 10.0;
    p_contentSize->width = v6;
    p_contentSize->height = v7;
  }
  -[CIGVNode updateSize](self, "updateSize");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, label=%@, color=%d shape=%d>"), objc_opt_class(), self, -[CIGVNode label](self, "label"), self->color, self->shape);
}

- (int)color
{
  return self->color;
}

- (int)shape
{
  return self->shape;
}

- (__CFString)title
{
  return self->title;
}

- (__CFString)label
{
  return self->label;
}

- (void)contentInsertSize
{
  __assert_rtn("-[CIGVNode contentInsertSize]", "CIGVNode.m", 319, "0 && \"unreachable\");
}

- (void)contentCornerSize
{
  __assert_rtn("-[CIGVNode contentCornerSize]", "CIGVNode.m", 342, "0 && \"unreachable\");
}

@end
