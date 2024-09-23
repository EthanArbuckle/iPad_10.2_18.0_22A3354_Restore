@implementation AMPCardMetadataRegistration

+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 size:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _BYTE location[12];
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = a5;
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "_passesForPassTypeIdentifier:serialNumber:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v12 |= 2u;
  objc_msgSend(v11, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    v14 = v12;
  else
    v14 = v12 & 2;
  if (v14)
  {
    v15 = (void *)objc_opt_class();
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = v15;
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v15;
    v32 = 2114;
    v33 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 22;
    v18 = (void *)_os_log_send_and_compose_impl();

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, location, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();

    }
  }
  else
  {

  }
  objc_initWeak((id *)location, a1);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke;
  v27[3] = &unk_24F966DF8;
  objc_copyWeak(&v30, (id *)location);
  v20 = v26;
  v28 = v20;
  v21 = v25;
  v29 = v21;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v27);
  v22 = (void *)objc_msgSend(v21, "copy");

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);

  return v22;
}

void __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  int v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  int *v54;
  uint64_t v55;
  uint64_t block;
  uint64_t v57;
  void (*v58)(uint64_t);
  void *v59;
  id v60;
  id v61;
  uint64_t *v62;
  double v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  int v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = objc_alloc_init(MEMORY[0x24BE080C0]);
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy_;
  v68 = __Block_byref_object_dispose_;
  v69 = 0;
  objc_msgSend(a1[4], "floatValue");
  if (v6 > 0.0)
  {
    v7 = v6;
    block = MEMORY[0x24BDAC760];
    v57 = 3221225472;
    v58 = __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke_13;
    v59 = &unk_24F966DD0;
    v62 = &v64;
    v60 = WeakRetained;
    v61 = v3;
    v63 = v7;
    dispatch_sync(MEMORY[0x24BDAC9B8], &block);
    v8 = (void *)v65[5];
    if (v8)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:image/png;base64,%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCardArtwork:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41 = objc_msgSend(v9, "shouldLog");
      v42 = objc_msgSend(v9, "shouldLogToDisk");
      objc_msgSend(v9, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      v10 = v43;
      if (v42)
        v41 |= 2u;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v41 &= 2u;
      if (v41)
      {
        v44 = (void *)objc_opt_class();
        v70 = 138543362;
        v71 = v44;
        v45 = v44;
        LODWORD(v55) = 12;
        v54 = &v70;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v70, v55, block, v57, v58, v59, v60);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        free(v46);
        v54 = (int *)v10;
        SSFileLog();
      }
    }

LABEL_5:
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  v13 = objc_msgSend(v11, "shouldLogToDisk");
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    v12 |= 2u;
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v12 &= 2u;
  if (!v12)
    goto LABEL_15;
  v16 = (void *)objc_opt_class();
  v70 = 138543362;
  v71 = v16;
  v17 = v16;
  LODWORD(v55) = 12;
  v54 = &v70;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v70, v55);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v18);
    v54 = (int *)v15;
    SSFileLog();
LABEL_15:

  }
