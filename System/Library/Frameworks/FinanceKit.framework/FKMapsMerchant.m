@implementation FKMapsMerchant

- (FKMapsMerchant)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 location:(id)a15 postalAddress:(id)a16
{
  uint64_t v19;
  id v22;
  id v23;
  FKMapsMerchant *v24;
  uint64_t v25;
  CLLocation *location;
  uint64_t v27;
  CNPostalAddress *postalAddress;
  objc_super v31;

  v19 = *(_QWORD *)&a4;
  v22 = a15;
  v23 = a16;
  v31.receiver = self;
  v31.super_class = (Class)FKMapsMerchant;
  v24 = -[FKMapsItem initWithMUID:resultProviderIdentifier:name:phoneNumber:url:heroImageURL:heroImageAttributionName:category:mapsCategoryIdentifier:encodedStylingInfo:businessChatURL:lastProcessedDate:](&v31, sel_initWithMUID_resultProviderIdentifier_name_phoneNumber_url_heroImageURL_heroImageAttributionName_category_mapsCategoryIdentifier_encodedStylingInfo_businessChatURL_lastProcessedDate_, a3, v19, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  if (v24)
  {
    v25 = objc_msgSend(v22, "copy");
    location = v24->_location;
    v24->_location = (CLLocation *)v25;

    v27 = objc_msgSend(v23, "copy");
    postalAddress = v24->_postalAddress;
    v24->_postalAddress = (CNPostalAddress *)v27;

  }
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FKMapsMerchant;
  v5 = -[FKMapsItem copyWithZone:](&v11, sel_copyWithZone_);
  v6 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = (void *)v5[13];
  v5[13] = v6;

  v8 = -[CNPostalAddress copyWithZone:](self->_postalAddress, "copyWithZone:", a3);
  v9 = (void *)v5[14];
  v5[14] = v8;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_location);
  objc_msgSend(v3, "safelyAddObject:", self->_postalAddress);
  v7.receiver = self;
  v7.super_class = (Class)FKMapsMerchant;
  v4 = -[FKMapsItem hash](&v7, sel_hash);
  v5 = FKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKMapsMerchant *v4;
  FKMapsMerchant *v5;
  void **v6;
  double v7;
  char v8;
  objc_super v10;

  v4 = (FKMapsMerchant *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v10.receiver = self;
    v10.super_class = (Class)FKMapsMerchant;
    if (-[FKMapsItem isEqual:](&v10, sel_isEqual_, v6)
      && (-[CLLocation distanceFromLocation:](self->_location, "distanceFromLocation:", v6[13]), v7 == 0.0))
    {
      v8 = FKEqualObjects(self->_postalAddress, v6[14]);
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

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
