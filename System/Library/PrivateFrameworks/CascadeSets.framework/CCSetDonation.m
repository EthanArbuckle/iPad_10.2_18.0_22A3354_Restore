@implementation CCSetDonation

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  int v9;
  int itemType;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t flushThreshold;
  unint64_t v38;
  NSString *name;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (CCValidateNonNilField((uint64_t)CFSTR("item"), (uint64_t)v6, a4))
  {
    v7 = (objc_class *)objc_opt_class();
    if (CCValidateIsInstanceOfExpectedClass(CFSTR("item"), v6, v7, a4))
    {
      objc_msgSend(v6, "content");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend((id)objc_opt_class(), "itemType");
      itemType = self->_itemType;

      if (v9 == itemType)
      {
        objc_msgSend(v6, "metaContent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend((id)objc_opt_class(), "itemType");
        v13 = self->_itemType;

        if (v12 == v13)
        {
          objc_msgSend(v6, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = (void *)MEMORY[0x24BDD1540];
            v51 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item has invalid content buffer: %@"), self, v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v18;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v26;
            goto LABEL_13;
          }
          v16 = objc_msgSend(v15, "length");
          if (v16 >= 0xC801)
          {
            v17 = (void *)MEMORY[0x24BDD1540];
            v49 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item content must be less than %lu bytes, received %lu: %@"), self, 51200, v16, v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v18;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v17;
LABEL_13:
            objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 4, v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            CCSetError(a4, v27);

            goto LABEL_14;
          }
          objc_msgSend(v6, "metaContent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "data");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "length"))
          {
            v30 = objc_msgSend(v18, "length");
            if (v30 < 0xC801)
            {
              if (self->_service)
              {
                -[NSMutableArray addObject:](self->_contentBuffers, "addObject:", v15);
                -[NSMutableArray addObject:](self->_metaContentBuffers, "addObject:", v18);
                flushThreshold = self->_flushThreshold;
                v38 = v30 + v16 + self->_bufferSize;
                self->_bufferSize = v38;
                v21 = v38 < flushThreshold || -[CCSetDonation _flushItemsWithError:](self, "_flushItemsWithError:", a4);
                goto LABEL_16;
              }
              name = self->_name;
              v40 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v6, "metaContent");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "sourceItemIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "stringWithFormat:", CFSTR("add item with sourceItemIdentifier: %@"), v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              _donationInactiveError((uint64_t)name, (uint64_t)v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              CCSetError(a4, v44);

LABEL_15:
              v21 = 0;
LABEL_16:

              goto LABEL_17;
            }
            v31 = (void *)MEMORY[0x24BDD1540];
            v45 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item meta content must be less than %lu bytes, received %lu: %@"), self, 51200, v30, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 4, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            CCSetError(a4, v33);

          }
          else
          {
            v34 = (void *)MEMORY[0x24BDD1540];
            v47 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item has invalid meta content buffer: %@"), self, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 4, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            CCSetError(a4, v36);

          }
LABEL_14:

          goto LABEL_15;
        }
        v22 = (void *)MEMORY[0x24BDD1540];
        v53 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item metaContent must have itemType: %hu. Received: %@"), self, self->_itemType, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v15;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = &v54;
        v25 = &v53;
      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ item content must have itemType: %hu. Received: %@"), self, self->_itemType, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v15;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = (void **)v56;
        v25 = &v55;
      }
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v19);
      goto LABEL_14;
    }
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (BOOL)_flushItemsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  CCDonateService *service;
  unsigned int v9;
  BOOL v10;
  void *v11;
  CCDonateService *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __int16 v18;

  if (!-[NSMutableArray count](self->_contentBuffers, "count"))
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("add %u item(s)"), -[NSMutableArray count](self->_contentBuffers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableArray copy](self->_contentBuffers, "copy");
  v7 = (void *)-[NSMutableArray copy](self->_metaContentBuffers, "copy");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  service = self->_service;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__CCSetDonation__flushItemsWithError___block_invoke;
  v14[3] = &unk_250990AE0;
  v14[4] = &v15;
  -[CCDonateService addItemsWithContents:metaContents:completion:](service, "addItemsWithContents:metaContents:completion:", v6, v7, v14);
  -[NSMutableArray removeAllObjects](self->_contentBuffers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_metaContentBuffers, "removeAllObjects");
  self->_bufferSize = 0;
  v9 = *((unsigned __int16 *)v16 + 12);
  v10 = v9 == 7;
  if (v9 != 7)
  {
    _donationResponseError(self->_name, v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v11);

    v12 = self->_service;
    self->_service = 0;

  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_opt_class();
  _sharedXPCClientFactory();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullSetDonationWithItemType:forAccount:descriptors:serviceProvider:completion:", v8, v11, v10, v13, v9);

}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 serviceProvider:(id)a6 completion:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v10 = a3;
  v12 = a7;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __95__CCSetDonation_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion___block_invoke;
  v19[3] = &unk_2509909A0;
  v20 = v12;
  v13 = v12;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = (void *)MEMORY[0x23B820934](v19);
  _sharedQueue();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setDonationWithItemType:forAccount:descriptors:fromDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:", v10, v16, v15, 0, 0, 0, v14, v18, 120000000000, v17);

}