LABEL_17:
  objc_msgSend(v3, "localizedDescription", v54);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptionShort:", v19);

  objc_msgSend(v3, "serialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSerialNumber:", v20);

  getPKPaymentPassClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSuffix:", objc_msgSend(v3, "performSelector:withObject:", sel_primaryAccountNumberSuffix, 0));
  objc_msgSend(v3, "paymentPass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "associatedAccountServiceAccountIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog");
    v26 = objc_msgSend(v24, "shouldLogToDisk");
    objc_msgSend(v24, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26)
      v25 |= 2u;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      v25 &= 2u;
    if (v25)
    {
      v29 = (void *)objc_opt_class();
      v70 = 138543362;
      v71 = v29;
      v30 = v29;
      LODWORD(v55) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
        v32 = 2;
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v70, v55);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog();
    }
    v32 = 2;
    goto LABEL_60;
  }
  objc_msgSend(v3, "paymentPass");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hasAssociatedPeerPaymentAccount");

  if (v34)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = objc_msgSend(v24, "shouldLog");
    v36 = objc_msgSend(v24, "shouldLogToDisk");
    objc_msgSend(v24, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    v28 = v37;
    if (v36)
      v35 |= 2u;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      v35 &= 2u;
    if (v35)
    {
      v38 = (void *)objc_opt_class();
      v70 = 138543362;
      v71 = v38;
      v39 = v38;
      LODWORD(v55) = 12;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
        v32 = 1;
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v40, 4, &v70, v55);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      free(v40);
      SSFileLog();
    }
    v32 = 1;
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = objc_msgSend(v24, "shouldLog");
  v48 = objc_msgSend(v24, "shouldLogToDisk");
  objc_msgSend(v24, "OSLogObject");
  v49 = objc_claimAutoreleasedReturnValue();
  v28 = v49;
  if (v48)
    v47 |= 2u;
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    v47 &= 2u;
  if (!v47)
  {
LABEL_59:
    v32 = 0;
LABEL_60:

    goto LABEL_61;
  }
  v50 = (void *)objc_opt_class();
  v70 = 138543362;
  v71 = v50;
  v51 = v50;
  LODWORD(v55) = 12;
  v32 = _os_log_send_and_compose_impl();

  if (v32)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v32, 4, &v70, v55);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    free((void *)v32);
    SSFileLog();
    goto LABEL_59;
  }
LABEL_61:

  objc_msgSend(v5, "setCardType:", v32);
  objc_msgSend(v3, "paymentPass");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "devicePrimaryInAppPaymentApplication");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaymentNetwork:", objc_msgSend(v53, "paymentNetworkIdentifier"));

  objc_msgSend(a1[5], "addObject:", v5);
  _Block_object_dispose(&v64, 8);

}

void __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cardArtworkForPaymentPass:width:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4
{
  id v5;
  UIImage *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_cardArtworkForPaymentPass_width__onceToken != -1)
    dispatch_once(&_cardArtworkForPaymentPass_width__onceToken, &__block_literal_global_0);
  objc_msgSend(v5, "cardImageWithDimensions:", a4, a4);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      LODWORD(v17) = 138543362;
      *(_QWORD *)((char *)&v17 + 4) = objc_opt_class();
      v13 = *(id *)((char *)&v17 + 4);
      LODWORD(v16) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

        v8 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v17, v16, v17);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_16;
  }
  UIImagePNGRepresentation(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v8;
}

void __64__AMPCardMetadataRegistration__cardArtworkForPaymentPass_width___block_invoke()
{
  if (PassKitUILibrary_sOnce != -1)
    dispatch_once(&PassKitUILibrary_sOnce, &__block_literal_global_27);
}

+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(getPKPassLibraryClass());
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5 && v6)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      v35 = 138543362;
      v36 = (id)objc_opt_class();
      v13 = v36;
      LODWORD(v33) = 12;
      v32 = &v35;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v35, v33);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      v32 = (int *)v12;
      SSFileLog();
    }

LABEL_14:
    objc_msgSend(v7, "passWithPassTypeIdentifier:serialNumber:", v5, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v34 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v23, "shouldLog", v32);
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v25 &= 2u;
    if (v25)
    {
      v27 = (void *)objc_opt_class();
      v35 = 138543362;
      v36 = v27;
      v28 = v27;
      LODWORD(v33) = 12;
      v32 = &v35;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_39:

        v17 = 0;
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v35, v33);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v29);
      v32 = (int *)v26;
      SSFileLog();
    }

    goto LABEL_39;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v9, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    v19 &= 2u;
  if (!v19)
    goto LABEL_26;
  v35 = 138543362;
  v36 = (id)objc_opt_class();
  v21 = v36;
  LODWORD(v33) = 12;
  v32 = &v35;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v35, v33);
    v20 = objc_claimAutoreleasedReturnValue();
    free(v22);
    v32 = (int *)v20;
    SSFileLog();
LABEL_26:

  }
  objc_msgSend(v7, "passesOfType:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:
  v30 = (void *)objc_msgSend(v17, "copy", v32);

  return v30;
}

@end
