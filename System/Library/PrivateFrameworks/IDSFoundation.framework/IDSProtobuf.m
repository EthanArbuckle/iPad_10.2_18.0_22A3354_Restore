@implementation IDSProtobuf

+ (id)keyRepresentationForType:(unsigned __int16)a3 isResponse:(BOOL)a4
{
  double v4;
  int v5;

  if (a4)
    v5 = 0x10000;
  else
    v5 = 0;
  return (id)objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, v5 | a3, v4);
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  double v9;
  unsigned int isResponse;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_type(self, a2, v2, v3);
  isResponse = objc_msgSend_isResponse(self, v7, v8, v9);
  objc_msgSend_data(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v14, v15, v16, v17);
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("IDSProtobuf %p type %d isResponse %d data length %lu"), v20, self, v6, isResponse, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (IDSProtobuf)initWithProtobufData:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  IDSProtobuf *v9;
  IDSProtobuf *v10;
  CFMutableDictionaryRef *v11;
  id v12;
  const char *v13;
  double v14;
  uint64_t v15;
  CFMutableDictionaryRef v16;
  id v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  objc_super v25;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IDSProtobuf;
  v9 = -[IDSProtobuf init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_sync_enter(v11);
    v12 = objc_alloc(MEMORY[0x1E0C99E08]);
    v15 = objc_msgSend_initWithCapacity_(v12, v13, 3, v14);
    v16 = v11[1];
    v11[1] = (CFMutableDictionaryRef)v15;

    v17 = v8;
    if (v17)
      CFDictionarySetValue(v11[1], CFSTR("IDSProtoBufDataKey"), v17);

    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v18, v6, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(v11[1], CFSTR("IDSProtoBufTypeKey"), v20);

    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v21, v5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      CFDictionarySetValue(v11[1], CFSTR("IDSProtoBufIsResponseKey"), v23);

    objc_sync_exit(v11);
  }

  return v10;
}

- (IDSProtobuf)initWithDictionary:(id)a3
{
  id v4;
  IDSProtobuf *v5;
  IDSProtobuf *v6;
  IDSProtobuf *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  NSMutableDictionary *protoBufParams;
  IDSProtobuf *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSProtobuf;
    v5 = -[IDSProtobuf init](&v15, sel_init);
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      objc_sync_enter(v7);
      v11 = objc_msgSend_mutableCopy(v4, v8, v9, v10);
      protoBufParams = v7->_protoBufParams;
      v7->_protoBufParams = (NSMutableDictionary *)v11;

      objc_sync_exit(v7);
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (IDSProtobuf)init
{
  IDSProtobuf *v2;
  IDSProtobuf *v3;
  IDSProtobuf *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *protoBufParams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSProtobuf;
  v2 = -[IDSProtobuf init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    objc_sync_enter(v4);
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    protoBufParams = v4->_protoBufParams;
    v4->_protoBufParams = v5;

    objc_sync_exit(v4);
  }
  return v3;
}

- (void)dealloc
{
  IDSProtobuf *v2;
  objc_super v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)IDSProtobuf;
  -[IDSProtobuf dealloc](&v3, sel_dealloc);
}

- (id)dictionaryRepresentation
{
  IDSProtobuf *v2;
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_mutableCopy(v2->_protoBufParams, v3, v4, v5);
  objc_msgSend_removeObjectForKey_(v6, v7, (uint64_t)CFSTR("IDSProtoBufMessageContextKey"), v8);
  objc_sync_exit(v2);

  return v6;
}

- (id)dictionaryRepresentationWithUncompressedData
{
  IDSProtobuf *v2;
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_mutableCopy(v2->_protoBufParams, v3, v4, v5);
  objc_msgSend_removeObjectForKey_(v6, v7, (uint64_t)CFSTR("IDSProtoBufMessageContextKey"), v8);
  objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v2->_uncompressedData, v10, CFSTR("IDSProtoBufDataKey"));
  objc_sync_exit(v2);

  return v6;
}

