@implementation HAP2AccessoryServerEncodingThread

- (HAP2AccessoryServerEncodingThread)initWithEncodingFeatures:(unint64_t)a3 accessoryDescription:(id)a4
{
  id v7;
  HAP2AccessoryServerEncodingThread *v8;
  HAP2AccessoryServerEncodingThread *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServerEncodingThread;
  v8 = -[HAP2AccessoryServerEncodingThread init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_encodingFeatures = a3;
    objc_storeStrong((id *)&v8->_accessoryDescription, a4);
  }

  return v9;
}

- (id)encodeBodyValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedValue:format:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decodeBodyData:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseTransformedValue:format:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA51008) & 1) == 0)
  {

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)readRequestForAttributeDatabaseWithEncryption:(BOOL)a3 error:(id *)a4
{
  void *v5;
  HAP2EncodedRequestThread *v6;
  unint64_t v7;
  HAP2EncodedRequestThread *v8;

  +[HAP2AccessoryServerEncodingThreadBTLERequest attributeDatabaseRequest](HAP2AccessoryServerEncodingThreadBTLERequest, "attributeDatabaseRequest", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HAP2EncodedRequestThread alloc];
  if (self)
    v7 = (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1;
  else
    v7 = 0;
  v8 = -[HAP2EncodedRequestThread initWithBTLERequest:enforcePDUBodyLength:](v6, "initWithBTLERequest:enforcePDUBodyLength:", v5, v7);

  return v8;
}

- (id)groupingsForReadRequestsForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") & 4) != 0)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__HAP2AccessoryServerEncodingThread_groupingsForReadRequestsForCharacteristics___block_invoke;
    v9[3] = &unk_1E894D098;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  return v7;
}

- (id)readRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  HAP2EncodedCharacteristicRequestThread *v11;
  void *v12;
  unint64_t v13;
  HAP2EncodedCharacteristicRequestThread *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  -[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __87__HAP2AccessoryServerEncodingThread_readRequestForCharacteristics_shouldEncrypt_error___block_invoke;
  v19 = &unk_1E894C750;
  v9 = v7;
  v20 = v9;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v16);

  v11 = [HAP2EncodedCharacteristicRequestThread alloc];
  v12 = (void *)objc_msgSend(v10, "copy", v16, v17, v18, v19);
  if (self)
    v13 = (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1;
  else
    v13 = 0;
  v14 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v11, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v12, 2, v13);

  return v14;
}

- (id)groupingsForWriteRequestsForCharacteristics:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _QWORD v22[4];
  void *v23;

  v4 = a3;
  v5 = -[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 4) != 0)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1871;
    v20 = __Block_byref_object_dispose__1872;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke_52;
    v13[3] = &unk_1E8949D10;
    v15 = &v16;
    v8 = v7;
    v14 = v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
    if (objc_msgSend((id)v17[5], "count"))
    {
      v11 = (void *)objc_msgSend((id)v17[5], "copy");
      objc_msgSend(v8, "addObject:", v11);

    }
    v9 = (void *)objc_msgSend(v8, "copy");

    _Block_object_dispose(&v16, 8);
    v10 = (void *)v21;
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke;
    v22[3] = &unk_1E894C728;
    v23 = v6;
    v8 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = v23;
  }

  return v9;
}

- (id)writeRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HAP2EncodedCharacteristicRequestThread *v14;
  HAP2EncodedCharacteristicRequestThread *v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  id v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  -[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1871;
  v31 = __Block_byref_object_dispose__1872;
  v32 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __88__HAP2AccessoryServerEncodingThread_writeRequestForCharacteristics_shouldEncrypt_error___block_invoke;
  v22 = &unk_1E8949D38;
  v26 = a4;
  v25 = &v27;
  v11 = v9;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v19);
  v13 = (void *)v28[5];
  if (v13)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v15 = [HAP2EncodedCharacteristicRequestThread alloc];
    v16 = (void *)objc_msgSend(v12, "copy", v19, v20, v21, v22, v23);
    if (self)
      v17 = (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1;
    else
      v17 = 0;
    v14 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v15, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v16, 1, v17);

  }
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)prepareWriteRequestForCharacteristics:(id)a3 ttl:(double)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  HAP2EncodedCharacteristicRequestThread *v11;
  HAP2EncodedCharacteristicRequestThread *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1871;
  v26 = __Block_byref_object_dispose__1872;
  v27 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __85__HAP2AccessoryServerEncodingThread_prepareWriteRequestForCharacteristics_ttl_error___block_invoke;
  v19 = &unk_1E8949D10;
  v21 = &v22;
  v9 = v8;
  v20 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v16);
  v10 = (void *)v23[5];
  if (v10)
  {
    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = [HAP2EncodedCharacteristicRequestThread alloc];
    v13 = (void *)objc_msgSend(v9, "copy", v16, v17, v18, v19);
    if (self)
      v14 = (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1;
    else
      v14 = 0;
    v11 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v12, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v13, 3, v14);

  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

- (id)executeWriteRequestForCharacteristics:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  HAP2EncodedCharacteristicRequestThread *v10;
  HAP2EncodedCharacteristicRequestThread *v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1871;
  v25 = __Block_byref_object_dispose__1872;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __81__HAP2AccessoryServerEncodingThread_executeWriteRequestForCharacteristics_error___block_invoke;
  v18 = &unk_1E8949D10;
  v20 = &v21;
  v8 = v7;
  v19 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v15);
  v9 = (void *)v22[5];
  if (v9)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v11 = [HAP2EncodedCharacteristicRequestThread alloc];
    v12 = (void *)objc_msgSend(v8, "copy", v15, v16, v17, v18);
    if (self)
      v13 = (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1;
    else
      v13 = 0;
    v10 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v11, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v12, 4, v13);

  }
  _Block_object_dispose(&v21, 8);

  return v10;
}

