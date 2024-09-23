@implementation CollectAssetResourcesByCplResourceType

void ___CollectAssetResourcesByCplResourceType_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PHResourceLocalAvailabilityRequestResourceType _ResourceTypeForAssetResource(PHAsset *__strong, PHAssetResource *__strong)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v9)
      goto LABEL_3;
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PHResourceLocalAvailabilityRequestResourceType _ResourceTypeForAssetResource(PHAsset *__strong, PHAssetResource *__strong)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _CPLResourceTypeForAssetResource(PHAssetResource *__strong, CPLResourceType *)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_37;
LABEL_3:
  v10 = v9;
LABEL_4:
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE3816B0)
    && (v11 = objc_msgSend(v9, "cplResourceType")) != 0)
  {
    v12 = v11;

    if (v12 < 0x1D)
    {
      v13 = v12 - 1;
      if (((0x9DFE07Fu >> (v12 - 1)) & 1) != 0)
      {
        v14 = &unk_19944A6F8;
LABEL_26:
        v16 = v14[v13];
        goto LABEL_27;
      }
    }
  }
  else
  {

  }
  v15 = objc_msgSend(v9, "type");
  v16 = v15;
  if (v15 > 107)
  {
    if (v15 == 108)
    {
      v16 = 20;
      goto LABEL_27;
    }
    if (v15 == 110)
    {
      v16 = 22;
      goto LABEL_27;
    }
  }
  else
  {
    if (v15 == 7)
    {
      v16 = 21;
      goto LABEL_27;
    }
    if (v15 == 16)
    {
      v16 = 19;
      goto LABEL_27;
    }
  }
  if (!objc_msgSend(v7, "isCloudSharedAsset"))
  {
    v13 = v16 - 1;
    if (v16 - 1 < 0x13 && ((0x4FFFFu >> v13) & 1) != 0)
    {
      v14 = &unk_19944A7D8;
      goto LABEL_26;
    }
LABEL_34:

    PLPhotoKitGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v37 = v29;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Ignoring resource for sharing asset: %@, resource: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  if (v16 == 1)
    goto LABEL_27;
  if (objc_msgSend(v9, "type") == 2)
  {
    v16 = 1;
    goto LABEL_27;
  }
  if (v16 != 9)
    goto LABEL_34;
  v16 = 13;
LABEL_27:

  v17 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, v28);
LABEL_30:

    goto LABEL_31;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = *(_QWORD *)(a1 + 32);
  _PHResourceLocalAvailabilityRequestResourceTypeDescription(v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("Trying to collect resource for already used _PHResourceLocalAvailabilityRequestResourceType while sharing asset: %@, cplResourceType: %@, resource: %@, all resources: %@"), v21, v22, v9, *(_QWORD *)(a1 + 48));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _PHResourceLocalAvailabilityRequestError(0, 0, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

  *a4 = 1;
LABEL_31:

}

@end
