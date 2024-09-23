@implementation REAudioGroupPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAudioGroupPayload)initWithPayloads:(id)a3
{
  id v5;
  REAudioGroupPayload *v6;
  REAudioGroupPayload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAudioGroupPayload;
  v6 = -[RESharedResourcePayload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payloads, a3);

  return v7;
}

- (REAudioGroupPayload)initWithCoder:(id)a3
{
  id v4;
  REAudioGroupPayload *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSArray *payloads;
  re *v17;
  NSObject *v18;
  REAudioGroupPayload *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)REAudioGroupPayload;
    v5 = -[RESharedResourcePayload initWithCoder:](&v25, sel_initWithCoder_, v4);
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v13, CFSTR("payloads"), &v24);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v24;
      payloads = v5->_payloads;
      v5->_payloads = (NSArray *)v14;

      if (v15)
      {
        v18 = *re::audioLogObjects(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v15;
          _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "Failed to decode AudioGroupPayload: %@", buf, 0xCu);
        }
      }

    }
    self = v5;
    v19 = self;
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0BA0];
    v29[0] = CFSTR("REAudioGroupPayload requires an NSXPCCoder");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_payloads, CFSTR("payloads"));
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = CFSTR("REAudioPayload requires an NSXPCCoder");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v7);

  }
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
