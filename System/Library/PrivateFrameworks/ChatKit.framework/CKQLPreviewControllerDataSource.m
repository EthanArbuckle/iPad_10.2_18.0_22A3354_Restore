@implementation CKQLPreviewControllerDataSource

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[CKQLPreviewControllerDataSource previewItems](self, "previewItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[CKQLPreviewControllerDataSource previewItems](self, "previewItems", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= a4)
  {
    -[CKQLPreviewControllerDataSource previewItems](self, "previewItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setPreviewItems:(id)a3
{
  id v4;
  NSArray **p_previewItems;
  NSArray *previewItems;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  previewItems = self->_previewItems;
  p_previewItems = &self->_previewItems;
  v9 = v4;
  if (-[NSArray isEqualToArray:](previewItems, "isEqualToArray:"))
  {
    v7 = v9;
  }
  else
  {
    v8 = (void *)objc_msgSend(v9, "copy");

    objc_storeStrong((id *)p_previewItems, v8);
    v7 = v8;
  }

}

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItems, 0);
}

@end
