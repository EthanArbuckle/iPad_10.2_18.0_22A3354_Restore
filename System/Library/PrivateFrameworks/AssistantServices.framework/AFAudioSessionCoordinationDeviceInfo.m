@implementation AFAudioSessionCoordinationDeviceInfo

- (AFAudioSessionCoordinationDeviceInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAudioSessionCoordinationDeviceInfoMutation *);
  AFAudioSessionCoordinationDeviceInfo *v5;
  AFAudioSessionCoordinationDeviceInfo *v6;
  _AFAudioSessionCoordinationDeviceInfoMutation *v7;
  void *v8;
  uint64_t v9;
  AFPeerInfo *peerInfo;
  void *v11;
  uint64_t v12;
  AFAudioSessionCoordinationSystemInfo *systemInfo;
  objc_super v15;

  v4 = (void (**)(id, _AFAudioSessionCoordinationDeviceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFAudioSessionCoordinationDeviceInfo;
  v5 = -[AFAudioSessionCoordinationDeviceInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAudioSessionCoordinationDeviceInfoMutation initWithBase:]([_AFAudioSessionCoordinationDeviceInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAudioSessionCoordinationDeviceInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFAudioSessionCoordinationDeviceInfoMutation getPeerInfo](v7, "getPeerInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = (AFPeerInfo *)v9;

      -[_AFAudioSessionCoordinationDeviceInfoMutation getSystemInfo](v7, "getSystemInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      systemInfo = v6->_systemInfo;
      v6->_systemInfo = (AFAudioSessionCoordinationSystemInfo *)v12;

    }
  }

  return v6;
}

- (AFAudioSessionCoordinationDeviceInfo)init
{
  return -[AFAudioSessionCoordinationDeviceInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAudioSessionCoordinationDeviceInfo)initWithPeerInfo:(id)a3 systemInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFAudioSessionCoordinationDeviceInfo *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__AFAudioSessionCoordinationDeviceInfo_initWithPeerInfo_systemInfo___block_invoke;
  v12[3] = &unk_1E3A31B50;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFAudioSessionCoordinationDeviceInfo initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (NSString)description
{
  return (NSString *)-[AFAudioSessionCoordinationDeviceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFAudioSessionCoordinationDeviceInfo;
  -[AFAudioSessionCoordinationDeviceInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {peerInfo = %@, systemInfo = %@}"), v5, self->_peerInfo, self->_systemInfo);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[AFPeerInfo hash](self->_peerInfo, "hash");
  return -[AFAudioSessionCoordinationSystemInfo hash](self->_systemInfo, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFAudioSessionCoordinationDeviceInfo *v4;
  AFAudioSessionCoordinationDeviceInfo *v5;
  AFPeerInfo *v6;
  AFPeerInfo *peerInfo;
  AFAudioSessionCoordinationSystemInfo *v8;
  AFAudioSessionCoordinationSystemInfo *systemInfo;
  BOOL v10;

  v4 = (AFAudioSessionCoordinationDeviceInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFAudioSessionCoordinationDeviceInfo peerInfo](v5, "peerInfo");
      v6 = (AFPeerInfo *)objc_claimAutoreleasedReturnValue();
      peerInfo = self->_peerInfo;
      if (peerInfo == v6 || -[AFPeerInfo isEqual:](peerInfo, "isEqual:", v6))
      {
        -[AFAudioSessionCoordinationDeviceInfo systemInfo](v5, "systemInfo");
        v8 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue();
        systemInfo = self->_systemInfo;
        v10 = systemInfo == v8 || -[AFAudioSessionCoordinationSystemInfo isEqual:](systemInfo, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFAudioSessionCoordinationDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFAudioSessionCoordinationDeviceInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationDeviceInfo::peerInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationDeviceInfo::systemInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFAudioSessionCoordinationDeviceInfo initWithPeerInfo:systemInfo:](self, "initWithPeerInfo:systemInfo:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  AFPeerInfo *peerInfo;
  id v5;

  peerInfo = self->_peerInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", peerInfo, CFSTR("AFAudioSessionCoordinationDeviceInfo::peerInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemInfo, CFSTR("AFAudioSessionCoordinationDeviceInfo::systemInfo"));

}

- (AFAudioSessionCoordinationDeviceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  AFPeerInfo *v6;
  AFAudioSessionCoordinationDeviceInfo *v7;
  void *v8;
  AFAudioSessionCoordinationSystemInfo *v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("peerInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = -[AFPeerInfo initWithDictionaryRepresentation:]([AFPeerInfo alloc], "initWithDictionaryRepresentation:", v5);
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("systemInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = -[AFAudioSessionCoordinationSystemInfo initWithDictionaryRepresentation:]([AFAudioSessionCoordinationSystemInfo alloc], "initWithDictionaryRepresentation:", v8);
    else
      v9 = 0;

    self = -[AFAudioSessionCoordinationDeviceInfo initWithPeerInfo:systemInfo:](self, "initWithPeerInfo:systemInfo:", v6, v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  AFPeerInfo *peerInfo;
  void *v5;
  AFAudioSessionCoordinationSystemInfo *systemInfo;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  peerInfo = self->_peerInfo;
  if (peerInfo)
  {
    -[AFPeerInfo buildDictionaryRepresentation](peerInfo, "buildDictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("peerInfo"));

  }
  systemInfo = self->_systemInfo;
  if (systemInfo)
  {
    -[AFAudioSessionCoordinationSystemInfo buildDictionaryRepresentation](systemInfo, "buildDictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("systemInfo"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (AFPeerInfo)peerInfo
{
  return self->_peerInfo;
}

- (AFAudioSessionCoordinationSystemInfo)systemInfo
{
  return self->_systemInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
}

void __68__AFAudioSessionCoordinationDeviceInfo_initWithPeerInfo_systemInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPeerInfo:", v3);
  objc_msgSend(v4, "setSystemInfo:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFAudioSessionCoordinationDeviceInfoMutation *);
  _AFAudioSessionCoordinationDeviceInfoMutation *v5;
  AFAudioSessionCoordinationDeviceInfo *v6;
  void *v7;
  uint64_t v8;
  AFPeerInfo *peerInfo;
  void *v10;
  uint64_t v11;
  AFAudioSessionCoordinationSystemInfo *systemInfo;

  v4 = (void (**)(id, _AFAudioSessionCoordinationDeviceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAudioSessionCoordinationDeviceInfoMutation initWithBase:]([_AFAudioSessionCoordinationDeviceInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAudioSessionCoordinationDeviceInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAudioSessionCoordinationDeviceInfo);
      -[_AFAudioSessionCoordinationDeviceInfoMutation getPeerInfo](v5, "getPeerInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = (AFPeerInfo *)v8;

      -[_AFAudioSessionCoordinationDeviceInfoMutation getSystemInfo](v5, "getSystemInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      systemInfo = v6->_systemInfo;
      v6->_systemInfo = (AFAudioSessionCoordinationSystemInfo *)v11;

    }
    else
    {
      v6 = (AFAudioSessionCoordinationDeviceInfo *)-[AFAudioSessionCoordinationDeviceInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAudioSessionCoordinationDeviceInfo *)-[AFAudioSessionCoordinationDeviceInfo copy](self, "copy");
  }

  return v6;
}

@end
