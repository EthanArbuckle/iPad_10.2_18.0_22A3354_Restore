@implementation FKMapsItem

- (FKMapsItem)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  FKMapsItem *v26;
  FKMapsItem *v27;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSString *phoneNumber;
  uint64_t v32;
  NSURL *url;
  uint64_t v34;
  NSURL *heroImageURL;
  uint64_t v36;
  NSString *heroImageAttributionName;
  uint64_t v38;
  NSString *mapsCategoryIdentifier;
  uint64_t v40;
  NSData *encodedStylingInfo;
  uint64_t v42;
  NSURL *businessChatURL;
  uint64_t v44;
  NSDate *lastProcessedDate;
  id v48;
  id v49;
  objc_super v50;

  v49 = a5;
  v48 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v50.receiver = self;
  v50.super_class = (Class)FKMapsItem;
  v26 = -[FKMapsItem init](&v50, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_muid = a3;
    v26->_resultProviderIdentifier = a4;
    v28 = objc_msgSend(v49, "copy");
    name = v27->_name;
    v27->_name = (NSString *)v28;

    v30 = objc_msgSend(v48, "copy");
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v30;

    v32 = objc_msgSend(v19, "copy");
    url = v27->_url;
    v27->_url = (NSURL *)v32;

    v34 = objc_msgSend(v20, "copy");
    heroImageURL = v27->_heroImageURL;
    v27->_heroImageURL = (NSURL *)v34;

    v36 = objc_msgSend(v21, "copy");
    heroImageAttributionName = v27->_heroImageAttributionName;
    v27->_heroImageAttributionName = (NSString *)v36;

    v27->_category = a10;
    v38 = objc_msgSend(v22, "copy");
    mapsCategoryIdentifier = v27->_mapsCategoryIdentifier;
    v27->_mapsCategoryIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v23, "copy");
    encodedStylingInfo = v27->_encodedStylingInfo;
    v27->_encodedStylingInfo = (NSData *)v40;

    v42 = objc_msgSend(v24, "copy");
    businessChatURL = v27->_businessChatURL;
    v27->_businessChatURL = (NSURL *)v42;

    v44 = objc_msgSend(v25, "copy");
    lastProcessedDate = v27->_lastProcessedDate;
    v27->_lastProcessedDate = (NSDate *)v44;

  }
  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_QWORD *)(v5 + 16) = self->_muid;
  *(_DWORD *)(v5 + 8) = self->_resultProviderIdentifier;
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSURL copyWithZone:](self->_heroImageURL, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_heroImageAttributionName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  *(_QWORD *)(v5 + 64) = self->_category;
  v16 = -[NSString copyWithZone:](self->_mapsCategoryIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSData copyWithZone:](self->_encodedStylingInfo, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSURL copyWithZone:](self->_businessChatURL, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[NSDate copyWithZone:](self->_lastProcessedDate, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v22;

  return (id)v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_url);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageURL);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageAttributionName);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsCategoryIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_encodedStylingInfo);
  objc_msgSend(v3, "safelyAddObject:", self->_businessChatURL);
  objc_msgSend(v3, "safelyAddObject:", self->_lastProcessedDate);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_muid);
  v6 = FKIntegerHash(v5, self->_resultProviderIdentifier);
  v7 = FKIntegerHash(v6, self->_category);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  FKMapsItem *v4;
  FKMapsItem *v5;
  FKMapsItem *v6;
  void **p_isa;
  char v8;

  v4 = (FKMapsItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    p_isa = (void **)&v6->super.isa;
    if (self->_muid == v6->_muid
      && self->_resultProviderIdentifier == v6->_resultProviderIdentifier
      && FKEqualObjects(self->_name, v6->_name)
      && FKEqualObjects(self->_phoneNumber, p_isa[4])
      && FKEqualObjects(self->_url, p_isa[5])
      && FKEqualObjects(self->_heroImageURL, p_isa[6])
      && FKEqualObjects(self->_heroImageAttributionName, p_isa[7])
      && (void *)self->_category == p_isa[8]
      && FKEqualObjects(self->_mapsCategoryIdentifier, p_isa[9])
      && FKEqualObjects(self->_encodedStylingInfo, p_isa[10])
      && FKEqualObjects(self->_businessChatURL, p_isa[11]))
    {
      v8 = FKEqualObjects(self->_lastProcessedDate, p_isa[12]);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)heroImageAttributionName
{
  return self->_heroImageAttributionName;
}

- (void)setHeroImageAttributionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)mapsCategoryIdentifier
{
  return self->_mapsCategoryIdentifier;
}

- (void)setMapsCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)encodedStylingInfo
{
  return self->_encodedStylingInfo;
}

- (void)setEncodedStylingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_encodedStylingInfo, a3);
}

- (NSURL)businessChatURL
{
  return self->_businessChatURL;
}

- (void)setBusinessChatURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_businessChatURL, 0);
  objc_storeStrong((id *)&self->_encodedStylingInfo, 0);
  objc_storeStrong((id *)&self->_mapsCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
