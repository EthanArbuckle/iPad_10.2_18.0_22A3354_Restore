@implementation NEAppProxyFlow

- (NEAppProxyFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  id v7;
  NEAppProxyFlow *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NEFlowMetaData *v13;
  NEAppProxyFlow *v14;
  uint64_t v15;
  NSString *remoteHostname;
  uint64_t v17;
  NEFlowMetaData *metaData;
  uint64_t v19;
  _NEFlow *flow;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_dispatch_queue *queue;
  NEFlowMetaData *v25;
  NEFlowMetaData *v26;
  void *v27;
  void *v28;
  void *v29;
  SEL v30;
  void *v31;
  uint64_t v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  id v38;
  objc_super v39;
  objc_super v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NEAppProxyFlow;
  v8 = -[NEAppProxyFlow init](&v39, sel_init);
  if (!v8)
    goto LABEL_23;
  v8->_flow = (_NEFlow *)CFRetain(a3);
  objc_storeStrong((id *)&v8->_queue, a4);
  -[NEAppProxyFlow applicationData](v8, "applicationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsdata(v9))
    goto LABEL_6;
  v38 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, &v38);
  v11 = v38;
  if (v11)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

LABEL_6:
      v13 = [NEFlowMetaData alloc];
      if (v13)
      {
        v40.receiver = v13;
        v40.super_class = (Class)NEFlowMetaData;
        v14 = -[NEAppProxyFlow init](&v40, sel_init);
        if (v14)
        {
          v15 = NEFlowCopyProperty();
          remoteHostname = v14->_remoteHostname;
          v14->_remoteHostname = (NSString *)v15;

          v17 = NEFlowCopyProperty();
          metaData = v14->_metaData;
          v14->_metaData = (NEFlowMetaData *)v17;

          v19 = NEFlowCopyProperty();
          flow = v14->_flow;
          v14->_flow = (_NEFlow *)v19;

          v21 = (void *)NEFlowCopyProperty();
          if (isa_nsnumber(v21))
          {
            v14->_isBound = (objc_msgSend(v21, "unsignedIntValue") & 2) != 0;
            *(&v14->_isBound + 1) = (objc_msgSend(v21, "unsignedIntValue") & 4) != 0;
          }
          v22 = (void *)NEFlowCopyProperty();
          if (isa_nsdata(v22) && objc_msgSend(v22, "length") == 16)
          {
            v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v22), "bytes"));
            queue = v14->_queue;
            v14->_queue = (OS_dispatch_queue *)v23;

          }
        }
      }
      else
      {
        v14 = 0;
      }
      v25 = 0;
      v26 = v8->_metaData;
      v8->_metaData = (NEFlowMetaData *)v14;
      goto LABEL_15;
    }
    LODWORD(v40.receiver) = 138412290;
    *(id *)((char *)&v40.receiver + 4) = v11;
    v35 = "Failed to decode the application data: %@";
    v36 = v12;
    v37 = 12;
LABEL_29:
    _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v40, v37);
    goto LABEL_5;
  }
  objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MetaData"));
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    LOWORD(v40.receiver) = 0;
    v35 = "Failed to decode the meta data from the application data";
    v36 = v12;
    v37 = 2;
    goto LABEL_29;
  }
  v34 = (void *)v33;

  v25 = v34;
  v26 = v8->_metaData;
  v8->_metaData = v25;
LABEL_15:

  NEFlowSetDispatchQueue();
  v27 = (void *)NEFlowCopyProperty();
  if (isa_nsnumber(v27) && (objc_msgSend(v27, "unsignedIntValue") & 8) != 0)
    -[NEAppProxyFlow setIsBound:](v8, "setIsBound:", 1);
  v28 = (void *)NEFlowCopyProperty();
  if (isa_nsnumber(v28))
  {
    objc_msgSend(v28, "unsignedIntValue");
    v29 = (void *)nw_interface_create_with_index();
    objc_setProperty_atomic(v8, v30, v29, 48);

  }
  v31 = (void *)NEFlowCopyProperty();
  if (isa_nsstring(v31))
    objc_storeStrong((id *)&v8->_remoteHostname, v31);

LABEL_23:
  return v8;
}

