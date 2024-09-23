@implementation PHAsset(CloudSupport)

- (void)isAssetLocalWithCompletion:()CloudSupport requiresDerivative:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "mediaType") == 1)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDE3528]);
    objc_msgSend(v8, "setNetworkAccessAllowed:", 0);
    objc_msgSend(v8, "setCanHandleAdjustmentData:", &__block_literal_global_24);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_2;
    v19[3] = &unk_24EE59408;
    v20 = v6;
    v9 = v6;
    objc_msgSend(a1, "requestContentEditingInputWithOptions:completionHandler:", v8, v19);
    v10 = v20;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDE36B0]);
    objc_msgSend(v11, "setNetworkAccessAllowed:", 0);
    if (a4)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v11, "setDeliveryMode:", v12);
    objc_msgSend(v11, "setVersion:", 0);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_3;
    v14[3] = &unk_24EE59430;
    v18 = a4;
    v14[4] = a1;
    v15 = v11;
    v16 = v7;
    v17 = v6;
    v13 = v6;
    v8 = v11;
    objc_msgSend(v16, "requestAVAssetForVideo:options:resultHandler:", a1, v8, v14);

    v10 = v15;
  }

}

@end
