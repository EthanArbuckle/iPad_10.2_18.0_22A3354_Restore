@implementation ATXHeroData

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13 poiMuid:(id)a14
{
  id v21;
  id v22;
  id v23;
  id v24;
  ATXHeroData *v25;
  ATXHeroData *v26;
  uint64_t v27;
  NSString *bundleId;
  uint64_t v29;
  NSString *urlHash;
  id v34;
  objc_super v35;

  v21 = a4;
  v22 = a11;
  v34 = a12;
  v23 = a13;
  v24 = a14;
  v35.receiver = self;
  v35.super_class = (Class)ATXHeroData;
  v25 = -[ATXHeroData init](&v35, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_adamId = a3;
    v27 = objc_msgSend(v21, "copy");
    bundleId = v26->_bundleId;
    v26->_bundleId = (NSString *)v27;

    v26->_latitude = a5;
    v26->_longitude = a6;
    v26->_radiusInMeters = a7;
    v26->_rank = a8;
    v26->_isTouristApp = a9;
    v26->_score = a10;
    v29 = objc_msgSend(v22, "copy");
    urlHash = v26->_urlHash;
    v26->_urlHash = (NSString *)v29;

    objc_storeStrong((id *)&v26->_clipMetadata, a12);
    v26->_latitudeAtPredictionTime = 0.0;
    v26->_longitudeAtPredictionTime = 0.0;
    objc_storeStrong((id *)&v26->_poiCategory, a13);
    objc_storeStrong((id *)&v26->_poiMuid, a14);
  }

  return v26;
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12 poiCategory:(id)a13
{
  return -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:", a3, a4, a7, a8, a9, a11, a5, a6, a10, a12, a13, 0);
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 bundleId:(id)a4 latitude:(double)a5 longitude:(double)a6 radiusInMeters:(unint64_t)a7 rank:(unint64_t)a8 isTouristApp:(BOOL)a9 score:(double)a10 urlHash:(id)a11 clipMetadata:(id)a12
{
  return -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:", a3, a4, a7, a8, a9, a11, a5, a6, a10, a12, 0);
}

- (ATXHeroData)initWithPredictedAdamId:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8
{
  return -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:", a3, &stru_24C3C6878, a6, a7, a8, 0, a4, a5, (double)0, 0);
}

- (ATXHeroData)initWithPredictedBundleId:(id)a3 latitude:(double)a4 longitude:(double)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8
{
  _BOOL8 v8;
  void *v14;
  ATXHeroData *v15;

  v8 = a8;
  v14 = (void *)objc_msgSend(a3, "copy");
  v15 = -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:", -1, v14, a6, a7, v8, 0, a4, a5, (double)0, 0);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  latitude = self->_latitude;
  v8 = a3;
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("latitude"), latitude);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("latitudeAtPrediction"), self->_latitudeAtPredictionTime);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("longitudeAtPrediction"), self->_longitudeAtPredictionTime);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_radiusInMeters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("radius"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_rank);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("rank"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_isTouristApp, CFSTR("isTouristApp"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_adamId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("adamId"));

  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v8, "encodeObject:forKey:", self->_urlHash, CFSTR("urlHash"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_clipMetadata, CFSTR("clipMetadata"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_poiCategory, CFSTR("poiCategory"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_poiMuid, CFSTR("poiMuid"));

}

- (ATXHeroData)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  ATXHeroData *v28;
  _BOOL4 v30;
  void *v31;
  _BOOL4 v32;
  unsigned int v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  void *v40;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v6 = v5;
  v39 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("latitude"), v4, CFSTR("com.apple.proactive.hero"), -1);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v8 = v7;
  v38 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("longitude"), v4, CFSTR("com.apple.proactive.hero"), -1);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitudeAtPrediction"));
  v10 = v9;
  v37 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("latitudeAtPrediction"), v4, CFSTR("com.apple.proactive.hero"), -1);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitudeAtPrediction"));
  v12 = v11;
  v36 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("longitudeAtPrediction"), v4, CFSTR("com.apple.proactive.hero"), -1);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radius"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v13, CFSTR("radius"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 70);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rank"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v15, CFSTR("rank"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v33 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTouristApp"));
  v32 = -[ATXHeroData checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v17, CFSTR("bundleId"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {
    v18 = &stru_24C3C6878;

    v17 = v18;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adamId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v19, CFSTR("adamId"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -1);
    v20 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v20;
  }
  else
  {
    v34 = v19;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v22 = v21;
  v30 = -[ATXHeroData checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("score"), v4, CFSTR("com.apple.proactive.hero"), -1);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlHash"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v23, CFSTR("urlHash"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {

    v23 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipMetadata"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v13;
  v31 = v23;
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v24, CFSTR("clipMetadata"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {

    v24 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poiCategory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v25, CFSTR("poiCategory"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {

    v25 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poiMuid"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeroData checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v26, CFSTR("poiMuid"), v4, CFSTR("com.apple.proactive.hero"), -1))
  {

    v26 = 0;
  }
  if (v30)
    v22 = 0.0;
  if (v32)
    v27 = kATXHeroAppDefaultIsTouristApp != 0;
  else
    v27 = v33;
  if (v36)
    v12 = 0.0;
  if (v37)
    v10 = 0.0;
  if (v38)
    v8 = 0.0;
  if (v39)
    v6 = 0.0;
  v28 = -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:", objc_msgSend(v34, "unsignedIntegerValue"), v35, objc_msgSend(v40, "unsignedIntegerValue"), objc_msgSend(v15, "unsignedIntegerValue"), v27, v31, v6, v8, v22, v24);
  -[ATXHeroData setLatitudeAtPredictionTime:](v28, "setLatitudeAtPredictionTime:", v10);
  -[ATXHeroData setLongitudeAtPredictionTime:](v28, "setLongitudeAtPredictionTime:", v12);
  -[ATXHeroData setPoiCategory:](v28, "setPoiCategory:", v25);
  -[ATXHeroData setPoiMuid:](v28, "setPoiMuid:", v26);

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  ATXHeroData *v7;
  BOOL v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  unint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  void *v27;
  void *v28;
  char v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  char v37;
  char v38;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  unint64_t v46;

  v6 = a3;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = (ATXHeroData *)v6;
    if (self == v7)
    {
      v21 = 1;
LABEL_39:

      goto LABEL_40;
    }
    v46 = -[ATXHeroData adamId](self, "adamId");
    v45 = -[ATXHeroData adamId](v7, "adamId");
    v8 = -[ATXHeroData isTouristApp](self, "isTouristApp");
    v9 = -[ATXHeroData isTouristApp](v7, "isTouristApp");
    -[ATXHeroData latitude](self, "latitude");
    v11 = v10;
    -[ATXHeroData latitude](v7, "latitude");
    v13 = v12;
    -[ATXHeroData longitude](self, "longitude");
    v15 = v14;
    -[ATXHeroData longitude](v7, "longitude");
    v17 = v16;
    -[ATXHeroData urlHash](self, "urlHash");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 || (-[ATXHeroData urlHash](v7, "urlHash"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ATXHeroData urlHash](v7, "urlHash");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[ATXHeroData urlHash](self, "urlHash");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeroData urlHash](v7, "urlHash");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v19, "isEqualToString:", v20);

      }
      else
      {
        v44 = 0;
      }

      if (v18)
      {
LABEL_14:

        v22 = -[ATXHeroData rank](self, "rank");
        v43 = -[ATXHeroData rank](v7, "rank");
        -[ATXHeroData poiCategory](self, "poiCategory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 || (-[ATXHeroData poiCategory](v7, "poiCategory"), (v40 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[ATXHeroData poiCategory](v7, "poiCategory", v40);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[ATXHeroData poiCategory](self, "poiCategory");
            v4 = (void *)v22;
            v25 = v8;
            v26 = v9;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXHeroData poiCategory](v7, "poiCategory");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v27, "isEqualToString:", v28);

            v9 = v26;
            v8 = v25;
            v22 = (unint64_t)v4;
          }
          else
          {
            v42 = 0;
          }

          if (v23)
          {
LABEL_23:
            v29 = v8 ^ v9;
            v30 = vabdd_f64(v11, v13);
            v31 = vabdd_f64(v15, v17);

            -[ATXHeroData poiMuid](self, "poiMuid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32
              || (-[ATXHeroData poiMuid](v7, "poiMuid"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[ATXHeroData poiMuid](v7, "poiMuid", v41);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                -[ATXHeroData poiMuid](self, "poiMuid");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXHeroData poiMuid](v7, "poiMuid");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v34, "isEqualToNumber:", v35);

              }
              else
              {
                v36 = 0;
              }

              if (v32)
                goto LABEL_32;
            }
            else
            {
              v36 = 1;
            }

LABEL_32:
            v37 = (v46 == v45) & ~v29;
            if (v30 >= 2.22044605e-16)
              v37 = 0;
            if (v31 >= 2.22044605e-16)
              v37 = 0;
            v38 = v37 & v44;
            if (v22 != v43)
              v38 = 0;
            v21 = v38 & v42 & v36;
            goto LABEL_39;
          }
        }
        else
        {
          v41 = 0;
          v42 = 1;
        }

        goto LABEL_23;
      }
    }
    else
    {
      v44 = 1;
    }

    goto LABEL_14;
  }
  v21 = 0;