- (void)dealloc
{
  NEAppProxyFlow *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (NEAppProxyFlow *)self->_flow;
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)NEAppProxyFlow;
  -[NEAppProxyFlow dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  if (self)
    self = (NEAppProxyFlow *)self->_flow;
  return CFHash(self);
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_flow);
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  NEAppProxyFlow *v9;
  uint64_t v10;
  const sockaddr *address;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  BOOL v17;
  id v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  NSObject *Property;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  NEAppProxyFlow *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  NEAppProxyFlow *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  NEAppProxyFlow *v45;
  id v46;
  uint8_t buf[4];
  NEAppProxyFlow *v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    v49 = 2112;
    v50 = v6;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "opening flow %@ with local %@", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v10 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    address = nw_endpoint_get_address(v6);
    if (address)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", address, address->sa_len);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    if (!NEFlowSetProperty())
    {

      goto LABEL_19;
    }
    v13 = (void *)NEFlowCopyProperty();
    if (isa_nsnumber(v13))
    {
      objc_msgSend(v13, "unsignedIntValue");
      v15 = (void *)nw_interface_create_with_index();
      if (v9)
        objc_setProperty_atomic(v9, v14, v15, 48);

    }
  }
  v41 = v10;
  v42 = 3221225472;
  v43 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v44 = &unk_1E3CBF468;
  v16 = v7;
  v45 = v9;
  v46 = v16;
  v17 = NEFlowSetEventHandler() == 0;

  if (v17)
    goto LABEL_19;
  v35 = v10;
  v36 = 3221225472;
  v37 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2;
  v38 = &unk_1E3CBF468;
  v18 = v16;
  v39 = v9;
  v40 = v18;
  v19 = NEFlowSetEventHandler() == 0;

  if (v19)
    goto LABEL_19;
  v29 = v10;
  v30 = 3221225472;
  v31 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3;
  v32 = &unk_1E3CBF468;
  v33 = v9;
  v34 = v18;
  v20 = NEFlowSetEventHandler() == 0;

  if (v20 || !NEFlowOpen())
  {
LABEL_19:
    -[NEAppProxyFlow clearEventHandlers]((uint64_t)v9);
    v21 = (void *)NEFlowCopyError();
    v23 = v21;
    if (v21)
    {
      v24 = objc_msgSend(v21, "code");
      if (v9)
      {
LABEL_21:
        Property = objc_getProperty(v9, v22, 40, 1);
LABEL_22:
        v26[0] = v10;
        v26[1] = 3221225472;
        v26[2] = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4;
        v26[3] = &unk_1E3CC3B08;
        v27 = v7;
        v28 = v24;
        dispatch_async(Property, v26);

        goto LABEL_23;
      }
    }
    else
    {
      v24 = 0;
      if (v9)
        goto LABEL_21;
    }
    Property = 0;
    goto LABEL_22;
  }
LABEL_23:
  objc_sync_exit(v9);

}

- (void)openWithLocalEndpoint:(NWHostEndpoint *)localEndpoint completionHandler:(void *)completionHandler
{
  void *v6;
  id v7;

  v6 = completionHandler;
  v7 = (id)-[NWHostEndpoint copyCEndpoint](localEndpoint, "copyCEndpoint");
  -[NEAppProxyFlow openWithLocalFlowEndpoint:completionHandler:](self, "openWithLocalFlowEndpoint:completionHandler:", v7, v6);

}

- (void)closeReadWithError:(NSError *)error
{
  NSError *v4;
  NSObject *v5;
  CFErrorRef v6;
  int v7;
  NEAppProxyFlow *v8;
  __int16 v9;
  NSError *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = error;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "closing read on flow %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4)
    v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)NEAppProxyFlow, v4);
  else
    v6 = 0;
  NEFlowReadClose();
  if (v6)
    CFRelease(v6);

}

- (void)closeWriteWithError:(NSError *)error
{
  NSError *v4;
  NSObject *v5;
  CFErrorRef v6;
  int v7;
  NEAppProxyFlow *v8;
  __int16 v9;
  NSError *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = error;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "closing write on flow %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4)
    v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)NEAppProxyFlow, v4);
  else
    v6 = 0;
  NEFlowWriteClose();
  if (v6)
    CFRelease(v6);

}

- (NSData)applicationData
{
  return (NSData *)(id)NEFlowCopyProperty();
}

- (void)setApplicationData:(id)a3
{
  NEFlowSetProperty();
}

- (nw_interface_t)networkInterface
{
  if (self)
    self = (NEAppProxyFlow *)objc_getProperty(self, a2, 48, 1);
  return (nw_interface_t)self;
}

