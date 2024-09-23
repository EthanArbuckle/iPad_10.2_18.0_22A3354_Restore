@implementation CKSearchActivityItemProvider

- (CKSearchActivityItemProvider)initWithPlaceholderItem:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  CKSearchActivityItemProvider *v8;
  CKSearchActivityItemProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKSearchActivityItemProvider;
  v8 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_, v6);
  v9 = v8;
  if (v8)
  {
    -[CKSearchActivityItemProvider setPayload:](v8, "setPayload:", v6);
    -[CKSearchActivityItemProvider setMetadata:](v9, "setMetadata:", v7);
  }

  return v9;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong(&self->_payload, a3);
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_payload, 0);
}

@end
