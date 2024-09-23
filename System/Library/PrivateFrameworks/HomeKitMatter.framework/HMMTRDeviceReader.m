@implementation HMMTRDeviceReader

- (HMMTRDeviceReader)initWithClientQueue:(id)a3 distributor:(id)a4 device:(id)a5 endpointID:(id)a6 clusterID:(id)a7 attributeID:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMMTRDeviceReader *v18;
  HMMTRDeviceReader *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRDeviceReader;
  v18 = -[HMMTRDeviceReader init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientQueue, a3);
    objc_storeStrong((id *)&v19->_distributor, a4);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeStrong((id *)&v19->_endpointID, a6);
    objc_storeStrong((id *)&v19->_clusterID, a7);
    objc_storeStrong((id *)&v19->_attributeID, a8);
    v19->_reportTimeoutNSecs = 60000000000;
  }

  return v19;
}

- (void)readAttributeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  dispatch_time_t v35;
  NSObject *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD block[4];
  id v57;
  id v58;

  v4 = a3;
  -[HMMTRDeviceReader device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader endpointID](self, "endpointID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader clusterID](self, "clusterID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader attributeID](self, "attributeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v5, "readAttributeWithEndpointID:clusterID:attributeID:params:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRDeviceReader clientQueue](self, "clientQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke;
    block[3] = &unk_250F22768;
    v58 = v4;
    v57 = v10;
    dispatch_async(v11, block);

    v12 = v58;
  }
  else
  {
    -[HMMTRDeviceReader device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRDeviceReader endpointID](self, "endpointID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRDeviceReader clusterID](self, "clusterID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    objc_msgSend(v13, "readAttributeWithEndpointID:clusterID:attributeID:params:", v14, v15, &unk_250F3F5B8, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v12, CFSTR("AttributeList"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;
      -[HMMTRDeviceReader attributeID](self, "attributeID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsObject:", v20);

      -[HMMTRDeviceReader clientQueue](self, "clientQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      if ((v21 & 1) != 0)
      {
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2;
        v52[3] = &unk_250F22768;
        v52[4] = self;
        v53 = v4;
        dispatch_async(v22, v52);

        v23 = v53;
      }
      else
      {
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_5;
        v54[3] = &unk_250F22988;
        v55 = v4;
        dispatch_async(v22, v54);

        v23 = v55;
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x24BDDB538];
      -[HMMTRDeviceReader endpointID](self, "endpointID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRDeviceReader clusterID](self, "clusterID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "attributePathWithEndpointID:clusterID:attributeID:", v25, v26, &unk_250F3F5B8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__4777;
      v50 = __Block_byref_object_dispose__4778;
      v51 = 0;
      -[HMMTRDeviceReader distributor](self, "distributor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRDeviceReader clientQueue](self, "clientQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x24BDAC760];
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_7;
      v42[3] = &unk_250F21248;
      v45 = &v46;
      v42[4] = self;
      v31 = v27;
      v43 = v31;
      v32 = v4;
      v44 = v32;
      objc_msgSend(v28, "registerHandlerForAttributePath:queue:handler:", v31, v29, v42);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v47[5];
      v47[5] = v33;

      v35 = dispatch_time(0, -[HMMTRDeviceReader reportTimeoutNSecs](self, "reportTimeoutNSecs"));
      -[HMMTRDeviceReader clientQueue](self, "clientQueue");
      v36 = objc_claimAutoreleasedReturnValue();
      v38[0] = v30;
      v38[1] = 3221225472;
      v38[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2_9;
      v38[3] = &unk_250F238B8;
      v41 = &v46;
      v38[4] = self;
      v39 = v31;
      v40 = v32;
      v37 = v31;
      dispatch_after(v35, v36, v38);

      _Block_object_dispose(&v46, 8);
      v12 = 0;
    }
  }

}

- (void)_readAttributeAfterAttributeListConfirmationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  dispatch_time_t v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD block[4];
  id v43;
  id v44;

  v4 = a3;
  -[HMMTRDeviceReader device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader endpointID](self, "endpointID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader clusterID](self, "clusterID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceReader attributeID](self, "attributeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v5, "readAttributeWithEndpointID:clusterID:attributeID:params:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRDeviceReader clientQueue](self, "clientQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke;
    block[3] = &unk_250F22768;
    v44 = v4;
    v43 = v10;
    v12 = v4;
    dispatch_async(v11, block);

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDDB538];
    -[HMMTRDeviceReader endpointID](self, "endpointID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRDeviceReader clusterID](self, "clusterID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRDeviceReader attributeID](self, "attributeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributePathWithEndpointID:clusterID:attributeID:", v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__4777;
    v40 = __Block_byref_object_dispose__4778;
    v41 = 0;
    -[HMMTRDeviceReader distributor](self, "distributor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRDeviceReader clientQueue](self, "clientQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_2;
    v32[3] = &unk_250F21248;
    v35 = &v36;
    v32[4] = self;
    v21 = v17;
    v33 = v21;
    v22 = v4;
    v34 = v22;
    objc_msgSend(v18, "registerHandlerForAttributePath:queue:handler:", v21, v19, v32);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v37[5];
    v37[5] = v23;

    v25 = dispatch_time(0, -[HMMTRDeviceReader reportTimeoutNSecs](self, "reportTimeoutNSecs"));
    -[HMMTRDeviceReader clientQueue](self, "clientQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    v28[1] = 3221225472;
    v28[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_3;
    v28[3] = &unk_250F238B8;
    v28[4] = self;
    v29 = v21;
    v30 = v22;
    v31 = &v36;
    v27 = v22;
    v12 = v21;
    dispatch_after(v25, v26, v28);

    _Block_object_dispose(&v36, 8);
  }

}

- (int64_t)reportTimeoutNSecs
{
  return self->_reportTimeoutNSecs;
}

- (void)setReportTimeoutNSecs:(int64_t)a3
{
  self->_reportTimeoutNSecs = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMMTRAttributeReportDistributor)distributor
{
  return (HMMTRAttributeReportDistributor *)objc_getProperty(self, a2, 24, 1);
}

- (MTRDevice)device
{
  return (MTRDevice *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)endpointID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)clusterID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)attributeID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_distributor, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

uint64_t __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v14 = v3;
    objc_msgSend(*(id *)(a1 + 32), "distributor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deregisterHandlerForAttributePath:registry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    v7 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endpointID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clusterID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "attributeID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v8, "readAttributeWithEndpointID:clusterID:attributeID:params:", v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v13);

    }
    v3 = v14;
  }

}

uint64_t __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_3(uint64_t result)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = (_QWORD *)result;
    objc_msgSend(*(id *)(result + 32), "distributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deregisterHandlerForAttributePath:registry:", v1[5], *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40));

    v3 = *(_QWORD *)(v1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    return (*(uint64_t (**)(void))(v1[6] + 16))();
  }
  return result;
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readAttributeAfterAttributeListConfirmationWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v19 = v3;
    objc_msgSend(*(id *)(a1 + 32), "distributor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deregisterHandlerForAttributePath:registry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    if (v19)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      objc_msgSend(*(id *)(a1 + 32), "attributeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if ((v11 & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "_readAttributeAfterAttributeListConfirmationWithCompletionHandler:", *(_QWORD *)(a1 + 48));
      else
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endpointID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clusterID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "attributeID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      objc_msgSend(v13, "readAttributeWithEndpointID:clusterID:attributeID:params:", v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v18);

    }
    v3 = v19;
  }

}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2_9(uint64_t result)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = (_QWORD *)result;
    objc_msgSend(*(id *)(result + 32), "distributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deregisterHandlerForAttributePath:registry:", v1[5], *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40));

    v3 = *(_QWORD *)(v1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    return (*(uint64_t (**)(void))(v1[6] + 16))();
  }
  return result;
}

@end
