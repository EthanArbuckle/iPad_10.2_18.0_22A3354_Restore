@implementation CTLazuliChatBotOrgDetails

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotOrgDetails communicationAddress](self, "communicationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", communicationAddress = %@"), v4);

  -[CTLazuliChatBotOrgDetails mediaList](self, "mediaList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mediaList = %@"), v5);

  -[CTLazuliChatBotOrgDetails orgName](self, "orgName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", orgName = %@"), v6);

  -[CTLazuliChatBotOrgDetails orgDescription](self, "orgDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", orgDescription = %@"), v7);

  -[CTLazuliChatBotOrgDetails categoryList](self, "categoryList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", categoryList = %@"), v8);

  -[CTLazuliChatBotOrgDetails webResources](self, "webResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", webResources = %@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgDetails:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;

  v7 = a3;
  -[CTLazuliChatBotOrgDetails communicationAddress](self, "communicationAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "communicationAddress"), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails communicationAddress](self, "communicationAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "communicationAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToCTLazuliChatBotCommunicationAddress:", v4) & 1) == 0)
    {

      v9 = 0;
      goto LABEL_56;
    }
    v36 = 1;
  }
  else
  {
    v35 = 0;
    v36 = 0;
  }
  -[CTLazuliChatBotOrgDetails mediaList](self, "mediaList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v7, "mediaList"), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails mediaList](self, "mediaList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "isEqualToCTLazuliChatBotMediaList:", v5) & 1) == 0)
    {

      if (v10)
      else

      v9 = 0;
      if ((v36 & 1) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
    v33 = 1;
  }
  else
  {
    v31 = 0;
    v33 = 0;
  }
  -[CTLazuliChatBotOrgDetails orgName](self, "orgName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v7, "orgName"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails orgName](self, "orgName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orgName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v34, "isEqualToCTLazuliChatBotOrgName:"))
    {
      v9 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v28 = 1;
  }
  else
  {
    v26 = 0;
    v28 = 0;
  }
  -[CTLazuliChatBotOrgDetails orgDescription](self, "orgDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 || (objc_msgSend(v7, "orgDescription"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails orgDescription](self, "orgDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orgDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v30, "isEqualToCTLazuliChatBotOrgDescription:"))
    {
      v9 = 0;
LABEL_43:

      goto LABEL_44;
    }
    v23 = 1;
  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  -[CTLazuliChatBotOrgDetails categoryList](self, "categoryList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 || (objc_msgSend(v7, "categoryList"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails categoryList](self, "categoryList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "isEqualToCTLazuliChatBotCategoryList:"))
    {
      v9 = 0;
      goto LABEL_39;
    }
    v20 = 1;
  }
  else
  {
    v18 = 0;
    v20 = 0;
  }
  -[CTLazuliChatBotOrgDetails webResources](self, "webResources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 || (objc_msgSend(v7, "webResources"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotOrgDetails webResources](self, "webResources", v16, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webResources");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqualToCTLazuliChatBotWebResources:", v13);

    if (v19)
    {

      if (!v20)
        goto LABEL_40;
      goto LABEL_39;
    }
    v15 = v17;
  }
  else
  {
    v15 = 0;
    v9 = 1;
  }

  if ((v20 & 1) != 0)
  {
LABEL_39:

  }
LABEL_40:
  if (!v24)

  if (v23)
    goto LABEL_43;
LABEL_44:
  if (!v29)

  if (v28)
    goto LABEL_47;
LABEL_48:
  if (!v11)

  if (v33)
  {

  }
  if (!v10)

  if (v36)
  {
LABEL_55:

  }
