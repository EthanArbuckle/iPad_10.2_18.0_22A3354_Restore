@implementation HKAttachmentBuilder

- (HKAttachmentBuilder)initWithAttachmentStore:(id)a3
{
  id v5;
  HKAttachmentBuilder *v6;
  HKAttachmentBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKAttachmentBuilder;
  v6 = -[HKAttachmentBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attachmentStore, a3);

  return v7;
}

- (void)finishWithCompletion:(id)a3
{
  UTType *contentType;
  HKAttachmentStore *attachmentStore;
  NSString *name;
  NSString *objectIdentifier;
  NSString *schemaIdentifier;
  NSDictionary *attachmentMetadata;
  NSDictionary *referenceMetadata;
  NSURL *v11;
  UTType *v12;
  NSString *v13;

  contentType = self->_contentType;
  attachmentStore = self->_attachmentStore;
  name = self->_name;
  objectIdentifier = self->_objectIdentifier;
  schemaIdentifier = self->_schemaIdentifier;
  attachmentMetadata = self->_attachmentMetadata;
  referenceMetadata = self->_referenceMetadata;
  v11 = self->_fileURL;
  v12 = contentType;
  v13 = name;
  -[HKAttachmentStore addAttachmentWithName:contentType:URL:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:](attachmentStore, "addAttachmentWithName:contentType:URL:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:", v13, v12, v11, objectIdentifier, schemaIdentifier, attachmentMetadata, referenceMetadata, a3);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)attachmentMetadata
{
  return self->_attachmentMetadata;
}

- (void)setAttachmentMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)referenceMetadata
{
  return self->_referenceMetadata;
}

- (void)setReferenceMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceMetadata, 0);
  objc_storeStrong((id *)&self->_attachmentMetadata, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attachmentStore, 0);
}

@end
