@implementation MPCModelRadioContentReference

- (MPCModelRadioContentReference)initWithICRadioContentReference:(id)a3
{
  id v4;
  MPCModelRadioContentReference *v5;
  uint64_t v6;
  ICRadioContentReference *ICRadioContentReference;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioContentReference;
  v5 = -[MPCModelRadioContentReference init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    ICRadioContentReference = v5->_ICRadioContentReference;
    v5->_ICRadioContentReference = (ICRadioContentReference *)v6;

  }
  return v5;
}

- (MPCModelRadioContentReference)initWithCoder:(id)a3
{
  id v4;
  MPCModelRadioContentReference *v5;
  uint64_t v6;
  ICRadioContentReference *ICRadioContentReference;
  uint64_t v8;
  MPIdentifierSet *referenceModelObjectIdentifiers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCModelRadioContentReference;
  v5 = -[MPCModelRadioContentReference init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cr"));
    v6 = objc_claimAutoreleasedReturnValue();
    ICRadioContentReference = v5->_ICRadioContentReference;
    v5->_ICRadioContentReference = (ICRadioContentReference *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ids"));
    v8 = objc_claimAutoreleasedReturnValue();
    referenceModelObjectIdentifiers = v5->_referenceModelObjectIdentifiers;
    v5->_referenceModelObjectIdentifiers = (MPIdentifierSet *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ICRadioContentReference *ICRadioContentReference;
  id v5;

  ICRadioContentReference = self->_ICRadioContentReference;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ICRadioContentReference, CFSTR("cr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceModelObjectIdentifiers, CFSTR("ids"));

}

- (ICRadioContentReference)ICRadioContentReference
{
  return self->_ICRadioContentReference;
}

- (MPIdentifierSet)referenceModelObjectIdentifiers
{
  return self->_referenceModelObjectIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceModelObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_ICRadioContentReference, 0);
}

+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3
{
  return (MPCModelRadioContentReference *)objc_msgSend(a1, "referenceWithMPModelObject:containerModelPlayEvent:", a3, 0);
}

+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3 containerModelPlayEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char *v16;
  uint64_t quot;
  lldiv_t v18;
  uint64_t v19;
  const UInt8 *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mpc_radioContentReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (!v7 || !objc_msgSend(v8, "conformsToProtocol:", &unk_254AEC248))
      goto LABEL_22;
    v10 = v9;
    v11 = objc_msgSend(v7, "itemType");
    if (v11 == 3)
    {
      objc_msgSend(v7, "playlist");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "universalStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "globalPlaylistID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "length"))
      {
        objc_msgSend(v14, "universalCloudLibraryID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "length"))
          objc_msgSend(v10, "setContainerID:", v28);

        goto LABEL_20;
      }
    }
    else
    {
      if (v11 != 1)
      {
LABEL_21:

LABEL_22:
        v22 = (id *)objc_alloc_init((Class)a1);
        objc_storeStrong(v22 + 1, v9);
        objc_msgSend(v6, "identifiers");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v22[2];
        v22[2] = (id)v25;

        goto LABEL_23;
      }
      objc_msgSend(v7, "album");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "universalStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "purchasedAdamID");
      if (v15 || (v15 = objc_msgSend(v14, "subscriptionAdamID")) != 0 || (v15 = objc_msgSend(v14, "adamID")) != 0)
      {
        v16 = (char *)&v31 + 1;
        quot = v15;
        do
        {
          v18 = lldiv(quot, 10);
          quot = v18.quot;
          if (v18.rem >= 0)
            LOBYTE(v19) = v18.rem;
          else
            v19 = -v18.rem;
          *(v16 - 2) = v19 + 48;
          v20 = (const UInt8 *)(v16 - 2);
          --v16;
        }
        while (v18.quot);
        if (v15 < 0)
        {
          *(v16 - 2) = 45;
          v20 = (const UInt8 *)(v16 - 2);
        }
        v21 = (void *)CFStringCreateWithBytes(0, v20, (char *)&v31 - (char *)v20, 0x8000100u, 0);
      }
      else
      {
        objc_msgSend(v6, "identifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "personalizedStore");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "cloudAlbumID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v21, "length"))
          goto LABEL_20;
      }
    }
    objc_msgSend(v10, "setContainerID:", v21);
LABEL_20:

    goto LABEL_21;
  }
  v22 = 0;
LABEL_23:

  return (MPCModelRadioContentReference *)v22;
}

+ (MPCModelRadioContentReference)referenceWithStoreIdentifier:(id)a3 trackInfo:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BEC8978];
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend([v6 alloc], "initWithStoreIdentifier:trackInfo:", v8, v7);

  v10 = objc_alloc_init((Class)a1);
  v11 = (void *)v10[1];
  v10[1] = v9;

  return (MPCModelRadioContentReference *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
