@implementation FCClientInfoHeaderValue

void __FCClientInfoHeaderValue_block_invoke()
{
  id v0;
  const __CFString *v1;
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  CKProductType();
  v1 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("UNKNOWN");
  if (!v1)
    v1 = CFSTR("UNKNOWN");
  v29 = (__CFString *)v1;
  v25 = v0;
  objc_msgSend(v0, "appendFormat:", CFSTR("<%@>"), v1);
  objc_msgSend(MEMORY[0x1E0C94C00], "sharedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productName");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94C00], "sharedOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productVersion");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94C00], "sharedOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v8 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v4;
  if (v4)
    v9 = (const __CFString *)v4;
  else
    v9 = CFSTR("UNKNOWN");
  if (v6)
    v10 = v6;
  else
    v10 = CFSTR("UNKNOWN");
  v27 = (void *)v8;
  if (v8)
    v11 = (const __CFString *)v8;
  else
    v11 = CFSTR("UNKNOWN");
  objc_msgSend(v0, "appendFormat:", CFSTR(" <%@;%@;%@>"), v9, v10, v11);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.newscore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9AAF0];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "infoDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", v14);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v13, "length"))
    v20 = v13;
  else
    v20 = CFSTR("UNKNOWN");
  if (-[__CFString length](v15, "length"))
    v21 = v15;
  else
    v21 = CFSTR("1.0");
  if (-[__CFString length](v18, "length"))
    v2 = v18;
  if (-[__CFString length](v19, "length"))
    v22 = v19;
  else
    v22 = CFSTR("1.0");
  objc_msgSend(v25, "appendFormat:", CFSTR(" <%@/%@ (%@/%@)>"), v20, v21, v2, v22);
  v23 = (void *)_MergedGlobals_200;
  _MergedGlobals_200 = (uint64_t)v25;

}

@end