- (id)notificationRequestsForCharacteristics:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HAP2EncodedCharacteristicRequestThread *v18;
  HAP2EncodedCharacteristicRequestThread *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  char v26;
  _QWORD v27[4];
  id v28;
  HAP2AccessoryServerEncodingThread *v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v7 = 12;
    v8 = 11;
  }
  else if (a4)
  {
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v7 = 11;
    v8 = 10;
  }
  v9 = (void *)MEMORY[0x1E0C99E20];
  v10 = a3;
  objc_msgSend(v9, "setWithCapacity:", 2 * objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__HAP2AccessoryServerEncodingThread_notificationRequestsForCharacteristics_type_error___block_invoke;
  v22[3] = &unk_1E8949D60;
  v26 = v7;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  v25 = a4;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);

  v16 = v14;
  if (self)
  {
    if ((-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") & 4) != 0)
    {
      v19 = [HAP2EncodedCharacteristicRequestThread alloc];
      v20 = (void *)objc_msgSend(v16, "copy");
      v18 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v19, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v20, v8, (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") >> 5) & 1);

      v27[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      self = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __77__HAP2AccessoryServerEncodingThread__hapRequestsForBTLERequests_requestType___block_invoke;
      v27[3] = &unk_1E8949CE8;
      v29 = self;
      v30 = v8;
      v28 = v17;
      v18 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v27);
      self = (HAP2AccessoryServerEncodingThread *)-[HAP2EncodedCharacteristicRequestThread copy](v18, "copy");

    }
  }

  return self;
}

- (id)_parseCharacteristicResponsesWithBodyData:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HAPBTLEResponse *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HAP2AccessoryServerEncodingThread *v25;
  id v26;
  id *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a4, "btleRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke;
  v44[3] = &unk_1E8949F68;
  v11 = v10;
  v45 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v44);
  v12 = v8;
  v41 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  v14 = v12;
  while (1)
  {
    if (!objc_msgSend(v14, "length", v40) || !objc_msgSend(v11, "count"))
    {
      if (!objc_msgSend(v14, "length"))
      {
        if (objc_msgSend(v11, "count"))
        {
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke_55;
          v42[3] = &unk_1E8949D88;
          v43 = v13;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v42);

        }
        v35 = (void *)objc_msgSend(v13, "copy");
        goto LABEL_38;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v31 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        v33 = objc_msgSend(v14, "length");
        *(_DWORD *)buf = 138412546;
        v47 = self;
        v48 = 1024;
        v49 = v33;
        _os_log_error_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%@ Found %u extra bytes of incoming PDU data", buf, 0x12u);

      }
      goto LABEL_24;
    }
    -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (!a5)
      {
        v14 = 0;
        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
LABEL_26:
      v35 = 0;
      *a5 = v34;
      goto LABEL_38;
    }
    v14 = v15;
    if (!objc_msgSend(v14, "length"))
    {

LABEL_24:
      if (!a5)
        goto LABEL_37;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    buf[0] = 0;
    objc_msgSend(v14, "getBytes:length:", buf, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", buf[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_24;
    objc_msgSend(v11, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      break;
    v18 = (void *)v17;
    objc_msgSend(v11, "removeObjectForKey:", v16);
    v14 = v14;
    if (!self
      || (v19 = v14, (-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") & 0x20) == 0))
    {
      v19 = v14;
      if ((objc_msgSend(v18, "expectsResponseBody") & 1) == 0)
      {
        objc_msgSend(v14, "subdataWithRange:", 0, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v20 = -[HAPBTLEResponse initWithRequest:]([HAPBTLEResponse alloc], "initWithRequest:", v18);
    v21 = -[HAPBTLEResponse appendData:error:](v20, "appendData:error:", v19, a5);
    if (v21)
    {
      objc_msgSend(v13, "addObject:", v20);
      objc_msgSend(v14, "subdataWithRange:", v21, objc_msgSend(v14, "length") - v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v14;
      v24 = v16;
      v25 = self;
      v26 = v11;
      v27 = a5;
      v28 = v13;
      v29 = v22;

      v30 = (void *)v29;
      v13 = v28;
      a5 = v27;
      v11 = v26;
      self = v25;
      v16 = v24;
      v14 = v30;
    }

    if (!v21)
      goto LABEL_37;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v36 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v38 = v36;
    v39 = objc_msgSend(v16, "unsignedIntValue");
    *(_DWORD *)buf = 138412546;
    v47 = self;
    v48 = 1024;
    v49 = v39;
    _os_log_error_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_ERROR, "%@ Unable to match request to response (tid: %x)", buf, 0x12u);

    if (a5)
    {
LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a5)
  {
    goto LABEL_31;
  }

LABEL_37:
  v35 = 0;
LABEL_38:

  return v35;
}

- (id)responseForRequest:(id)a3 bodyData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HAPBTLEResponse *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  HAP2EncodedCharacteristicResponse *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  HAP2AccessoryServerEncodingThread *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HAP2EncodedEnableNotificationResponse *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  HAPBTLEResponse *v78;
  _BYTE buf[12];
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "type") == 12)
  {
    self = objc_alloc_init(HAP2EncodedEmptyResponseThread);
    goto LABEL_65;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;
    if (v11)
    {
      -[HAP2AccessoryServerEncodingThread _parseCharacteristicResponsesWithBodyData:request:error:](self, "_parseCharacteristicResponsesWithBodyData:request:error:", v9, v11, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_63:
        self = 0;
        goto LABEL_64;
      }
      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v8;
    else
      v13 = 0;
    objc_msgSend(v13, "btleRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HAPBTLEResponse initWithRequest:]([HAPBTLEResponse alloc], "initWithRequest:", v14);
    v69 = v8;
    v71 = v9;
    if (self)
    {
      -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v9, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        *(_QWORD *)buf = 0;
        v17 = -[HAPBTLEResponse appendData:error:](v15, "appendData:error:", v16, buf);
        objc_msgSend(v16, "subdataWithRange:", v17, objc_msgSend(v16, "length") - v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v18 = 0;
      }

    }
    else
    {
      v19 = 0;
      v18 = 0;
    }

    v20 = v19;
    v21 = v20;
    if (v18)
    {
      if (!objc_msgSend(v18, "length"))
      {
        v78 = v15;
        v25 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v22 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v26 = v22;
        v27 = -[HAPBTLEResponse bodyLength](v15, "bodyLength");
        v28 = objc_msgSend(v71, "length");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = self;
        v80 = 2048;
        v81 = v27;
        v82 = 2048;
        v83 = v28 - 1;
        v84 = 2112;
        v85 = v21;
        _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to parse response (read %lu bytes, expected %lu): %@", buf, 0x2Au);

        if (a5)
          goto LABEL_27;
      }
      else if (a5)
      {
LABEL_27:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
        v24 = 0;
        v25 = 0;
        *a5 = v23;
LABEL_34:

        if (!v25)
        {
          self = 0;
          v8 = v69;
          v9 = v71;
          v11 = 0;
          v12 = (void *)v24;
LABEL_64:

          goto LABEL_65;
        }
        v8 = v69;
        v9 = v71;
        v11 = 0;
        v12 = (void *)v24;
LABEL_36:
        switch(objc_msgSend(v8, "type"))
        {
          case 0:
          case 5:
          case 6:
          case 7:
          case 8:
          case 12:
            if (!a5)
              goto LABEL_63;
            v29 = (void *)MEMORY[0x1E0CB35C8];
            v30 = 9;
            goto LABEL_39;
          case 1:
          case 4:
            v31 = v12;
            v67 = v31;
            if (self)
            {
              v32 = v31;
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v77 = 0u;
              v34 = v32;
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v75;
                do
                {
                  for (i = 0; i != v36; ++i)
                  {
                    if (*(_QWORD *)v75 != v37)
                      objc_enumerationMutation(v34);
                    -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](self, *(void **)(*((_QWORD *)&v74 + 1) + 8 * i));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "addObject:", v39);

                  }
                  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
                }
                while (v36);
              }

              v40 = [HAP2EncodedCharacteristicResponse alloc];
              v41 = (void *)objc_msgSend(v33, "copy");
              self = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](v40, "initWithCharacteristics:", v41);

            }
            v12 = v67;

            goto LABEL_64;
          case 2:
            -[HAP2AccessoryServerEncodingThread _readResponseFromBTLEResponses:error:]((HAP2EncodedCharacteristicResponse *)self, v12);
            v48 = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();
            goto LABEL_68;
          case 3:
            -[HAP2AccessoryServerEncodingThread _prepareWriteResponseFromBTLEResponses:error:]((HAP2EncodedCharacteristicResponse *)self, v12);
            v48 = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();
LABEL_68:
            self = v48;
            break;
          case 9:
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAP2AccessoryServerEncodingThread _attributeDatabaseResponseFromBTLEResponse:error:]((HAP2EncodedAttributeDatabaseResponseThread *)self, v49, a5);
            self = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();

            break;
          case 10:
          case 11:
            v42 = v12;
            v70 = v8;
            v72 = v9;
            v66 = v11;
            v68 = v42;
            if (self)
            {
              v43 = v42;
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") & 4) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", (unint64_t)objc_msgSend(v43, "count") >> 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v44 = 0;
              }
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v51 = v43;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v75;
                do
                {
                  for (j = 0; j != v53; ++j)
                  {
                    if (*(_QWORD *)v75 != v54)
                      objc_enumerationMutation(v51);
                    v56 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                    objc_msgSend(v56, "request");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = objc_msgSend(v57, "type");

                    if (v58 == 3)
                    {
                      -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](self, v56);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "addObject:", v59);
                    }
                    else
                    {
                      -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](self, v56);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "request");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "characteristic");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v61, v59);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v73, "addObject:", v62);
                    }

                  }
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, buf, 16);
                }
                while (v53);
              }

              v63 = [HAP2EncodedEnableNotificationResponse alloc];
              v64 = (void *)objc_msgSend(v73, "copy");
              v65 = (void *)objc_msgSend(v44, "copy");
              self = -[HAP2EncodedEnableNotificationResponse initWithNotificationResponses:updatedValues:](v63, "initWithNotificationResponses:updatedValues:", v64, v65);

            }
            v12 = v68;

            v8 = v70;
            v9 = v72;
            v11 = v66;
            break;
          case 13:
          case 14:
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v45 = (id)objc_claimAutoreleasedReturnValue();
            if (self)
            {
              -[HAP2AccessoryServerEncodingThread _extractResponseBodyFromBTLEResponse:request:error:](self, v45, a5);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46
                && +[HAP2EncodingUtils parseAddOrRemovePairingRequestResponse:error:](HAP2EncodingUtils, "parseAddOrRemovePairingRequestResponse:error:", v46, a5))
              {
                self = -[HAP2EncodedResponseThread initWithBTLEResponse:]([HAP2EncodedResponseThread alloc], "initWithBTLEResponse:", v45);
              }
              else
              {
                self = 0;
              }

            }
            break;
          case 15:
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAP2AccessoryServerEncodingThread _listPairingsResponseFromBTLEResponse:request:error:]((HAP2EncodedListPairingsResponseThread *)self, v50, a5);
            self = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();

            break;
          default:
            if (!a5)
              goto LABEL_63;
            v29 = (void *)MEMORY[0x1E0CB35C8];
            v30 = 1;
