@implementation IDSGroupSessionDataCryptor

- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3
{
  id v4;
  IDSGroupSessionDataCryptor *v5;
  IDSGroupSessionDataCryptor *v6;
  uint64_t v7;
  NSString *topic;
  uint64_t v9;
  NSMapTable *decryptionCryptorsByKeyID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSGroupSessionDataCryptor;
  v5 = -[IDSGroupSessionDataCryptor init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    topic = v6->_topic;
    v6->_topic = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 32);
    decryptionCryptorsByKeyID = v6->_decryptionCryptorsByKeyID;
    v6->_decryptionCryptorsByKeyID = (NSMapTable *)v9;

  }
  return v6;
}

- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3 keyManager:(id)a4
{
  id v6;
  IDSGroupSessionDataCryptor *v7;
  IDSGroupSessionDataCryptor *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  id *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  id *v22;
  _QWORD v23[4];
  id *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[IDSGroupSessionDataCryptor initWithTopic:](self, "initWithTopic:", a3);
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1906FBF4C;
    v23[3] = &unk_1E2C60C28;
    v10 = v7;
    v24 = v10;
    objc_msgSend(v6, "useCurrentEncryptionkeyWithHandler:", v23);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[7];
    v10[7] = (id)v11;

    v18 = v9;
    v19 = 3221225472;
    v20 = sub_1906FBFDC;
    v21 = &unk_1E2C60C28;
    v13 = v10;
    v22 = v13;
    objc_msgSend(v6, "enumerateDecryptingKeysAndSaltsUsingBlock:", &v18);
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor", v18, v19, v20, v21);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Created IDSGroupSessionDataCryptor: %@", buf, 0xCu);

    }
    if (v13[3])
    {
      objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", v13[4], v13[5]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[7], "setObject:forKeyedSubscript:", v16, v13[3]);

    }
  }

  return v8;
}

- (void)dealloc
{
  _CCCryptor *encryptingCryptor;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const void *v9;
  id v10;
  objc_super v11;
  void *value;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  encryptingCryptor = self->_encryptingCryptor;
  if (encryptingCryptor)
    CCCryptorRelease(encryptingCryptor);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_decryptionCryptorsByKeyID;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(const void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = -[NSMapTable objectForKey:](self->_decryptionCryptorsByKeyID, "objectForKey:", v9);
        value = (void *)0xAAAAAAAAAAAAAAAALL;
        if (NSMapMember(self->_decryptionCryptorsByKeyID, v9, 0, &value) && value)
          CCCryptorRelease((CCCryptorRef)value);
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)IDSGroupSessionDataCryptor;
  -[IDSGroupSessionDataCryptor dealloc](&v11, sel_dealloc);
}

- (id)encryptData:(id)a3 sequenceNumber:(unint64_t)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  id *v10;
  NSObject *v11;
  NSString *topic;
  id v13;
  id v14;
  void *v15;
  _BYTE *v16;
  int v17;
  NSObject *v18;
  NSString *v19;
  uint64_t v20;
  CCCryptorStatus v21;
  NSObject *v22;
  NSString *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  NSString *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _CCCryptor *encryptingCryptor;
  id v35;
  int v36;
  NSObject *v37;
  NSString *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  NSObject *v44;
  NSString *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  NSObject *v51;
  NSString *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint8_t buf[4];
  NSString *v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)objc_msgSend(v8, "length") >= 0xFFFFFFF1)
  {
    v10 = a5;
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      topic = self->_topic;
      *(_DWORD *)buf = 138412546;
      v80 = topic;
      v81 = 2048;
      v82 = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "encryptData: plaintext larger than GCM can support for topic %@ data.length %lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - plaintext larger than GCM can support for topic %@ data.length %lu"), self->_topic, objc_msgSend(v8, "length"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v77 = *MEMORY[0x1E0CB2D50];
    v78 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *v10 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 4, v15);

    goto LABEL_38;
  }
  v62 = a5;
  if (!self->_encryptingCryptor)
  {
    v21 = CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, -[NSData bytes](self->_encryptingKey, "bytes"), -[NSData length](self->_encryptingKey, "length"), 0, 0, 0, 0, &self->_encryptingCryptor);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_topic;
        v24 = v21;
        *(_DWORD *)buf = 138412546;
        v80 = v23;
        v81 = 2048;
        v82 = v21;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "encryptData: failed to create CommonCrypto cryptor for topic %@ error %ld", buf, 0x16u);
      }
      else
      {
        v24 = v21;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - failed to create CommonCrypto cryptor for topic %@ error %ld"), self->_topic, v24);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v75 = *MEMORY[0x1E0CB2D50];
      v76 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *v62 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v33);

