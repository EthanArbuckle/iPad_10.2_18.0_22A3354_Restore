@implementation _MFQLItemDataProvider

- (_MFQLItemDataProvider)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MFQLItemDataProvider *v11;
  uint64_t v12;
  QLItem *item;
  uint64_t v14;
  NSData *data;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MFQLItemDataProvider;
  v11 = -[_MFQLItemDataProvider init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc((Class)getQLItemClass[0]()), "initWithDataProvider:contentType:previewTitle:", v11, v9, v10);
    item = v11->_item;
    v11->_item = (QLItem *)v12;

    v14 = objc_msgSend(v8, "copy");
    data = v11->_data;
    v11->_data = (NSData *)v14;

  }
  return v11;
}

- (id)provideDataForItem:(id)a3
{
  return self->_data;
}

- (QLItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
