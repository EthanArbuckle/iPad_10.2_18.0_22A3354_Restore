@implementation NFTag

- (NSData)atqa
{
  return self->_atqa;
}

- (NSData)sak
{
  return self->_sak;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (NSData)selectedAID
{
  return self->_appData;
}

- (double)sfgt
{
  return dbl_19B68A9D8[self->_sfgi] / 13560000.0;
}

- (unsigned)sfgi
{
  return self->_sfgi;
}

- (NSData)pupi
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 0, 4);
}

- (NSData)applicationData
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 4, 4);
}

- (BOOL)applicationDataCoding
{
  return (*(_BYTE *)(-[NSData bytes](self->_tagID, "bytes") + 10) & 0xC) == 4;
}

- (NSData)IDm
{
  return self->_tagID;
}

- (NSData)PMm
{
  return self->_pmm;
}

- (NSData)SystemCode
{
  return self->_appData;
}

- (NSArray)allSystemCodes
{
  return self->_allSystemCodes;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)technology
{
  return self->_technology;
}

- (NSData)UID
{
  return self->_uid;
}

- (NSData)tagID
{
  return self->_tagID;
}

- (NSData)AppData
{
  return self->_appData;
}

- (unsigned)ndefAvailability
{
  return self->_ndefAvailability;
}

- (unint64_t)ndefMessageSize
{
  return self->_ndefMessageSize;
}

- (unint64_t)ndefContainerSize
{
  return self->_ndefContainerSize;
}

- (NSString)description
{
  return self->_description;
}

- (NFTagA)tagA
{
  if (self->_technology == 1)
    return (NFTagA *)self;
  else
    return (NFTagA *)0;
}

- (NFTagB)tagB
{
  if (self->_technology == 2)
    return (NFTagB *)self;
  else
    return (NFTagB *)0;
}

- (NFTagF)tagF
{
  if (self->_technology == 4)
    return (NFTagF *)self;
  else
    return (NFTagF *)0;
}

