@implementation AFAudioDeviceInfo

- (AFAudioDeviceInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAudioDeviceInfoMutation *);
  AFAudioDeviceInfo *v5;
  AFAudioDeviceInfo *v6;
  _AFAudioDeviceInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *route;
  void *v11;
  uint64_t v12;
  NSUUID *deviceUID;
  objc_super v15;

  v4 = (void (**)(id, _AFAudioDeviceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFAudioDeviceInfo;
  v5 = -[AFAudioDeviceInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAudioDeviceInfoMutation initWithBase:]([_AFAudioDeviceInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAudioDeviceInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFAudioDeviceInfoMutation getRoute](v7, "getRoute");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      route = v6->_route;
      v6->_route = (NSString *)v9;

      v6->_isRemoteDevice = -[_AFAudioDeviceInfoMutation getIsRemoteDevice](v7, "getIsRemoteDevice");
      -[_AFAudioDeviceInfoMutation getDeviceUID](v7, "getDeviceUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v12;

    }
  }

  return v6;
}

- (AFAudioDeviceInfo)init
{
  return -[AFAudioDeviceInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAudioDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 deviceUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AFAudioDeviceInfo *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__AFAudioDeviceInfo_initWithRoute_isRemoteDevice_deviceUID___block_invoke;
  v14[3] = &unk_1E3A31FE8;
  v17 = a4;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = -[AFAudioDeviceInfo initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (id)description
{
  return -[AFAudioDeviceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFAudioDeviceInfo;
  -[AFAudioDeviceInfo description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isRemoteDevice)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {route = %@, isRemoteDevice = %@, deviceUID = %@}"), v5, self->_route, v7, self->_deviceUID);

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_route, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteDevice);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSUUID hash](self->_deviceUID, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFAudioDeviceInfo *v4;
  AFAudioDeviceInfo *v5;
  _BOOL4 isRemoteDevice;
  NSString *v7;
  NSString *route;
  NSUUID *v9;
  NSUUID *deviceUID;
  BOOL v11;

  v4 = (AFAudioDeviceInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isRemoteDevice = self->_isRemoteDevice;
      if (isRemoteDevice == -[AFAudioDeviceInfo isRemoteDevice](v5, "isRemoteDevice"))
      {
        -[AFAudioDeviceInfo route](v5, "route");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        route = self->_route;
        if (route == v7 || -[NSString isEqual:](route, "isEqual:", v7))
        {
          -[AFAudioDeviceInfo deviceUID](v5, "deviceUID");
          v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          deviceUID = self->_deviceUID;
          v11 = deviceUID == v9 || -[NSUUID isEqual:](deviceUID, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (AFAudioDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AFAudioDeviceInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioDeviceInfo::route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioDeviceInfo::isRemoteDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioDeviceInfo::deviceUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFAudioDeviceInfo initWithRoute:isRemoteDevice:deviceUID:](self, "initWithRoute:isRemoteDevice:deviceUID:", v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *route;
  void *v5;
  id v6;

  route = self->_route;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", route, CFSTR("AFAudioDeviceInfo::route"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteDevice);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFAudioDeviceInfo::isRemoteDevice"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceUID, CFSTR("AFAudioDeviceInfo::deviceUID"));
}

- (NSString)route
{
  return self->_route;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

void __60__AFAudioDeviceInfo_initWithRoute_isRemoteDevice_deviceUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRoute:", v3);
  objc_msgSend(v4, "setIsRemoteDevice:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setDeviceUID:", *(_QWORD *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFAudioDeviceInfoMutation *);
  _AFAudioDeviceInfoMutation *v5;
  AFAudioDeviceInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *route;
  void *v10;
  uint64_t v11;
  NSUUID *deviceUID;

  v4 = (void (**)(id, _AFAudioDeviceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAudioDeviceInfoMutation initWithBase:]([_AFAudioDeviceInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAudioDeviceInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAudioDeviceInfo);
      -[_AFAudioDeviceInfoMutation getRoute](v5, "getRoute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      route = v6->_route;
      v6->_route = (NSString *)v8;

      v6->_isRemoteDevice = -[_AFAudioDeviceInfoMutation getIsRemoteDevice](v5, "getIsRemoteDevice");
      -[_AFAudioDeviceInfoMutation getDeviceUID](v5, "getDeviceUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v11;

    }
    else
    {
      v6 = (AFAudioDeviceInfo *)-[AFAudioDeviceInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAudioDeviceInfo *)-[AFAudioDeviceInfo copy](self, "copy");
  }

  return v6;
}

@end