+ (void)_setDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 fromDevice:(id)a6 version:(unint64_t)a7 validity:(id)a8 serviceProvider:(id)a9 queue:(id)a10 timeoutNanos:(unint64_t)delta completion:(id)a12
{
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id *v36;
  void *v37;
  id v38;
  dispatch_time_t when;
  id v40;
  NSObject *queue;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  id v54[2];
  _QWORD v55[4];
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  _QWORD *v60;
  __int16 v61;
  _QWORD v62[4];
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  __int16 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[6];
  _QWORD v77[5];
  id v78;
  _QWORD v79[3];
  char v80;
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v16 = a3;
  v83 = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  v18 = a5;
  v46 = a6;
  v47 = a8;
  v48 = a9;
  v19 = a10;
  v20 = a12;
  v21 = v20;
  if (v20)
  {
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    v80 = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__2;
    v77[4] = __Block_byref_object_dispose__2;
    v78 = (id)MEMORY[0x23B820934](v20);
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke;
    v76[3] = &unk_2509909F0;
    v76[4] = v79;
    v76[5] = v77;
    v45 = (void *)MEMORY[0x23B820934](v76);
    v22 = v18;
    v23 = v22;
    if (v17)
    {
      v75 = 0;
      CCAddAcountInfoToDescriptors(v22, (uint64_t)v17, (uint64_t)&v75);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v75;

      if (!v24)
      {
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2;
        v72[3] = &unk_250990A18;
        v73 = v25;
        v74 = v45;
        v24 = v25;
        dispatch_async(v19, v72);

        v30 = v74;
LABEL_21:

        _Block_object_dispose(v77, 8);
        _Block_object_dispose(v79, 8);
        goto LABEL_22;
      }

    }
    else
    {
      v24 = v22;
    }
    CCTypeIdentifierRegistryBridge();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isValidItemType:", v16);

    if ((v28 & 1) != 0)
    {
      v68 = 0;
      +[BMResourceDescriptor encodedStringFromDescriptors:error:](CCSetDescriptor, "encodedStringFromDescriptors:error:", v24, &v68);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v68;
      v44 = v29;
      if (v29)
      {
        CCDonateServiceRequestDescription(a7, v47, v16, v29);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "makeConnection:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          __biome_log_for_category();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v43;
            _os_log_impl(&dword_237B25000, v31, OS_LOG_TYPE_DEFAULT, "Requesting new set donation %@", buf, 0xCu);
          }

          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_18;
          v55[3] = &unk_250990A90;
          queue = v19;
          v56 = queue;
          v60 = v79;
          v32 = v43;
          v57 = v32;
          v40 = v45;
          v59 = v40;
          v61 = v16;
          v33 = v42;
          v58 = v33;
          objc_msgSend(v33, "beginSetDonationWithItemType:fromDevice:encodedDescriptors:version:validity:completion:", v16, v46, v44, a7, v47, v55);
          objc_initWeak((id *)buf, v33);
          when = dispatch_time(0, delta);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_23;
          block[3] = &unk_250990AB8;
          v53 = v79;
          objc_copyWeak(v54, (id *)buf);
          v54[1] = (id)delta;
          v50 = v32;
          v51 = v48;
          v52 = v40;
          v34 = v32;
          dispatch_after(when, queue, block);

          objc_destroyWeak(v54);
          objc_destroyWeak((id *)buf);

          v35 = (id *)&v56;
          v36 = &v57;
        }
        else
        {
          v62[0] = MEMORY[0x24BDAC760];
          v62[1] = 3221225472;
          v62[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_5;
          v62[3] = &unk_250990A18;
          v35 = &v64;
          v36 = &v63;
          v63 = v43;
          v64 = v45;
          v38 = v43;
          dispatch_async(v19, v62);
        }

        v37 = v42;
      }
      else
      {
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_4;
        v65[3] = &unk_250990A18;
        v67 = v45;
        v66 = v30;
        dispatch_async(v19, v65);

        v37 = v67;
      }

    }
    else
    {
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_3;
      v69[3] = &unk_250990A40;
      v70 = v45;
      v71 = v16;
      dispatch_async(v19, v69);
      v30 = v70;
    }
    goto LABEL_21;
  }
  __biome_log_for_category();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    +[CCSetDonation _setDonationWithItemType:forAccount:descriptors:fromDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:].cold.1(v26);

