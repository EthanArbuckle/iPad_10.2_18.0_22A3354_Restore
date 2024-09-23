@implementation EKPredictedLocationOfInterest

- (EKPredictedLocationOfInterest)initWithPredictedLocationOfInterest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKPredictedLocationOfInterest *v13;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "locationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "customLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thoroughfare");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locality");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKPredictedLocationOfInterest initWithType:customLabel:mapItemName:addressCountryCode:addressThoroughFare:addressLocality:](self, "initWithType:customLabel:mapItemName:addressCountryCode:addressThoroughFare:addressLocality:", v7, v8, v9, v10, v11, v12);

  if (v13)
    objc_storeStrong((id *)&v13->_rtPredictedLocationOfInterest, a3);

  return v13;
}

- (EKPredictedLocationOfInterest)initWithType:(int64_t)a3 customLabel:(id)a4 mapItemName:(id)a5 addressCountryCode:(id)a6 addressThoroughFare:(id)a7 addressLocality:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  EKPredictedLocationOfInterest *v19;
  EKPredictedLocationOfInterest *v20;
  uint64_t v21;
  NSString *customLabel;
  uint64_t v23;
  NSString *mapItemName;
  uint64_t v25;
  NSString *addressCountryCode;
  uint64_t v27;
  NSString *addressThoroughfare;
  uint64_t v29;
  NSString *addressLocality;
  objc_super v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)EKPredictedLocationOfInterest;
  v19 = -[EKPredictedLocationOfInterest init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    v21 = objc_msgSend(v14, "copy");
    customLabel = v20->_customLabel;
    v20->_customLabel = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    mapItemName = v20->_mapItemName;
    v20->_mapItemName = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    addressCountryCode = v20->_addressCountryCode;
    v20->_addressCountryCode = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    addressThoroughfare = v20->_addressThoroughfare;
    v20->_addressThoroughfare = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    addressLocality = v20->_addressLocality;
    v20->_addressLocality = (NSString *)v29;

  }
  return v20;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (NSString)mapItemName
{
  return self->_mapItemName;
}

- (NSString)addressCountryCode
{
  return self->_addressCountryCode;
}

- (NSString)addressThoroughfare
{
  return self->_addressThoroughfare;
}

- (NSString)addressLocality
{
  return self->_addressLocality;
}

- (RTPredictedLocationOfInterest)rtPredictedLocationOfInterest
{
  return self->_rtPredictedLocationOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtPredictedLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_addressLocality, 0);
  objc_storeStrong((id *)&self->_addressThoroughfare, 0);
  objc_storeStrong((id *)&self->_addressCountryCode, 0);
  objc_storeStrong((id *)&self->_mapItemName, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
}

@end
