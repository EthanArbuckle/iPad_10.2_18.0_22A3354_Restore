@implementation KCAESGCMDuplexSession

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[KCAESGCMDuplexSession asSender](self, "asSender"), CFSTR("asSender"));
  -[KCAESGCMDuplexSession secret](self, "secret");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("secret"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession context](self, "context"), CFSTR("context"));
  -[KCAESGCMDuplexSession altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("altDSID"));

  -[KCAESGCMDuplexSession pairingUUID](self, "pairingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("uuid"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession piggybackingVersion](self, "piggybackingVersion"), CFSTR("piggy"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession epoch](self, "epoch"), CFSTR("epoch"));

}

- (KCAESGCMDuplexSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  KCAESGCMDuplexSession *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("asSender"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secret"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("context"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("piggy"));
  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("epoch"));

  v12 = -[KCAESGCMDuplexSession initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:](self, "initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:", v6, v7, v5, v8, v9, v10, v11);
  return v12;
}

- (id)initAsSender:(id)a3 context:(unint64_t)a4
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:](self, "initWithSecret:context:as:", a3, a4, 1);
}

- (id)initAsReceiver:(id)a3 context:(unint64_t)a4
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:](self, "initWithSecret:context:as:", a3, a4, 0);
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:](self, "initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:", a3, a4, a5, 0, 0, 0, 1);
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5 altDSID:(id)a6 pairingUUID:(id)a7 piggybackingVersion:(unint64_t)a8 epoch:(unint64_t)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  KCAESGCMDuplexSession *v18;
  KCAESGCMDuplexSession *v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  KCAESGCMDuplexSession *v30;
  objc_super v32;

  v12 = a5;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  if (initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken != -1)
    dispatch_once(&initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken, &__block_literal_global_289);
  v32.receiver = self;
  v32.super_class = (Class)KCAESGCMDuplexSession;
  v18 = -[KCAESGCMDuplexSession init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    -[KCAESGCMDuplexSession setAsSender:](v18, "setAsSender:", v12);
    -[KCAESGCMDuplexSession setSecret:](v19, "setSecret:", v15);
    ccaes_gcm_encrypt_mode();
    v20 = ccgcm_context_size();
    -[KCAESGCMDuplexSession setSend:](v19, "setSend:", malloc_type_malloc(v20, 0x6B11E69AuLL));
    ccaes_gcm_decrypt_mode();
    v21 = ccgcm_context_size();
    -[KCAESGCMDuplexSession setReceive:](v19, "setReceive:", malloc_type_malloc(v21, 0x92BC9A35uLL));
    -[KCAESGCMDuplexSession setContext:](v19, "setContext:", a4);
    objc_storeStrong((id *)&v19->_pairingUUID, a7);
    v19->_piggybackingVersion = a8;
    v19->_epoch = a9;
    objc_storeStrong((id *)&v19->_altDSID, a6);
    if (!-[KCAESGCMDuplexSession send](v19, "send") || !-[KCAESGCMDuplexSession receive](v19, "receive"))
    {
      v30 = 0;
      goto LABEL_15;
    }
    v22 = ccaes_gcm_encrypt_mode();
    v23 = -[KCAESGCMDuplexSession send](v19, "send");
    -[KCAESGCMDuplexSession secret](v19, "secret");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v25 = &kdfInfoSendToReceive;
    else
      v25 = &kdfInfoReceiveToSend;
    if (v12)
      v26 = &kdfInfoReceiveToSend;
    else
      v26 = &kdfInfoSendToReceive;
    derive_and_init(v22, v23, v24, (void *)*v25);

    v27 = ccaes_gcm_decrypt_mode();
    v28 = -[KCAESGCMDuplexSession receive](v19, "receive");
    -[KCAESGCMDuplexSession secret](v19, "secret");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    derive_and_init(v27, v28, v29, (void *)*v26);

  }
  v30 = v19;
LABEL_15:

  return v30;
}

- (unint64_t)encryptCapsuleSize:(id)a3 IV:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a4, "length");
  v6 = ccder_sizeof_raw_octet_string();
  if (v6)
  {
    objc_msgSend(v5, "length");
    if (ccder_sizeof_raw_octet_string()
      && (objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "length"),
          v8 = ccder_sizeof_raw_octet_string(),
          v7,
          v8))
    {
      v6 = ccder_sizeof();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)GCM:(const ccmode_gcm *)a3 context:(id *)a4 iv:(id)a5 size:(unint64_t)a6 data:(const char *)a7 processed:(char *)a8 tag:(char *)a9 error:(id *)a10
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;

  v10 = a5;
  v11 = ccgcm_reset();
  if (CoreCryptoError(v11, a10, CFSTR("ccgcm_reset failed: %d"), v12, v13, v14, v15, v16, v11)
    && (objc_msgSend(v10, "length"),
        objc_msgSend(objc_retainAutorelease(v10), "bytes"),
        v17 = ccgcm_set_iv(),
        CoreCryptoError(v17, a10, CFSTR("ccgcm_set_iv failed: %d"), v18, v19, v20, v21, v22, v17))
    && (v23 = ccgcm_update(), CoreCryptoError(v23, a10, CFSTR("ccgcm_update failed: %d"), v24, v25, v26, v27, v28, v23)))
  {
    v29 = ccgcm_finalize();
    v35 = CoreCryptoError(v29, a10, CFSTR("ccgcm_finalize failed: %d"), v30, v31, v32, v33, v34, v29);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)encrypt:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  $0DD201535F598B6025D84F9AACEC468E *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithRandomBytes:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", -[KCAESGCMDuplexSession encryptCapsuleSize:IV:](self, "encryptCapsuleSize:IV:", v6, v7));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "mutableBytes");
  objc_msgSend(v8, "length");
  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "bytes");
  v25 = 0;
  v26 = 0;
  v11 = objc_msgSend(v6, "length");
  kcder_encode_raw_octet_space(16, &v26);
  kcder_encode_raw_octet_space(v11, &v25);
  kcder_encode_data(v7);
  if (ccder_encode_constructed_tl() == v10)
  {
    v18 = ccaes_gcm_encrypt_mode();
    v19 = -[KCAESGCMDuplexSession send](self, "send");
    v20 = objc_msgSend(v6, "length");
    v21 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    if (-[KCAESGCMDuplexSession GCM:context:iv:size:data:processed:tag:error:](self, "GCM:context:iv:size:data:processed:tag:error:", v18, v19, v7, v20, v21, v25, v26, a4))
    {
      v22 = v9;
    }
    else
    {
      v22 = 0;
    }
    v17 = v22;
  }
  else
  {
    KCJoiningErrorCreate(0, a4, CFSTR("Failed to allocate space for der"), v12, v13, v14, v15, v16, v24);
    v17 = 0;
  }

  return v17;
}