LABEL_22:
}

- (BOOL)finish:(id *)a3
{
  return -[CCSetDonation finishWithOptions:error:](self, "finishWithOptions:error:", 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[CCSetDonation cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CCSetDonation;
  -[CCSetDonation dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  CCDonateService *service;
  CCDonateService *v4;

  service = self->_service;
  if (service)
  {
    -[CCDonateService abortSetDonation](service, "abortSetDonation");
    v4 = self->_service;
    self->_service = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentBuffers, 0);
  objc_storeStrong((id *)&self->_contentBuffers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __95__CCSetDonation_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)donationWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:itemType:service:payload:flushThreshold:", v10, v7, v9, a6, 20480);

  return v11;
}

- (CCSetDonation)initWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6 flushThreshold:(unint64_t)a7
{
  id v12;
  id v13;
  CCSetDonation *v14;
  CCSetDonation *v15;
  void *v16;
  uint64_t v17;
  NSString *name;
  NSMutableArray *v19;
  NSMutableArray *contentBuffers;
  NSMutableArray *v21;
  NSMutableArray *metaContentBuffers;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CCSetDonation *v26;
  unint64_t v27;
  objc_super v29;
  objc_super v30;

  v12 = a3;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CCSetDonation;
  v14 = -[CCSetDonation init](&v30, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_8;
  v29.receiver = v14;
  v29.super_class = (Class)CCSetDonation;
  -[CCSetDonation description](&v29, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", v12);
  v17 = objc_claimAutoreleasedReturnValue();
  name = v15->_name;
  v15->_name = (NSString *)v17;

  objc_storeStrong((id *)&v15->_service, a5);
  v15->_itemType = a4;
  v15->_flushThreshold = a7;
  v15->_bufferSize = 0;
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  contentBuffers = v15->_contentBuffers;
  v15->_contentBuffers = v19;

  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  metaContentBuffers = v15->_metaContentBuffers;
  v15->_metaContentBuffers = v21;

  v23 = objc_opt_class();
  if (v23 == objc_opt_class())
    goto LABEL_5;
  v24 = objc_opt_class();
  if (v24 == objc_opt_class())
  {
    v27 = a6;
    a6 = 0;
    goto LABEL_7;
  }
  v25 = objc_opt_class();
  v26 = 0;
  if (v25 == objc_opt_class())
  {
LABEL_5:
    v27 = 0;
LABEL_7:
    v15->_priorVersion = v27;
    v15->_errorCode = a6;
LABEL_8:
    v26 = v15;
  }

  return v26;
}

uint64_t __38__CCSetDonation__flushItemsWithError___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (CCSetDonation)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  _sharedXPCClientFactory();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullSetDonationWithItemType:forAccount:descriptors:serviceProvider:completion:", v6, 0, v8, v10, v7);

}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 completion:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a3;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = (void *)objc_opt_class();
  _sharedXPCClientFactory();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "incrementalSetDonationWithItemType:forAccount:descriptors:version:validity:serviceProvider:completion:", v10, 0, v13, a5, v12, v15, v11);

}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v12 = a3;
  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = (void *)objc_opt_class();
  _sharedXPCClientFactory();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "incrementalSetDonationWithItemType:forAccount:descriptors:version:validity:serviceProvider:completion:", v12, v16, v15, a6, v14, v18, v13);

}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend((id)objc_opt_class(), "fullSetDonationWithItemType:forAccount:descriptors:serviceProvider:completion:", v8, 0, v11, v10, v9);

}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 serviceProvider:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  objc_msgSend((id)objc_opt_class(), "incrementalSetDonationWithItemType:forAccount:descriptors:version:validity:serviceProvider:completion:", v12, 0, v16, a5, v15, v14, v13);

}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 serviceProvider:(id)a8 completion:(id)a9
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v14 = a3;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  _sharedQueue();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setDonationWithItemType:forAccount:descriptors:fromDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:", v14, v20, v19, 0, a6, v18, v17, v21, 120000000000, v16);

}

