@implementation WKTextRange

- (BOOL)_isRanged
{
  return !-[WKTextRange isEmpty](self, "isEmpty");
}

+ (id)textRangeWithState:(BOOL)a3 isRange:(BOOL)a4 isEditable:(BOOL)a5 startRect:(CGRect)a6 endRect:(CGRect)a7 selectionRects:(id)a8 selectedTextLength:(unint64_t)a9
{
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  _BOOL8 v21;
  WKTextRange *v22;

  v11 = a5;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a6.size.height;
  v17 = a6.size.width;
  v18 = a6.origin.y;
  v19 = a6.origin.x;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(WKTextRange);
  -[WKTextRange setIsNone:](v22, "setIsNone:", v21);
  -[WKTextRange setIsRange:](v22, "setIsRange:", v20);
  -[WKTextRange setIsEditable:](v22, "setIsEditable:", v11);
  -[WKTextRange setStartRect:](v22, "setStartRect:", v19, v18, v17, v16);
  -[WKTextRange setEndRect:](v22, "setEndRect:", x, y, width, height);
  -[WKTextRange setSelectedTextLength:](v22, "setSelectedTextLength:", a9);
  -[WKTextRange setSelectionRects:](v22, "setSelectionRects:", a8);
  return (id)(id)CFMakeCollectable(v22);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKTextRange;
  -[WKTextRange dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  CGRect v7;
  CGRect v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WKTextRange startRect](self, "startRect");
  v5 = NSStringFromCGRect(v7);
  -[WKTextRange endRect](self, "endRect");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p) - start:%@, end:%@"), v4, self, v5, NSStringFromCGRect(v8));
}

- (id)start
{
  WKTextPosition *v3;
  uint64_t v4;

  -[WKTextRange startRect](self, "startRect");
  v3 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:");
  if (-[WKTextRange isEmpty](self, "isEmpty"))
    v4 = 3;
  else
    v4 = 1;
  -[WKTextPosition setAnchors:](v3, "setAnchors:", v4);
  return v3;
}

- (id)end
{
  WKTextPosition *v3;

  -[WKTextRange endRect](self, "endRect");
  v3 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:");
  -[WKTextPosition setAnchors:](v3, "setAnchors:", -[WKTextRange isEmpty](self, "isEmpty") | 2);
  return v3;
}

- (BOOL)isEmpty
{
  return !-[WKTextRange isRange](self, "isRange");
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  v5 = -[WKTextRange isRange](self, "isRange");
  v6 = objc_msgSend(a3, "isRange");
  if (!v5)
  {
    if ((v6 & 1) == 0)
    {
      -[WKTextRange startRect](self, "startRect");
      v20 = v31;
      v22 = v32;
      v24 = v33;
      v26 = v34;
      objc_msgSend(a3, "startRect");
      goto LABEL_12;
    }
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (v6)
  {
    -[WKTextRange startRect](self, "startRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(a3, "startRect");
    v38.origin.x = v15;
    v38.origin.y = v16;
    v38.size.width = v17;
    v38.size.height = v18;
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    v6 = CGRectEqualToRect(v36, v38);
    if (v6)
    {
      -[WKTextRange endRect](self, "endRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(a3, "endRect");
LABEL_12:
      v39.origin.x = v27;
      v39.origin.y = v28;
      v39.size.width = v29;
      v39.size.height = v30;
      v37.origin.x = v20;
      v37.origin.y = v22;
      v37.size.width = v24;
      v37.size.height = v26;
      LOBYTE(v6) = CGRectEqualToRect(v37, v39);
    }
  }
  return v6;
}

- (CGRect)startRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startRect.origin.x;
  y = self->_startRect.origin.y;
  width = self->_startRect.size.width;
  height = self->_startRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartRect:(CGRect)a3
{
  self->_startRect = a3;
}

- (CGRect)endRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endRect.origin.x;
  y = self->_endRect.origin.y;
  width = self->_endRect.size.width;
  height = self->_endRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEndRect:(CGRect)a3
{
  self->_endRect = a3;
}

- (BOOL)isNone
{
  return self->_isNone;
}

- (void)setIsNone:(BOOL)a3
{
  self->_isNone = a3;
}

- (BOOL)isRange
{
  return self->_isRange;
}

- (void)setIsRange:(BOOL)a3
{
  self->_isRange = a3;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (unint64_t)selectedTextLength
{
  return self->_selectedTextLength;
}

- (void)setSelectedTextLength:(unint64_t)a3
{
  self->_selectedTextLength = a3;
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (void)setSelectionRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
