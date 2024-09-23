@implementation CNGeminiInteraction

- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5
{
  return -[CNGeminiInteraction initWithTransport:directionality:destinationHandle:destinationContactIdentifier:](self, "initWithTransport:directionality:destinationHandle:destinationContactIdentifier:", a3, a4, a5, 0);
}

- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5 destinationContactIdentifier:(id)a6
{
  id v10;
  id v11;
  CNGeminiInteraction *v12;
  CNGeminiInteraction *v13;
  uint64_t v14;
  NSString *handle;
  uint64_t v16;
  NSString *contactIdentifier;
  CNGeminiInteraction *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNGeminiInteraction;
  v12 = -[CNGeminiInteraction init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_transport = a3;
    v12->_directionality = a4;
    v14 = objc_msgSend(v10, "copy");
    handle = v13->_handle;
    v13->_handle = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (int64_t)transport
{
  return self->_transport;
}

- (int64_t)directionality
{
  return self->_directionality;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
