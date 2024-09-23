@implementation AMSCardMetadataRegistrationResult

- (AMSCardMetadataRegistrationResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSCardMetadataRegistrationResult;
  return -[AMSCardMetadataRegistrationResult init](&v3, sel_init);
}

- (AMSCardMetadataRegistrationResult)initWithCardArtwork:(id)a3 cardType:(int64_t)a4 descriptionLong:(id)a5 descriptionShort:(id)a6 paymentNetwork:(int64_t)a7 serialNumber:(id)a8 suffix:(id)a9
{
  id v15;
  id v16;
  id v17;
  AMSCardMetadataRegistrationResult *v18;
  AMSCardMetadataRegistrationResult *v19;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)AMSCardMetadataRegistrationResult;
  v18 = -[AMSCardMetadataRegistrationResult init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cardArtwork, a3);
    v19->_cardType = a4;
    objc_storeStrong((id *)&v19->_descriptionLong, a5);
    objc_storeStrong((id *)&v19->_descriptionShort, a6);
    v19->_paymentNetwork = a7;
    objc_storeStrong((id *)&v19->_serialNumber, a8);
    objc_storeStrong((id *)&v19->_suffix, a9);
  }

  return v19;
}

- (NSDictionary)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSCardMetadataRegistrationResult cardArtwork](self, "cardArtwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSCardMetadataRegistrationResult cardArtwork](self, "cardArtwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cardArtwork"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSCardMetadataRegistrationResult cardType](self, "cardType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cardType"));

  -[AMSCardMetadataRegistrationResult descriptionLong](self, "descriptionLong");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AMSCardMetadataRegistrationResult descriptionLong](self, "descriptionLong");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("descriptionLong"));

  }
  -[AMSCardMetadataRegistrationResult descriptionShort](self, "descriptionShort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSCardMetadataRegistrationResult descriptionShort](self, "descriptionShort");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("descriptionShort"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSCardMetadataRegistrationResult paymentNetwork](self, "paymentNetwork"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("paymentNetwork"));

  -[AMSCardMetadataRegistrationResult serialNumber](self, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSCardMetadataRegistrationResult serialNumber](self, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("serialNumber"));

  }
  -[AMSCardMetadataRegistrationResult suffix](self, "suffix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSCardMetadataRegistrationResult suffix](self, "suffix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("suffix"));

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v16;
}

- (NSString)cardArtwork
{
  return self->_cardArtwork;
}

- (void)setCardArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_cardArtwork, a3);
}

- (NSData)cardArtworkData
{
  return self->_cardArtworkData;
}

- (void)setCardArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_cardArtworkData, a3);
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)descriptionLong
{
  return self->_descriptionLong;
}

- (void)setDescriptionLong:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLong, a3);
}

- (NSString)descriptionShort
{
  return self->_descriptionShort;
}

- (void)setDescriptionShort:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionShort, a3);
}

- (int64_t)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(int64_t)a3
{
  self->_paymentNetwork = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_suffix, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_descriptionShort, 0);
  objc_storeStrong((id *)&self->_descriptionLong, 0);
  objc_storeStrong((id *)&self->_cardArtworkData, 0);
  objc_storeStrong((id *)&self->_cardArtwork, 0);
}

@end
