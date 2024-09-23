@implementation CDVAppleClientInfoString

void __CDVAppleClientInfoString_block_invoke()
{
  id v0;
  uint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v0 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v1 = MGCopyAnswer();
  if (v1)
    v2 = (const __CFString *)v1;
  else
    v2 = CFSTR("UNKNOWN");
  v23 = v0;
  objc_msgSend(v0, "appendFormat:", CFSTR("<%@>"), v2);
  CFRelease(v2);
  v3 = MGCopyAnswer();
  v4 = (__CFString *)MGCopyAnswer();
  v5 = MGCopyAnswer();
  v25 = (void *)v3;
  v26 = (id)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("UNKNOWN");
  if (v3)
    v7 = (const __CFString *)v3;
  else
    v7 = CFSTR("UNKNOWN");
  if (v4)
    v8 = v4;
  else
    v8 = CFSTR("UNKNOWN");
  objc_msgSend(v0, "appendFormat:", CFSTR(" <%@;%@;%@>"), v6, v7, v8);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDBD288];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBD288]);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDBD1E0];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBD1E0]);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "infoDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v12);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("UNKNOWN");
  if (-[__CFString length](v11, "length"))
    v18 = v11;
  else
    v18 = CFSTR("UNKNOWN");
  if (-[__CFString length](v13, "length"))
    v19 = v13;
  else
    v19 = CFSTR("1.0");
  if (-[__CFString length](v15, "length"))
    v17 = v15;
  if (-[__CFString length](v16, "length"))
    v20 = v16;
  else
    v20 = CFSTR("1.0");
  objc_msgSend(v23, "appendFormat:", CFSTR(" <%@/%@ (%@/%@)>"), v18, v19, v17, v20);
  v21 = (void *)CDVAppleClientInfoString__sVersionString;
  CDVAppleClientInfoString__sVersionString = (uint64_t)v23;

}

@end
