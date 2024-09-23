@implementation MKSRPServer

- (MKSRPServer)init
{
  void *v3;
  MKSRPServer *v4;

  +[MKSRPServer generateRandomPassword](MKSRPServer, "generateRandomPassword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MKSRPServer initWithUsername:password:](self, "initWithUsername:password:", 0x24E35CD38, v3);

  return v4;
}

- (MKSRPServer)initWithPassword:(id)a3
{
  return -[MKSRPServer initWithUsername:password:](self, "initWithUsername:password:", 0x24E35CD38, a3);
}

- (MKSRPServer)initWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  MKSRPServer *v8;
  MKSRPServer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MKSRPServer;
  v8 = -[MKSRPServer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MKSRPServer setUsername:](v8, "setUsername:", v6);
    -[MKSRPServer setPassword:](v9, "setPassword:", v7);
  }

  return v9;
}

+ (id)generateRandomPassword
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), arc4random_uniform(0xF423Fu));
}

- (void)dealloc
{
  objc_super v3;

  -[MKSRPServer cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)MKSRPServer;
  -[MKSRPServer dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  -[MKSRPServer cleanupSRP](self, "cleanupSRP");
  -[MKSRPServer setUsername:](self, "setUsername:", 0);
  -[MKSRPServer setPassword:](self, "setPassword:", 0);
}

- (void)cleanupSRP
{
  if (self->_session)
    SRP_free();
  self->_session = 0;
  -[MKSRPServer setSalt:](self, "setSalt:", 0);
  -[MKSRPServer setPubkey:](self, "setPubkey:", 0);
  -[MKSRPServer setProofOfMatch:](self, "setProofOfMatch:", 0);
}

- (NSData)sharedKey
{
  MKSRPServer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSData copy](v2->_sharedKey, "copy");
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)generateSalt:(id *)a3 pubkey:(id *)a4
{
  MKSRPServer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MKSRPServer _generateSalt:pubkey:](obj, "_generateSalt:pubkey:", a3, a4);
  objc_sync_exit(obj);

}

- (void)_generateSalt:(id *)a3 pubkey:(id *)a4
{
  srp_st *v7;
  MKError *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  MKError *v13;
  NSObject *v14;
  void *v15;
  MKHex *v16;
  uint64_t v17;
  _BYTE bytes[16];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MKSRPServer cleanupSRP](self, "cleanupSRP");
  -[MKSRPServer setSharedKey:](self, "setSharedKey:", 0);
  if (!-[NSString length](self->_username, "length") || !-[NSString length](self->_password, "length"))
  {
    v8 = [MKError alloc];
    v9 = CFSTR("could not continue to genegate salt because username or password was not configured.");
    v10 = 0;
LABEL_16:
    v13 = -[MKError initWithDomain:code:message:](v8, "initWithDomain:code:message:", 0x24E35CD18, v10, v9, v17);
    +[MKLog log](MKLog, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MKSRPServer _generateSalt:pubkey:].cold.1((uint64_t)self, v13);

    -[MKSRPServer cleanupSRP](self, "cleanupSRP");
    goto LABEL_19;
  }
  SRP6a_server_method();
  v7 = (srp_st *)SRP_new();
  self->_session = v7;
  if (!v7)
  {
    v8 = [MKError alloc];
    v9 = CFSTR("could not initialize SRP because there was an underlying issue occurred unexpectedly.");
    goto LABEL_8;
  }
  -[NSString UTF8String](self->_username, "UTF8String");
  if (SRP_set_username())
  {
    v8 = [MKError alloc];
    v9 = CFSTR("could not set username because there was an underlying issue occurred unexpectedly.");
LABEL_8:
    v10 = 1;
    goto LABEL_16;
  }
  if (CCRandomGenerateBytes(bytes, 0x10uLL))
  {
    v11 = CFSTR("could not generate a salt because there was an underlying issue occurred unexpectedly.");
LABEL_15:
    v8 = [MKError alloc];
    v10 = 1;
    v9 = v11;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSRPServer setSalt:](self, "setSalt:", v12);

  if (SRP_set_params())
  {
    v11 = CFSTR("could not set parameters because there was an underlying issue occurred unexpectedly.");
    goto LABEL_15;
  }
  -[NSString UTF8String](self->_password, "UTF8String");
  if (SRP_set_auth_password())
  {
    v11 = CFSTR("could not set password because there was an underlying issue occurred unexpectedly.");
    goto LABEL_15;
  }
  v17 = 0;
  if (SRP_gen_pub())
  {
    v8 = [MKError alloc];
    v9 = CFSTR("could not generate a public key because there was an underlying issue occurred unexpectedly.");
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0], MEMORY[8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSRPServer setPubkey:](self, "setPubkey:", v15);

  cstr_free();
  v16 = objc_alloc_init(MKHex);
  v13 = (MKError *)v16;
  if (a3)
  {
    -[MKHex dataToHex:](v16, "dataToHex:", self->_salt);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    -[MKError dataToHex:](v13, "dataToHex:", self->_pubkey);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

}