LABEL_39:
            objc_msgSend(v29, "hapErrorWithCode:", v30);
            self = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_64;
      }
    }
    else if (a5)
    {
      v23 = objc_retainAutorelease(v20);
      goto LABEL_30;
    }
    v24 = 0;
    v25 = 0;
    goto LABEL_34;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
    self = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self = 0;
  }
LABEL_65:

  return self;
}

- (id)unpairedIdentifyRequestWithError:(id *)a3
{
  return -[HAP2EncodedEmptyRequestThread initWithRequestType:]([HAP2EncodedEmptyRequestThread alloc], "initWithRequestType:", 12);
}

- (id)requestToRemovePairing:(id)a3 characteristic:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[HAP2EncodingUtils removePairingRequestWithIdentifier:error:](HAP2EncodingUtils, "removePairingRequestWithIdentifier:error:", v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (!v10)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v11;
      _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize remove request TLVs: %@", buf, 0x16u);
      if (a5)
        goto LABEL_7;
    }
    else if (a5)
    {
LABEL_7:
      v12 = 0;
      *a5 = objc_retainAutorelease(v11);
      goto LABEL_10;
    }
    v12 = 0;
    goto LABEL_10;
  }
  -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v8, (uint64_t)v10, 10, (uint64_t)a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

- (id)requestToAddPairing:(id)a3 characteristic:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v14 = 0;
  +[HAP2EncodingUtils addPairingRequestWithIdentity:error:](HAP2EncodingUtils, "addPairingRequestWithIdentity:error:", a3, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize remove request TLVs: %@", buf, 0x16u);
      if (a5)
        goto LABEL_7;
    }
    else if (a5)
    {
LABEL_7:
      v11 = 0;
      *a5 = objc_retainAutorelease(v10);
      goto LABEL_10;
    }
    v11 = 0;
    goto LABEL_10;
  }
  -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v8, (uint64_t)v9, 13, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (id)requestToListPairingsWithCharacteristic:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  +[HAPPairingUtilities createListPairingsRequest:](HAPPairingUtilities, "createListPairingsRequest:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v7)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize list pairing request: %@", buf, 0x16u);
      if (a4)
        goto LABEL_7;
    }
    else if (a4)
    {
LABEL_7:
      v9 = 0;
      *a4 = objc_retainAutorelease(v8);
      goto LABEL_10;
    }
    v9 = 0;
    goto LABEL_10;
  }
  -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v6, (uint64_t)v7, 14, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