LABEL_38:
      v57 = 0;
      goto LABEL_39;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v8, "length") + 29);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (_BYTE *)objc_msgSend(v13, "mutableBytes");
  *v16 = 1;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0xCuLL, v16 + 1))
    __assert_rtn("-[IDSGroupSessionDataCryptor encryptData:sequenceNumber:error:]", "IDSGroupSessionDataCryptor.m", 197, "0 == SecRandomCopyBytes(kSecRandomDefault, IDSGROUPSESSIONCRYPTOR_NONCE_SIZE_NBYTES, nonceBytes)");
  v17 = CCCryptorGCMSetIV();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_topic;
      v20 = v17;
      *(_DWORD *)buf = 138412546;
      v80 = v19;
      v81 = 2048;
      v82 = v17;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "encryptData: failed to set IV for topic %@ error %ld", buf, 0x16u);
    }
    else
    {
      v20 = v17;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to set IV for topic %@ error %ld"), self->_topic, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *v62 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v31);

    goto LABEL_38;
  }
  v71 = 0xAAAAAAAAAAAAAAAALL;
  v72 = -86;
  LOBYTE(v71) = *v16;
  BYTE1(v71) = HIBYTE(a4);
  BYTE2(v71) = BYTE6(a4);
  BYTE3(v71) = BYTE5(a4);
  BYTE4(v71) = BYTE4(a4);
  BYTE5(v71) = BYTE3(a4);
  BYTE6(v71) = BYTE2(a4);
  HIBYTE(v71) = BYTE1(a4);
  v72 = a4;
  v25 = CCCryptorGCMAddAAD();
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_topic;
      v28 = v25;
      *(_DWORD *)buf = 138412546;
      v80 = v27;
      v81 = 2048;
      v82 = v25;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "encryptData: failed to add AAD for topic %@ error %ld", buf, 0x16u);
    }
    else
    {
      v28 = v25;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to add AAD for topic %@ error %ld"), self->_topic, v28);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *v62 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v42);

    goto LABEL_38;
  }
  encryptingCryptor = self->_encryptingCryptor;
  v35 = objc_retainAutorelease(v8);
  v36 = MEMORY[0x19400EEA4](encryptingCryptor, objc_msgSend(v35, "bytes"), objc_msgSend(v35, "length"), v16 + 13);
  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_topic;
      v39 = v36;
      *(_DWORD *)buf = 138412546;
      v80 = v38;
      v81 = 2048;
      v82 = v36;
      _os_log_impl(&dword_1906E0000, v37, OS_LOG_TYPE_DEFAULT, "encryptData: failed to encrypt for topic %@ error %ld", buf, 0x16u);
    }
    else
    {
      v39 = v36;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to encrypt for topic %@ error %ld"), self->_topic, v39);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v67 = *MEMORY[0x1E0CB2D50];
    v68 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *v62 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v49);

    goto LABEL_38;
  }
  objc_msgSend(v35, "length");
  v43 = CCCryptorGCMFinalize();
  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = self->_topic;
      v46 = v43;
      *(_DWORD *)buf = 138412546;
      v80 = v45;
      v81 = 2048;
      v82 = v43;
      _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "encryptData: failed to create auth tag for topic %@ error %ld", buf, 0x16u);
    }
    else
    {
      v46 = v43;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to create auth tag for topic %@ error %ld"), self->_topic, v46);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v65 = *MEMORY[0x1E0CB2D50];
    v66 = v54;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *v62 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v56);

    goto LABEL_38;
  }
  v50 = CCCryptorGCMReset();
  if (v50)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = self->_topic;
      v53 = v50;
      *(_DWORD *)buf = 138412546;
      v80 = v52;
      v81 = 2048;
      v82 = v50;
      _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "encryptData: failed to reset cryptor for topic %@ error %ld", buf, 0x16u);
    }
    else
    {
      v53 = v50;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to reset for topic %@ error %ld"), self->_topic, v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *v62 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v60);

    goto LABEL_38;
  }
  v57 = v13;
LABEL_39:

  os_unfair_lock_unlock(p_lock);
  return v57;
}

