@implementation HAP2AccessoryServerEncodingThreadBTLERequest

- (BOOL)expectsResponseBody
{
  unsigned int v3;
  uint64_t v4;
  char v5;

  if (!-[HAP2AccessoryServerEncodingThreadBTLERequest threadRequestType](self, "threadRequestType")
    || (v3 = -[HAP2AccessoryServerEncodingThreadBTLERequest threadRequestType](self, "threadRequestType") - 9, v3 >= 6))
  {
    LODWORD(v4) = -[HAPBTLERequest type](self, "type");
    if (v4 <= 8)
    {
      v5 = v4;
      LOBYTE(v4) = 1;
      if (((1 << v5) & 0x1CA) != 0)
        return v4;
      if (((1 << v5) & 0x24) != 0)
        return ((unint64_t)-[HAP2AccessoryServerEncodingThreadBTLERequest writeOptions](self, "writeOptions") >> 1) & 1;
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  LODWORD(v4) = (0x33u >> v3) & 1;
  return v4;
}

- (int64_t)writeOptions
{
  return self->_writeOptions;
}

- (unsigned)threadRequestType
{
  return self->_threadRequestType;
}

- (id)requestedValue
{
  return self->_requestedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestedValue, 0);
}

+ (id)readRequestForCharacteristic:(id)a3
{
  id v3;
  HAP2AccessoryServerEncodingThreadBTLERequest *v4;

  v3 = a3;
  v4 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAP2AccessoryServerEncodingThreadBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v3, 3, 0, 1, 900.0);

  return v4;
}

+ (id)notificationRequestForCharacteristic:(id)a3 threadRequestType:(unsigned __int8)a4 enforcePDUBodyLength:(BOOL)a5
{
  uint64_t v5;
  id v6;
  HAP2AccessoryServerEncodingThreadBTLERequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAP2AccessoryServerEncodingThreadBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v6, v5, 0, 1, 900.0);

  v7->_threadRequestType = v5;
  return v7;
}

+ (id)attributeDatabaseRequest
{
  HAP2AccessoryServerEncodingThreadBTLERequest *v2;

  v2 = -[HAPBTLERequest initWithRequestType:bodyData:shouldEncrypt:timeoutInterval:]([HAP2AccessoryServerEncodingThreadBTLERequest alloc], "initWithRequestType:bodyData:shouldEncrypt:timeoutInterval:", 9, 0, 1, 900.0);
  v2->_threadRequestType = 9;
  return v2;
}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  void *v15;
  HAP2AccessoryServerEncodingThreadBTLERequest *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v14 = a4;
  +[_HAPAccessoryServerBTLE200 writeRequestForCharacteristic:value:authorizationData:contextData:options:error:](_HAPAccessoryServerBTLE200, "writeRequestForCharacteristic:value:authorizationData:contextData:options:error:", a3, v14, a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    objc_msgSend(v15, "characteristic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "type");
    objc_msgSend(v15, "body");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "isEncrypted");
    objc_msgSend(v15, "timeoutInterval");
    v21 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v16, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v17, v18, v19, v20);

    if (v21)
    {
      *(_QWORD *)(v21 + 88) = a7;
      objc_storeStrong((id *)(v21 + 96), a4);
      v22 = (id)v21;
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v21 = 0;
  }

  return (id)v21;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  void *v15;
  HAP2AccessoryServerEncodingThreadBTLERequest *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v14 = a4;
  +[_HAPAccessoryServerBTLE200 prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:](_HAPAccessoryServerBTLE200, "prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:", a3, v14, a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    objc_msgSend(v15, "characteristic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "type");
    objc_msgSend(v15, "body");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "isEncrypted");
    objc_msgSend(v15, "timeoutInterval");
    v21 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v16, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v17, v18, v19, v20);

    if (v21)
    {
      *(_QWORD *)(v21 + 88) = a7;
      objc_storeStrong((id *)(v21 + 96), a4);
      v22 = (id)v21;
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v21 = 0;
  }

  return (id)v21;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  HAP2AccessoryServerEncodingThreadBTLERequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v10 = a4;
  +[_HAPAccessoryServerBTLE200 executeWriteRequestForCharacteristic:options:error:](_HAPAccessoryServerBTLE200, "executeWriteRequestForCharacteristic:options:error:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    objc_msgSend(v11, "characteristic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "type");
    objc_msgSend(v11, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "isEncrypted");
    objc_msgSend(v11, "timeoutInterval");
    v17 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v12, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v13, v14, v15, v16);

    if (v17)
    {
      *(_QWORD *)(v17 + 88) = a5;
      objc_storeStrong((id *)(v17 + 96), a4);
      v18 = (id)v17;
    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
  }

  return (id)v17;
}

@end