LABEL_40:

  return v21;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[ATXHeroData adamId](self, "adamId");
  -[ATXHeroData bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData urlHash](self, "urlHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData poiCategory](self, "poiCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData latitude](self, "latitude");
  v9 = v8;
  -[ATXHeroData longitude](self, "longitude");
  v11 = v10;
  -[ATXHeroData score](self, "score");
  v13 = v12;
  v14 = -[ATXHeroData rank](self, "rank");
  v15 = -[ATXHeroData radiusInMeters](self, "radiusInMeters");
  -[ATXHeroData poiMuid](self, "poiMuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HeroApp with adamId: %ld bundleId: %@ urlHash: %@ poiCategory: %@ latitude: %f longitude: %f score: %lf rank: %lu radius: %lu poiMuid: %@"), v4, v5, v6, v7, v9, v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  double v15;
  void *v16;
  unint64_t v17;

  v3 = -[ATXHeroData adamId](self, "adamId");
  -[ATXHeroData urlHash](self, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  -[ATXHeroData poiCategory](self, "poiCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  -[ATXHeroData poiMuid](self, "poiMuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  v10 = objc_alloc(MEMORY[0x24BDD16E0]);
  -[ATXHeroData latitude](self, "latitude");
  *(float *)&v11 = v11;
  v12 = (void *)objc_msgSend(v10, "initWithFloat:", v11);
  v13 = objc_msgSend(v12, "hash") - v9 + 32 * v9;

  v14 = objc_alloc(MEMORY[0x24BDD16E0]);
  -[ATXHeroData longitude](self, "longitude");
  *(float *)&v15 = v15;
  v16 = (void *)objc_msgSend(v14, "initWithFloat:", v15);
  v17 = objc_msgSend(v16, "hash") - v13 + 32 * v13;

  return v17;
}

- (ATXHeroData)initWithProtoData:(id)a3
{
  id v4;
  ATXPBHeroAppPrediction *v5;
  ATXHeroData *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBHeroAppPrediction initWithData:]([ATXPBHeroAppPrediction alloc], "initWithData:", v4);

    self = -[ATXHeroData initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXHeroData)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  ATXHeroData *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v21 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[ATXHeroData initWithProto:].cold.2();
    goto LABEL_10;
  }
  v5 = v4;
  objc_msgSend(v5, "clipMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x20BD30CC0]();
    v9 = (void *)MEMORY[0x24BDD1620];
    v10 = objc_opt_class();
    objc_msgSend(v5, "clipMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v11, &v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v37;

    objc_autoreleasePoolPop(v8);
    if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[ATXHeroData initWithProto:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  else
  {
    v12 = 0;
  }
  v22 = objc_msgSend(v5, "adamId");
  objc_msgSend(v5, "bundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latitude");
  v25 = v24;
  objc_msgSend(v5, "longitude");
  v27 = v26;
  v28 = objc_msgSend(v5, "radius");
  v29 = objc_msgSend(v5, "rank");
  v30 = objc_msgSend(v5, "isTouristApp");
  objc_msgSend(v5, "score");
  v32 = v31;
  objc_msgSend(v5, "urlHash");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:](self, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:", v22, v23, v28, v29, v30, v33, v25, v27, v32, v12);

  objc_msgSend(v5, "latitudeAtPredictionTime");
  -[ATXHeroData setLatitudeAtPredictionTime:](self, "setLatitudeAtPredictionTime:");
  objc_msgSend(v5, "longitudeAtPredictionTime");
  -[ATXHeroData setLongitudeAtPredictionTime:](self, "setLongitudeAtPredictionTime:");
  objc_msgSend(v5, "poiCategory");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData setPoiCategory:](self, "setPoiCategory:", v34);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "poiMuid"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData setPoiMuid:](self, "setPoiMuid:", v35);

  v21 = self;
LABEL_13:

  return v21;
}