- (id)eventsForData:(id)a3 error:(id *)a4
{
  HAP2EncodedCharacteristicEvent *v5;
  unsigned int v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  HAP2EncodedCharacteristicEvent *v15;
  HAP2EncodedCharacteristicEvent *v16;
  void *v17;
  HAP2EncodedCharacteristicEvent *v18;
  NSObject *v19;
  int v20;
  HAP2EncodedCharacteristicEvent *v21;
  void *v22;
  NSObject *v23;
  HAP2EncodedCharacteristicEvent *v24;
  HAP2EncodedCharacteristicEvent *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  __int128 v31;
  id *v32;
  void *v34;
  unsigned int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  HAP2EncodedCharacteristicEvent *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v5 = (HAP2EncodedCharacteristicEvent *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = 0;
  *(_QWORD *)&v7 = 138412802;
  v31 = v7;
  v32 = a4;
  while (1)
  {
    if (objc_msgSend(v38, "length", v31) <= (unint64_t)v6)
    {
      v24 = v5;
      goto LABEL_46;
    }
    objc_msgSend(v38, "subdataWithRange:", v6, objc_msgSend(v38, "length") - v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v8, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      if (!a4)
        goto LABEL_45;
      v27 = 3;
      goto LABEL_44;
    }
    if ((unint64_t)objc_msgSend(v9, "length") <= 3)
      break;
    objc_msgSend(v10, "subdataWithRange:", 0, 2);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = *(unsigned __int16 *)objc_msgSend(v37, "bytes");
    objc_msgSend(v10, "subdataWithRange:", 2, 2);
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = *(unsigned __int16 *)objc_msgSend(v36, "bytes");
    v13 = 0;
    if (objc_msgSend(v10, "length") >= (unint64_t)(v12 + 4))
    {
      objc_msgSend(v10, "subdataWithRange:", 4, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v13, "length"))
    {
      v35 = v6;
      v40 = 0;
      +[_HAPAccessoryServerBTLE200 extractSerializedRequestValueFromBodyData:error:](_HAPAccessoryServerBTLE200, "extractSerializedRequestValueFromBodyData:error:", v13, &v40);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (HAP2EncodedCharacteristicEvent *)v40;
      v16 = v15;
      v34 = (void *)v14;
      if (v14)
      {

        v39 = 0;
        +[_HAPAccessoryServerBTLE200 extractNotificationContextFromBodyData:error:](_HAPAccessoryServerBTLE200, "extractNotificationContextFromBodyData:error:", v13, &v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (HAP2EncodedCharacteristicEvent *)v39;
        v16 = v18;
        if (v17 || !v18)
        {
          v25 = [HAP2EncodedCharacteristicEvent alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HAP2EncodedCharacteristicEvent initWithInstanceID:encodedValueData:encodedContextData:](v25, "initWithInstanceID:encodedValueData:encodedContextData:", v26, v34, v17);

          if (v21)
          {
            -[HAP2EncodedCharacteristicEvent addObject:](v5, "addObject:", v21);
            v20 = 0;
            v35 += v12 + 5;
          }
          else
          {
            if (v32)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
              *v32 = (id)objc_claimAutoreleasedReturnValue();
            }

            v21 = 0;
            v5 = 0;
            v20 = 3;
          }
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v19 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v42 = self;
            v43 = 2112;
            v44 = v13;
            v45 = 2112;
            v46 = v16;
            _os_log_error_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to extract notification context from data: %@ with error: %@", buf, 0x20u);
          }
          v20 = 3;
          v21 = v5;
          v5 = 0;
        }

      }
      else
      {
        if (a4)
        {
          v16 = objc_retainAutorelease(v15);
          *a4 = v16;
        }
        v20 = 3;
        v17 = v5;
        v5 = 0;
      }
      v22 = v37;
      v24 = v5;

      v5 = v16;
      a4 = v32;
      v6 = v35;
      goto LABEL_34;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = v37;
    v23 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 2112;
      v44 = v10;
      _os_log_error_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%@ Invalid event, no data: %@", buf, 0x16u);
      if (!a4)
      {
LABEL_32:
        v24 = 0;
        goto LABEL_33;
      }
    }
    else if (!a4)
    {
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v20 = 3;
LABEL_34:

    v5 = v24;
    if (v20)
      goto LABEL_46;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v28 = hap2Log_accessory;
  if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    if (!a4)
      goto LABEL_45;
LABEL_43:
    v27 = 12;
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", v27);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  *(_DWORD *)buf = 138412546;
  v42 = self;
  v43 = 2112;
  v44 = v10;
  _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%@ Invalid event, not enough data for header: %@", buf, 0x16u);
  if (a4)
    goto LABEL_43;
LABEL_45:

  v24 = 0;
LABEL_46:
  v29 = (void *)-[HAP2EncodedCharacteristicEvent copy](v24, "copy");

  return v29;
}

- (id)_parseCharacteristicMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HAPCharacteristicMetadata *v11;
  char v12;
  id v13;
  NSObject *v14;
  HAPMetadataConstraints *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL valid;
  HAPCharacteristicMetadata *v28;
  void *v29;
  void *v30;
  HAPCharacteristicMetadata *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "userDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bluetoothFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v32 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 2112;
      v44 = v6;
      _os_log_error_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%@ Characteristic contains no format: %@", buf, 0x16u);
      if (a4)
        goto LABEL_22;
    }
    else if (a4)
    {
LABEL_22:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v11 = 0;
    goto LABEL_46;
  }
  v39 = 0;
  v40 = 0;
  objc_msgSend(v6, "bluetoothFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _parseBTLEPresentationFormat(v9, (uint64_t)&v39, a4);

  v11 = 0;
  if (v10)
  {
    v38 = 0;
    v11 = 0;
    if (_parseHAPCharacteristicFormat(v39, &v38, a4))
    {
      v37 = 0;
      v12 = _parseHAPCharacteristicUnit(v39, &v40, &v37);
      v13 = v37;
      if ((v12 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v14 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v42 = self;
          v43 = 2112;
          v44 = v6;
          v45 = 2112;
          v46 = v13;
          _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Characteristic %@ unit failed to parse with error: %@", buf, 0x20u);
        }
        v40 = 0;
      }
      v15 = objc_alloc_init(HAPMetadataConstraints);
      objc_msgSend(v6, "validRange");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            objc_msgSend(v6, "validRange"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = _parseCharacteristicValidRange(v18, v38, v15, a4),
            v18,
            v17,
            !v19))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v33 = hap2Log_accessory;
        if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
      }
      else
      {
        objc_msgSend(v6, "stepValue");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20
          || (v21 = (void *)v20,
              objc_msgSend(v6, "stepValue"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = _parseCharacteristicStepValue(v22, v38, v15, a4),
              v22,
              v21,
              v23))
        {
          objc_msgSend(v6, "validValuesRange");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24
            || (v25 = (void *)v24,
                objc_msgSend(v6, "validValuesRange"),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                valid = _parseCharacteristicValidValues(v26, v38, v15, a4),
                v26,
                v25,
                valid))
          {
            v28 = [HAPCharacteristicMetadata alloc];
            HAPCharacteristicFormatToString(v38);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            HAPCharacteristicUnitToString(v40);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:](v28, "initWithConstraints:description:format:units:", v15, v7, v29, v30);

            if (v11)
            {
              v31 = v11;
LABEL_44:

              goto LABEL_45;
            }
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v35 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v42 = self;
              v43 = 2112;
              v44 = v6;
              _os_log_error_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%@ Characteristic %@ metadata failed to parse", buf, 0x16u);
              if (!a4)
                goto LABEL_44;
            }
            else if (!a4)
            {
              goto LABEL_44;
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v33 = hap2Log_accessory;
          if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
LABEL_36:
            v11 = 0;
LABEL_45:

            goto LABEL_46;
          }
          *(_DWORD *)buf = 138412546;
          v42 = self;
          v43 = 2112;
          v44 = v6;
          v34 = "%@ Characteristic %@ valid values range failed to parse";
LABEL_35:
          _os_log_error_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
          goto LABEL_36;
        }
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v33 = hap2Log_accessory;
        if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
      }
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 2112;
      v44 = v6;
      v34 = "%@ Characteristic %@ valid range failed to parse";
      goto LABEL_35;
    }
  }
LABEL_46:

  return v11;
}

- (id)_parseCharacteristics:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ Characteristic list contains no characteristics", (uint8_t *)&buf, 0xCu);
      if (a4)
        goto LABEL_9;
    }
    else if (a4)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v11 = 0;
    goto LABEL_12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1871;
  v20 = __Block_byref_object_dispose__1872;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HAP2AccessoryServerEncodingThread__parseCharacteristics_error___block_invoke;
  v14[3] = &unk_1E8949DB0;
  v14[4] = self;
  p_buf = &buf;
  v9 = v8;
  v15 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v10)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "copy");
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v11;
}

- (id)_parseServiceList:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ Service list contains no services", (uint8_t *)&buf, 0xCu);
      if (a4)
        goto LABEL_9;
    }
    else if (a4)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v11 = 0;
    goto LABEL_12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1871;
  v20 = __Block_byref_object_dispose__1872;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HAP2AccessoryServerEncodingThread__parseServiceList_error___block_invoke;
  v14[3] = &unk_1E8949DD8;
  v14[4] = self;
  p_buf = &buf;
  v9 = v8;
  v15 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v10)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "copy");
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v11;
}

