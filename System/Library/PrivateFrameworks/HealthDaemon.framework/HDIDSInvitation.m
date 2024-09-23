@implementation HDIDSInvitation

- (HDIDSInvitation)initWithUUID:(id)a3 fromID:(id)a4 codableObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDIDSInvitation *v11;
  uint64_t v12;
  NSUUID *UUID;
  uint64_t v14;
  NSString *fromID;
  uint64_t v16;
  id codableObject;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDIDSInvitation;
  v11 = -[HDIDSInvitation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    fromID = v11->_fromID;
    v11->_fromID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    codableObject = v11->_codableObject;
    v11->_codableObject = (id)v16;

  }
  return v11;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (id)codableObject
{
  return self->_codableObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_codableObject, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
