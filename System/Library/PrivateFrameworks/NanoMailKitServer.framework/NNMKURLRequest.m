@implementation NNMKURLRequest

+ (id)mailNotificationURL
{
  __CFString *v2;

  nnmk_setupLoggingSubsystems();
  if (!os_variant_has_internal_ui()
    || (v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("NanoMailCloudNotificationStagingServer"), CFSTR("com.apple.NanoMail"))) == 0)
  {
    v2 = CFSTR("https://mailnotifications.apple.com");
  }
  return v2;
}

+ (void)requestWithType:(unint64_t)a3 baseURLString:(id)a4 path:(id)a5 body:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v10 = a8;
  v23 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(a1, "_getRequestWithBaseURLString:path:params:token:errorParser:completion:", v23, v16, v17, v18, v19, v20);
      break;
    case 1uLL:
    case 3uLL:
    case 4uLL:
      objc_msgSend(a1, "_methodNameForType:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_jsonBodyRequestWithBaseURLString:path:body:method:token:needsBAA:errorParser:completion:", v23, v16, v17, v21, v18, v10, v19, v20);

      break;
    case 2uLL:
      objc_msgSend(a1, "_methodNameForType:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_formBodyRequestWithBaseURLString:path:body:method:token:errorParser:completion:", v23, v16, v17, v22, v18, v19, v20);

      break;
    default:
      break;
  }

}

+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "postRequestWithBaseURLString:path:body:token:needsBAA:completion:", a3, a4, a5, a6, 0, a7);
}

+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 needsBAA:(BOOL)a7 completion:(id)a8
{
  objc_msgSend(a1, "_jsonBodyRequestWithBaseURLString:path:body:method:token:needsBAA:errorParser:completion:", a3, a4, a5, CFSTR("POST"), a6, a7, 0, a8);
}

+ (void)formPostRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "_formBodyRequestWithBaseURLString:path:body:method:token:errorParser:completion:", a3, a4, a5, CFSTR("POST"), a6, 0, a7);
}

+ (void)patchRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "_jsonBodyRequestWithBaseURLString:path:body:method:token:needsBAA:errorParser:completion:", a3, a4, a5, CFSTR("PATCH"), a6, 0, 0, a7);
}

+ (void)getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "_getRequestWithBaseURLString:path:params:token:errorParser:completion:", a3, a4, a5, a6, 0, a7);
}

+ (void)_getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 errorParser:(id)a7 completion:(id)a8
{
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v27 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x24BDD1808];
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend([v15 alloc], "initWithString:", v19);

  objc_msgSend(v20, "setPath:", v18);
  if (objc_msgSend(v27, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __88__NNMKURLRequest__getRequestWithBaseURLString_path_params_token_errorParser_completion___block_invoke;
    v28[3] = &unk_24F9F6330;
    v29 = v21;
    v22 = v21;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v28);
    objc_msgSend(v20, "setQueryItems:", v22);

  }
  v23 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v20, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestWithURL:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addValue:forHTTPHeaderField:", v26, CFSTR("Authorization"));

  }
  objc_msgSend(v25, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(a1, "_handleRequest:errorParser:completion:", v25, v17, v16);

}

void __88__NNMKURLRequest__getRequestWithBaseURLString_path_params_token_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x24BDD1838];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithName:value:", v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

+ (void)_jsonBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, id);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  void (**v37)(id, _QWORD, id);
  id v38;
  id v39;
  id v40;

  v10 = a8;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v34 = a9;
  v19 = (void (**)(id, _QWORD, id))a10;
  v20 = (void *)MEMORY[0x24BDBCF48];
  v21 = a6;
  objc_msgSend(v20, "URLWithString:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v33 = a1;
  if (v16)
  {
    objc_msgSend(v22, "URLByAppendingPathComponent:", v16);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v22;
  }
  v25 = v24;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addValue:forHTTPHeaderField:", v27, CFSTR("Authorization"));

  }
  objc_msgSend(v26, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v26, "setHTTPMethod:", v21);

  if (v10)
  {
    +[NNMKURLRequest serverFriendlyDescription](NNMKURLRequest, "serverFriendlyDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addValue:forHTTPHeaderField:", v28, CFSTR("X-MMe-Client-Info"));

  }
  if (v17)
    v29 = v17;
  else
    v29 = (id)MEMORY[0x24BDBD1B8];
  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v29, 0, &v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v40;
  objc_msgSend(v26, "setHTTPBody:", v30);
  if (v31)
  {
    v19[2](v19, 0, v31);
    v32 = v34;
  }
  else if (v10)
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __107__NNMKURLRequest__jsonBodyRequestWithBaseURLString_path_body_method_token_needsBAA_errorParser_completion___block_invoke;
    v35[3] = &unk_24F9F6358;
    v37 = v19;
    v36 = v26;
    v32 = v34;
    v39 = v33;
    v38 = v34;
    +[NNMKBAAManager appleAuthHeaderFrom:completion:](NNMKBAAManager, "appleAuthHeaderFrom:completion:", v30, v35);

  }
  else
  {
    v32 = v34;
    objc_msgSend(v33, "_handleRequest:errorParser:completion:", v26, v34, v19);
  }

}