- (id)_parseTopLevelAttributeDatabaseFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HAPTLVUnsignedNumberValue *v9;
  void *v10;
  HAPTLVUnsignedNumberValue *v11;
  HAP2TLVParamAccessorySignature *v12;
  void *v13;
  HAP2TLVParamAccessorySignature *v14;
  HAP2TLVParamAccessoryList *v15;
  void *v16;
  HAP2TLVParamAccessoryList *v17;
  HAP2TLVAccessorySignatureReadRequest *v18;
  NSObject *v19;
  HAP2TLVParamAccessorySignature *v21;
  uint8_t buf[4];
  HAP2AccessoryServerEncodingThread *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[HAP2AccessoryServerEncodingThread encodingFeatures](self, "encodingFeatures") & 2) == 0)
  {
    +[HAP2TLVOldServiceList parsedFromData:error:](HAP2TLVOldServiceList, "parsedFromData:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v18 = 0;
LABEL_15:

      return v18;
    }
    objc_msgSend(v7, "serviceList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [HAPTLVUnsignedNumberValue alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HAPTLVNumberValueBase initWithValue:](v9, "initWithValue:", v10);

      v12 = [HAP2TLVParamAccessorySignature alloc];
      objc_msgSend(v7, "serviceList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HAP2TLVParamAccessorySignature initWithAccessoryID:serviceList:](v12, "initWithAccessoryID:serviceList:", v11, v13);

      v15 = [HAP2TLVParamAccessoryList alloc];
      v21 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HAP2TLVParamAccessoryList initWithAccessorySignatureList:](v15, "initWithAccessorySignatureList:", v16);

      v18 = -[HAP2TLVAccessorySignatureReadRequest initWithAccessoryList:]([HAP2TLVAccessorySignatureReadRequest alloc], "initWithAccessoryList:", v17);
LABEL_14:

      goto LABEL_15;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v19 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%@ Found no services: %@", buf, 0x16u);
      if (a4)
        goto LABEL_11;
    }
    else if (a4)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v18 = 0;
    goto LABEL_14;
  }
  +[HAP2TLVAccessorySignatureReadRequest parsedFromData:error:](HAP2TLVAccessorySignatureReadRequest, "parsedFromData:error:", v6, a4);
  v18 = (HAP2TLVAccessorySignatureReadRequest *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *accessoryDescription;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerEncodingThread;
  -[HAP2LoggingObject description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self)
    accessoryDescription = self->_accessoryDescription;
  else
    accessoryDescription = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, accessoryDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)encodingFeatures
{
  return self->_encodingFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
}

void __61__HAP2AccessoryServerEncodingThread__parseServiceList_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  HAPService *v27;
  void *v28;
  HAPService *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  id v45;
  id v46;
  id obj;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "_parseShortFormUUID:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    objc_msgSend(v6, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v31 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v49 = v41;
        v50 = 2112;
        v51 = v6;
        _os_log_error_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%@ Service contains no instance id: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;

      *a4 = 1;
      goto LABEL_33;
    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v6, "characteristicList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "characteristicSignatureList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v46 = *(id *)(v16 + 40);
    objc_msgSend(v13, "_parseCharacteristics:error:", v15, &v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), v46);

    if (!v17)
    {
      *a4 = 1;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v44 = a4;
    objc_msgSend(v6, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "value");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "linkedServices");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      objc_msgSend(v6, "linkedServices");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v45 = *(id *)(v24 + 40);
      v25 = _parseLinkedServices(v23, v20, &v45);
      objc_storeStrong((id *)(v24 + 40), v45);

      if ((v25 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v35 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v42 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v49 = v42;
          v50 = 2112;
          v51 = v6;
          _os_log_error_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%@ Service contained invalid linked services: %@", buf, 0x16u);
        }
        *v44 = 1;
        goto LABEL_31;
      }
      objc_msgSend(v20, "removeObject:", v12);
    }
    v26 = v19 & 7;
    v27 = [HAPService alloc];
    v28 = (void *)objc_msgSend(v20, "copy");
    v29 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v27, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v10, v12, v17, v26, v28);

    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v29);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v36 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v43 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v49 = v43;
        v50 = 2112;
        v51 = v6;
        _os_log_error_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%@ Unable to parse service: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

      *v44 = 1;
    }

LABEL_31:
    goto LABEL_32;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v30 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v40 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v49 = v40;
    v50 = 2112;
    v51 = v6;
    _os_log_error_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%@ Service contains invalid or no type: %@", buf, 0x16u);
  }
  *a4 = 1;
LABEL_34:

}

void __65__HAP2AccessoryServerEncodingThread__parseCharacteristics_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  HAPCharacteristic *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id obj;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "characteristicType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "_parseShortFormUUID:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    objc_msgSend(v6, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "characteristicProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "characteristicProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "value");

        v16 = *(void **)(a1 + 32);
        v45 = 0;
        objc_msgSend(v16, "_parseCharacteristicMetadata:error:", v6, &v45);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v45;
        if (v17)
        {
          v19 = 2 * (v15 & 1);
          if ((v15 & 0x22) != 0)
            v19 = (2 * (v15 & 1)) | 0x84;
          LOBYTE(v44) = 1;
          v20 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:]([HAPCharacteristic alloc], "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v10, v12, 0, 0, (v15 >> 3) & 2 | v15 & 0x40 | (16 * ((v15 >> 2) & 3)) | (v15 >> 6) & 8 | (v15 >> 2) & 0x100 | ((~(_WORD)v15 & 0x180) == 0) | v19, 0, v44, v17);
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPCharacteristic setValueUpdatedTime:](v20, "setValueUpdatedTime:", v21);

            objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
          }
          else
          {
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v36 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              v43 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v48 = v43;
              v49 = 2112;
              v50 = v6;
              _os_log_error_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%@ Unable to parse characteristic: %@", buf, 0x16u);
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v39 = *(void **)(v38 + 40);
            *(_QWORD *)(v38 + 40) = v37;

            *a4 = 1;
          }

        }
        else
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v32 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            v42 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            v48 = v42;
            v49 = 2112;
            v50 = v6;
            _os_log_error_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%@ Characteristic contains invalid metadata: %@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v35 = *(void **)(v34 + 40);
          *(_QWORD *)(v34 + 40) = v33;

          *a4 = 1;
        }

        goto LABEL_34;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v26 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;

        *a4 = 1;
LABEL_34:

        goto LABEL_35;
      }
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v48 = v41;
      v49 = 2112;
      v50 = v6;
      v28 = "%@ Characteristic contains no properties: %@";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v26 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v48 = v27;
      v49 = 2112;
      v50 = v6;
      v28 = "%@ Characteristic contains no instance id: %@";
    }
    _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_21;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v22 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v40 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v48 = v40;
    v49 = 2112;
    v50 = v6;
    _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%@ Characteristic contains invalid or no type: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  *a4 = 1;
LABEL_35:

}

- (id)_extractAndValidateControlFieldWithData:(int)a3 expectedType:
{
  id v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  unsigned __int8 v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v10 = 0;
    if (v5 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(v6, "getBytes:length:", &v10, 1);
      v7 = (v10 >> 1) & 7;
      if (v7 > 2)
        v7 = 255;
      if (v7 == a3)
      {
        objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = a1;
        v13 = 1024;
        v14 = v10;
        _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Invalid response, control field (%02x) is not a response", buf, 0x12u);
      }
    }
    a1 = 0;
  }
LABEL_13:

  return a1;
}

- (HAP2EncodedCharacteristicRequestThread)_pairingsRequestWithCharacteristic:(uint64_t)a3 bodyValue:(char)a4 threadRequestType:(uint64_t)a5 error:
{
  HAP2EncodedCharacteristicRequestThread *v5;
  uint64_t v6;
  void *v7;
  HAP2EncodedCharacteristicRequestThread *v8;
  void *v9;
  _QWORD v11[2];

  v5 = a1;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = *(_QWORD *)&asc_1CCFA3100[8 * (a4 - 10)];
    +[HAP2AccessoryServerEncodingThreadBTLERequest writeRequestForCharacteristic:value:authorizationData:contextData:options:error:](HAP2AccessoryServerEncodingThreadBTLERequest, "writeRequestForCharacteristic:value:authorizationData:contextData:options:error:", a2, a3, 0, 0, 3, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = [HAP2EncodedCharacteristicRequestThread alloc];
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v8, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v9, v6, ((unint64_t)-[HAP2EncodedCharacteristicRequestThread encodingFeatures](v5, "encodingFeatures") >> 5) & 1);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (HAP2EncodedCharacteristicResponse)_readResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HAP2EncodedCharacteristicResponse *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v15);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = [HAP2EncodedCharacteristicResponse alloc];
    v13 = (void *)objc_msgSend(v5, "copy");
    a1 = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](v12, "initWithCharacteristics:", v13);

  }
  return a1;
}

