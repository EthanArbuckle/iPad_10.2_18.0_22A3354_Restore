@implementation SSSPDFPageUndoObject

+ (id)newPageUndoObjectWithPDFPage:(id)a3 index:(int64_t)a4 modificationInfo:(id)a5
{
  id v7;
  id v8;
  SSSPDFPageUndoObject *v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(SSSPDFPageUndoObject);
  -[SSSPDFPageUndoObject setPage:](v9, "setPage:", v8);

  -[SSSPDFPageUndoObject setIndex:](v9, "setIndex:", a4);
  -[SSSPDFPageUndoObject setModificationInfo:](v9, "setModificationInfo:", v7);

  return v9;
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (SSSScreenshotModificationInfo)modificationInfo
{
  return self->_modificationInfo;
}

- (void)setModificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_modificationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationInfo, 0);
  objc_storeStrong((id *)&self->_page, 0);
}

@end