+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  _sharedXPCClientFactory();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteSetWithItemType:descriptors:serviceProvider:completion:", v6, v9, v10, v8);

}

+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__CCSetDonation_deleteSetWithItemType_descriptors_serviceProvider_completion___block_invoke;
  v12[3] = &unk_2509909C8;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "fullSetDonationWithItemType:descriptors:serviceProvider:completion:", v8, a4, a5, v12);

}

void __78__CCSetDonation_deleteSetWithItemType_descriptors_serviceProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = 0;
    objc_msgSend(v5, "finishWithOptions:error:", 1, &v11);
    v8 = v11;
    v9 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if (v9)
      {
        v10 = *(void (**)(void))(v9 + 16);
LABEL_9:
        v10();
      }
    }
    else if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
LABEL_11:

}

+ (void)remoteCRDTSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 fromDevice:(id)a5 descriptors:(id)a6 serviceProvider:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v12 = a3;
  v14 = a8;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __112__CCSetDonation_remoteCRDTSetDonationWithItemType_forAccount_fromDevice_descriptors_serviceProvider_completion___block_invoke;
  v23[3] = &unk_2509909A0;
  v24 = v14;
  v15 = v14;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = (void *)MEMORY[0x23B820934](v23);
  v21 = v16;
  if (!v16)
  {
    _sharedXPCClientFactory();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _sharedQueue();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setDonationWithItemType:forAccount:descriptors:fromDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:", v12, v19, v17, v18, 0, 0, v21, v22, 120000000000, v20);

  if (!v16)
}

uint64_t __112__CCSetDonation_remoteCRDTSetDonationWithItemType_forAccount_fromDevice_descriptors_serviceProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD0FC8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  CCTypeIdentifierRegistryBridge();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForTypeIdentifier:", *(unsigned __int16 *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Invalid itemType: %@"), v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

uint64_t __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1540];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to establish connection to donate service for set donation %@"), *(_QWORD *)(a1 + 32), *MEMORY[0x24BDD0FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v5);

}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_18(uint64_t a1, __int16 a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_19;
  v6[3] = &unk_250990A68;
  v12 = a2;
  v10 = *(_QWORD *)(a1 + 64);
  v5 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v13 = *(_WORD *)(a1 + 72);
  v8 = *(id *)(a1 + 48);
  v11 = a3;
  dispatch_async(v5, v6);

}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_19(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __objc2_class *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CCDonateServiceResponseDescription(*(unsigned __int16 *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_19_cold_1((uint64_t)v2, a1, v5);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_237B25000, v5, OS_LOG_TYPE_DEFAULT, "Service responded to request for new donation %@ with %@", buf, 0x16u);
    }

    v7 = *(unsigned __int16 *)(a1 + 72);
    switch(v7)
    {
      case 3:
        v8 = *(_QWORD *)(a1 + 48);
        v9 = CCRemoteCRDTSetDonation;
        break;
      case 2:
        v8 = *(_QWORD *)(a1 + 48);
        v9 = CCIncrementalSetDonation;
        break;
      case 1:
        v8 = *(_QWORD *)(a1 + 48);
        v9 = CCFullSetDonation;
        break;
      default:
        v10 = *(_QWORD *)(a1 + 48);
        v11 = (void *)MEMORY[0x24BDD1540];
        v12 = CCDonateErrorCodeFromServiceResponse(v7);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open set donation %@ - %@"), *(_QWORD *)(a1 + 32), v2, *MEMORY[0x24BDD0FC8]);
        v5 = objc_claimAutoreleasedReturnValue();
        v16 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v14);

        goto LABEL_14;
    }
    -[__objc2_class donationWithName:itemType:service:payload:](v9, "donationWithName:itemType:service:payload:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 74), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, NSObject *, _QWORD))(v8 + 16))(v8, v5, 0);
  }
