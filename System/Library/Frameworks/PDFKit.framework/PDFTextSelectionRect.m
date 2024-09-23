@implementation PDFTextSelectionRect

- (PDFTextSelectionRect)initWithRect:(CGRect)a3 onPage:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  PDFTextSelectionRect *v11;
  PDFTextSelectionRect *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDFTextSelectionRect;
  v11 = -[PDFTextSelectionRect init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_rect.origin.x = x;
    v11->_rect.origin.y = y;
    v11->_rect.size.width = width;
    v11->_rect.size.height = height;
    objc_storeStrong((id *)&v11->_page, a4);
  }

  return v12;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)writingDirection
{
  return -1;
}

- (BOOL)containsStart
{
  return self->_isStartingRect;
}

- (BOOL)containsEnd
{
  return self->_isEndingRect;
}

- (BOOL)isVertical
{
  return 0;
}

- (void)setIsStartingRect:(BOOL)a3
{
  self->_isStartingRect = a3;
}

- (void)setIsEndingRect:(BOOL)a3
{
  self->_isEndingRect = a3;
}

- (id)description
{
  PDFPage *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;

  v3 = self->_page;
  -[PDFPage document](v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexForPage:", v3);

  v6 = "Yes";
  if (self->_isStartingRect)
    v7 = "Yes";
  else
    v7 = "No";
  if (!self->_isEndingRect)
    v6 = "No";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Page index %d, rect {(%.2f, %.2f),(%.2f, %.2f) }, is start? %s, is end? %s"), v5, *(_OWORD *)&self->_rect.origin, *(_QWORD *)&self->_rect.size.width, *(_QWORD *)&self->_rect.size.height, v7, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
}

@end