uint64_t __107__NNMKURLRequest__jsonBodyRequestWithBaseURLString_path_body_method_token_needsBAA_errorParser_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", a2, CFSTR("X-Apple-Authentication"));
  return objc_msgSend(*(id *)(a1 + 56), "_handleRequest:errorParser:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (void)_formBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 errorParser:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  _QWORD v34[4];
  id v35;

  v33 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x24BDBCF48];
  v17 = a9;
  v18 = a8;
  v19 = a5;
  objc_msgSend(v16, "URLWithString:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v20;
  if (v33)
  {
    objc_msgSend(v20, "URLByAppendingPathComponent:");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v20;
  }
  v22 = v21;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addValue:forHTTPHeaderField:", v24, CFSTR("Authorization"));

  }
  objc_msgSend(v23, "setHTTPMethod:", v14);
  v25 = (void *)objc_opt_new();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __98__NNMKURLRequest__formBodyRequestWithBaseURLString_path_body_method_token_errorParser_completion___block_invoke;
  v34[3] = &unk_24F9F6380;
  v35 = v25;
  v26 = v25;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v34);

  objc_msgSend(v26, "dataUsingEncoding:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHTTPBody:", v27);
  objc_msgSend(v23, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "length"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringValue");
  v29 = v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forHTTPHeaderField:", v30, CFSTR("Content-Length"));

  objc_msgSend(a1, "_handleRequest:errorParser:completion:", v23, v18, v17);
}

void __98__NNMKURLRequest__formBodyRequestWithBaseURLString_path_body_method_token_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  const __CFString *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  if (objc_msgSend(v5, "length"))
    v7 = CFSTR("&%@=%@");
  else
    v7 = CFSTR("%@=%@");
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", v7, v8, v6);

}

+ (void)_handleRequest:(id)a3 errorParser:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke;
  v15[3] = &unk_24F9F63A8;
  v16 = v7;
  v17 = v9;
  v18 = v8;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "resume");
}

void __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "statusCode");
    if (v9)
    {
LABEL_3:
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(_QWORD *)(a1 + 40);
      v17 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v9, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "code");
      v38 = *MEMORY[0x24BDD0FC8];
      v39[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v21);

      goto LABEL_25;
    }
  }
  else
  {
    v10 = -1;
    if (v9)
      goto LABEL_3;
  }
  if (!v7 || v10 < 200 || v10 > 299)
  {
    if (objc_msgSend(v7, "length"))
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v36);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 48);
      if (v24)
      {
        if (v9)
        {
          (*(void (**)(uint64_t, id))(v24 + 16))(v24, v9);
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            v27 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 32), "URL");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "absoluteString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@"), v29, v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "httpErrorWithCode:message:", v10, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = *(_QWORD *)(a1 + 40);
            if (v31)
            {
              (*(void (**)(_QWORD, id, void *))(v32 + 16))(*(_QWORD *)(a1 + 40), v9, v31);
LABEL_22:

              goto LABEL_25;
            }
LABEL_21:
            v33 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(*(id *)(a1 + 32), "URL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "absoluteString");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "httpErrorWithCode:message:", v10, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, id, void *))(v32 + 16))(v32, v9, v35);

            goto LABEL_22;
          }
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v32 = *(_QWORD *)(a1 + 40);
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "length"))
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v37);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v37;
    if (v22)
    {
      v23 = (void *)__logCategories;
      if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
        __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke_cold_1(v23, v22);
    }

  }
  else
  {
    v9 = (id)MEMORY[0x24BDBD1B8];
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_25:

}

+ (id)_methodNameForType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("GET");
  else
    return off_24F9F6408[a3 - 1];
}

+ (id)serverFriendlyDescription
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NNMKURLRequest_serverFriendlyDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverFriendlyDescription_onceToken != -1)
    dispatch_once(&serverFriendlyDescription_onceToken, block);
  return (id)serverFriendlyDescription__serverFriendlyDescription;
}

void __43__NNMKURLRequest_serverFriendlyDescription__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  +[NNMKURLRequest _hardwareModel](NNMKURLRequest, "_hardwareModel");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDD17C8];
  +[NNMKURLRequest _osName](NNMKURLRequest, "_osName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKURLRequest _osVersion](NNMKURLRequest, "_osVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKURLRequest _buildNumber](NNMKURLRequest, "_buildNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@;%@;%@"), v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBD2A0];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBD2A0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("1.0");
  if (v11)
    v16 = v11;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v13, v8, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v20, v4, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)serverFriendlyDescription__serverFriendlyDescription;
  serverFriendlyDescription__serverFriendlyDescription = v18;

}

+ (id)_systemVersionDictionary
{
  if (_systemVersionDictionary_onceToken != -1)
    dispatch_once(&_systemVersionDictionary_onceToken, &__block_literal_global_0);
  return (id)_systemVersionDictionary_platformDictionary;
}

void __42__NNMKURLRequest__systemVersionDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = _CFCopySystemVersionDictionary();
  v1 = (void *)_systemVersionDictionary_platformDictionary;
  _systemVersionDictionary_platformDictionary = v0;

}

+ (id)_osName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

+ (id)_osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

+ (id)_buildNumber
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_systemVersionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBD1F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hardwareModel
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

void __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_22E161000, v3, OS_LOG_TYPE_ERROR, "Unable to parse JSON response: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
