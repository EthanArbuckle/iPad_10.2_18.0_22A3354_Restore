@implementation PDFPageRange

- (PDFPageRange)initWithPage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  PDFPageRange *v8;
  PDFPageRangePrivate *v9;
  PDFPageRangePrivate *v10;
  PDFPageRangePrivate *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDFPageRange;
  v8 = -[PDFPageRange init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(PDFPageRangePrivate);
    v10 = v8->_private;
    v8->_private = v9;

    objc_storeWeak((id *)&v8->_private->page, v7);
    v11 = v8->_private;
    v11->range.location = location;
    v11->range.length = length;
  }

  return v8;
}

- (id)page
{
  return objc_loadWeakRetained((id *)&self->_private->page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_private->page, a3);
}

- (_NSRange)range
{
  PDFPageRangePrivate *v2;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  v2 = self->_private;
  location = v2->range.location;
  length = v2->range.length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_private->range = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPageRange page](self, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v8 = objc_msgSend(v4, "range");
    v10 = v9;
    v7 = v8 == -[PDFPageRange range](self, "range") && v10 == v11;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Page index = %ld Range = (%ld, %ld]\n"), objc_msgSend(v5, "indexForPage:", WeakRetained), self->_private->range.location, self->_private->range.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
