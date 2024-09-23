@implementation PHShare

+ (void)fetchShareFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHShare.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v12, "assetsdClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cloudInternalClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke;
  v20[3] = &unk_1E35DE018;
  v21 = v12;
  v22 = v11;
  v24 = v8;
  v23 = v13;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  objc_msgSend(v15, "fetchShareFromShareURL:ignoreExistingShare:completionHandler:", v17, v8, v20);

}

+ (void)acceptShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHShare.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v10, "assetsdClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudInternalClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PHShare_acceptShareWithUUID_photoLibrary_completion___block_invoke;
  v16[3] = &unk_1E35DE040;
  v17 = v11;
  v18 = a1;
  v14 = v11;
  objc_msgSend(v13, "acceptShare:completionHandler:", v9, v16);

}

+ (void)publishShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, void *);
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHShare.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v10, "cplStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exitDeleteTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 6007, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "PHShareErrorFromError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);

  }
  else
  {
    objc_msgSend(v10, "assetsdClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudInternalClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__PHShare_publishShareWithUUID_photoLibrary_completion___block_invoke;
    v18[3] = &unk_1E35DE068;
    v19 = v11;
    v20 = a1;
    objc_msgSend(v16, "publishShare:completionHandler:", v9, v18);

  }
}

+ (id)PHShareErrorFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PHPhotosErrorDomain"));

    if (v6)
    {
      v7 = v4;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E08]);
      v26 = *MEMORY[0x1E0CB3388];
      v27[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

      objc_msgSend(v4, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D11268]);

      if (v12)
      {
        objc_msgSend(v4, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D11278]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("PHServerGeneratedLocalizedDescriptionErrorKey"));

        objc_msgSend(v4, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D11270]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("PHLearnMoreLinkErrorKey"));

        }
        v18 = objc_msgSend(v4, "code");
        v19 = -1;
        if (v18 > 999)
        {
          switch(v18)
          {
            case 1000:
              v19 = 6010;
              break;
            case 1001:
            case 1003:
            case 1004:
            case 1005:
              break;
            case 1002:
              v19 = 9999;
              break;
            case 1006:
              v19 = 6012;
              break;
            case 1007:
              v19 = 8500;
              break;
            case 1008:
              v19 = 8501;
              break;
            default:
              switch(v18)
              {
                case 2008:
                  v19 = 8502;
                  break;
                case 2009:
                  v19 = 8503;
                  break;
                case 2010:
                  v19 = 8504;
                  break;
                case 2011:
                  v19 = 8507;
                  break;
                default:
                  goto LABEL_40;
              }
              break;
          }
        }
        else
        {
          switch(v18)
          {
            case 23:
            case 25:
              v19 = 6003;
              break;
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 31:
            case 32:
            case 33:
              break;
            case 30:
              v19 = 6008;
              break;
            case 34:
              v19 = 6002;
              break;
            case 35:
              v19 = 6009;
              break;
            case 36:
              v19 = 8001;
              break;
            case 37:
              v19 = 6011;
              break;
            default:
              if ((unint64_t)(v18 - 80) >= 3)
              {
                if (v18 == 2)
                  v19 = 6006;
              }
              else
              {
                v19 = 6001;
              }
              break;
          }
        }
LABEL_40:

      }
      else
      {
        objc_msgSend(v4, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D71C78]);

        if (v21)
        {
          v22 = objc_msgSend(v4, "code");
          if ((unint64_t)(v22 - 100) >= 3)
            v19 = -1;
          else
            v19 = v22 + 5903;
        }
        else
        {
          objc_msgSend(v4, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D74498]);

          if (v24)
          {
            if (objc_msgSend(v4, "code") == 81001)
              v19 = 8505;
            else
              v19 = -1;
          }
          else
          {
            v19 = -1;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v19, v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __56__PHShare_publishShareWithUUID_photoLibrary_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "PHShareErrorFromError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __55__PHShare_acceptShareWithUUID_photoLibrary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;
  uint64_t v3;
  id v4;

  v2 = a2 == 0;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v3 + 16))(v3, v2, v4);

}

void __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != (void *)*MEMORY[0x1E0CB28A8])
  {

LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "code");

  if (v9 != 4099)
    goto LABEL_6;
  v10 = objc_alloc(MEMORY[0x1E0D73168]);
  objc_msgSend(*(id *)(a1 + 32), "photoLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithPhotoLibraryURL:", v11);

  if (v12)
  {
    objc_msgSend(v12, "cloudInternalClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(a1 + 56);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke_2;
    v16[3] = &unk_1E35DE620;
    v15 = *(_QWORD *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v13, "fetchShareFromShareURL:ignoreExistingShare:completionHandler:", v15, v14, v16);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_7:
}

void __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != (void *)*MEMORY[0x1E0CB28A8])
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v5, "code");

  if (v9 != 4099)
  {
LABEL_6:
    PLBackendSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315138;
      v15 = "+[PHShare fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:]_block_invoke";
      v11 = "XPC connection invalidated first time but worked on second try in %s";
      v12 = v10;
      v13 = OS_LOG_TYPE_FAULT;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  PLBackendSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = (const char *)v5;
    v11 = "Unable to fetch moment share because XPC service returned an error on second attempt. (%@)";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_1991EC000, v12, v13, v11, (uint8_t *)&v14, 0xCu);
  }
LABEL_9:

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
}

- (PHShare)init
{
  PHShare *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singletonPhotoLibraryPath, 0);
}

@end
