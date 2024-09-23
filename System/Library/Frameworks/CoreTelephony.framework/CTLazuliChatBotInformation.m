@implementation CTLazuliChatBotInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotInformation pcc](self, "pcc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pcc = %@"), v4);

  -[CTLazuliChatBotInformation version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", version = %@"), v5);

  -[CTLazuliChatBotInformation provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", provider = %@"), v6);

  -[CTLazuliChatBotInformation email](self, "email");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", email = %@"), v7);

  -[CTLazuliChatBotInformation color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", color = %@"), v8);

  -[CTLazuliChatBotInformation backgroundImage](self, "backgroundImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", backgroundImage = %@"), v9);

  -[CTLazuliChatBotInformation website](self, "website");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", website = %@"), v10);

  -[CTLazuliChatBotInformation tcPageUrl](self, "tcPageUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", tcPageUrl = %@"), v11);

  -[CTLazuliChatBotInformation addresses](self, "addresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", addresses = %@"), v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotInformation:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  int v78;
  _QWORD v79[4];
  int v80;
  int v81;
  id v82;
  void *v83;

  v7 = a3;
  -[CTLazuliChatBotInformation pcc](self, "pcc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pcc");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToCTLazuliChatBotPCC:", v9);
  v82 = v7;
  v83 = v8;
  v80 = v10;
  if (!(_DWORD)v10)
  {
    v12 = (void *)v9;
    v81 = 0;
    v13 = 0;
    memset(v79, 0, sizeof(v79));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_7;
  }
  -[CTLazuliChatBotInformation version](self, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v3;
  HIDWORD(v79[3]) = v3 == 0;
  if (v3 || (objc_msgSend(v7, "version"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotInformation version](self, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "version");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    if (!objc_msgSend(v5, "isEqualToString:", v68))
    {
      v81 = 1;
      v70 = v5;
      v75 = (void *)v4;
      v12 = (void *)v9;
      LODWORD(v10) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v79, 0, 28);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v11 = 0;
  }
  v75 = (void *)v4;
  v70 = v5;
  -[CTLazuliChatBotInformation provider](self, "provider");
  v31 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v79[2]) = v31 == 0;
  v81 = v11;
  v74 = (void *)v31;
  if (v31 || (objc_msgSend(v7, "provider"), (v72 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotInformation provider](self, "provider");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "provider");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (!objc_msgSend(v69, "isEqualToString:", v67))
    {
      v12 = (void *)v9;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v79, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v79[3]) = 1;
      goto LABEL_7;
    }
    LODWORD(v79[3]) = 1;
  }
  else
  {
    v72 = 0;
    LODWORD(v79[3]) = 0;
  }
  -[CTLazuliChatBotInformation email](self, "email");
  v32 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v79[1]) = v32 == 0;
  v73 = (void *)v32;
  if (v32 || (objc_msgSend(v7, "email"), (v71 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotInformation email](self, "email");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "email");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v33;
    v34 = objc_msgSend(v33, "isEqualToString:", v65);
    v10 = 1;
    if (!v34)
    {
      v12 = (void *)v9;
      v14 = 0;
      *(_QWORD *)((char *)v79 + 4) = 0;
      v15 = 0;
      LODWORD(v79[0]) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v13 = 1;
      LODWORD(v79[2]) = 1;
      goto LABEL_7;
    }
    v35 = 1;
  }
  else
  {
    v71 = 0;
    v35 = 0;
  }
  -[CTLazuliChatBotInformation color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v79[0]) = v3 == 0;
  v63 = v3;
  LODWORD(v79[2]) = v35;
  if (v3 || (objc_msgSend(v7, "color"), (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotInformation color](self, "color");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "color");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v36;
    v37 = objc_msgSend(v36, "isEqualToString:", v59);
    v10 = 1;
    if (!v37)
    {
      v62 = (void *)v32;
      v12 = (void *)v9;
      v15 = 0;
      LODWORD(v79[0]) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v13 = 1;
      v14 = 1;
      LODWORD(v79[1]) = 1;
      goto LABEL_7;
    }
    LODWORD(v79[1]) = 1;
  }
  else
  {
    LODWORD(v79[1]) = 0;
  }
  v62 = (void *)v32;
  -[CTLazuliChatBotInformation backgroundImage](self, "backgroundImage");
  v38 = objc_claimAutoreleasedReturnValue();
  LODWORD(v79[0]) = v38 == 0;
  v58 = (void *)v38;
  if (v38 || (objc_msgSend(v7, "backgroundImage"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v64 = (void *)v10;
    -[CTLazuliChatBotInformation backgroundImage](self, "backgroundImage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundImage");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (!objc_msgSend(v61, "isEqualToString:", v57))
    {
      v12 = (void *)v9;
      v17 = 0;
      v18 = 0;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      goto LABEL_7;
    }
    v16 = 1;
    v39 = v64;
  }
  else
  {
    v39 = 0;
    v16 = 0;
  }
  v64 = v39;
  -[CTLazuliChatBotInformation website](self, "website");
  v40 = objc_claimAutoreleasedReturnValue();
  v18 = v40 == 0;
  v56 = (void *)v40;
  if (v40 || (objc_msgSend(v7, "website"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v55 = (void *)v10;
    -[CTLazuliChatBotInformation website](self, "website");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "website");
    v53 = v3;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1;
    if (!objc_msgSend(v3, "isEqual:"))
    {
      v12 = (void *)v9;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v17 = 1;
LABEL_7:
      v77 = 0;
      v19 = v10;
      if (v17)
        goto LABEL_8;
      goto LABEL_79;
    }
  }
  else
  {
    v55 = 0;
  }
  -[CTLazuliChatBotInformation tcPageUrl](self, "tcPageUrl");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(v7, "tcPageUrl");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v51 = 0;
      v49 = 0;
      v78 = 0;
      goto LABEL_64;
    }
  }
  -[CTLazuliChatBotInformation tcPageUrl](self, "tcPageUrl");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tcPageUrl");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "isEqual:"))
  {
    v48 = v42;
    v51 = v41;
    v78 = 1;
LABEL_64:
    -[CTLazuliChatBotInformation addresses](self, "addresses");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 || (objc_msgSend(v7, "addresses"), (v47 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotInformation addresses](self, "addresses");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addresses");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v44, "isEqualToCTLazuliChatBotAddressEntryList:", v45);

      if (v50)
      {

        if (v78)
        {
LABEL_68:
          v41 = v51;
          v42 = v48;
          goto LABEL_69;
        }
LABEL_75:
        v41 = v51;
        v3 = v53;
        v77 = v43;
        if (v51)
          goto LABEL_76;
        goto LABEL_77;
      }
      v46 = (void *)v47;
    }
    else
    {
      v46 = 0;
      v43 = 1;
    }

    if ((v78 & 1) != 0)
      goto LABEL_68;
    goto LABEL_75;
  }
  v43 = 0;
LABEL_69:

  v77 = v43;
  if (v41)
  {
    v3 = v53;
LABEL_76:
    v12 = (void *)v9;
    goto LABEL_78;
  }
  v3 = v53;
LABEL_77:
  v12 = (void *)v9;

LABEL_78:
  v17 = 1;
  v15 = 1;
  v14 = 1;
  v13 = 1;
  v19 = 1;
  if ((v10 & 1) != 0)
  {
LABEL_8:

    if (!v18)
      goto LABEL_9;
    goto LABEL_80;
  }
LABEL_79:
  if (!v18)
  {
LABEL_9:
    if (v17)
      goto LABEL_10;
    goto LABEL_81;
  }
LABEL_80:

  if ((v17 & 1) != 0)
  {
LABEL_10:

    v20 = v74;
    v21 = (void *)v71;
    if ((v16 & 1) == 0)
      goto LABEL_11;
    goto LABEL_82;
  }
LABEL_81:
  v20 = v74;
  v21 = (void *)v71;
  if (!v16)
  {
LABEL_11:
    if (LODWORD(v79[0]))
      goto LABEL_12;
    goto LABEL_83;
  }
LABEL_82:

  if ((v79[0] & 1) != 0)
  {
LABEL_12:

    v22 = (void *)v72;
    if ((v15 & 1) == 0)
      goto LABEL_13;
    goto LABEL_84;
  }
LABEL_83:
  v22 = (void *)v72;
  if (!v15)
  {
LABEL_13:
    if (LODWORD(v79[1]))
      goto LABEL_14;
    goto LABEL_85;
  }
LABEL_84:

  if ((v79[1] & 1) != 0)
  {
LABEL_14:

    if ((v79[0] & 0x100000000) == 0)
      goto LABEL_15;
    goto LABEL_86;
  }
LABEL_85:
  if (!HIDWORD(v79[0]))
  {
LABEL_15:
    if (v14)
      goto LABEL_16;
    goto LABEL_87;
  }
LABEL_86:

  if ((v14 & 1) != 0)
  {
LABEL_16:

    if ((v79[2] & 1) == 0)
      goto LABEL_17;
    goto LABEL_88;
  }
LABEL_87:
  if (!LODWORD(v79[2]))
  {
LABEL_17:
    v23 = v73;
    if (HIDWORD(v79[1]))
      goto LABEL_18;
    goto LABEL_89;
  }
LABEL_88:

  v23 = v73;
  if ((v79[1] & 0x100000000) != 0)
  {
LABEL_18:

    if ((v13 & 1) == 0)
      goto LABEL_19;
    goto LABEL_90;
  }
LABEL_89:
  if (!v13)
  {
LABEL_19:
    if (LODWORD(v79[3]))
      goto LABEL_20;
    goto LABEL_91;
  }
LABEL_90:

  if ((v79[3] & 1) != 0)
  {
LABEL_20:

    v24 = v83;
    if ((v79[2] & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_92;
  }
LABEL_91:
  v24 = v83;
  if (!HIDWORD(v79[2]))
  {
LABEL_21:
    if (v19)
      goto LABEL_22;
    goto LABEL_93;
  }
LABEL_92:

  if ((v19 & 1) != 0)
  {
LABEL_22:

    if ((v81 & 1) == 0)
      goto LABEL_23;
    goto LABEL_94;
  }
LABEL_93:
  if (!v81)
  {
LABEL_23:
    v25 = v82;
    v26 = v75;
    v27 = v76;
    v28 = v80;
    v29 = v77;
    if (!HIDWORD(v79[3]))
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_94:

  v25 = v82;
  v26 = v75;
  v27 = v76;
  v28 = v80;
  v29 = v77;
  if ((v79[3] & 0x100000000) != 0)
LABEL_24:

LABEL_25:
  if (v28)

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotInformation *v4;
  CTLazuliChatBotInformation *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotInformation isEqualToCTLazuliChatBotInformation:](self, "isEqualToCTLazuliChatBotInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotInformation *v4;

  v4 = +[CTLazuliChatBotInformation allocWithZone:](CTLazuliChatBotInformation, "allocWithZone:", a3);
  -[CTLazuliChatBotInformation setPcc:](v4, "setPcc:", self->_pcc);
  -[CTLazuliChatBotInformation setVersion:](v4, "setVersion:", self->_version);
  -[CTLazuliChatBotInformation setProvider:](v4, "setProvider:", self->_provider);
  -[CTLazuliChatBotInformation setEmail:](v4, "setEmail:", self->_email);
  -[CTLazuliChatBotInformation setColor:](v4, "setColor:", self->_color);
  -[CTLazuliChatBotInformation setBackgroundImage:](v4, "setBackgroundImage:", self->_backgroundImage);
  -[CTLazuliChatBotInformation setWebsite:](v4, "setWebsite:", self->_website);
  -[CTLazuliChatBotInformation setTcPageUrl:](v4, "setTcPageUrl:", self->_tcPageUrl);
  -[CTLazuliChatBotInformation setAddresses:](v4, "setAddresses:", self->_addresses);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_pcc, CFSTR("kPccKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_version, CFSTR("kVersionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provider, CFSTR("kProviderKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_email, CFSTR("kEmailKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_color, CFSTR("kColorKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundImage, CFSTR("kBackgroundImageKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_website, CFSTR("kWebsiteKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tcPageUrl, CFSTR("kTcPageUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_addresses, CFSTR("kAddressesKey"));

}

- (CTLazuliChatBotInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotInformation *v5;
  uint64_t v6;
  CTLazuliChatBotPCC *pcc;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *provider;
  uint64_t v12;
  NSString *email;
  uint64_t v14;
  NSString *color;
  uint64_t v16;
  NSString *backgroundImage;
  uint64_t v18;
  NSURL *website;
  uint64_t v20;
  NSURL *tcPageUrl;
  uint64_t v22;
  CTLazuliChatBotAddressEntryList *addresses;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTLazuliChatBotInformation;
  v5 = -[CTLazuliChatBotInformation init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPccKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    pcc = v5->_pcc;
    v5->_pcc = (CTLazuliChatBotPCC *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVersionKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kProviderKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kEmailKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kColorKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBackgroundImageKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kWebsiteKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    website = v5->_website;
    v5->_website = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTcPageUrlKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    tcPageUrl = v5->_tcPageUrl;
    v5->_tcPageUrl = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAddressesKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (CTLazuliChatBotAddressEntryList *)v22;

  }
  return v5;
}

- (CTLazuliChatBotInformation)initWithReflection:(const void *)a3
{
  CTLazuliChatBotInformation *v4;
  CTLazuliChatBotPCC *v5;
  CTLazuliChatBotPCC *pcc;
  char *v7;
  uint64_t v8;
  NSString *version;
  char *v10;
  uint64_t v11;
  NSString *provider;
  char *v13;
  uint64_t v14;
  NSString *email;
  char *v16;
  uint64_t v17;
  NSString *color;
  char *v19;
  uint64_t v20;
  NSString *backgroundImage;
  void *v22;
  void *v23;
  int v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  NSURL *website;
  void *v31;
  void *v32;
  int v33;
  char *v34;
  uint64_t v35;
  char *v36;
  void *v37;
  uint64_t v38;
  NSURL *tcPageUrl;
  CTLazuliChatBotAddressEntryList *v40;
  uint64_t v41;
  CTLazuliChatBotAddressEntryList *addresses;
  CTLazuliChatBotInformation *result;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CTLazuliChatBotInformation;
  v4 = -[CTLazuliChatBotInformation init](&v44, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliChatBotPCC initWithReflection:]([CTLazuliChatBotPCC alloc], "initWithReflection:", a3);
  pcc = v4->_pcc;
  v4->_pcc = v5;

  if (*((_BYTE *)a3 + 336))
  {
    if (*((char *)a3 + 335) >= 0)
      v7 = (char *)a3 + 312;
    else
      v7 = (char *)*((_QWORD *)a3 + 39);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    version = v4->_version;
    v4->_version = (NSString *)v8;
  }
  else
  {
    version = v4->_version;
    v4->_version = 0;
  }

  if (*((_BYTE *)a3 + 368))
  {
    if (*((char *)a3 + 367) >= 0)
      v10 = (char *)a3 + 344;
    else
      v10 = (char *)*((_QWORD *)a3 + 43);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    provider = v4->_provider;
    v4->_provider = (NSString *)v11;
  }
  else
  {
    provider = v4->_provider;
    v4->_provider = 0;
  }

  if (*((_BYTE *)a3 + 400))
  {
    if (*((char *)a3 + 399) >= 0)
      v13 = (char *)a3 + 376;
    else
      v13 = (char *)*((_QWORD *)a3 + 47);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    email = v4->_email;
    v4->_email = (NSString *)v14;
  }
  else
  {
    email = v4->_email;
    v4->_email = 0;
  }

  if (*((_BYTE *)a3 + 432))
  {
    if (*((char *)a3 + 431) >= 0)
      v16 = (char *)a3 + 408;
    else
      v16 = (char *)*((_QWORD *)a3 + 51);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    color = v4->_color;
    v4->_color = (NSString *)v17;
  }
  else
  {
    color = v4->_color;
    v4->_color = 0;
  }

  if (*((_BYTE *)a3 + 464))
  {
    if (*((char *)a3 + 463) >= 0)
      v19 = (char *)a3 + 440;
    else
      v19 = (char *)*((_QWORD *)a3 + 55);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    backgroundImage = v4->_backgroundImage;
    v4->_backgroundImage = (NSString *)v20;
  }
  else
  {
    backgroundImage = v4->_backgroundImage;
    v4->_backgroundImage = 0;
  }

  if (*((_BYTE *)a3 + 496))
  {
    v22 = (void *)MEMORY[0x1E0C99E98];
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = *((char *)a3 + 495);
    v25 = (char *)*((_QWORD *)a3 + 59);
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v24 >= 0)
      v27 = (char *)a3 + 472;
    else
      v27 = v25;
    objc_msgSend(v23, "stringWithCString:encoding:", v27, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLWithString:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    website = v4->_website;
    v4->_website = (NSURL *)v29;

  }
  else
  {
    v28 = v4->_website;
    v4->_website = 0;
  }

  if (*((_BYTE *)a3 + 528))
  {
    v31 = (void *)MEMORY[0x1E0C99E98];
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = *((char *)a3 + 527);
    v34 = (char *)*((_QWORD *)a3 + 63);
    v35 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v33 >= 0)
      v36 = (char *)a3 + 504;
    else
      v36 = v34;
    objc_msgSend(v32, "stringWithCString:encoding:", v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLWithString:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    tcPageUrl = v4->_tcPageUrl;
    v4->_tcPageUrl = (NSURL *)v38;

  }
  else
  {
    v37 = v4->_tcPageUrl;
    v4->_tcPageUrl = 0;
  }

  if (!*((_BYTE *)a3 + 560))
  {
    addresses = v4->_addresses;
    v4->_addresses = 0;
    goto LABEL_48;
  }
  v40 = [CTLazuliChatBotAddressEntryList alloc];
  if (*((_BYTE *)a3 + 560))
  {
    v41 = -[CTLazuliChatBotAddressEntryList initWithReflection:](v40, "initWithReflection:", (char *)a3 + 536);
    addresses = v4->_addresses;
    v4->_addresses = (CTLazuliChatBotAddressEntryList *)v41;
LABEL_48:

    return v4;
  }
  result = (CTLazuliChatBotInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotPCC)pcc
{
  return self->_pcc;
}

- (void)setPcc:(id)a3
{
  objc_storeStrong((id *)&self->_pcc, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (NSURL)website
{
  return self->_website;
}

- (void)setWebsite:(id)a3
{
  objc_storeStrong((id *)&self->_website, a3);
}

- (NSURL)tcPageUrl
{
  return self->_tcPageUrl;
}

- (void)setTcPageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_tcPageUrl, a3);
}

- (CTLazuliChatBotAddressEntryList)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_tcPageUrl, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_pcc, 0);
}

@end