- (id)getEncryptionKeyID
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSUUID copy](self->_encryptingKeyID, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)decryptData:(id)a3 keyID:(id)a4 sequenceNumber:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  os_unfair_lock_s *p_lock;
  NSObject *v13;
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BYTE *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  NSString *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  NSString *v30;
  NSObject *v31;
  NSString *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSString *topic;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSString *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v50;
  void *v51;
  CCCryptorRef v52;
  int v53;
  NSObject *v54;
  NSString *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  int v62;
  NSObject *v63;
  NSString *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  NSObject *v70;
  NSString *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id *v80;
  void *value;
  CCCryptorRef cryptorRef;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint8_t buf[4];
  NSString *v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  _QWORD v108[4];

  v108[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v80 = a6;
  if ((unint64_t)objc_msgSend(v10, "length") > 0x1D)
  {
    value = (void *)0xAAAAAAAAAAAAAAAALL;
    cryptorRef = (CCCryptorRef)0xAAAAAAAAAAAAAAAALL;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_decryptionKeysByKeyID, "objectForKeyedSubscript:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (NSMapMember(self->_decryptionCryptorsByKeyID, v11, 0, &value))
    {
      cryptorRef = (CCCryptorRef)value;
    }
    else
    {
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          topic = self->_topic;
          *(_DWORD *)buf = 138412546;
          v100 = topic;
          v101 = 2112;
          v102 = (uint64_t)v11;
          _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "decryptData: unknown keyID for topic %@ keyID %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - unknown keyID %@"), v11);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v105 = *MEMORY[0x1E0CB2D50];
        v106 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *v80 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 1, v40);

        goto LABEL_29;
      }
      objc_msgSend(v19, "first");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(v28) = CCCryptorCreateWithMode(1u, 0xBu, 0, 0, 0, (const void *)objc_msgSend(v27, "bytes"), objc_msgSend(v27, "length"), 0, 0, 0, 0, &cryptorRef);
      if ((_DWORD)v28)
      {
        objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_topic;
          v28 = (int)v28;
          *(_DWORD *)buf = 138412802;
          v100 = v30;
          v101 = 2112;
          v102 = (uint64_t)v11;
          v103 = 2048;
          v104 = (int)v28;
          _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "decryptData: failed to create cryptor for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          v28 = (int)v28;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - CommonCryptor fails to create cryptor for topic %@ keyID %@ error %ld"), self->_topic, v11, v28);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v97 = *MEMORY[0x1E0CB2D50];
        v98 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *v80 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v45);

        goto LABEL_29;
      }
      -[NSMapTable setObject:forKey:](self->_decryptionCryptorsByKeyID, "setObject:forKey:", cryptorRef, v11);

    }
    v20 = objc_retainAutorelease(v10);
    v21 = (_BYTE *)objc_msgSend(v20, "bytes");
    v22 = *v21;
    if ((_DWORD)v22 != 1)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = self->_topic;
        *(_DWORD *)buf = 138412802;
        v100 = v32;
        v101 = 2112;
        v102 = (uint64_t)v11;
        v103 = 1024;
        LODWORD(v104) = v22;
        _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "decryptData: unknown version for topic %@ keyID %@ version %u", buf, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - unknown version for topic %@ keyID %@ version %u"), self->_topic, v11, v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v95 = *MEMORY[0x1E0CB2D50];
      v96 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *v80 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 6, v35);

      goto LABEL_29;
    }
    v23 = CCCryptorGCMSetIV();
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_topic;
        v26 = v23;
        *(_DWORD *)buf = 138412802;
        v100 = v25;
        v101 = 2112;
        v102 = (uint64_t)v11;
        v103 = 2048;
        v104 = v23;
        _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "decryptData: failed to set IV for topic %@ keyID %@ error %ld", buf, 0x20u);
      }
      else
      {
        v26 = v23;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - CommonCryptor fails to set IV for topic %@ keyID %@ error %ld"), self->_topic, v11, v26);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v93 = *MEMORY[0x1E0CB2D50];
      v94 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *v80 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v48);

