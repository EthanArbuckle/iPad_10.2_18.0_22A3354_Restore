@implementation MROutputDeviceModificationRequest

- (MROutputDeviceModificationRequest)initWithRequestDetails:(id)a3 configuration:(id)a4 type:(unint64_t)a5 outputDevices:(id)a6
{
  id v11;
  id v12;
  id v13;
  MROutputDeviceModificationRequest *v14;
  MROutputDeviceModificationRequest *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MROutputDeviceModificationRequest;
  v14 = -[MROutputDeviceModificationRequest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestDetails, a3);
    objc_storeStrong((id *)&v15->_configuration, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_outputDevices, a6);
  }

  return v15;
}

- (MROutputDeviceModificationRequest)initWithRequestDetails:(id)a3 configuration:(id)a4 type:(unint64_t)a5 outputDevice:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  MROutputDeviceModificationRequest *v14;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a4;
  v12 = a3;
  if (a6)
    objc_msgSend(v10, "setWithObject:", a6);
  else
    objc_msgSend(v10, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MROutputDeviceModificationRequest initWithRequestDetails:configuration:type:outputDevices:](self, "initWithRequestDetails:configuration:type:outputDevices:", v12, v11, a5, v13);

  return v14;
}

+ (id)pendingSelectionforModifications:(id)a3 currentSelection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type", (_QWORD)v18);
        if (v14 == 2)
        {
          objc_msgSend(v13, "outputDevices");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setSet:", v15);
        }
        else if (v14 == 1)
        {
          objc_msgSend(v13, "outputDevices");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "minusSet:", v15);
        }
        else
        {
          if (v14)
            continue;
          objc_msgSend(v13, "outputDevices");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v15);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "minusSet:", v6);
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (id)groupTopologyModificationRequest
{
  void *v3;
  void *v4;
  MRGroupTopologyModificationRequest *v5;

  -[MROutputDeviceModificationRequest outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_compactMap:", &__block_literal_global_48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDeviceUIDs:", self->_requestDetails, -[MROutputDeviceModificationRequest requestType](self, "requestType"), v4);
  return v5;
}

uint64_t __69__MROutputDeviceModificationRequest_groupTopologyModificationRequest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceID");
}

- (unint64_t)requestType
{
  unint64_t type;

  type = self->_type;
  if (type < 3)
    return type + 1;
  else
    return 0;
}

- (MRRequestDetails)requestDetails
{
  return self->_requestDetails;
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (NSSet)outputDevices
{
  return self->_outputDevices;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_requestDetails, 0);
}

@end