- (id)proto
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;

  v3 = (void *)objc_opt_new();
  -[ATXHeroData bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleId:", v4);

  -[ATXHeroData latitude](self, "latitude");
  objc_msgSend(v3, "setLatitude:");
  -[ATXHeroData longitude](self, "longitude");
  objc_msgSend(v3, "setLongitude:");
  objc_msgSend(v3, "setRadius:", -[ATXHeroData radiusInMeters](self, "radiusInMeters"));
  objc_msgSend(v3, "setRank:", -[ATXHeroData rank](self, "rank"));
  objc_msgSend(v3, "setAdamId:", -[ATXHeroData adamId](self, "adamId"));
  -[ATXHeroData urlHash](self, "urlHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUrlHash:", v5);

  -[ATXHeroData score](self, "score");
  objc_msgSend(v3, "setScore:");
  objc_msgSend(v3, "setIsTouristApp:", -[ATXHeroData isTouristApp](self, "isTouristApp"));
  -[ATXHeroData latitudeAtPredictionTime](self, "latitudeAtPredictionTime");
  objc_msgSend(v3, "setLatitudeAtPredictionTime:");
  -[ATXHeroData longitudeAtPredictionTime](self, "longitudeAtPredictionTime");
  objc_msgSend(v3, "setLongitudeAtPredictionTime:");
  -[ATXHeroData poiCategory](self, "poiCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPoiCategory:", v6);

  -[ATXHeroData poiMuid](self, "poiMuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPoiMuid:", objc_msgSend(v7, "unsignedIntegerValue"));

  -[ATXHeroData clipMetadata](self, "clipMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x20BD30CC0]();
    v10 = (void *)MEMORY[0x24BDD1618];
    -[ATXHeroData clipMetadata](self, "clipMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    objc_msgSend(v3, "setClipMetadata:", v12);

    objc_autoreleasePoolPop(v9);
    if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[ATXHeroData proto].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXHeroData proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL8 v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ATXHeroData *v21;
  ATXHeroData *v23;

  v23 = +[ATXHeroData allocWithZone:](ATXHeroData, "allocWithZone:", a3);
  v4 = -[ATXHeroData adamId](self, "adamId");
  -[ATXHeroData bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData latitude](self, "latitude");
  v7 = v6;
  -[ATXHeroData longitude](self, "longitude");
  v9 = v8;
  v10 = -[ATXHeroData radiusInMeters](self, "radiusInMeters");
  v11 = -[ATXHeroData rank](self, "rank");
  v12 = -[ATXHeroData isTouristApp](self, "isTouristApp");
  -[ATXHeroData score](self, "score");
  v14 = v13;
  -[ATXHeroData urlHash](self, "urlHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_class();
  -[ATXHeroData clipMetadata](self, "clipMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "copyClipMetadata:", v17);
  -[ATXHeroData poiCategory](self, "poiCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroData poiMuid](self, "poiMuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ATXHeroData initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:](v23, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:", v4, v5, v10, v11, v12, v15, v7, v9, v14, v18, v19, v20);

  return v21;
}

+ (id)copyClipMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x20BD30CC0]();
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isClipMetadataEqual:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "clipBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    objc_msgSend(v5, "clipURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == v11;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(unint64_t)a3
{
  self->_adamId = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)latitudeAtPredictionTime
{
  return self->_latitudeAtPredictionTime;
}

- (void)setLatitudeAtPredictionTime:(double)a3
{
  self->_latitudeAtPredictionTime = a3;
}

- (double)longitudeAtPredictionTime
{
  return self->_longitudeAtPredictionTime;
}

- (void)setLongitudeAtPredictionTime:(double)a3
{
  self->_longitudeAtPredictionTime = a3;
}

- (unint64_t)radiusInMeters
{
  return self->_radiusInMeters;
}

- (void)setRadiusInMeters:(unint64_t)a3
{
  self->_radiusInMeters = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (void)setIsTouristApp:(BOOL)a3
{
  self->_isTouristApp = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
  objc_storeStrong((id *)&self->_urlHash, a3);
}

- (CPSClipMetadata)clipMetadata
{
  return self->_clipMetadata;
}

- (void)setClipMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clipMetadata, a3);
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (NSNumber)poiMuid
{
  return self->_poiMuid;
}

- (void)setPoiMuid:(id)a3
{
  objc_storeStrong((id *)&self->_poiMuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiMuid, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD98000, MEMORY[0x24BDACB70], a3, "Could not de-serialize clip metadata from recently engaged protobufs: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20AD98000, MEMORY[0x24BDACB70], v2, "%@: tried to initialize with an incompatible proto", v3, v4, v5, v6, 2u);

}

- (void)proto
{
  OUTLINED_FUNCTION_0(&dword_20AD98000, MEMORY[0x24BDACB70], a3, "Could not serialize clip metadata via protobufs: %@", a5, a6, a7, a8, 2u);
}

@end