- (HAP2EncodedCharacteristicResponse)_prepareWriteResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HAP2EncodedCharacteristicResponse *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "request");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }

          v13 = v10;
          objc_msgSend(v13, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "request");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "characteristic");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](a1, v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            v18 = v17;
          else
            v18 = 0;
          +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v16, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v19);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }

    v20 = [HAP2EncodedCharacteristicResponse alloc];
    v21 = (void *)objc_msgSend(v5, "copy");
    a1 = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](v20, "initWithCharacteristics:", v21);

  }
  return a1;
}

- (HAP2EncodedAttributeDatabaseResponseThread)_attributeDatabaseResponseFromBTLEResponse:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  HAP2EncodedAttributeDatabaseResponseThread *v23;
  uint64_t v25;
  _QWORD v26[7];
  id obj;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t v34[4];
  HAP2EncodedAttributeDatabaseResponseThread *v35;
  __int16 v36;
  void *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__1871;
    v32 = __Block_byref_object_dispose__1872;
    v33 = 0;
    objc_msgSend(v5, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id *)(v29 + 5);
    obj = (id)v29[5];
    -[HAP2EncodedAttributeDatabaseResponseThread _parseTopLevelAttributeDatabaseFromData:error:](a1, "_parseTopLevelAttributeDatabaseFromData:error:", v7, &obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, obj);

    if (v9)
    {
      objc_msgSend(v9, "accessoryList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v39 = __Block_byref_object_copy__1871;
        v40 = __Block_byref_object_dispose__1872;
        v11 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend(v10, "accessorySignatureList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

        objc_msgSend(v10, "accessorySignatureList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __86__HAP2AccessoryServerEncodingThread__attributeDatabaseResponseFromBTLEResponse_error___block_invoke;
        v26[3] = &unk_1E8949E50;
        v26[4] = a1;
        v26[5] = &v28;
        v26[6] = buf;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

        v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = v16 == 0;

        if ((_DWORD)v14)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v17 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v34 = 138412546;
            v35 = a1;
            v36 = 2112;
            v37 = v10;
            _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%@ Attribute database response doesn't contain primary accessory: %@", v34, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v29[5];
          v29[5] = v18;

        }
        v20 = (void *)v29[5];
        if (v20)
        {
          a1 = 0;
          if (a3)
            *a3 = objc_retainAutorelease(v20);
        }
        else
        {
          v23 = [HAP2EncodedAttributeDatabaseResponseThread alloc];
          a1 = -[HAP2EncodedAttributeDatabaseResponseThread initWithBTLEResponse:attributeDatabase:](v23, "initWithBTLEResponse:attributeDatabase:", v6, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_25;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v22 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%@ Attribute database contains no accessory list: %@", buf, 0x16u);
        if (a3)
          goto LABEL_22;
      }
      else if (a3)
      {
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      a1 = 0;
      goto LABEL_25;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v25 = v29[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v25;
      _os_log_error_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%@ Failed to parse attribute database: %@", buf, 0x16u);
      if (a3)
        goto LABEL_17;
    }
    else if (a3)
    {
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 7, CFSTR("Invalid Response."), CFSTR("Failed to parse attribute database."), 0, v29[5]);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      _Block_object_dispose(&v28, 8);
      goto LABEL_27;
    }
    a1 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return a1;
}

- (HAP2EncodedListPairingsResponseThread)_listPairingsResponseFromBTLEResponse:(HAP2EncodedListPairingsResponseThread *)a1 request:(void *)a2 error:(_QWORD *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  HAP2EncodedListPairingsResponseThread *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    -[HAP2AccessoryServerEncodingThread _extractResponseBodyFromBTLEResponse:request:error:](a1, v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }
      goto LABEL_16;
    }
    v11 = 0;
    +[HAPPairingUtilities parseListPairingsResponse:error:](HAPPairingUtilities, "parseListPairingsResponse:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v7)
    {
      a1 = -[HAP2EncodedListPairingsResponseThread initWithBTLEResponse:pairings:]([HAP2EncodedListPairingsResponseThread alloc], "initWithBTLEResponse:pairings:", v5, v7);
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%@ Unable to parse list pairings response: %@", buf, 0x16u);
      if (a3)
        goto LABEL_11;
    }
    else if (a3)
    {
LABEL_11:
      a1 = 0;
      *a3 = objc_retainAutorelease(v8);
      goto LABEL_15;
    }
    a1 = 0;
    goto LABEL_15;
  }
LABEL_17:

  return a1;
}

- (id)_extractResponseBodyFromBTLEResponse:(void *)a1 request:(void *)a2 error:(_QWORD *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v5, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v11, "setValue:", 0);
    if (v9)
    {
      v13 = v9;
LABEL_17:

      goto LABEL_20;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = a1;
      _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid type for HAP2 request", (uint8_t *)&v18, 0xCu);
      if (!a3)
        goto LABEL_17;
    }
    else if (!a3)
    {
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v15 = v8;
    objc_msgSend(v6, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = a1;
    v20 = 2112;
    v21 = v16;
    _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%@ Unable to parse pairing response: %@", (uint8_t *)&v18, 0x16u);

    if (a3)
      goto LABEL_6;
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  if (!a3)
    goto LABEL_19;
LABEL_6:
  objc_msgSend(v6, "error");
  v9 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v9;
}

- (id)_valueResponseFromBTLEResponse:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *log;
  os_log_t v44;
  NSObject *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v3, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](a1, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v3, "body");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "type");
    if (v10)
    {
      if (v11 == 3 || (objc_msgSend(v5, "writeOptions") & 2) != 0)
      {
        objc_msgSend(v3, "body");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        +[_HAPAccessoryServerBTLE200 extractSerializedRequestValueFromBodyData:error:](_HAPAccessoryServerBTLE200, "extractSerializedRequestValueFromBodyData:error:", v12, &v50);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v50;

        if (!v13)
        {
          objc_msgSend(v7, "setValue:", 0);
          objc_msgSend(v7, "setNotificationContext:", 0);
          +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v14;
          goto LABEL_34;
        }

        objc_msgSend(v5, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "format");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = HAPCharacteristicFormatFromString(v17);

        if (!v18)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v25 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            v39 = v25;
            objc_msgSend(v7, "type");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "instanceID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v52 = a1;
            v53 = 2112;
            v54 = v41;
            v55 = 2112;
            v56 = v42;
            _os_log_error_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_ERROR, "%@ No format for characteristic %@ [%@]", buf, 0x20u);

          }
          objc_msgSend(v7, "setValue:", 0);
          objc_msgSend(v7, "setNotificationContext:", 0);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, v26);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_34;
        }
        v49 = 0;
        objc_msgSend(a1, "decodeBodyData:format:error:", v13, v18, &v49);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v49;
        if (v20)
        {
          v21 = v20;
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v22 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            v45 = v22;
            objc_msgSend(v7, "type");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v47);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "instanceID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v52 = a1;
            v53 = 2112;
            v54 = v37;
            v55 = 2112;
            v56 = v38;
            v57 = 2112;
            v58 = v21;
            _os_log_error_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_ERROR, "%@ Decoding value for characteristic %@ [%@] failed with error: %@", buf, 0x2Au);

          }
          objc_msgSend(v7, "setValue:", 0);
          objc_msgSend(v7, "setNotificationContext:", 0);
          +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, v21);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
        objc_msgSend(v7, "setValue:", v19);
        if (objc_msgSend(v5, "type") == 3 && (objc_msgSend(v7, "properties") & 0x100) != 0)
        {
          objc_msgSend(v3, "body");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          +[_HAPAccessoryServerBTLE200 extractNotificationContextFromBodyData:error:](_HAPAccessoryServerBTLE200, "extractNotificationContextFromBodyData:error:", v28, &v48);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v48;

          if (v21)
          {
            objc_msgSend(v7, "setNotificationContext:", v21);
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v30 = (void *)hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
            {
              v46 = v29;
              log = v30;
              objc_msgSend(v7, "type");
              v44 = (os_log_t)objc_claimAutoreleasedReturnValue();
              +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v44);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "instanceID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v52 = a1;
              v53 = 2112;
              v54 = v31;
              v55 = 2112;
              v56 = v32;
              v57 = 2112;
              v58 = v21;
              _os_log_impl(&dword_1CCE01000, log, OS_LOG_TYPE_INFO, "%@ Response for characteristic %@ [%@] contains notification context %@", buf, 0x2Au);

              v29 = v46;
            }
          }

        }
        else
        {
          v21 = 0;
        }

