@implementation CCDonateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_connection);
}

- (unsigned)requestId
{
  return self->_requestId;
}

- (CCDonateRequest)initWithConnection:(id)a3 manager:(id)a4 itemType:(unsigned __int16)a5 encodedDescriptors:(id)a6 version:(unint64_t)a7 validity:(id)a8 device:(id)a9 accessAssertion:(id)a10
{
  id v16;
  id v17;
  id v18;
  CCDonateRequest *v19;
  CCDonateRequest *v20;
  unsigned int v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];
  objc_super v31;

  v16 = a3;
  v17 = a4;
  v29 = a6;
  v28 = a8;
  v27 = a9;
  v18 = a10;
  v31.receiver = self;
  v31.super_class = (Class)CCDonateRequest;
  v19 = -[CCDonateRequest init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_connection, v16);
    objc_storeWeak((id *)&v20->_manager, v17);
    v20->_itemType = a5;
    objc_storeStrong((id *)&v20->_encodedDescriptors, a6);
    v20->_version = a7;
    objc_storeStrong((id *)&v20->_validity, a8);
    do
      v21 = __ldaxr((unsigned int *)&requestCount);
    while (__stlxr(v21 + 1, (unsigned int *)&requestCount));
    v20->_requestId = v21;
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_generate(v22);

    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_237B02000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "donateRequestQueued", " enableTelemetry=YES ", buf, 2u);
    }

    v20->_requestQueuedSignpostId = v23;
    objc_storeStrong((id *)&v20->_device, a9);
    objc_storeStrong((id *)&v20->_accessAssertion, a10);
  }

  return v20;
}

- (void)terminateWithType:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t requestHandledSignpostId;
  int itemType;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id WeakRetained;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  requestHandledSignpostId = self->_requestHandledSignpostId;
  if (requestHandledSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    itemType = self->_itemType;
    -[CCDonateRequest _connectionTypeString](self, "_connectionTypeString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if ((unint64_t)a3 > 4)
      v11 = CFSTR("Undefined");
    else
      v11 = *(&off_25098AE80 + a3);
    v13[0] = 67240706;
    v13[1] = itemType;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_signpost_emit_with_name_impl(&dword_237B02000, v6, OS_SIGNPOST_INTERVAL_END, requestHandledSignpostId, "donateRequestHandled", " itemType=%{public,signpost.telemetry:number1}d  requestType=%{public,signpost.telemetry:string1}@  result=%{public,signpost.telemetry:string2}@ ", (uint8_t *)v13, 0x1Cu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "completeRequest:", self);

}

- (void)handle
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t requestQueuedSignpostId;
  CCDonateRequest *v6;
  int itemType;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  id v14;
  NSObject *v15;
  int v16;
  CCDonateRequest *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestQueuedSignpostId = self->_requestQueuedSignpostId;
  if (requestQueuedSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    -[CCDonateRequest _connectionTypeString](self, "_connectionTypeString");
    v6 = (CCDonateRequest *)objc_claimAutoreleasedReturnValue();
    itemType = self->_itemType;
    v16 = 138543618;
    v17 = v6;
    v18 = 1026;
    v19 = itemType;
    _os_signpost_emit_with_name_impl(&dword_237B02000, v4, OS_SIGNPOST_INTERVAL_END, requestQueuedSignpostId, "donateRequestQueued", " requestType=%{public,signpost.telemetry:string1}@  itemType=%{public,signpost.telemetry:number1}d ", (uint8_t *)&v16, 0x12u);

  }
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_237B02000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "donateRequestHandled", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  self->_requestHandledSignpostId = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v13 = objc_msgSend(WeakRetained, "isAlive");

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(v14, "resume");

  }
  else
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = self;
      _os_log_impl(&dword_237B02000, v15, OS_LOG_TYPE_DEFAULT, "Connection is invalidated for request %@", (uint8_t *)&v16, 0xCu);
    }

    -[CCDonateRequest terminateWithType:](self, "terminateWithType:", 1);
  }
}

- (id)description
{
  void *v2;
  uint64_t requestId;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  requestId = self->_requestId;
  -[CCDonateRequest _connectionTypeString](self, "_connectionTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CCDonateServiceRequestDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("#%u [%@] %@"), requestId, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connectionTypeString
{
  id WeakRetained;
  __CFString *v3;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (objc_msgSend(WeakRetained, "isXPC"))
    v3 = CFSTR("XPC");
  else
    v3 = CFSTR("In Process");
  v4 = v3;

  return v4;
}

- (CCDevice)device
{
  return self->_device;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)validity
{
  return self->_validity;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (NSString)encodedDescriptors
{
  return self->_encodedDescriptors;
}

- (BMAccessAssertion)accessAssertion
{
  return self->_accessAssertion;
}

- (void)timeout
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "timeout");

  v4 = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(v4, "completeRequest:", self);

}

- (BOOL)isEqual:(id)a3
{
  CCDonateRequest *v4;
  CCDonateRequest *v5;
  BOOL v6;

  v4 = (CCDonateRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCDonateRequest isEqualToDonateRequest:](self, "isEqualToDonateRequest:", v5);

  return v6;
}

- (BOOL)isEqualToDonateRequest:(id)a3
{
  void *v3;
  void *version;
  id v6;
  unsigned int requestId;
  uint64_t itemType;
  NSString *encodedDescriptors;
  NSString *v10;
  unint64_t v11;
  int v12;
  char v13;
  NSString *validity;
  NSString *v16;
  void *v17;

  v6 = a3;
  requestId = self->_requestId;
  if (requestId != objc_msgSend(v6, "requestId")
    || (itemType = self->_itemType, (_DWORD)itemType != objc_msgSend(v6, "itemType")))
  {
    v13 = 0;
    goto LABEL_10;
  }
  encodedDescriptors = self->_encodedDescriptors;
  v10 = encodedDescriptors;
  if (!encodedDescriptors)
  {
    objc_msgSend(v6, "encodedDescriptors");
    itemType = objc_claimAutoreleasedReturnValue();
    if (!itemType)
    {
      version = (void *)self->_version;
      v12 = 0;
      v13 = 0;
      if (version != (void *)objc_msgSend(v6, "version"))
      {
LABEL_21:

        goto LABEL_10;
      }
      goto LABEL_14;
    }
    v10 = self->_encodedDescriptors;
  }
  objc_msgSend(v6, "encodedDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v10, "isEqual:", v3) & 1) == 0)
  {

    v13 = 0;
    goto LABEL_20;
  }
  v11 = self->_version;
  if (v11 != objc_msgSend(v6, "version"))
  {
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = 1;
LABEL_14:
  validity = self->_validity;
  v16 = validity;
  if (!validity)
  {
    objc_msgSend(v6, "validity");
    version = (void *)objc_claimAutoreleasedReturnValue();
    if (!version)
    {
      v13 = 1;
      goto LABEL_23;
    }
    v16 = self->_validity;
  }
  objc_msgSend(v6, "validity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSString isEqual:](v16, "isEqual:", v17);

  if (validity)
  {
    if (!v12)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_23:

  if ((v12 & 1) != 0)
    goto LABEL_19;
LABEL_20:
  if (!encodedDescriptors)
    goto LABEL_21;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_requestId);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_itemType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSString hash](self->_encodedDescriptors, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[NSString hash](self->_validity, "hash");

  return v10;
}

@end