- (id)generateSharedKey:(id)a3 proofOfMatch:(id)a4
{
  id v6;
  id v7;
  MKSRPServer *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MKSRPServer _generateSharedKey:proofOfMatch:](v8, "_generateSharedKey:proofOfMatch:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (id)_generateSharedKey:(id)a3 proofOfMatch:(id)a4
{
  id v6;
  id v7;
  MKHex *v8;
  id v9;
  id v10;
  MKError *v11;
  const __CFString *v12;
  uint64_t v13;
  MKError *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  MKError *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MKHex);
  -[MKHex hexToData:](v8, "hexToData:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[MKHex hexToData:](v8, "hexToData:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_session)
  {
    v11 = [MKError alloc];
    v12 = CFSTR("could not generate a public key because there was an underlying issue occurred unexpectedly.");
    v13 = 2;
    goto LABEL_5;
  }
  v9 = objc_retainAutorelease(v9);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (SRP_compute_key() || !MEMORY[8])
  {
    v11 = [MKError alloc];
    v12 = CFSTR("could not compute a shared key because there was an underlying issue occurred unexpectedly.");
    v13 = 1;
LABEL_5:
    v14 = -[MKError initWithDomain:code:message:](v11, "initWithDomain:code:message:", 0x24E35CD18, v13, v12);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  cstr_free();
  v10 = objc_retainAutorelease(v10);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  if (SRP_verify())
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not generate proof of match because there was an underlying issue occurred unexpectedly or the client might send an invalid parameter.");
  }
  else
  {
    v22 = 0;
    if (!SRP_respond())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0], MEMORY[8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSRPServer setProofOfMatch:](self, "setProofOfMatch:", v21);

      cstr_free();
      -[MKSRPServer setSharedKey:](self, "setSharedKey:", v18);

      -[MKHex dataToHex:](v8, "dataToHex:", self->_sharedKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v19 = [MKError alloc];
    v20 = CFSTR("could not verify proof of match because there was an underlying issue occurred unexpectedly or the client might send an invalid parameter");
  }
  v14 = -[MKError initWithDomain:code:message:](v19, "initWithDomain:code:message:", 0x24E35CD18, 0, v20, v22);

LABEL_6:
  -[MKSRPServer setSharedKey:](self, "setSharedKey:", 0);
  +[MKLog log](MKLog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MKSRPServer _generateSalt:pubkey:].cold.1((uint64_t)self, v14);

  v16 = 0;
LABEL_9:
  -[MKSRPServer cleanupSRP](self, "cleanupSRP", v22);

  return v16;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (NSData)pubkey
{
  return self->_pubkey;
}

- (void)setPubkey:(id)a3
{
  objc_storeStrong((id *)&self->_pubkey, a3);
}

- (void)setSharedKey:(id)a3
{
  objc_storeStrong((id *)&self->_sharedKey, a3);
}

- (NSData)proofOfMatch
{
  return self->_proofOfMatch;
}

- (void)setProofOfMatch:(id)a3
{
  objc_storeStrong((id *)&self->_proofOfMatch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proofOfMatch, 0);
  objc_storeStrong((id *)&self->_sharedKey, 0);
  objc_storeStrong((id *)&self->_pubkey, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)_generateSalt:(uint64_t)a1 pubkey:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a2, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_21EC08000, v5, v6, "%@ %@ domain=%@, code=%ld", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

@end