LABEL_29:
      v18 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v91 = 0xAAAAAAAAAAAAAAAALL;
    v92 = -86;
    LOBYTE(v91) = *v21;
    BYTE1(v91) = HIBYTE(a5);
    BYTE2(v91) = BYTE6(a5);
    BYTE3(v91) = BYTE5(a5);
    BYTE4(v91) = BYTE4(a5);
    BYTE5(v91) = BYTE3(a5);
    BYTE6(v91) = BYTE2(a5);
    HIBYTE(v91) = BYTE1(a5);
    v92 = a5;
    LODWORD(a5) = CCCryptorGCMAddAAD();
    if ((_DWORD)a5)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = self->_topic;
        a5 = (int)a5;
        *(_DWORD *)buf = 138412546;
        v100 = v42;
        v101 = 2048;
        v102 = (int)a5;
        _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, "encryptData: failed to add AAD for topic %@ error %ld", buf, 0x16u);
      }
      else
      {
        a5 = (int)a5;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encryption failed - CommonCryptor failed to add AAD for topic %@ error %ld"), self->_topic, a5);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v89 = *MEMORY[0x1E0CB2D50];
      v90 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)v57;
      *v80 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v59);

      v18 = 0;
      v61 = v60;
      goto LABEL_51;
    }
    v50 = objc_msgSend(v20, "length") - 29;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = cryptorRef;
    v79 = objc_retainAutorelease(v51);
    v53 = MEMORY[0x19400EE98](v52, v21 + 13, v50, objc_msgSend(v79, "mutableBytes"));
    if (v53)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = self->_topic;
        v56 = v53;
        *(_DWORD *)buf = 138412802;
        v100 = v55;
        v101 = 2112;
        v102 = (uint64_t)v11;
        v103 = 2048;
        v104 = v53;
        _os_log_impl(&dword_1906E0000, v54, OS_LOG_TYPE_DEFAULT, "decryptData: failed to decrypt for topic %@ keyID %@ error %ld", buf, 0x20u);
      }
      else
      {
        v56 = v53;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - CommonCryptor failed to decrypt for topic %@ keyID %@ error %ld"), self->_topic, v11, v56);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v87 = *MEMORY[0x1E0CB2D50];
      v88 = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *v80 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v68);

    }
    else
    {
      v62 = CCCryptorGCMFinalize();
      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = self->_topic;
          v65 = v62;
          *(_DWORD *)buf = 138412802;
          v100 = v64;
          v101 = 2112;
          v102 = (uint64_t)v11;
          v103 = 2048;
          v104 = v62;
          _os_log_impl(&dword_1906E0000, v63, OS_LOG_TYPE_DEFAULT, "decryptData: failed to verify auth tag for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          v65 = v62;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - failed to verify auth tag for topic %@ keyID %@ error %ld"), self->_topic, v11, v65);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v85 = *MEMORY[0x1E0CB2D50];
        v86 = v73;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *v80 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 3, v75);

      }
      else
      {
        v69 = CCCryptorGCMReset();
        if (!v69)
        {
          v61 = v79;
          v18 = v61;
LABEL_51:

          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = self->_topic;
          v72 = v69;
          *(_DWORD *)buf = 138412802;
          v100 = v71;
          v101 = 2112;
          v102 = (uint64_t)v11;
          v103 = 2048;
          v104 = v69;
          _os_log_impl(&dword_1906E0000, v70, OS_LOG_TYPE_DEFAULT, "decryptData: failed to reset cryptor for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          v72 = v69;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - CommonCryptor failed to reset for topic %@ keyID %@ error %ld"), self->_topic, v11, v72);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v83 = *MEMORY[0x1E0CB2D50];
        v84 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *v80 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 2, v78);

      }
    }
    v18 = 0;
    v61 = v79;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionDataCryptor");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_topic;
    *(_DWORD *)buf = 138412546;
    v100 = v14;
    v101 = 2048;
    v102 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "decryptData: insufficient incoming data for topic %@ size %lu", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decryption failed - data has insufficient bytes to decrypt for topic %@ keyID %@"), self->_topic, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v107 = *MEMORY[0x1E0CB2D50];
  v108[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *v80 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 4, v17);

  v18 = 0;
LABEL_31:
  os_unfair_lock_unlock(p_lock);

  return v18;
}

- (id)getDecryptionKeyIDSet
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_decryptionKeysByKeyID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && -[IDSGroupSessionDataCryptor isEqualToCryptor:](self, "isEqualToCryptor:", v4);

  return v6;
}

