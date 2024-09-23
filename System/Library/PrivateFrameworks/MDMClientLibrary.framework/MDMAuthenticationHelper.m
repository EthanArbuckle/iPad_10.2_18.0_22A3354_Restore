@implementation MDMAuthenticationHelper

+ (unint64_t)enrollmentMethodFromAuthenticateString:(id)a3 outParams:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44[2];

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v6, 1, v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v44[0];
    if (v8)
    {
      v9 = v8;
      v10 = 0;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
    objc_msgSend(v5, "substringWithRange:", v12, v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v39, "isEqualToString:", CFSTR("Bearer")))
    {
      v9 = 0;
      v10 = 0;
      v25 = v39;
LABEL_26:

      goto LABEL_27;
    }
    v38 = v11;
    v14 = objc_msgSend(v11, "rangeAtIndex:", 2);
    objc_msgSend(v5, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
    {
      v9 = 0;
      v10 = 0;
      v25 = v39;
LABEL_25:

      v11 = v38;
      goto LABEL_26;
    }
      CFSTR("[ \t]*"));
    v43 = 0;
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v43;

    v18 = (void *)objc_opt_new();
    v19 = objc_msgSend(v16, "length");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __76__MDMAuthenticationHelper_enrollmentMethodFromAuthenticateString_outParams___block_invoke;
    v40[3] = &unk_1E98526E8;
    v37 = v16;
    v41 = v16;
    v20 = v18;
    v42 = v20;
    v35 = v17;
    objc_msgSend(v17, "enumerateMatchesInString:options:range:usingBlock:", v41, 0, 0, v19, v40);
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("method"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      +[MDMBearerTokenAuthenticator authenticationMethod](MDMBearerTokenAuthenticator, "authenticationMethod");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0)
      {
        v23 = (void *)objc_opt_new();
        v24 = objc_msgSend(v23, "validAuthParams:", v20);

        if (v24)
        {
          *a4 = objc_retainAutorelease(v20);
          v10 = 2;
LABEL_23:
          v25 = v39;
          v31 = (void *)v36;
          v16 = v37;
          v32 = v35;
LABEL_24:

          v7 = v32;
          goto LABEL_25;
        }
      }
      else
      {

      }
      +[MDMMAIDBearerTokenAuthenticator authenticationMethod](MDMMAIDBearerTokenAuthenticator, "authenticationMethod");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", v26) & 1) != 0)
      {
        v27 = (void *)objc_opt_new();
        v28 = objc_msgSend(v27, "validAuthParams:", v20);

        if (v28)
        {
          *a4 = objc_retainAutorelease(v20);
          v10 = 1;
          goto LABEL_23;
        }
      }
      else
      {

      }
      +[MDMOAuth2Authenticator authenticationMethod](MDMOAuth2Authenticator, "authenticationMethod");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", v29) & 1) != 0)
      {
        v30 = (void *)objc_opt_new();
        v34 = objc_msgSend(v30, "validAuthParams:", v20);

        v25 = v39;
        v31 = (void *)v36;
        v16 = v37;
        v32 = v35;
        if (v34)
        {
          *a4 = objc_retainAutorelease(v20);
          v10 = 5;
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_24;
      }

    }
    v10 = 0;
    goto LABEL_23;
  }
  v10 = 0;
LABEL_28:

  return v10;
}

void __76__MDMAuthenticationHelper_enrollmentMethodFromAuthenticateString_outParams___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v10, "rangeWithName:", CFSTR("pname"));
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "rangeWithName:", CFSTR("pvalue"));
  if (!v8)
    v7 = objc_msgSend(v10, "rangeWithName:", CFSTR("pquoted"));
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v6);

}

+ (void)performExchangeMAIDForBearerTokenAtURL:(id)a3 rmAccountIdentifier:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v18[0] = CFSTR("method");
  +[MDMMAIDBearerTokenAuthenticator authenticationMethod](MDMMAIDBearerTokenAuthenticator, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = CFSTR("url");
  objc_msgSend(v10, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __126__MDMAuthenticationHelper_performExchangeMAIDForBearerTokenAtURL_rmAccountIdentifier_anchorCertificateRefs_completionHandler___block_invoke;
  v16[3] = &unk_1E9852710;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v11, "refreshTokenWithAuthParams:accountID:completionHandler:", v14, v9, v16);

}

void __126__MDMAuthenticationHelper_performExchangeMAIDForBearerTokenAtURL_rmAccountIdentifier_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("token"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

@end
