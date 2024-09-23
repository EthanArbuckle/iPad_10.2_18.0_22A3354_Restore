@implementation MKSRPClient

- (MKSRPClient)initWithPassword:(id)a3
{
  id v4;
  MKSRPClient *v5;
  MKSRPClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSRPClient;
  v5 = -[MKSRPClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MKSRPClient setUsername:](v5, "setUsername:", 0x24E35CD38);
    -[MKSRPClient setPassword:](v6, "setPassword:", v4);
  }

  return v6;
}

- (void)computeSharedKey:(id *)a3 clientPublicKey:(id *)a4 proofOfMatch:(id *)a5 FromSalt:(id)a6 serverPublicKey:(id)a7
{
  id v12;
  id v13;
  MKHex *v14;
  void *v15;
  void *v16;
  MKError *v17;
  const __CFString *v18;
  MKError *v19;
  const __CFString *v20;
  MKError *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  MKError *v26;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  int v32;
  void *v33;
  id v34;

  v12 = a6;
  v13 = a7;
  if (!-[NSString length](self->_username, "length"))
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not initialize SRP because username was invalid.");
LABEL_14:
    v21 = -[MKError initWithDomain:code:message:](v19, "initWithDomain:code:message:", 0x24E35CD18, 0, v20);
    v22 = 0;
    v14 = 0;
LABEL_15:
    v23 = 0;
    v24 = 0;
    goto LABEL_16;
  }
  if (!-[NSString length](self->_password, "length"))
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not initialize SRP because password was invalid.");
    goto LABEL_14;
  }
  if (!objc_msgSend(v12, "length"))
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not initialize SRP because salt was invalid.");
    goto LABEL_14;
  }
  if (!objc_msgSend(v13, "length"))
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not initialize SRP because server pubkey was invalid.");
    goto LABEL_14;
  }
  v14 = objc_alloc_init(MKHex);
  -[MKHex hexToData:](v14, "hexToData:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
  {
    v21 = -[MKError initWithDomain:code:message:]([MKError alloc], "initWithDomain:code:message:", 0x24E35CD18, 0, CFSTR("could not initialize SRP because salt was invalid."));
LABEL_24:

    v22 = 0;
    goto LABEL_15;
  }
  -[MKHex hexToData:](v14, "hexToData:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length"))
  {
    v26 = [MKError alloc];
    v27 = CFSTR("could not initialize SRP because server pubkey was invalid.");
    v28 = 0;
LABEL_23:
    v21 = -[MKError initWithDomain:code:message:](v26, "initWithDomain:code:message:", 0x24E35CD18, v28, v27);

    goto LABEL_24;
  }
  SRP6a_client_method();
  if (!SRP_new())
  {
    v26 = [MKError alloc];
    v27 = CFSTR("could not initialize SRP because there was an underlying issue occurred unexpectedly.");
    v28 = 1;
    goto LABEL_23;
  }
  v34 = v16;
  -[NSString UTF8String](self->_username, "UTF8String");
  v31 = a5;
  v33 = v15;
  if (SRP_set_username())
  {
    v17 = [MKError alloc];
    v18 = CFSTR("could not set username because there was an underlying issue occurred unexpectedly.");
LABEL_31:
    v21 = -[MKError initWithDomain:code:message:](v17, "initWithDomain:code:message:", 0x24E35CD18, 1, v18, a5);
    v22 = 0;
    v23 = 0;
    v24 = 0;
LABEL_32:
    v32 = 0;
    goto LABEL_33;
  }
  v29 = objc_retainAutorelease(v15);
  objc_msgSend(v29, "bytes");
  objc_msgSend(v29, "length");
  if (SRP_set_params())
  {
    v17 = [MKError alloc];
    v18 = CFSTR("could not set params because there was an underlying issue occurred unexpectedly.");
    goto LABEL_31;
  }
  -[NSString UTF8String](self->_password, "UTF8String");
  if (SRP_set_auth_password())
  {
    v17 = [MKError alloc];
    v18 = CFSTR("could not set password because there was an underlying issue occurred unexpectedly.");
    goto LABEL_31;
  }
  if (SRP_gen_pub() || !MEMORY[8])
  {
    v17 = [MKError alloc];
    v18 = CFSTR("could not generate client pubkey there was an underlying issue occurred unexpectedly.");
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  cstr_free();
  v30 = objc_retainAutorelease(v34);
  objc_msgSend(v30, "bytes");
  objc_msgSend(v30, "length");
  if (SRP_compute_key() || !MEMORY[8])
  {
    v21 = -[MKError initWithDomain:code:message:]([MKError alloc], "initWithDomain:code:message:", 0x24E35CD18, 1, CFSTR("could not compute shared key there was an underlying issue occurred unexpectedly."));
    v22 = 0;
    v23 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  cstr_free();
  if (SRP_respond() || !MEMORY[8])
  {
    v21 = -[MKError initWithDomain:code:message:]([MKError alloc], "initWithDomain:code:message:", 0x24E35CD18, 1, CFSTR("could not compute proof of match there was an underlying issue occurred unexpectedly."));
    v22 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  cstr_free();
  v21 = 0;
  v32 = 1;
LABEL_33:

  SRP_free();
  if (v32)
  {
    if (a3)
    {
      -[MKHex dataToHex:](v14, "dataToHex:", v23);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a4)
    {
      -[MKHex dataToHex:](v14, "dataToHex:", v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v31)
    {
      -[MKHex dataToHex:](v14, "dataToHex:", v22);
      *v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
LABEL_16:
  +[MKLog log](MKLog, "log", v31);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[MKSRPClient computeSharedKey:clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:].cold.1((uint64_t)self, v21, v25);

LABEL_19:
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)computeSharedKey:(NSObject *)a3 clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2048;
  v15 = objc_msgSend(a2, "code");
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "%@ %@ domain=%@, code=%ld", (uint8_t *)&v8, 0x2Au);

}

@end
