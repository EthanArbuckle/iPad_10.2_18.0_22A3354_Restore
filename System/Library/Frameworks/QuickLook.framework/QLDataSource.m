@implementation QLDataSource

- (QLDataSource)initWithPreviewItems:(id)a3
{
  id v5;
  QLDataSource *v6;
  QLDataSource *v7;
  QLDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLDataSource;
  v6 = -[QLDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_previewItems, a3);
    v8 = v7;
  }

  return v7;
}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  NSArray *previewItems;
  id v8;
  void *v9;
  void *v10;
  id v11;

  previewItems = self->_previewItems;
  v8 = a4;
  -[NSArray objectAtIndexedSubscript:](previewItems, "objectAtIndexedSubscript:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_previewItems, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a4 + 2))(v8, v11, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItems, 0);
}

@end
