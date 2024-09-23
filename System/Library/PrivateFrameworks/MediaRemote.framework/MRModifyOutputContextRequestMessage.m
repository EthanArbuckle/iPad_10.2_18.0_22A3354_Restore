@implementation MRModifyOutputContextRequestMessage

- (MRModifyOutputContextRequestMessage)initWithRequest:(id)a3
{
  id v4;
  MRModifyOutputContextRequestMessage *v5;
  _MRAVModifyOutputContextRequestProtobuf *v6;
  void *v7;
  MRModifyOutputContextRequestMessage *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRModifyOutputContextRequestMessage;
  v5 = -[MRProtocolMessage init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRAVModifyOutputContextRequestProtobuf);
    -[_MRAVModifyOutputContextRequestProtobuf setOutputContextType:](v6, "setOutputContextType:", 1);
    objc_msgSend(v4, "protobuf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRAVModifyOutputContextRequestProtobuf setRequest:](v6, "setRequest:", v7);

    switch(objc_msgSend(v4, "type"))
    {
      case 0:

        v8 = 0;
        goto LABEL_10;
      case 1:
        objc_msgSend(v4, "outputDeviceUIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");
        -[_MRAVModifyOutputContextRequestProtobuf setClusterAwareAddingOutputDeviceUIDs:](v6, "setClusterAwareAddingOutputDeviceUIDs:", v10);
        goto LABEL_7;
      case 2:
        objc_msgSend(v4, "outputDeviceUIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");
        -[_MRAVModifyOutputContextRequestProtobuf setClusterAwareRemovingOutputDeviceUIDs:](v6, "setClusterAwareRemovingOutputDeviceUIDs:", v10);
        goto LABEL_7;
      case 3:
        objc_msgSend(v4, "outputDeviceUIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");
        -[_MRAVModifyOutputContextRequestProtobuf setClusterAwareSettingOutputDeviceUIDs:](v6, "setClusterAwareSettingOutputDeviceUIDs:", v10);
LABEL_7:

        break;
      default:
        break;
    }
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  v8 = v5;
LABEL_10:

  return v8;
}

- (unsigned)contextType
{
  void *v2;
  unsigned int v3;
  unsigned int v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputContextType");
  if (v3 - 1 >= 5)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (MRGroupTopologyModificationRequest)request
{
  void *v3;
  int v4;
  MRGroupTopologyModificationRequest *v5;
  MRRequestDetails *v6;
  void *v7;
  MRGroupTopologyModificationRequest *v8;
  MRRequestDetails *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MRGroupTopologyModificationRequest *request;

  if (!self->_request)
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasRequest");

    if (v4)
    {
      v5 = [MRGroupTopologyModificationRequest alloc];
      -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
      v6 = (MRRequestDetails *)objc_claimAutoreleasedReturnValue();
      -[MRRequestDetails request](v6, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MRGroupTopologyModificationRequest initWithProtobuf:](v5, "initWithProtobuf:", v7);
LABEL_12:
      request = self->_request;
      self->_request = v8;

      return self->_request;
    }
    v9 = [MRRequestDetails alloc];
    -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MRRequestDetails initWithName:requestID:reason:](v9, "initWithName:requestID:reason:", CFSTR("MRModifyOutputContextRequestMessage"), v10, CFSTR("MRModifyOutputContextRequestMessage"));

    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clusterAwareAddingOutputDeviceUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "clusterAwareAddingOutputDeviceUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
    }
    else
    {
      objc_msgSend(v14, "clusterAwareRemovingOutputDeviceUIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (v18)
      {
        objc_msgSend(v19, "clusterAwareRemovingOutputDeviceUIDs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 2;
      }
      else
      {
        objc_msgSend(v19, "clusterAwareSettingOutputDeviceUIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v20, "count");

        if (!v16)
        {
          v7 = 0;
          goto LABEL_11;
        }
        -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clusterAwareSettingOutputDeviceUIDs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 3;
      }
    }

LABEL_11:
    v8 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDeviceUIDs:", v6, v16, v7);
    goto LABEL_12;
  }
  return self->_request;
}

- (NSArray)addingOutputDeviceUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[MRModifyOutputContextRequestMessage request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    -[MRModifyOutputContextRequestMessage request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)removingOutputDeviceUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[MRModifyOutputContextRequestMessage request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    -[MRModifyOutputContextRequestMessage request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)settingOutputDeviceUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[MRModifyOutputContextRequestMessage request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    -[MRModifyOutputContextRequestMessage request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (unint64_t)type
{
  return 48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
