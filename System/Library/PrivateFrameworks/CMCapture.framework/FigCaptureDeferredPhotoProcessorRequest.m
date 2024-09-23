@implementation FigCaptureDeferredPhotoProcessorRequest

- (FigCaptureDeferredPhotoProcessorRequest)initWithApplicationID:(id)a3 captureRequstIdentifier:(id)a4 photoIdentifier:(id)a5 clientPID:(int)a6 message:(id)a7 qosClass:(unsigned int)a8 parent:(id)a9
{
  FigCaptureDeferredPhotoProcessorRequest *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FigCaptureDeferredPhotoProcessorRequest;
  v14 = -[FigCaptureDeferredPhotoProcessorRequest init](&v16, sel_init);
  if (v14)
  {
    v14->_applicationID = (NSString *)objc_msgSend(a3, "copy");
    v14->_captureRequestIdentifier = (NSString *)objc_msgSend(a4, "copy");
    v14->_photoIdentifier = (NSString *)objc_msgSend(a5, "copy");
    v14->_clientPID = a6;
    v14->_parent = (FigCaptureDeferredPhotoProcessorRequest *)a9;
    v14->_message = (OS_xpc_object *)FigXPCRetain();
    v14->_qosClass = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  FigXPCRelease();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredPhotoProcessorRequest;
  -[FigCaptureDeferredPhotoProcessorRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int clientPID;
  FigCaptureDeferredPhotoProcessorRequest *parent;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v5 = -[NSString isEqual:](self->_applicationID, "isEqual:", objc_msgSend(a3, "applicationID"));
  if (!v5)
    return v5;
  v5 = -[NSString isEqual:](self->_captureRequestIdentifier, "isEqual:", objc_msgSend(a3, "captureRequestIdentifier"));
  if (!v5)
    return v5;
  v5 = -[NSString isEqual:](self->_photoIdentifier, "isEqual:", objc_msgSend(a3, "photoIdentifier"));
  if (!v5)
    return v5;
  clientPID = self->_clientPID;
  if (clientPID != objc_msgSend(a3, "clientPID"))
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  parent = self->_parent;
  if (parent == (FigCaptureDeferredPhotoProcessorRequest *)objc_msgSend(a3, "parent")
    || (v5 = -[FigCaptureDeferredPhotoProcessorRequest isEqual:](self->_parent, "isEqual:", objc_msgSend(a3, "parent"))) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_applicationID, "hash");
  v4 = -[NSString hash](self->_captureRequestIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_photoIdentifier, "hash") ^ self->_clientPID;
}

- (id)description
{
  FigCaptureDeferredPhotoProcessorRequest *parent;
  const __CFString *v4;
  void *v5;
  uint64_t v6;

  parent = self->_parent;
  if (parent)
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", parent: %@"), -[FigCaptureDeferredPhotoProcessorRequest description](parent, "description"));
  else
    v4 = &stru_1E4928818;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>: applicationID: %@, captureRequestIdentifier: %@, photoIdentifier: %@ clientPID: %d %@%@"), v6, self, self->_applicationID, self->_captureRequestIdentifier, self->_photoIdentifier, self->_clientPID, FigCaptureQOSClassToString(self->_qosClass), v4);
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (int)clientPID
{
  return self->_clientPID;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (FigCaptureDeferredPhotoProcessorRequest)parent
{
  return self->_parent;
}

- (BWDeferredProcessingContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
