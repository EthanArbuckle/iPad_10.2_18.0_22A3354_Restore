@implementation NSError

uint64_t __47__NSError_BacklightServices__bls_loggingString__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke_2;
  v3[3] = &unk_1E621A368;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "appendCustomFormatWithName:block:", 0, v3);
}

void __47__NSError_BacklightServices__bls_loggingString__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "localizedFailureReason");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v12 = (id)v5;
  if (v5)
  {
    v7 = objc_msgSend(v6, "code");
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@ (%ld:%@) \"%@\"), v12, v7, v8, v9);
  }
  else
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "code");
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@ (%ld:%@)"), v8, v10, v9, v11);
  }

}

void __47__NSError_BacklightServices__bls_loggingString__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bls_shortLoggingString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:", v4, 0);

}

void __52__NSError_BacklightServices__bls_shortLoggingString__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "localizedFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "code");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\"%@\"(%ld:%@)"), v5, v6, v7);

  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }

}

@end