LABEL_14:

}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_23(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Client timed out waiting %lf seconds for donate service to accept a new donation %@"), (double)*(unint64_t *)(a1 + 72) / 1000000000.0, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_23_cold_1((uint64_t)v3, v4);

    objc_msgSend(*(id *)(a1 + 40), "terminateConnection:", WeakRetained);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

  }
}

- (id)description
{
  return self->_name;
}

- (BOOL)removeSourceItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  CCDonateService *service;
  unsigned int v11;
  BOOL v12;
  void *v13;
  CCDonateService *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  if (CCValidateIsInstanceOfExpectedClass(CFSTR("sourceItemIdentifier"), v6, v7, a4))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remove sourceItemIdentifier: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      service = self->_service;
      if (service)
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x2020000000;
        v24 = 0;
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __50__CCSetDonation_removeSourceItemIdentifier_error___block_invoke;
        v20[3] = &unk_250990AE0;
        v20[4] = &v21;
        -[CCDonateService removeSourceItemIdentifier:completion:](service, "removeSourceItemIdentifier:completion:", v8, v20);
        v11 = *((unsigned __int16 *)v22 + 12);
        v12 = v11 == 7;
        if (v11 != 7)
        {
          _donationResponseError(self->_name, v9, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a4, v13);

          v14 = self->_service;
          self->_service = 0;

        }
        _Block_object_dispose(&v21, 8);
        goto LABEL_11;
      }
      _donationInactiveError((uint64_t)self->_name, (uint64_t)v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v18);

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ sourceItemIdentifier is invalid: \"%@\"), self, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 7, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v17);

    }
    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

uint64_t __50__CCSetDonation_removeSourceItemIdentifier_error___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)finishWithOptions:(unint64_t)a3 error:(id *)a4
{
  CCDonateService *service;
  CCDonateService *v8;
  unsigned int v9;
  BOOL v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __int16 v18;

  if (!self->_service)
  {
    _donationInactiveError((uint64_t)self->_name, (uint64_t)CFSTR("finish"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a4, v12);

    return 0;
  }
  if (!-[CCSetDonation _flushItemsWithError:](self, "_flushItemsWithError:", a4))
  {
    -[CCSetDonation cancel](self, "cancel");
    return 0;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  service = self->_service;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__CCSetDonation_finishWithOptions_error___block_invoke;
  v14[3] = &unk_250990AE0;
  v14[4] = &v15;
  -[CCDonateService endSetDonationWithOptions:completion:](service, "endSetDonationWithOptions:completion:", a3, v14);
  v8 = self->_service;
  self->_service = 0;

  v9 = *((unsigned __int16 *)v16 + 12);
  v10 = v9 == 7;
  if (v9 != 7)
  {
    _donationResponseError(self->_name, CFSTR("finish"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a4, v11);

  }
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __41__CCSetDonation_finishWithOptions_error___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)_mergeDelta:(id)a3 withDeltaMetadata:(id)a4
{
  id v6;
  id v7;
  CCDonateService *service;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __int16 v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  service = self->_service;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__CCSetDonation__mergeDelta_withDeltaMetadata___block_invoke;
  v10[3] = &unk_250990AE0;
  v10[4] = &v11;
  -[CCDonateService mergeDelta:withDeltaMetadata:completion:](service, "mergeDelta:withDeltaMetadata:completion:", v6, v7, v10);
  LOBYTE(self) = *((unsigned __int16 *)v12 + 12) == 7;
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

uint64_t __47__CCSetDonation__mergeDelta_withDeltaMetadata___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)priorVersion
{
  return self->_priorVersion;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

+ (void)_setDonationWithItemType:(os_log_t)log forAccount:descriptors:fromDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "completion parameter is nil.", v1, 2u);
}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_19_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_237B25000, log, OS_LOG_TYPE_DEBUG, "Ignoring service response (%@) for timed out request %@", (uint8_t *)&v4, 0x16u);
}

void __139__CCSetDonation__setDonationWithItemType_forAccount_descriptors_fromDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "%@ - invalidating connection", (uint8_t *)&v2, 0xCu);
}

@end