- (id)decryptAndVerify:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  __int128 *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  $0DD201535F598B6025D84F9AACEC468E *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = v7 + v8;
  v39 = 0;
  v10 = ccder_decode_constructed_tl();
  if (v10)
    v16 = v39 == v9;
  else
    v16 = 0;
  if (!v16)
  {
    KCJoiningErrorCreate(1, a4, CFSTR("decode failed"), v11, v12, v13, v14, v15, v37);
    return 0;
  }
  v38 = 0;
  v18 = kcder_decode_data_internal(&v38, 1, a4, v10, v9);
  v19 = v38;
  v40 = v18;
  if (v18)
  {
    v20 = ccder_decode_constructed_tl();
    v21 = v40;
    v22 = ccder_decode_constructed_tl();
    if (v40)
    {
      if (v40 == v9)
      {
        v29 = (__int128 *)v22;
        if (v9 - v22 == 16)
        {
          v30 = v21 - v20;
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v21 - v20);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *v29;
          v32 = ccaes_gcm_decrypt_mode();
          v33 = -[KCAESGCMDuplexSession receive](self, "receive");
          v34 = objc_retainAutorelease(v31);
          if (-[KCAESGCMDuplexSession GCM:context:iv:size:data:processed:tag:error:](self, "GCM:context:iv:size:data:processed:tag:error:", v32, v33, v19, v30, v20, objc_msgSend(v34, "mutableBytes"), &v41, a4))
          {
            v35 = v34;
          }
          else
          {
            v35 = 0;
          }
          v36 = v35;

          goto LABEL_19;
        }
        v37 = v9 - v22;
        v28 = CFSTR("Unexpected tag size: %ld");
      }
      else
      {
        v28 = CFSTR("Extra space");
      }
    }
    else
    {
      v28 = CFSTR("Decode failure");
    }
    KCJoiningErrorCreate(1, a4, v28, v23, v24, v25, v26, v27, v37);
  }
  v36 = 0;
LABEL_19:

  return v36;
}

- (void)dealloc
{
  objc_super v3;

  if (-[KCAESGCMDuplexSession send](self, "send"))
  {
    ccaes_gcm_encrypt_mode();
    ccgcm_context_size();
    -[KCAESGCMDuplexSession send](self, "send");
    cc_clear();
    free(-[KCAESGCMDuplexSession send](self, "send"));
  }
  if (-[KCAESGCMDuplexSession receive](self, "receive"))
  {
    ccaes_gcm_decrypt_mode();
    ccgcm_context_size();
    -[KCAESGCMDuplexSession receive](self, "receive");
    cc_clear();
    free(-[KCAESGCMDuplexSession receive](self, "receive"));
  }
  v3.receiver = self;
  v3.super_class = (Class)KCAESGCMDuplexSession;
  -[KCAESGCMDuplexSession dealloc](&v3, sel_dealloc);
}

- (NSString)pairingUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)piggybackingVersion
{
  return self->_piggybackingVersion;
}

- (void)setPiggybackingVersion:(unint64_t)a3
{
  self->_piggybackingVersion = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (BOOL)asSender
{
  return self->_asSender;
}

- (void)setAsSender:(BOOL)a3
{
  self->_asSender = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSData)secret
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSecret:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- ($0DD201535F598B6025D84F9AACEC468E)send
{
  return self->_send;
}

- (void)setSend:(id *)a3
{
  self->_send = a3;
}

- ($0DD201535F598B6025D84F9AACEC468E)receive
{
  return self->_receive;
}

- (void)setReceive:(id *)a3
{
  self->_receive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
}

void __97__KCAESGCMDuplexSession_initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", "send->recv", 10, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kdfInfoSendToReceive;
  kdfInfoSendToReceive = v0;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", "recv->send", 10, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)kdfInfoReceiveToSend;
  kdfInfoReceiveToSend = v2;

}

+ (id)sessionAsSender:(id)a3 context:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[KCAESGCMDuplexSession initAsSender:context:]([KCAESGCMDuplexSession alloc], "initAsSender:context:", v5, a4);

  return v6;
}

+ (id)sessionAsReceiver:(id)a3 context:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[KCAESGCMDuplexSession initAsReceiver:context:]([KCAESGCMDuplexSession alloc], "initAsReceiver:context:", v5, a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
