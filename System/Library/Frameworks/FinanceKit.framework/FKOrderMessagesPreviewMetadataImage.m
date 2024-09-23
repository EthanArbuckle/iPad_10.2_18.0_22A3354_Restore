@implementation FKOrderMessagesPreviewMetadataImage

- (id)_initWithImage:(id)a3
{
  id v4;
  FKOrderMessagesPreviewMetadataImage *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKOrderMessagesPreviewMetadataImage;
  v5 = -[FKOrderMessagesPreviewMetadataImage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_kind = objc_msgSend(v4, "kind");
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
