@implementation AVAssetResourceLoaderRemoteHandlerContext

- (AVAssetResourceLoaderRemoteHandlerContext)initWithEndpoint:(id)a3 customURLHandlerObjectID:(unint64_t)a4 authHandlerObjectID:(unint64_t)a5 contentKeySessionHandlerObjectID:(unint64_t)a6
{
  AVAssetResourceLoaderRemoteHandlerContext *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  v9 = -[AVAssetResourceLoaderRemoteHandlerContext init](&v11, sel_init);
  if (v9)
  {
    v9->_endpoint = (OS_xpc_object *)FigXPCRetain();
    v9->_customURLHandlerObjectID = a4;
    v9->_authHandlerObjectID = a5;
    v9->_contentKeySessionHandlerObjectID = a6;
  }
  return v9;
}

- (AVAssetResourceLoaderRemoteHandlerContext)initWithCoder:(id)a3
{
  AVAssetResourceLoaderRemoteHandlerContext *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  objc_super v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = (objc_class *)objc_opt_class();
    v17 = CFSTR("can be decoded only by a NSXPCCoder");
    goto LABEL_8;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  v6 = -[AVAssetResourceLoaderRemoteHandlerContext init](&v19, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "decodeXPCObjectForKey:", CFSTR("endpoint"));
    if (v7)
    {
      -[AVAssetResourceLoaderRemoteHandlerContext initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:](v6, "initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:", v7, objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("customURLHandlerObjectID")), objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("authHandlerObjectID")), objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("contentKeySessionHandlerObjectID")));
      return v6;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = (objc_class *)objc_opt_class();
    v17 = CFSTR("NSXPCCoder returned NULL endpoint");
LABEL_8:
    v18 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithClassAndSelector(v11, a2, (uint64_t)v17, v12, v13, v14, v15, v16, (uint64_t)v19.receiver), 0);
    objc_exception_throw(v18);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  FigXPCRelease();
  v3.receiver = self;
  v3.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  -[AVAssetResourceLoaderRemoteHandlerContext dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("can be encoded only by a NSXPCCoder"), v9, v10, v11, v12, v13, v15), 0);
    objc_exception_throw(v14);
  }
  objc_msgSend(a3, "encodeXPCObject:forKey:", self->_endpoint, CFSTR("endpoint"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_customURLHandlerObjectID, CFSTR("customURLHandlerObjectID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_authHandlerObjectID, CFSTR("authHandlerObjectID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_contentKeySessionHandlerObjectID, CFSTR("contentKeySessionHandlerObjectID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (unint64_t)customURLHandlerObjectID
{
  return self->_customURLHandlerObjectID;
}

- (unint64_t)authHandlerObjectID
{
  return self->_authHandlerObjectID;
}

- (unint64_t)contentKeySessionHandlerObjectID
{
  return self->_contentKeySessionHandlerObjectID;
}

@end