- (BOOL)isEqualToCryptor:(id)a3
{
  id *v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (-[NSUUID isEqual:](self->_encryptingKeyID, "isEqual:", v4[3])
    && -[NSData isEqual:](self->_encryptingKey, "isEqual:", v4[4])
    && -[NSData isEqual:](self->_encryptingKeySalt, "isEqual:", v4[5])
    && (v5 = -[NSMutableDictionary count](self->_decryptionKeysByKeyID, "count"), v5 == objc_msgSend(v4[7], "count")))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_decryptionKeysByKeyID;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_decryptionKeysByKeyID, "objectForKeyedSubscript:", v11, (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4[7], "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (!v14)
          {
            v15 = 0;
            goto LABEL_17;
          }
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_17:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Class:%@, Topic:%@, EncryptionKeyID:%@, DecryptionKeyCount:%lu}"), objc_opt_class(), self->_topic, self->_encryptingKeyID, -[NSMutableDictionary count](self->_decryptionKeysByKeyID, "count"));
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  NSString *topic;
  NSUUID *encryptingKeyID;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  topic = self->_topic;
  encryptingKeyID = self->_encryptingKeyID;
  -[NSMutableDictionary allKeys](self->_decryptionKeysByKeyID, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{Object:%p, Class:%@, Topic:%@, EncryptionKeyID:%@, DecryptionKeys:%@}"), self, v4, topic, encryptingKeyID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_topic, CFSTR("topic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptingKeyID, CFSTR("encryptingKeyID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptingKey, CFSTR("encryptingKey"));
  v17 = v4;
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptingKeySalt, CFSTR("encryptingKeySalt"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_decryptionKeysByKeyID;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_decryptionKeysByKeyID, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(v14, "first");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

        objc_msgSend(v14, "second");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("decryptingKeyIDs"));
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("decryptingKeys"));
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("decryptingKeySalts"));

}

- (IDSGroupSessionDataCryptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  IDSGroupSessionDataCryptor *v6;
  uint64_t v7;
  NSUUID *encryptingKeyID;
  uint64_t v9;
  NSData *encryptingKey;
  uint64_t v11;
  NSData *encryptingKeySalt;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *decryptionKeysByKeyID;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  IDSGroupSessionDataCryptor *v36;
  void *v38;
  id v39;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IDSGroupSessionDataCryptor initWithTopic:](self, "initWithTopic:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptingKeyID"));
    v7 = objc_claimAutoreleasedReturnValue();
    encryptingKeyID = v6->_encryptingKeyID;
    v6->_encryptingKeyID = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptingKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    encryptingKey = v6->_encryptingKey;
    v6->_encryptingKey = (NSData *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptingKeySalt"));
    v11 = objc_claimAutoreleasedReturnValue();
    encryptingKeySalt = v6->_encryptingKeySalt;
    v6->_encryptingKeySalt = (NSData *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("decryptingKeyIDs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("decryptingKeys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("decryptingKeySalts"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v16, "count");
    if (v25 != objc_msgSend(v20, "count") || (v26 = objc_msgSend(v16, "count"), v26 != objc_msgSend(v24, "count")))
    {

      v36 = 0;
      goto LABEL_10;
    }
    v38 = v5;
    v39 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    v27 = objc_claimAutoreleasedReturnValue();
    decryptionKeysByKeyID = v6->_decryptionKeysByKeyID;
    v6->_decryptionKeysByKeyID = (NSMutableDictionary *)v27;

    if (objc_msgSend(v16, "count"))
    {
      v29 = 0;
      do
      {
        v30 = (void *)MEMORY[0x1E0D36A98];
        objc_msgSend(v20, "objectAtIndexedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pairWithFirst:second:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v6->_decryptionKeysByKeyID;
        objc_msgSend(v16, "objectAtIndexedSubscript:", v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v33, v35);

        ++v29;
      }
      while (v29 < objc_msgSend(v16, "count"));
    }

    v5 = v38;
    v4 = v39;
  }
  v36 = v6;
LABEL_10:

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSGroupSessionDataCryptor initWithTopic:]([IDSGroupSessionDataCryptor alloc], "initWithTopic:", self->_topic);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptionCryptorsByKeyID, 0);
  objc_storeStrong((id *)&self->_decryptionKeysByKeyID, 0);
  objc_storeStrong((id *)&self->_encryptingKeySalt, 0);
  objc_storeStrong((id *)&self->_encryptingKey, 0);
  objc_storeStrong((id *)&self->_encryptingKeyID, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
