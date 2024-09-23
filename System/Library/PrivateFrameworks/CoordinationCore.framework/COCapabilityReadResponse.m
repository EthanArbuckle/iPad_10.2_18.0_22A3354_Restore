@implementation COCapabilityReadResponse

- (COCapabilityReadResponse)init
{
  void *v3;
  COCapabilityReadResponse *v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[COCapabilityReadResponse initWithCapabilities:](self, "initWithCapabilities:", v3);

  return v4;
}

- (COCapabilityReadResponse)initWithCapabilities:(id)a3
{
  id v4;
  COCapabilityReadResponse *v5;
  uint64_t v6;
  NSSet *capabilities;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COCapabilityReadResponse;
  v5 = -[COMeshCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    capabilities = v5->_capabilities;
    v5->_capabilities = (NSSet *)v6;

  }
  return v5;
}

- (COCapabilityReadResponse)initWithCoder:(id)a3
{
  id v4;
  COCapabilityReadResponse *v5;
  id *p_isa;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  COCapabilityReadResponse *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COCapabilityReadResponse;
  v5 = -[COMeshResponse initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    p_isa = (id *)&v5->super.super.super.isa;
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("capabilities"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = p_isa[2];
    p_isa[2] = (id)v10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = (id *)p_isa[2];
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
              goto LABEL_15;
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v14)
            continue;
          break;
        }
      }
      v17 = (COCapabilityReadResponse *)p_isa;
    }
    else
    {
      v17 = 0;
      v12 = p_isa;
    }
LABEL_15:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COCapabilityReadResponse;
  v4 = a3;
  -[COMeshResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COCapabilityReadResponse capabilities](self, "capabilities", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("capabilities"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
