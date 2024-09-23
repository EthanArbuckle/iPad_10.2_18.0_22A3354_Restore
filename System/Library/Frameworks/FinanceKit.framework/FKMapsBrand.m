@implementation FKMapsBrand

- (FKMapsBrand)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 logoURL:(id)a15
{
  uint64_t v19;
  id v22;
  FKMapsBrand *v23;
  uint64_t v24;
  NSURL *logoURL;
  objc_super v27;

  v19 = *(_QWORD *)&a4;
  v22 = a15;
  v27.receiver = self;
  v27.super_class = (Class)FKMapsBrand;
  v23 = -[FKMapsItem initWithMUID:resultProviderIdentifier:name:phoneNumber:url:heroImageURL:heroImageAttributionName:category:mapsCategoryIdentifier:encodedStylingInfo:businessChatURL:lastProcessedDate:](&v27, sel_initWithMUID_resultProviderIdentifier_name_phoneNumber_url_heroImageURL_heroImageAttributionName_category_mapsCategoryIdentifier_encodedStylingInfo_businessChatURL_lastProcessedDate_, a3, v19, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  if (v23)
  {
    v24 = objc_msgSend(v22, "copy");
    logoURL = v23->_logoURL;
    v23->_logoURL = (NSURL *)v24;

  }
  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FKMapsBrand;
  v5 = -[FKMapsItem copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSURL copyWithZone:](self->_logoURL, "copyWithZone:", a3);
  v7 = (void *)v5[13];
  v5[13] = v6;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_logoURL);
  v7.receiver = self;
  v7.super_class = (Class)FKMapsBrand;
  v4 = -[FKMapsItem hash](&v7, sel_hash);
  v5 = FKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKMapsBrand *v4;
  FKMapsBrand *v5;
  void **v6;
  char v7;
  objc_super v9;

  v4 = (FKMapsBrand *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)FKMapsBrand;
    if (-[FKMapsItem isEqual:](&v9, sel_isEqual_, v6))
      v7 = FKEqualObjects(self->_logoURL, v6[13]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoURL, 0);
}

@end
