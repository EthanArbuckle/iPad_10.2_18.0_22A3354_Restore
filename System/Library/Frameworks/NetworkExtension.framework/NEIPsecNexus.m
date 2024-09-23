@implementation NEIPsecNexus

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5
{
  _BOOL4 v5;
  NEIPsecNexus *v6;
  NEIPsecNexus *v7;
  uint64_t Channel;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  NEIPsecNexus *v14;
  NSObject *v16;
  const char *v17;
  uint8_t v18[16];
  objc_super v19;

  v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NEIPsecNexus;
  v6 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:](&v19, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_, 2, a3, 2, a4, a5);
  v7 = v6;
  if (!v6)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_WORD *)v18 = 0;
    v17 = "[super initWithLevel:name:delegate:] failed";
    goto LABEL_12;
  }
  if (v5)
  {
    Channel = NEVirtualInterfaceCreateChannel((uint64_t)-[NENexus virtualInterface](v6, "virtualInterface"));
    if (Channel)
    {
      v10 = (void *)Channel;
      v11 = objc_getProperty(v7, v9, 112, 1);
      v13 = v11;
      if (v11)
        objc_setProperty_atomic(v11, v12, v10, 8);

      goto LABEL_7;
    }
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v14 = 0;
      goto LABEL_8;
    }
    *(_WORD *)v18 = 0;
    v17 = "NEVirtualInterfaceCreateChannel failed";
LABEL_12:
    _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_10;
  }
LABEL_7:
  v14 = v7;
LABEL_8:

  return v14;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5
{
  return -[NEIPsecNexus initWithName:delegate:enableWithChannelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:](self, "initWithName:delegate:enableWithChannelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:", a3, a4, *(_QWORD *)&a5, 0, 0, 0);
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8
{
  NEIPsecNexus *v9;
  NEIPsecNexus *v10;
  NEIPsecNexus *v11;
  NSObject *v12;
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NEIPsecNexus;
  v9 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](&v15, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_, 2, a3, 2, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, __PAIR64__(a8, a7), 0);
  v10 = v9;
  if (!v9)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", buf, 2u);
    }

    goto LABEL_7;
  }
  if (!-[NEIPsecNexus initializeWithCount:](v9, a5))
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = v10;
LABEL_8:

  return v11;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8 execUUID:(id)a9
{
  NEIPsecNexus *v10;
  NEIPsecNexus *v11;
  NEIPsecNexus *v12;
  NSObject *v13;
  uint8_t buf[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NEIPsecNexus;
  v10 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](&v16, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_, 2, a3, 2, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, __PAIR64__(a8, a7), a9);
  v11 = v10;
  if (!v10)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", buf, 2u);
    }

    goto LABEL_7;
  }
  if (!-[NEIPsecNexus initializeWithCount:](v10, a5))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = v11;
LABEL_8:

  return v12;
}

- (BOOL)setDefaultInputHandler:(nw_protocol *)a3
{
  id Property;
  const char *v5;
  void *v6;
  id v7;
  uint64_t protocol_handler;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self)
    {
      Property = objc_getProperty(self, a2, 112, 1);
      v6 = Property;
      if (Property)
        Property = objc_getProperty(Property, v5, 8, 1);
    }
    else
    {
      v6 = 0;
      Property = 0;
    }
    v7 = Property;
    protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      (**(void (***)(uint64_t, nw_protocol *))(protocol_handler + 24))(protocol_handler, a3);
      return 1;
    }
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Could not get kernel channel protocol", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NEIPsecNexus setDefaultInputHandler:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null inputHandler", (uint8_t *)&v11, 0xCu);
    }
  }

  return 0;
}

- (void)setRemotePacketProxy:(id)a3
{
  id v4;
  const char *v5;
  NEIPsecNexus *Property;
  const char *v7;
  NEIPsecNexus *v8;
  uint64_t protocol_handler;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  -[NEInternetNexus setPacketProxy:](self, "setPacketProxy:", v4);
  if (v4)
  {
    -[NEIPsecNexus setDefaultInputHandler:](self, "setDefaultInputHandler:", objc_msgSend(v4, "protocol"));
    if (self)
    {
      Property = (NEIPsecNexus *)objc_getProperty(self, v5, 112, 1);
      self = Property;
      if (Property)
        Property = (NEIPsecNexus *)objc_getProperty(Property, v7, 8, 1);
    }
    else
    {
      Property = 0;
    }
    v8 = Property;
    protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      objc_msgSend(v4, "setDefaultOutputProtocolHandler:", protocol_handler);
    }
    else
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Could not get kernel channel protocol", v11, 2u);
      }

    }
  }

}

- (NSArray)nexusInstances
{
  return self->_nexusInstances;
}

- (void)setNexusInstances:(id)a3
{
  objc_storeStrong((id *)&self->_nexusInstances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nexusInstances, 0);
}

- (uint64_t)initializeWithCount:(void *)a1
{
  __CFArray *v4;
  const __CFArray *v5;
  int Count;
  id v7;
  CFIndex v8;
  const __CFAllocator *v9;
  uint64_t v10;
  const __CFUUID *ValueAtIndex;
  __CFString *v12;
  void *v13;
  NSObject *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "virtualInterface"))
    return 1;
  v4 = NEVirtualInterfaceCopyNexusInstances(objc_msgSend(a1, "virtualInterface"), a2);
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count == a2)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
      {
        v8 = 0;
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v10 = a2;
        do
        {
          ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v5, v8);
          v12 = (__CFString *)CFUUIDCreateString(v9, ValueAtIndex);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
          objc_msgSend(v7, "addObject:", v13);

          ++v8;
        }
        while (v10 != v8);
      }
      CFRelease(v5);
      objc_msgSend(a1, "setNexusInstances:", v7);

      return 1;
    }
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 67109634;
      v17[1] = a2;
      v18 = 1024;
      v19 = Count;
      v20 = 2112;
      v21 = v5;
      _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "Expected to create %u channels, created %u:%@", (uint8_t *)v17, 0x18u);
    }

    CFRelease(v5);
  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "NEVirtualInterfaceCopyNexusInstances failed", (uint8_t *)v17, 2u);
    }

  }
  return 0;
}

@end