LABEL_56:
  if (!v8)

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotOrgDetails *v4;
  CTLazuliChatBotOrgDetails *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotOrgDetails *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotOrgDetails isEqualToCTLazuliChatBotOrgDetails:](self, "isEqualToCTLazuliChatBotOrgDetails:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotOrgDetails *v4;

  v4 = +[CTLazuliChatBotOrgDetails allocWithZone:](CTLazuliChatBotOrgDetails, "allocWithZone:", a3);
  -[CTLazuliChatBotOrgDetails setCommunicationAddress:](v4, "setCommunicationAddress:", self->_communicationAddress);
  -[CTLazuliChatBotOrgDetails setMediaList:](v4, "setMediaList:", self->_mediaList);
  -[CTLazuliChatBotOrgDetails setOrgName:](v4, "setOrgName:", self->_orgName);
  -[CTLazuliChatBotOrgDetails setOrgDescription:](v4, "setOrgDescription:", self->_orgDescription);
  -[CTLazuliChatBotOrgDetails setCategoryList:](v4, "setCategoryList:", self->_categoryList);
  -[CTLazuliChatBotOrgDetails setWebResources:](v4, "setWebResources:", self->_webResources);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_communicationAddress, CFSTR("kCommunicationAddressKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaList, CFSTR("kMediaListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_orgName, CFSTR("kOrgNameKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_orgDescription, CFSTR("kOrgDescriptionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryList, CFSTR("kCategoryListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_webResources, CFSTR("kWebResourcesKey"));

}

- (CTLazuliChatBotOrgDetails)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotOrgDetails *v5;
  uint64_t v6;
  CTLazuliChatBotCommunicationAddress *communicationAddress;
  uint64_t v8;
  CTLazuliChatBotMediaList *mediaList;
  uint64_t v10;
  CTLazuliChatBotOrgName *orgName;
  uint64_t v12;
  CTLazuliChatBotOrgDescription *orgDescription;
  uint64_t v14;
  CTLazuliChatBotCategoryList *categoryList;
  uint64_t v16;
  CTLazuliChatBotWebResources *webResources;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTLazuliChatBotOrgDetails;
  v5 = -[CTLazuliChatBotOrgDetails init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCommunicationAddressKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    communicationAddress = v5->_communicationAddress;
    v5->_communicationAddress = (CTLazuliChatBotCommunicationAddress *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaListKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaList = v5->_mediaList;
    v5->_mediaList = (CTLazuliChatBotMediaList *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOrgNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    orgName = v5->_orgName;
    v5->_orgName = (CTLazuliChatBotOrgName *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOrgDescriptionKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (CTLazuliChatBotOrgDescription *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCategoryListKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    categoryList = v5->_categoryList;
    v5->_categoryList = (CTLazuliChatBotCategoryList *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kWebResourcesKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    webResources = v5->_webResources;
    v5->_webResources = (CTLazuliChatBotWebResources *)v16;

  }
  return v5;
}

- (CTLazuliChatBotOrgDetails)initWithReflection:(const void *)a3
{
  CTLazuliChatBotOrgDetails *v4;
  CTLazuliChatBotOrgDetails *v5;
  CTLazuliChatBotCommunicationAddress *v6;
  uint64_t v7;
  CTLazuliChatBotCommunicationAddress *communicationAddress;
  CTLazuliChatBotMediaList *v9;
  uint64_t v10;
  CTLazuliChatBotMediaList *mediaList;
  CTLazuliChatBotOrgName *v12;
  uint64_t v13;
  CTLazuliChatBotOrgName *orgName;
  CTLazuliChatBotOrgDescription *v15;
  uint64_t v16;
  CTLazuliChatBotOrgDescription *orgDescription;
  CTLazuliChatBotCategoryList *v18;
  uint64_t v19;
  CTLazuliChatBotCategoryList *categoryList;
  CTLazuliChatBotWebResources *v21;
  uint64_t v22;
  CTLazuliChatBotWebResources *webResources;
  CTLazuliChatBotOrgDetails *result;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CTLazuliChatBotOrgDetails;
  v4 = -[CTLazuliChatBotOrgDetails init](&v25, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (*((_BYTE *)a3 + 96))
  {
    v6 = [CTLazuliChatBotCommunicationAddress alloc];
    if (!*((_BYTE *)a3 + 96))
      goto LABEL_28;
    v7 = -[CTLazuliChatBotCommunicationAddress initWithReflection:](v6, "initWithReflection:", a3);
    communicationAddress = v5->_communicationAddress;
    v5->_communicationAddress = (CTLazuliChatBotCommunicationAddress *)v7;
  }
  else
  {
    communicationAddress = v4->_communicationAddress;
    v4->_communicationAddress = 0;
  }

  if (*((_BYTE *)a3 + 128))
  {
    v9 = [CTLazuliChatBotMediaList alloc];
    if (!*((_BYTE *)a3 + 128))
      goto LABEL_28;
    v10 = -[CTLazuliChatBotMediaList initWithReflection:](v9, "initWithReflection:", (char *)a3 + 104);
    mediaList = v5->_mediaList;
    v5->_mediaList = (CTLazuliChatBotMediaList *)v10;
  }
  else
  {
    mediaList = v5->_mediaList;
    v5->_mediaList = 0;
  }

  if (*((_BYTE *)a3 + 160))
  {
    v12 = [CTLazuliChatBotOrgName alloc];
    if (!*((_BYTE *)a3 + 160))
      goto LABEL_28;
    v13 = -[CTLazuliChatBotOrgName initWithReflection:](v12, "initWithReflection:", (char *)a3 + 136);
    orgName = v5->_orgName;
    v5->_orgName = (CTLazuliChatBotOrgName *)v13;
  }
  else
  {
    orgName = v5->_orgName;
    v5->_orgName = 0;
  }

  if (*((_BYTE *)a3 + 200))
  {
    v15 = [CTLazuliChatBotOrgDescription alloc];
    if (!*((_BYTE *)a3 + 200))
      goto LABEL_28;
    v16 = -[CTLazuliChatBotOrgDescription initWithReflection:](v15, "initWithReflection:", (char *)a3 + 168);
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (CTLazuliChatBotOrgDescription *)v16;
  }
  else
  {
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = 0;
  }

  if (*((_BYTE *)a3 + 232))
  {
    v18 = [CTLazuliChatBotCategoryList alloc];
    if (!*((_BYTE *)a3 + 232))
      goto LABEL_28;
    v19 = -[CTLazuliChatBotCategoryList initWithReflection:](v18, "initWithReflection:", (char *)a3 + 208);
    categoryList = v5->_categoryList;
    v5->_categoryList = (CTLazuliChatBotCategoryList *)v19;
  }
  else
  {
    categoryList = v5->_categoryList;
    v5->_categoryList = 0;
  }

  if (!*((_BYTE *)a3 + 264))
  {
    webResources = v5->_webResources;
    v5->_webResources = 0;
    goto LABEL_26;
  }
  v21 = [CTLazuliChatBotWebResources alloc];
  if (*((_BYTE *)a3 + 264))
  {
    v22 = -[CTLazuliChatBotWebResources initWithReflection:](v21, "initWithReflection:", (char *)a3 + 240);
    webResources = v5->_webResources;
    v5->_webResources = (CTLazuliChatBotWebResources *)v22;
LABEL_26:

    return v5;
  }
LABEL_28:
  result = (CTLazuliChatBotOrgDetails *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCommunicationAddress)communicationAddress
{
  return self->_communicationAddress;
}

- (void)setCommunicationAddress:(id)a3
{
  objc_storeStrong((id *)&self->_communicationAddress, a3);
}

- (CTLazuliChatBotMediaList)mediaList
{
  return self->_mediaList;
}

- (void)setMediaList:(id)a3
{
  objc_storeStrong((id *)&self->_mediaList, a3);
}

- (CTLazuliChatBotOrgName)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
  objc_storeStrong((id *)&self->_orgName, a3);
}

- (CTLazuliChatBotOrgDescription)orgDescription
{
  return self->_orgDescription;
}

- (void)setOrgDescription:(id)a3
{
  objc_storeStrong((id *)&self->_orgDescription, a3);
}

- (CTLazuliChatBotCategoryList)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_categoryList, a3);
}

- (CTLazuliChatBotWebResources)webResources
{
  return self->_webResources;
}

- (void)setWebResources:(id)a3
{
  objc_storeStrong((id *)&self->_webResources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webResources, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_orgDescription, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_mediaList, 0);
  objc_storeStrong((id *)&self->_communicationAddress, 0);
}

@end