LABEL_26:
        +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_34:
        goto LABEL_35;
      }
    }
    else if (v11 == 3)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v23 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v33 = v23;
        objc_msgSend(v7, "type");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "instanceID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v52 = a1;
        v53 = 2112;
        v54 = v35;
        v55 = 2112;
        v56 = v36;
        _os_log_error_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%@ Read response for %@ [%@] does not contain a value", buf, 0x20u);

      }
      objc_msgSend(v7, "setValue:", 0);
      objc_msgSend(v7, "setNotificationContext:", 0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    objc_msgSend(v5, "requestedValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "requestedValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:", v24);

      objc_msgSend(v7, "setNotificationContext:", 0);
      v13 = 0;
    }
    v21 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v7, "setValue:", 0);
  objc_msgSend(v7, "setNotificationContext:", 0);
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v9;
}

- (id)_errorIfResponseInvalid:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isValid") & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v16 = v12;
      objc_msgSend(v5, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412802;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = a1;
      _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%@ Response for %@ [%@] is invalid", (uint8_t *)&v28, 0x20u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 2;
    goto LABEL_24;
  }
  v6 = objc_msgSend(v3, "statusCode");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = (void *)hap2Log_accessory;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v20 = v7;
      objc_msgSend(v5, "type");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = a1;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v23;
      v34 = 1024;
      v35 = objc_msgSend(v3, "statusCode");
      _os_log_error_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%@ Response for characteristic: %@ [%@] contains a HAP status failure code: 0x%02x", (uint8_t *)&v28, 0x26u);

    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = objc_msgSend(v3, "statusCode");
    v10 = v9;
    v11 = 3;
    switch(v9)
    {
      case 0u:
        goto LABEL_23;
      case 1u:
      case 6u:
        goto LABEL_22;
      case 2u:
        v11 = 5;
        goto LABEL_22;
      case 3u:
        v11 = 16;
        goto LABEL_22;
      case 4u:
        v11 = 9;
        goto LABEL_22;
      case 5u:
        v11 = 17;
        goto LABEL_22;
      case 8u:
        v11 = 31;
        goto LABEL_22;
      default:
        v11 = 1;
LABEL_22:
        v10 = v11;
LABEL_23:
        v13 = v8;
        break;
    }
LABEL_24:
    objc_msgSend(v13, "hapErrorWithCode:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v24 = v7;
    objc_msgSend(v5, "type");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instanceID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412802;
    v29 = a1;
    v30 = 2112;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    _os_log_debug_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEBUG, "%@ Response for characteristic %@ [%@] contains a HAP status success code", (uint8_t *)&v28, 0x20u);

  }
  v14 = 0;
LABEL_25:

  return v14;
}

void __86__HAP2AccessoryServerEncodingThread__attributeDatabaseResponseFromBTLEResponse_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  id *location;
  id obj;
  _QWORD v48[3];
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t v60[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE buf[24];
  void *v65;
  id v66;
  uint64_t *v67;
  _QWORD *v68;
  uint64_t *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "accessoryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v36 = a1[4];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ Accessory contains no accessory id: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v8, "unsignedIntValue"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v40 = a1[4];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ Invalid accessory ID 0", buf, 0xCu);
    }
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "serviceList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serviceSignatureList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v32 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v41 = a1[4];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_error_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%@ Attribute database contains no service list for accessory: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1[5] + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      *a4 = 1;
      goto LABEL_50;
    }
    v18 = (void *)a1[4];
    v19 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v19 + 40);
    objc_msgSend(v18, "_parseServiceList:error:", v17, &obj);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v19 + 40), obj);
    v21 = (void *)objc_msgSend(v20, "copy");

    if (!v21)
      goto LABEL_44;
    v22 = a1[4];
    v23 = *(_QWORD *)(a1[5] + 8);
    v24 = *(id *)(v23 + 40);
    location = (id *)(v23 + 40);
    v25 = v21;
    v26 = v25;
    if (!v22)
    {

      objc_storeStrong(location, v24);
      goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 5 * objc_msgSend(v25, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__1871;
    v58 = __Block_byref_object_dispose__1872;
    v59 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v49 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke;
    v65 = &unk_1E8949E28;
    v67 = &v50;
    v68 = v48;
    v45 = v27;
    v66 = v45;
    v69 = &v54;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", buf);
    if (*((_BYTE *)v51 + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v28 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      *(_DWORD *)v60 = 138412290;
      v61 = v22;
      v29 = "%@ Invalid instanceID encountered";
      v30 = v28;
      v31 = 12;
    }
    else
    {
      if (!v55[5])
      {
        v38 = 1;
LABEL_38:

        _Block_object_dispose(v48, 8);
        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v54, 8);

        objc_storeStrong(location, v24);
        if ((v38 & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v26, v8);
LABEL_49:

LABEL_50:
          goto LABEL_19;
        }
LABEL_44:
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v43 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v44 = a1[4];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v6;
          _os_log_error_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%@ Attribute database contains invalid service list for accessory: %@", buf, 0x16u);
        }
        *a4 = 1;
        goto LABEL_49;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v37 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_37:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7, v22);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        goto LABEL_38;
      }
      v42 = v55[5];
      *(_DWORD *)v60 = 138412546;
      v61 = v22;
      v62 = 2112;
      v63 = v42;
      v29 = "%@ Multiple items with the same instanceID: %@";
      v30 = v37;
      v31 = 22;
    }
    _os_log_error_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, v29, v60, v31);
    goto LABEL_37;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v39 = a1[4];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Attribute database contains duplicate accessory entries: %@", buf, 0x16u);
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  *a4 = 1;
LABEL_19:

}

