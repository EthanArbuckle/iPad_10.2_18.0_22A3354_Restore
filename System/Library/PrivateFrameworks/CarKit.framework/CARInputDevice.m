@implementation CARInputDevice

- (CARInputDevice)initWithServiceClient:(__IOHIDServiceClient *)a3 UUID:(id)a4
{
  id v6;
  CARInputDevice *v7;
  void *v8;
  uint64_t v9;
  NSString *UUID;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARInputDevice;
  v7 = -[CARInputDevice init](&v12, sel_init);
  if (v7)
  {
    IOHIDServiceClientGetRegistryID(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_senderID = objc_msgSend(v8, "unsignedLongValue");
    v9 = objc_msgSend(v6, "copy");
    UUID = v7->_UUID;
    v7->_UUID = (NSString *)v9;

  }
  return v7;
}

- (void)_setUUID:(id)a3
{
  void *v4;
  char v5;
  NSString *v6;
  NSString *UUID;
  id v8;

  v8 = a3;
  -[CARInputDevice UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v8, "copy");
    UUID = self->_UUID;
    self->_UUID = v6;

  }
}

- (void)_setSenderID:(unint64_t)a3
{
  if (-[CARInputDevice senderID](self, "senderID") != a3)
    self->_senderID = a3;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
