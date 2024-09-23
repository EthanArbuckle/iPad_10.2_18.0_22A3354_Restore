@implementation PDFTextPosition

- (PDFTextPosition)initWithOffset:(int64_t)a3 onPage:(id)a4
{
  id v6;
  PDFTextPosition *v7;
  PDFTextPosition *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDFTextPosition;
  v7 = -[PDFTextPosition init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_offset = a3;
    objc_storeWeak((id *)&v7->_page, v6);
  }

  return v8;
}

- (int64_t)offset
{
  return self->_offset;
}

- (id)page
{
  return objc_loadWeakRetained((id *)&self->_page);
}

- (id)description
{
  id WeakRetained;
  void *v4;
  int64_t offset;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v4 = (void *)MEMORY[0x24BDD17C8];
  offset = self->_offset;
  objc_msgSend(WeakRetained, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Offset %d on page index %d"), offset, objc_msgSend(v6, "indexForPage:", WeakRetained));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
}

@end
