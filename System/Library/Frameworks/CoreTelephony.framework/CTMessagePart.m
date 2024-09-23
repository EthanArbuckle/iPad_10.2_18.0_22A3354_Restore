@implementation CTMessagePart

- (CTMessagePart)initWithData:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  CTMessagePart *v8;
  uint64_t v9;
  NSString *contentType;
  NSMutableDictionary *v11;
  NSMutableDictionary *contentTypeParams;
  uint64_t v13;
  NSData *data;
  NSString *contentId;
  NSString *contentLocation;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CTMessagePart;
  v8 = -[CTMessagePart init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    contentType = v8->_contentType;
    v8->_contentType = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentTypeParams = v8->_contentTypeParams;
    v8->_contentTypeParams = v11;

    v13 = objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v13;

    contentId = v8->_contentId;
    v8->_contentId = 0;

    contentLocation = v8->_contentLocation;
    v8->_contentLocation = 0;

  }
  return v8;
}

- (id)contentTypeParameterWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contentTypeParams, "objectForKey:", a3);
}

- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_contentTypeParams, "setObject:forKey:", a4, a3);
}

- (id)allContentTypeParameterNames
{
  return (id)-[NSMutableDictionary allKeys](self->_contentTypeParams, "allKeys");
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (void)setContentLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentLocation, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_contentTypeParams, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