- (void)setData:(id)a3
{
  IDSProtobuf *v4;
  const char *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_setObject_forKey_(v4->_protoBufParams, v5, (uint64_t)v7, v6, CFSTR("IDSProtoBufDataKey"));
  objc_sync_exit(v4);

}

- (NSData)data
{
  IDSProtobuf *v2;
  const char *v3;
  double v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_objectForKey_(v2->_protoBufParams, v3, (uint64_t)CFSTR("IDSProtoBufDataKey"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSData *)v5;
}

- (void)setType:(unsigned __int16)a3
{
  uint64_t v3;
  NSMutableDictionary *protoBufParams;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  IDSProtobuf *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  protoBufParams = obj->_protoBufParams;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(protoBufParams, v8, (uint64_t)v7, v9, CFSTR("IDSProtoBufTypeKey"));

  objc_sync_exit(obj);
}

- (unsigned)type
{
  IDSProtobuf *v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  unsigned __int16 v9;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_objectForKey_(v2->_protoBufParams, v3, (uint64_t)CFSTR("IDSProtoBufTypeKey"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8);

  objc_sync_exit(v2);
  return v9;
}

- (void)setIsResponse:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *protoBufParams;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  IDSProtobuf *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  protoBufParams = obj->_protoBufParams;
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(protoBufParams, v8, (uint64_t)v7, v9, CFSTR("IDSProtoBufIsResponseKey"));

  objc_sync_exit(obj);
}

- (BOOL)isResponse
{
  IDSProtobuf *v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  char v9;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_objectForKey_(v2->_protoBufParams, v3, (uint64_t)CFSTR("IDSProtoBufIsResponseKey"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v5, v6, v7, v8);

  objc_sync_exit(v2);
  return v9;
}

- (IDSMessageContext)context
{
  IDSProtobuf *v2;
  const char *v3;
  double v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_objectForKey_(v2->_protoBufParams, v3, (uint64_t)CFSTR("IDSProtoBufMessageContextKey"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (IDSMessageContext *)v5;
}

- (void)setContext:(id)a3
{
  IDSProtobuf *v4;
  double v5;
  NSMutableDictionary *protoBufParams;
  char *v7;

  v7 = (char *)a3;
  v4 = self;
  objc_sync_enter(v4);
  protoBufParams = v4->_protoBufParams;
  if (v7)
    objc_msgSend_setObject_forKey_(protoBufParams, v7, (uint64_t)v7, v5, CFSTR("IDSProtoBufMessageContextKey"));
  else
    objc_msgSend_removeObjectForKey_(protoBufParams, 0, (uint64_t)CFSTR("IDSProtoBufMessageContextKey"), v5);
  objc_sync_exit(v4);

}

- (void)encodeWithCoder:(id)a3
{
  IDSProtobuf *v4;
  const char *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)v4->_protoBufParams, v6, CFSTR("protobufparams"));
  objc_sync_exit(v4);

}

- (IDSProtobuf)initWithCoder:(id)a3
{
  id v4;
  IDSProtobuf *v5;
  IDSProtobuf *v6;
  IDSProtobuf *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  NSMutableDictionary *protoBufParams;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSProtobuf;
  v5 = -[IDSProtobuf init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    objc_msgSend_decodeObjectForKey_(v4, v8, (uint64_t)CFSTR("protobufparams"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    protoBufParams = v7->_protoBufParams;
    v7->_protoBufParams = (NSMutableDictionary *)v10;

    objc_sync_exit(v7);
  }

  return v6;
}

- (NSData)uncompressedData
{
  return self->_uncompressedData;
}

- (void)setUncompressedData:(id)a3
{
  objc_storeStrong((id *)&self->_uncompressedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedData, 0);
  objc_storeStrong((id *)&self->_protoBufParams, 0);
}

@end