void __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  id v19;
  _QWORD v20[4];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v19 = a2;
  objc_msgSend(v19, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = *(_QWORD *)(a1[6] + 8);
    goto LABEL_5;
  }
  v8 = (void *)a1[4];
  objc_msgSend(v19, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(v19, "instanceID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(_QWORD *)(a1[6] + 8);
LABEL_5:
    *(_BYTE *)(v13 + 24) = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  v14 = (void *)a1[4];
  objc_msgSend(v19, "instanceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  objc_msgSend(v19, "characteristics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke_2;
  v20[3] = &unk_1E8949E00;
  v22 = a1[6];
  v18 = *((_OWORD *)a1 + 2);
  v17 = (id)v18;
  v21 = v18;
  v23 = a1[7];
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a4 = 1;

LABEL_9:
}

void __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v8 = (void *)a1[4];
    objc_msgSend(v16, "instanceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

    if (!(_DWORD)v8)
    {
      v14 = (void *)a1[4];
      objc_msgSend(v16, "instanceID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      goto LABEL_7;
    }
    objc_msgSend(v16, "instanceID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(_QWORD *)(a1[6] + 8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = *(_QWORD *)(a1[6] + 8);
  }
  *(_BYTE *)(v13 + 24) = 1;
  *a4 = 1;
LABEL_7:

}

void __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedChar:", objc_msgSend(v6, "unsignedCharValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

void __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HAPBTLEResponse *v5;

  v4 = a3;
  v5 = -[HAPBTLEResponse initWithRequest:]([HAPBTLEResponse alloc], "initWithRequest:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

void __87__HAP2AccessoryServerEncodingThread_notificationRequestsForCharacteristics_type_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v3 = 0;
  do
  {
    v4 = *(unsigned __int8 *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
    if (v5)
      v6 = ((unint64_t)objc_msgSend(v5, "encodingFeatures") >> 5) & 1;
    else
      v6 = 0;
    +[HAP2AccessoryServerEncodingThreadBTLERequest notificationRequestForCharacteristic:threadRequestType:enforcePDUBodyLength:](HAP2AccessoryServerEncodingThreadBTLERequest, "notificationRequestForCharacteristic:threadRequestType:enforcePDUBodyLength:", v26, v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 40);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedChar:", objc_msgSend(v10, "unsignedCharValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v11);

    v3 = v7;
  }
  while ((v8 & 1) != 0);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  v12 = *(void **)(a1 + 40);
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedChar:", objc_msgSend(v14, "unsignedCharValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  if (!*(_QWORD *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 32), "encodingFeatures") & 4) != 0)
  {
    v16 = 0;
    do
    {
      v17 = v16;
      +[HAP2AccessoryServerEncodingThreadBTLERequest readRequestForCharacteristic:](HAP2AccessoryServerEncodingThreadBTLERequest, "readRequestForCharacteristic:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *(void **)(a1 + 40);
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedChar:", objc_msgSend(v20, "unsignedCharValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v18, "containsObject:", v21);

    }
    while ((v18 & 1) != 0);
    v22 = *(void **)(a1 + 40);
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithUnsignedChar:", objc_msgSend(v24, "unsignedCharValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v25);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
  }

}

void __77__HAP2AccessoryServerEncodingThread__hapRequestsForBTLERequests_requestType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  HAP2EncodedCharacteristicRequestThread *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  HAP2EncodedCharacteristicRequestThread *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v5 = [HAP2EncodedCharacteristicRequestThread alloc];
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[5];
  v8 = a1[6];
  if (v7)
    v9 = ((unint64_t)objc_msgSend(v7, "encodingFeatures") >> 5) & 1;
  else
    v9 = 0;
  v10 = -[HAP2EncodedCharacteristicRequestThread initWithBTLERequests:requestType:enforcePDUBodyLength:](v5, "initWithBTLERequests:requestType:enforcePDUBodyLength:", v6, v8, v9);
  objc_msgSend(v4, "addObject:", v10);

}

void __81__HAP2AccessoryServerEncodingThread_executeWriteRequestForCharacteristics_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v9 + 40);
  +[HAP2AccessoryServerEncodingThreadBTLERequest executeWriteRequestForCharacteristic:value:options:error:](HAP2AccessoryServerEncodingThreadBTLERequest, "executeWriteRequestForCharacteristic:value:options:error:", v7, v8, 5, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  else
    *a4 = 1;

}

void __85__HAP2AccessoryServerEncodingThread_prepareWriteRequestForCharacteristics_ttl_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  +[HAP2AccessoryServerEncodingThreadBTLERequest prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:](HAP2AccessoryServerEncodingThreadBTLERequest, "prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:", v7, v8, v9, v10, 5, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  else
    *a4 = 1;

}

void __88__HAP2AccessoryServerEncodingThread_writeRequestForCharacteristics_shouldEncrypt_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE *v24;
  id obj;

  v24 = a4;
  v5 = a2;
  v6 = objc_msgSend(v5, "includeResponseValue");
  v7 = 0;
  v8 = 2;
  if (!v6)
    v8 = 0;
  v9 = v8 | *(unsigned __int8 *)(a1 + 56);
  while (1)
  {
    v10 = v7;
    objc_msgSend(v5, "characteristic", v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v15 + 40);
    +[HAP2AccessoryServerEncodingThreadBTLERequest writeRequestForCharacteristic:value:authorizationData:contextData:options:error:](HAP2AccessoryServerEncodingThreadBTLERequest, "writeRequestForCharacteristic:value:authorizationData:contextData:options:error:", v11, v12, v13, v14, v9, &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), obj);

    if (!v7)
      break;
    v16 = *(void **)(a1 + 32);
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedChar:", objc_msgSend(v18, "unsignedCharValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v19);

    if ((v16 & 1) == 0)
    {
      v20 = *(void **)(a1 + 32);
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithUnsignedChar:", objc_msgSend(v22, "unsignedCharValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      goto LABEL_8;
    }
  }
  *v24 = 1;
LABEL_8:

}

void __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5, v6, v7);

}

void __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "timedWrite");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    if (objc_msgSend(v5, "count"))
    {
      v6 = *(void **)(a1 + 32);
      v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
      objc_msgSend(v6, "addObject:", v7);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v11 = *(void **)(a1 + 32);
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    objc_msgSend(v5, "addObject:", v3);
  }

}

void __87__HAP2AccessoryServerEncodingThread_readRequestForCharacteristics_shouldEncrypt_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = 0;
  do
  {
    v5 = v4;
    +[HAP2AccessoryServerEncodingThreadBTLERequest readRequestForCharacteristic:](HAP2AccessoryServerEncodingThreadBTLERequest, "readRequestForCharacteristic:", a2);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedChar:", objc_msgSend(v8, "unsignedCharValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v9);

    v4 = v14;
  }
  while ((v6 & 1) != 0);
  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedChar:", objc_msgSend(v12, "unsignedCharValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
}

void __80__HAP2AccessoryServerEncodingThread_groupingsForReadRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5, v6, v7);

}

+ (id)_parseShortFormUUID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int8x16_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  int8x16_t v20;
  uint8_t buf[16];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  if (objc_msgSend(v5, "length") == 16)
  {
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v6, "getBytes:length:", buf, 16);
    v7 = vrev64q_s8(*(int8x16_t *)buf);
    v20 = vextq_s8(v7, v7, 8uLL);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v20);
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_24;
  }
  if ((unint64_t)objc_msgSend(v6, "length") >= 5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "Provided UUID has invalid length: %@", buf, 0xCu);
      if (a4)
        goto LABEL_10;
      goto LABEL_23;
    }
LABEL_9:
    if (a4)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v6, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v6);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  if (v15)
  {
    v16 = v15;
    v17 = v14 - 1;
    do
    {
      if (v16 == objc_msgSend(v13, "length"))
        v18 = CFSTR("%X");
      else
        v18 = CFSTR("%02X");
      objc_msgSend(v12, "appendFormat:", v18, *(unsigned __int8 *)(v17 + v16--));
    }
    while (v16);
  }
  v10 = (void *)objc_msgSend(v12, "copy");

LABEL_24:
  return v10;
}

@end
