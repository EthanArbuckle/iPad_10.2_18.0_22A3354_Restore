@implementation HMCRedirectorChange

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMCRedirectorChange descriptionLines](self, "descriptionLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)MEMORY[0x24BDD17C8];
  __descriptionHeader(self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("HMCRedirectorChange %@\n%@>"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("HMCRedirectorChange %@ (NO CHANGES)>"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)descriptionLines
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCRedirectorChange inserts](self, "inserts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    objc_msgSend(v3, "addObject:", CFSTR("inserts:"));
    -[HMCRedirectorChange inserts](self, "inserts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke;
    v20[3] = &unk_24E798E48;
    v21 = v3;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  }
  -[HMCRedirectorChange updates](self, "updates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v3, "addObject:", CFSTR("updates:"));
    -[HMCRedirectorChange updates](self, "updates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke_2;
    v18[3] = &unk_24E798E48;
    v19 = v3;
    objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

  }
  -[HMCRedirectorChange deletes](self, "deletes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v3, "addObject:", CFSTR("deletes:"));
    -[HMCRedirectorChange deletes](self, "deletes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke_3;
    v16[3] = &unk_24E798E48;
    v17 = v3;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)dumpForLoggingWithPrefix:(id)a3 logType:(unsigned __int8)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMCRedirectorChange *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMCRedirectorChange descriptionLines](self, "descriptionLines");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  __descriptionHeader(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("\n"));
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v10);

  }
  else
  {
    v11 = objc_msgSend(v8, "appendString:", CFSTR(" (NO CHANGES)"));
  }
  v12 = (void *)MEMORY[0x227676638](v11);
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, (os_log_type_t)a4))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v15;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v14, (os_log_type_t)a4, "%{public}@%@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

}

- (NSSet)updates
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)inserts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)deletes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

void __39__HMCRedirectorChange_descriptionLines__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __39__HMCRedirectorChange_descriptionLines__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __39__HMCRedirectorChange_descriptionLines__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
