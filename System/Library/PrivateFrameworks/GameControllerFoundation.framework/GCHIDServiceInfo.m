@implementation GCHIDServiceInfo

- (GCHIDServiceInfo)initWithService:(__IOHIDServiceClient *)a3 queue:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  GCHIDServiceInfo *v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  __IOHIDServiceClient *v12;
  uint64_t v13;
  NSNumber *registryID;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDServiceInfo.m"), 21, CFSTR("Invalid parameter not satisfying: %s"), "service != NULL");

    if (v8)
      goto LABEL_3;
LABEL_5:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDServiceInfo.m"), 22, CFSTR("Invalid parameter not satisfying: %s"), "hidSystemClientQueue != NULL");

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  dispatch_assert_queue_V2(v8);
  v18.receiver = self;
  v18.super_class = (Class)GCHIDServiceInfo;
  v9 = -[GCHIDServiceInfo init](&v18, sel_init);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v8;
  v11 = v8;

  v12 = (__IOHIDServiceClient *)CFRetain(a3);
  v9->_service = v12;
  IOHIDServiceClientGetRegistryID(v12);
  v13 = objc_claimAutoreleasedReturnValue();
  registryID = v9->_registryID;
  v9->_registryID = (NSNumber *)v13;

  return v9;
}

- (GCHIDServiceInfo)init
{
  -[GCHIDServiceInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_service);
  self->_service = 0;
  v3.receiver = self;
  v3.super_class = (Class)GCHIDServiceInfo;
  -[GCHIDServiceInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualToHIDServiceInfo:(id)a3
{
  NSNumber *registryID;
  void *v4;

  registryID = self->_registryID;
  objc_msgSend(a3, "registryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(registryID) = -[NSNumber isEqual:](registryID, "isEqual:", v4);

  return (char)registryID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[GCHIDServiceInfo isEqualToHIDServiceInfo:](self, "isEqualToHIDServiceInfo:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[NSNumber isEqual:](self->_registryID, "isEqual:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_registryID, "hash");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ registryID='%#010llx'>"), objc_opt_class(), -[NSNumber longLongValue](self->_registryID, "longLongValue"));
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ registryID='%#010llx'>"), objc_opt_class(), -[NSNumber longLongValue](self->_registryID, "longLongValue"));
}

- (id)debugDescription
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = -[NSNumber longLongValue](self->_registryID, "longLongValue");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p registryID='%#010llx'>"), v5, self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)IOHIDServiceClientCopyProperty(self->_service, (CFStringRef)a3);
}

- (id)propertyForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v5;
  void *v6;

  -[GCHIDServiceInfo propertyForKey:](self, "propertyForKey:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (id)stringPropertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GCHIDServiceInfo propertyForKey:ofClass:](self, "propertyForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberPropertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GCHIDServiceInfo propertyForKey:ofClass:](self, "propertyForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryPropertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GCHIDServiceInfo propertyForKey:ofClass:](self, "propertyForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__IOHIDServiceClient)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)registryID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