- (void)setNetworkInterface:(nw_interface_t)networkInterface
{
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  SEL v8;
  NSObject *Property;
  id v10;

  if (networkInterface)
  {
    v4 = networkInterface;
    nw_interface_get_index(v4);
    v5 = (void *)nw_interface_create_with_index();
    v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 48);

      Property = objc_getProperty(self, v8, 48, 1);
    }
    else
    {

      Property = 0;
    }
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", nw_interface_get_index(Property));
    NEFlowSetProperty();

  }
}

- (void)setMetadata:(nw_parameters_t)parameters
{
  objc_class *v4;
  NSObject *v5;
  void *v6;
  id v7;
  xpc_object_t v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB36F8];
  v5 = parameters;
  v9 = (id)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  -[NEAppProxyFlow metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("MetaData"));

  objc_msgSend(v9, "finishEncoding");
  objc_msgSend(v9, "encodedData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = xpc_data_create((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  nw_parameters_set_metadata();

}

- (NEFlowMetaData)metaData
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isBound
{
  return self->_isBound;
}

- (void)setIsBound:(BOOL)a3
{
  self->_isBound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__networkInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteHostname, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

+ (CFErrorRef)convertFlowErrorToCFError:(uint64_t)a1
{
  id v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  CFIndex v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  CFErrorRef v8;

  v2 = a2;
  objc_opt_self();
  switch(objc_msgSend(v2, "code"))
  {
    case 1:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 1;
      break;
    case 2:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 2;
      break;
    case 3:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 3;
      break;
    case 4:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 4;
      break;
    case 5:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 5;
      break;
    case 6:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 6;
      break;
    case 7:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 7;
      break;
    case 9:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 100;
      break;
    case 10:
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = CFSTR("NEAppProxyFlowErrorDomain");
      v5 = 101;
      break;
    default:
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v7 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v5 = objc_msgSend(v2, "code");
      v3 = v6;
      v4 = v7;
      break;
  }
  v8 = CFErrorCreate(v3, v4, v5, 0);

  return v8;
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return -[NEAppProxyFlow clearEventHandlers](*(_QWORD *)(a1 + 32));
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return -[NEAppProxyFlow clearEventHandlers](*(_QWORD *)(a1 + 32));
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return -[NEAppProxyFlow clearEventHandlers](*(_QWORD *)(a1 + 32));
}

- (uint64_t)clearEventHandlers
{
  if (result)
  {
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    return NEFlowSetEventHandler();
  }
  return result;
}

void __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)errorForFlowError:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  switch(a2)
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = CFSTR("The operation could not be completed because the flow is not connected");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v6 = 1;
      goto LABEL_13;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("The peer closed the flow");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      v6 = 2;
      goto LABEL_13;
    case 3:
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v28 = CFSTR("The destination could host could not be reached");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9;
      v6 = 3;
      goto LABEL_13;
    case 4:
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("An invalid argument was passed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v6 = 4;
      goto LABEL_13;
    case 5:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("The flow was aborted");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11;
      v6 = 5;
      goto LABEL_13;
    case 6:
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("The flow was refused");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v12;
      v6 = 6;
      goto LABEL_13;
    case 7:
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("The flow timed out");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      v6 = 7;
      goto LABEL_13;
    default:
      if (a2 == 100)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2D50];
        v20 = CFSTR("The datagram was too large");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v14;
        v6 = 9;
        goto LABEL_13;
      }
      if (a2 == 101)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D50];
        v18 = CFSTR("A read operation is already pending");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v7;
        v6 = 10;
LABEL_13:
        objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NEAppProxyFlowErrorDomain"), v6, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        return v15;
      }
      return 0;
  }
}

+ (NSObject)copyRemoteEndpointFromFlow:
{
  void *v0;
  NSObject *address;
  sockaddr *v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)NEFlowCopyProperty();
  if (isa_nsdata(v0))
  {
    address = nw_endpoint_create_address((const sockaddr *)objc_msgSend(objc_retainAutorelease(v0), "bytes"));
    v2 = (sockaddr *)nw_endpoint_get_address(address);
    if (NEIsWildcardAddress(&v2->sa_len))
    {
      nw_endpoint_get_port(address);

    }
    else if (address)
    {
      goto LABEL_9;
    }
  }
  v3 = (void *)NEFlowCopyProperty();
  if (isa_nsstring(v3))
  {
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    address = nw_endpoint_create_host_with_numeric_port();
  }
  else
  {
    address = 0;
  }

LABEL_9:
  return address;
}

@end
