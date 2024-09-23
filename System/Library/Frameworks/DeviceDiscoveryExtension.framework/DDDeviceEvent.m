@implementation DDDeviceEvent

- (id)createDADeviceEvent
{
  DDEventType v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[DDDeviceEvent eventType](self, "eventType");
  -[DDDeviceEvent device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDADevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2BED8]), "initWithEventType:device:", v3, v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  if (CUXPCDecodeSInt64RangedEx() != 5 && a4)
  {
    DDErrorF(350001, (uint64_t)"DDEvent init bad type: %d", v6, v7, v8, v9, v10, v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (DDDeviceEvent)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  DDDeviceEvent *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  if (self)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v5 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v6 = v5;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("evTy")))
      self->_eventType = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("evTy"));

    v7 = self;
  }
  else
  {
    v9 = objc_opt_class();
    DDErrorF(350001, (uint64_t)"%@ init failed", v10, v11, v12, v13, v14, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DDDevice *device;
  NSError *error;
  int64_t eventType;
  id v8;

  v4 = a3;
  device = self->_device;
  v8 = v4;
  if (device)
  {
    objc_msgSend(v4, "encodeObject:forKey:", device, CFSTR("devi"));
    v4 = v8;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v8, "encodeObject:forKey:", error, CFSTR("errr"));
    v4 = v8;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    objc_msgSend(v8, "encodeInteger:forKey:", eventType, CFSTR("evTy"));
    v4 = v8;
  }

}

- (DDDeviceEvent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DDDeviceEvent *v7;
  int v8;
  DDDeviceEvent *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  int64_t v19;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DDDeviceEvent;
  v7 = -[DDDeviceEvent init](&v18, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v11 = objc_opt_class();
      DDErrorF(350001, (uint64_t)"%@ super init failed", v12, v13, v14, v15, v16, v17, v11);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (!CUXPCDecodeNSError())
    goto LABEL_11;
  v19 = 0;
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_eventType = v19;
    goto LABEL_6;
  }
  if (v8 == 5)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_8;
  }
LABEL_6:
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_11;
  v9 = v7;
LABEL_8:

  return v9;
}

- (void)encodeWithXPCObject:(id)a3
{
  int64_t eventType;
  xpc_object_t xdict;

  xdict = a3;
  CUXPCEncodeObject();
  CUXPCEncodeNSError();
  eventType = self->_eventType;
  if (eventType)
    xpc_dictionary_set_int64(xdict, "evTy", eventType);

}

- (DDDeviceEvent)initWithEventType:(DDEventType)type device:(DDDevice *)device
{
  DDDevice *v7;
  DDDeviceEvent *v8;
  DDDeviceEvent *v9;
  DDDeviceEvent *v10;

  v7 = device;
  v8 = -[DDDeviceEvent init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, device);
    v9->_eventType = type;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return -[DDDeviceEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  __CFString *v5;
  DDDevice *device;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v11;
  DDDevice *v12;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    v11 = objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  if (-[DDDeviceEvent eventType](self, "eventType", v11))
  {
    CUAppendF();
    v5 = v4;

    v4 = v5;
  }
  device = self->_device;
  if (device)
  {
    v12 = device;
    CUAppendF();
    v7 = v4;

    v4 = v7;
  }
  v8 = &stru_24F0EEDC8;
  if (v4)
    v8 = v4;
  v9 = v8;

  return v9;
}

- (DDDevice)device
{
  return self->_device;
}

- (DDEventType)eventType
{
  return self->_eventType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