- (NFTag)initWithNFTag:(id)a3
{
  id v4;
  NFTag *v5;
  void *v6;
  uint64_t v7;
  NSData *uid;
  void *v9;
  uint64_t v10;
  NSData *tagID;
  void *v12;
  uint64_t v13;
  NSString *description;
  id v15;
  void *v16;
  uint64_t v17;
  NSData *atqa;
  void *v19;
  uint64_t v20;
  NSData *sak;
  void *v22;
  uint64_t v23;
  NSData *historicalBytes;
  void *v25;
  uint64_t v26;
  NSData *appData;
  id v28;
  void *v29;
  uint64_t v30;
  NSData *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSData *pmm;
  void *v36;
  uint64_t v37;
  NSData *v38;
  void *v39;
  uint64_t v40;
  NSArray *allSystemCodes;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NFTag;
  v5 = -[NFTag init](&v43, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    v5->_technology = objc_msgSend(v4, "technology");
    objc_msgSend(v4, "UID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    objc_msgSend(v4, "tagID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v10;

    objc_msgSend(v4, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    description = v5->_description;
    v5->_description = (NSString *)v13;

    v5->_ndefAvailability = objc_msgSend(v4, "ndefAvailability");
    v5->_ndefMessageSize = objc_msgSend(v4, "ndefMessageSize");
    v5->_ndefContainerSize = objc_msgSend(v4, "ndefContainerSize");
    if (objc_msgSend(v4, "technology") == 1
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE4045C0))
    {
      v15 = v4;
      objc_msgSend(v15, "atqa");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      atqa = v5->_atqa;
      v5->_atqa = (NSData *)v17;

      objc_msgSend(v15, "sak");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      sak = v5->_sak;
      v5->_sak = (NSData *)v20;

      objc_msgSend(v15, "historicalBytes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      historicalBytes = v5->_historicalBytes;
      v5->_historicalBytes = (NSData *)v23;

      objc_msgSend(v15, "selectedAID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      appData = v5->_appData;
      v5->_appData = (NSData *)v26;

      LOBYTE(v25) = objc_msgSend(v15, "sfgi");
      v5->_sfgi = v25;
    }
    if (objc_msgSend(v4, "technology") == 2
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE404650))
    {
      v28 = v4;
      objc_msgSend(v28, "selectedAID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      v31 = v5->_appData;
      v5->_appData = (NSData *)v30;

      LOBYTE(v29) = objc_msgSend(v28, "sfgi");
      v5->_sfgi = v29;
    }
    if (objc_msgSend(v4, "technology") == 4
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE4046E0))
    {
      v32 = v4;
      objc_msgSend(v32, "PMm");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "copy");
      pmm = v5->_pmm;
      v5->_pmm = (NSData *)v34;

      objc_msgSend(v32, "SystemCode");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "copy");
      v38 = v5->_appData;
      v5->_appData = (NSData *)v37;

      objc_msgSend(v32, "allSystemCodes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_msgSend(v39, "copy");
      allSystemCodes = v5->_allSystemCodes;
      v5->_allSystemCodes = (NSArray *)v40;

    }
  }

  return v5;
}

- (NFTag)initWithCoder:(id)a3
{
  id v4;
  NFTag *v5;
  uint64_t v6;
  NSData *tagID;
  uint64_t v8;
  NSData *pmm;
  uint64_t v10;
  NSArray *allSystemCodes;
  uint64_t v12;
  NSData *appData;
  uint64_t v14;
  NSData *uid;
  uint64_t v16;
  NSString *description;
  uint64_t v18;
  NSData *atqa;
  uint64_t v20;
  NSData *sak;
  uint64_t v22;
  NSData *historicalBytes;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NFTag;
  v5 = -[NFTag init](&v25, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v5->_technology = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("technology"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PMm"));
    v8 = objc_claimAutoreleasedReturnValue();
    pmm = v5->_pmm;
    v5->_pmm = (NSData *)v8;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("allSystemCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    allSystemCodes = v5->_allSystemCodes;
    v5->_allSystemCodes = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppData"));
    v12 = objc_claimAutoreleasedReturnValue();
    appData = v5->_appData;
    v5->_appData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UID"));
    v14 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v16 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v16;

    v5->_ndefAvailability = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ndefAvailability"));
    v5->_ndefMessageSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ndefMessageSize"));
    v5->_ndefContainerSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ndefContainerSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atqa"));
    v18 = objc_claimAutoreleasedReturnValue();
    atqa = v5->_atqa;
    v5->_atqa = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sak"));
    v20 = objc_claimAutoreleasedReturnValue();
    sak = v5->_sak;
    v5->_sak = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historicalBytes"));
    v22 = objc_claimAutoreleasedReturnValue();
    historicalBytes = v5->_historicalBytes;
    v5->_historicalBytes = (NSData *)v22;

    v5->_sfgi = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sfgi"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_technology, CFSTR("technology"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tagID, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pmm, CFSTR("PMm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allSystemCodes, CFSTR("allSystemCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appData, CFSTR("AppData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uid, CFSTR("UID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_description, CFSTR("description"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_ndefAvailability, CFSTR("ndefAvailability"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ndefMessageSize, CFSTR("ndefMessageSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ndefContainerSize, CFSTR("ndefContainerSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_atqa, CFSTR("atqa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sak, CFSTR("sak"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historicalBytes, CFSTR("historicalBytes"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_sfgi, CFSTR("sfgi"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  NFTag *v4;
  NFTag *v5;
  unsigned int type;
  unsigned int technology;
  NSData *tagID;
  uint64_t v9;
  void *v10;
  NSData *v11;
  void *v12;
  NSData *uid;
  uint64_t v14;
  void *v15;
  NSData *v16;
  void *v17;
  char v18;
  unsigned int v19;
  NFTag *v20;
  NSData *atqa;
  uint64_t v22;
  void *v23;
  NSData *v24;
  void *v25;
  NSData *sak;
  uint64_t v27;
  void *v28;
  NSData *v29;
  void *v30;
  NSData *historicalBytes;
  uint64_t v32;
  void *v33;
  NSData *v34;
  void *v35;
  NSData *appData;
  uint64_t v37;
  void *v38;
  NSData *v39;
  void *v40;
  NFTag *v41;
  NSData *v42;
  uint64_t v43;
  void *v44;
  NSData *v45;
  void *v46;
  NFTag *v47;
  NSData *pmm;
  uint64_t v49;
  void *v50;
  NSData *v51;
  void *v52;
  NSData *v54;
  uint64_t v55;
  void *v56;
  NSData *v57;
  void *v58;
  NSArray *allSystemCodes;
  uint64_t v60;
  NSArray *v61;
  NSArray *v62;
  void *v63;

  v4 = (NFTag *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_43;
  type = self->_type;
  if (type != -[NFTag type](v4, "type"))
    goto LABEL_10;
  technology = self->_technology;
  if (technology != -[NFTag technology](v5, "technology"))
    goto LABEL_10;
  tagID = self->_tagID;
  -[NFTag tagID](v5, "tagID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (tagID == (NSData *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = self->_tagID;
    -[NFTag tagID](v5, "tagID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!(_DWORD)v11)
      goto LABEL_10;
  }
  uid = self->_uid;
  -[NFTag UID](v5, "UID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (uid == (NSData *)v14)
  {

    goto LABEL_12;
  }
  v15 = (void *)v14;
  v16 = self->_uid;
  -[NFTag UID](v5, "UID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = -[NSData isEqual:](v16, "isEqual:", v17);

  if ((_DWORD)v16)
  {
LABEL_12:
    v19 = self->_technology;
    if (v19 == 1)
    {
      if (-[NFTag conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EE4045C0))
      {
        v20 = v5;
        atqa = self->_atqa;
        -[NFTag atqa](v20, "atqa");
        v22 = objc_claimAutoreleasedReturnValue();
        if (atqa == (NSData *)v22)
        {

        }
        else
        {
          v23 = (void *)v22;
          v24 = self->_atqa;
          -[NFTag atqa](v20, "atqa");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = -[NSData isEqual:](v24, "isEqual:", v25);

          if (!(_DWORD)v24)
            goto LABEL_48;
        }
        sak = self->_sak;
        -[NFTag sak](v20, "sak");
        v27 = objc_claimAutoreleasedReturnValue();
        if (sak == (NSData *)v27)
        {

        }
        else
        {
          v28 = (void *)v27;
          v29 = self->_sak;
          -[NFTag sak](v20, "sak");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = -[NSData isEqual:](v29, "isEqual:", v30);

          if (!(_DWORD)v29)
            goto LABEL_48;
        }
        historicalBytes = self->_historicalBytes;
        -[NFTag historicalBytes](v20, "historicalBytes");
        v32 = objc_claimAutoreleasedReturnValue();
        if (historicalBytes == (NSData *)v32)
        {

        }
        else
        {
          v33 = (void *)v32;
          v34 = self->_historicalBytes;
          -[NFTag historicalBytes](v20, "historicalBytes");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v34) = -[NSData isEqual:](v34, "isEqual:", v35);

          if (!(_DWORD)v34)
            goto LABEL_48;
        }
        appData = self->_appData;
        -[NFTag selectedAID](v20, "selectedAID");
        v37 = objc_claimAutoreleasedReturnValue();
        if (appData == (NSData *)v37)
        {

        }
        else
        {
          v38 = (void *)v37;
          v39 = self->_appData;
          -[NFTag selectedAID](v20, "selectedAID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v39) = -[NSData isEqual:](v39, "isEqual:", v40);

          if (!(_DWORD)v39)
            goto LABEL_48;
        }

      }
      v19 = self->_technology;
    }
    if (v19 == 2 && -[NFTag conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EE404650))
    {
      v41 = v5;
      v42 = self->_appData;
      -[NFTag selectedAID](v41, "selectedAID");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v42 == (NSData *)v43)
      {

      }
      else
      {
        v44 = (void *)v43;
        v45 = self->_appData;
        -[NFTag selectedAID](v41, "selectedAID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v45) = -[NSData isEqual:](v45, "isEqual:", v46);

        if (!(_DWORD)v45)
          goto LABEL_10;
      }
    }
    if (self->_technology == 4 && -[NFTag conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EE4046E0))
    {
      v47 = v5;
      pmm = self->_pmm;
      -[NFTag PMm](v47, "PMm");
      v49 = objc_claimAutoreleasedReturnValue();
      if (pmm == (NSData *)v49)
      {

      }
      else
      {
        v50 = (void *)v49;
        v51 = self->_pmm;
        -[NFTag PMm](v47, "PMm");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v51) = -[NSData isEqual:](v51, "isEqual:", v52);

        if (!(_DWORD)v51)
          goto LABEL_48;
      }
      v54 = self->_appData;
      -[NFTag SystemCode](v47, "SystemCode");
      v55 = objc_claimAutoreleasedReturnValue();
      if (v54 == (NSData *)v55)
      {

      }
      else
      {
        v56 = (void *)v55;
        v57 = self->_appData;
        -[NFTag SystemCode](v47, "SystemCode");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v57) = -[NSData isEqual:](v57, "isEqual:", v58);

        if (!(_DWORD)v57)
        {
LABEL_48:
          v18 = 0;
LABEL_54:

          goto LABEL_44;
        }
      }
      allSystemCodes = self->_allSystemCodes;
      -[NFTag allSystemCodes](v47, "allSystemCodes");
      v60 = objc_claimAutoreleasedReturnValue();
      if (allSystemCodes == (NSArray *)v60)
      {
        v18 = 1;
      }
      else
      {
        v61 = (NSArray *)v60;
        v62 = self->_allSystemCodes;
        -[NFTag allSystemCodes](v47, "allSystemCodes");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NSArray isEqual:](v62, "isEqual:", v63);

        allSystemCodes = v61;
      }

      goto LABEL_54;
    }
LABEL_43:
    v18 = 1;
    goto LABEL_44;
  }
LABEL_10:
  v18 = 0;
LABEL_44:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_sak, 0);
  objc_storeStrong((id *)&self->_atqa, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_allSystemCodes, 0);
  objc_storeStrong((id *)&self->_pmm, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end
