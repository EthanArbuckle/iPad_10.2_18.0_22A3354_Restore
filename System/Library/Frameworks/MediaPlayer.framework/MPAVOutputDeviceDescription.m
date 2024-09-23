@implementation MPAVOutputDeviceDescription

- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5
{
  return -[MPAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:modelID:](self, "initWithDeviceType:deviceSubtype:uid:modelID:", a3, a4, a5, 0);
}

- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5 modelID:(id)a6
{
  id v11;
  id v12;
  MPAVOutputDeviceDescription *v13;
  MPAVOutputDeviceDescription *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MPAVOutputDeviceDescription;
  v13 = -[MPAVOutputDeviceDescription init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_routeType = a3;
    v13->_routeSubtype = a4;
    objc_storeStrong((id *)&v13->_uid, a5);
    objc_storeStrong((id *)&v14->_modelID, a6);
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPAVOutputDeviceDescription uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPAVOutputDeviceDescription routeType](self, "routeType");
  if (v6 > 3)
    v7 = CFSTR("Undefined");
  else
    v7 = off_1E3158B00[v6];
  v8 = -[MPAVOutputDeviceDescription routeSubtype](self, "routeSubtype");
  if (v8 > 0x1B)
    v9 = CFSTR("Undefined");
  else
    v9 = off_1E3158A20[v8];
  v10 = v9;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p uid=%@ type=%@ subtype=%@ modelID=%@>"), v4, self, v5, v7, v10, self->_modelID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  MPAVOutputDeviceDescription *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MPAVOutputDeviceDescription *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MPAVOutputDeviceDescription uid](v4, "uid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", self->_uid)
        && -[MPAVOutputDeviceDescription routeSubtype](v4, "routeSubtype") == self->_routeSubtype
        && -[MPAVOutputDeviceDescription routeType](v4, "routeType") == self->_routeType)
      {
        -[MPAVOutputDeviceDescription modelID](v4, "modelID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", self->_modelID);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;

  v3 = self->_routeSubtype ^ self->_routeType;
  v4 = v3 ^ -[NSString hash](self->_uid, "hash");
  return v4 ^ -[NSString hash](self->_modelID, "hash");
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (int64_t)routeSubtype
{
  return self->_routeSubtype;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
