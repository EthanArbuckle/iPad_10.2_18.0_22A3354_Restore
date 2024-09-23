@implementation HAP2AccessoryServerControllerReadOperation

- (HAP2AccessoryServerControllerReadOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 readRequest:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11
{
  id v19;
  HAP2AccessoryServerControllerReadOperation *v20;
  HAP2AccessoryServerControllerReadOperation *v21;
  objc_super v23;

  v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
  v20 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](&v23, sel_initWithName_controller_encoding_transport_request_endpoint_mimeType_timeout_options_, a3, a4, a5, a6, v19, a8, a10, a9, a11);
  v21 = v20;
  if (v20)
    objc_storeStrong((id *)&v20->_readRequest, a7);

  return v21;
}

- (void)_sendRequest
{
  HAP2EncodedRequest *v3;
  HAP2ControllerReadRequest *readRequest;
  HAP2ControllerReadRequest *v5;
  void *v6;
  HAP2ControllerReadRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  HAP2ControllerReadRequest *v11;
  HAP2ControllerReadRequest *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  HAP2AccessoryServerEncoding *encoding;
  HAP2AccessoryServerEncoding *v19;
  void *v20;
  void *v21;
  id v22;
  HAP2AccessoryServerControllerReadOperation *v23;
  void *v24;
  NSObject *v25;
  HAP2EncodedCharacteristicResponse *v26;
  HAP2EncodedCharacteristicResponse *v27;
  NSObject *v28;
  objc_super v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  HAP2AccessoryServerControllerReadOperation *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
  {
    if (self)
    {
      v3 = self->super._request;
      readRequest = self->_readRequest;

      if (v3 != (HAP2EncodedRequest *)readRequest)
      {
LABEL_26:
        v29.receiver = self;
        v29.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
        -[HAP2AccessoryServerControllerOperation _sendRequest](&v29, sel__sendRequest);
        return;
      }
      v5 = self->_readRequest;
    }
    else
    {
      v5 = 0;
    }
    v6 = (void *)MEMORY[0x1E0C99DE8];
    v7 = v5;
    -[HAP2ControllerReadRequest originalCharacteristics](v7, "originalCharacteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v11 = self->_readRequest;
    else
      v11 = 0;
    v12 = v11;
    -[HAP2ControllerReadRequest originalCharacteristics](v12, "originalCharacteristics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__HAP2AccessoryServerControllerReadOperation__sendRequest__block_invoke;
    v31[3] = &unk_1E894A6E8;
    v31[4] = self;
    v14 = v10;
    v32 = v14;
    v15 = v9;

    v33 = v15;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v31);

    v16 = (void *)objc_msgSend(v14, "copy");
    if (self)
      objc_storeStrong((id *)&self->_cachedCharacteristicIndices, v16);

    v17 = objc_msgSend(v15, "count");
    if (v17)
    {
      if (self)
        encoding = self->super._encoding;
      else
        encoding = 0;
      v19 = encoding;
      v20 = (void *)objc_msgSend(v15, "copy");
      v30 = 0;
      -[HAP2AccessoryServerEncoding readRequestForCharacteristics:shouldEncrypt:error:](v19, "readRequestForCharacteristics:shouldEncrypt:error:", v20, 1, &v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v30;

      if (v21)
      {
        v23 = self;
        v24 = v21;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v28 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v35 = self;
          v36 = 2112;
          v37 = v22;
          _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%@ Unable to create request for characteristics: %@", buf, 0x16u);
        }
        -[HAP2AccessoryServerControllerOperation finishWithError:](self, "finishWithError:", v22);
        v23 = self;
        v24 = 0;
      }
      -[HAP2AccessoryServerControllerOperation setRequest:]((uint64_t)v23, v24);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v25 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%@ All characteristics were cached, not sending request", buf, 0xCu);
      }
      v26 = [HAP2EncodedCharacteristicResponse alloc];
      v27 = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](v26, "initWithCharacteristics:", MEMORY[0x1E0C9AA60]);
      -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v27);

      -[HAP2AccessoryServerControllerOperation finish](self, "finish");
    }

    if (v17)
      goto LABEL_26;
  }
}

- (id)_HAP2AutoUpdateCachedCountdownCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  HAP2AccessoryServerControllerReadOperation *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("000000D4-0000-1000-8000-0026BB765291")) & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (!v7)
  {
LABEL_11:
    v8 = v4;
    goto LABEL_12;
  }
  v8 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueUpdatedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = (unint64_t)v11;

  if (v12)
  {
    objc_msgSend(v8, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (v14 > v12)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "unsignedIntegerValue") - v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:", v17);

      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v18 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        objc_msgSend(v8, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = self;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEFAULT, "%@ Auto updating countdown counter value to: %@", (uint8_t *)&v22, 0x16u);

      }
    }
  }

LABEL_12:
  return v8;
}

- (void)_cleanUp
{
  HAP2EncodedResponse *v3;
  HAP2EncodedResponse *v4;
  NSUInteger v5;
  HAP2EncodedResponse *v6;
  HAP2EncodedResponse *v7;
  HAP2ControllerReadRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  NSIndexSet *cachedCharacteristicIndices;
  id v13;
  id v14;
  HAP2EncodedCharacteristicResponse *v15;
  void *v16;
  HAP2EncodedCharacteristicResponse *v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  id v21;

  if (self)
  {
    v3 = self->super._response;
    if (v3)
    {
      v4 = v3;
      v5 = -[NSIndexSet count](self->_cachedCharacteristicIndices, "count");

      if (v5)
      {
        v6 = self->super._response;
        if (-[HAP2EncodedResponse conformsToProtocol:](v6, "conformsToProtocol:", &unk_1EFA35DE8))
          v7 = self->super._response;
        else
          v7 = 0;

        v8 = self->_readRequest;
        -[HAP2ControllerReadRequest originalCharacteristics](v8, "originalCharacteristics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2EncodedResponse characteristics](v7, "characteristics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        cachedCharacteristicIndices = self->_cachedCharacteristicIndices;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __54__HAP2AccessoryServerControllerReadOperation__cleanUp__block_invoke;
        v19[3] = &unk_1E894A718;
        v19[4] = self;
        v20 = v9;
        v21 = v11;
        v13 = v11;
        v14 = v9;
        -[NSIndexSet enumerateIndexesUsingBlock:](cachedCharacteristicIndices, "enumerateIndexesUsingBlock:", v19);
        v15 = [HAP2EncodedCharacteristicResponse alloc];
        v16 = (void *)objc_msgSend(v13, "copy");
        v17 = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](v15, "initWithCharacteristics:", v16);
        -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v17);

      }
    }
    objc_storeStrong((id *)&self->super._request, self->_readRequest);
  }
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
  -[HAP2AccessoryServerControllerOperation _cleanUp](&v18, sel__cleanUp);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readRequest, 0);
  objc_storeStrong((id *)&self->_cachedCharacteristicIndices, 0);
}

void __54__HAP2AccessoryServerControllerReadOperation__cleanUp__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_HAP2AutoUpdateCachedCountdownCharacteristic:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v7, a2);
}

void __58__HAP2AccessoryServerControllerReadOperation__sendRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!objc_msgSend(v5, "hap2_canUseCachedValue")
    || (v6 = *(_QWORD *)(a1 + 32)) != 0 && (*(_BYTE *)(v6 + 344) & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v7;
      objc_msgSend(v5, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Characteristic %@ [%@] is cached", (uint8_t *)&v13, 0x20u);

    }
  }

}

@end
