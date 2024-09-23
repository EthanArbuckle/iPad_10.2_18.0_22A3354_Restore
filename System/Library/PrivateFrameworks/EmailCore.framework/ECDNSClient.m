@implementation ECDNSClient

- (void)getPublicKeyRecordsFromDomain:(id)a3 withSelector:(id)a4 completionHandler:(id)a5
{
  _QWORD *v8;
  void *v9;
  void *v10;
  void (*v11)(_QWORD *, void *, id);
  id v12;
  id v13;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@._domainkey.%@"), a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[ECDNSClient _txtRecordsForDomain:error:](self, "_txtRecordsForDomain:error:", v9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void (*)(_QWORD *, void *, id))v8[2];
  v12 = v13;
  v11(v8, v10, v12);

}

- (id)getDMARCRecordsFromDomain:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_dmarc.%@"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  obj = 0;
  -[ECDNSClient _txtRecordsForDomain:error:](self, "_txtRecordsForDomain:error:", v6, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ECDNSClient_getDMARCRecordsFromDomain_error___block_invoke;
  v10[3] = &unk_1E7120CE0;
  v10[4] = &v12;
  objc_msgSend(v7, "ef_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v8;
}

id __47__ECDNSClient_getDMARCRecordsFromDomain_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  BOOL v9;
  id v11;

  v11 = 0;
  +[ECTagValueList tagValueListFromString:error:](ECTagValueList, "tagValueListFromString:error:", a2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v11;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (v8)
    v9 = 1;
  else
    v9 = v5 == 0;
  if (!v9)
    objc_storeStrong(v7, v4);

  return v3;
}

- (id)_txtRecordsForDomain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  DNSServiceErrorType v8;
  id v9;
  DNSServiceRef sdRef;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = (id)0xAAAAAAAAAAAAAAAALL;
  v18 = (id)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__ECDNSClient__txtRecordsForDomain_error___block_invoke;
  v12[3] = &unk_1E7120D08;
  v12[4] = &v19;
  v12[5] = &v13;
  v6 = (void *)MEMORY[0x1BCCC97B8](v12);
  sdRef = (DNSServiceRef)0xAAAAAAAAAAAAAAAALL;
  +[ECIDNAEncoder stringByEncodingDomainName:](ECIDNAEncoder, "stringByEncodingDomainName:", v5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = DNSServiceQueryRecord(&sdRef, 0x11000u, 0, (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 1), 0x10u, 1u, (DNSServiceQueryRecordReply)query_callback, v6);
  if (!v8)
  {
    v8 = DNSServiceProcessResult(sdRef);
    DNSServiceRefDeallocate(sdRef);
    if (!v8)
    {
      v8 = *((_DWORD *)v20 + 6);
      if (!v8)
      {
        v9 = (id)v14[5];
        goto LABEL_9;
      }
    }
    if (a4)
      goto LABEL_7;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  DNSServiceRefDeallocate(sdRef);
  if (!a4)
    goto LABEL_8;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDNSClient"), v8, 0);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __42__ECDNSClient__txtRecordsForDomain_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);
  }

}

@end
