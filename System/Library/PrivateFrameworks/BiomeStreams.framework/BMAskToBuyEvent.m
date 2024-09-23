@implementation BMAskToBuyEvent

- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:].cold.2((uint64_t)v6, v11, v18, v19, v20, v21, v22, v23);
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14
{
  uint64_t v15;

  LOBYTE(v15) = 0;
  return -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](self, "initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:", a3, *(_QWORD *)&a4, a6, a7, a8, a9, a5, a10, a11, a12, a13, &stru_1E2672FA8, v15, 0);
}

- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(BOOL)a15 storeLink:(id)a16
{
  __CFString *v21;
  id v22;
  BMAskToBuyEvent *v23;
  BMAskToBuyEvent *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BMAskToBuyEvent *v35;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v44 = a3;
  v38 = a6;
  v51 = a6;
  v40 = a7;
  v43 = a7;
  v41 = a8;
  v49 = a8;
  v21 = (__CFString *)a9;
  v48 = a10;
  v47 = a11;
  v50 = a12;
  v46 = a13;
  v42 = a14;
  v22 = a16;
  v52.receiver = self;
  v52.super_class = (Class)BMAskToBuyEvent;
  v23 = -[BMEventBase init](&v52, sel_init);
  v24 = v23;
  if (!v23)
  {
    v25 = v44;
LABEL_19:
    v35 = v24;
    goto LABEL_20;
  }
  v25 = v44;
  if (-[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v23, "validNonOptionalProperty:propertyName:", v44, CFSTR("requestID"))&& -[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v24, "validNonOptionalProperty:propertyName:", v51, CFSTR("userID"))&& -[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v24, "validNonOptionalProperty:propertyName:", v50, CFSTR("ageRating"))&& -[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v24, "validNonOptionalProperty:propertyName:", v49, CFSTR("itemTitle"))
    && -[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v24, "validNonOptionalProperty:propertyName:", v48, CFSTR("localizedPrice"))&& -[BMAskToBuyEvent validNonOptionalProperty:propertyName:](v24, "validNonOptionalProperty:propertyName:", v47, CFSTR("thumbnailPath")))
  {
    if (!v21)
    {
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:].cold.2(v26);

      v21 = &stru_1E2672FA8;
    }
    if (!v46)
    {
      __biome_log_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    }
    objc_storeStrong((id *)&v24->_requestID, a3);
    v24->_status = a4;
    v24->_eventTime = a5;
    objc_storeStrong((id *)&v24->_userID, v38);
    objc_storeStrong((id *)&v24->_requestID, a3);
    objc_storeStrong((id *)&v24->_actionUserID, v40);
    objc_storeStrong((id *)&v24->_itemTitle, v41);
    objc_storeStrong((id *)&v24->_itemDescription, v21);
    objc_storeStrong((id *)&v24->_thumbnailPath, a11);
    objc_storeStrong((id *)&v24->_itemLocalizedPrice, a10);
    objc_storeStrong((id *)&v24->_itemAgeRating, a12);
    objc_storeStrong((id *)&v24->_itemStarRating, a13);
    objc_storeStrong((id *)&v24->_productType, a14);
    v24->_isActionUserDevice = a15;
    objc_storeStrong((id *)&v24->_storeLink, a16);
    v25 = v44;
    goto LABEL_19;
  }
  v35 = 0;
LABEL_20:

  return v35;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  if (a4 - 3 > 0xFFFFFFFD)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[BMAskToBuyEvent eventWithData:dataVersion:].cold.1(a4, v7);

    v8 = 0;
  }

  return v8;
}

- (unsigned)dataVersion
{
  return 2;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMAskToBuyEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMAskToBuyEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBAskToBuyEvent *v5;
  BMAskToBuyEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBAskToBuyEvent initWithData:]([BMPBAskToBuyEvent alloc], "initWithData:", v4);

    self = -[BMAskToBuyEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMAskToBuyEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BMAskToBuyEvent *v15;
  NSObject *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BMAskToBuyEvent initWithProto:].cold.1((uint64_t)self, v16);

    goto LABEL_10;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "status");
  if (v6 - 1 >= 3)
    v7 = 0;
  else
    v7 = v6;
  v27 = v7;
  objc_msgSend(v5, "requestID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventTime");
  v9 = v8;
  objc_msgSend(v5, "userID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionUserID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemLocalizedPrice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ageRating");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "starRating");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "isActionUserDevice");
  objc_msgSend(v5, "storeLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = v13;
  self = -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](self, "initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:", v25, v27, v26, v24, v23, v22, v9, v21, v20, v19, v11, v12, v18, v14);

  v15 = self;
LABEL_11:

  return v15;
}

- (id)proto
{
  unsigned int status;
  uint64_t v4;
  void *v5;

  status = self->_status;
  if (status - 1 >= 3)
    v4 = 0;
  else
    v4 = status;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRequestID:", self->_requestID);
  objc_msgSend(v5, "setStatus:", v4);
  objc_msgSend(v5, "setEventTime:", self->_eventTime);
  objc_msgSend(v5, "setItemTitle:", self->_itemTitle);
  objc_msgSend(v5, "setItemDescription:", self->_itemDescription);
  objc_msgSend(v5, "setItemLocalizedPrice:", self->_itemLocalizedPrice);
  objc_msgSend(v5, "setThumbnailPath:", self->_thumbnailPath);
  objc_msgSend(v5, "setUserID:", self->_userID);
  objc_msgSend(v5, "setActionUserID:", self->_actionUserID);
  -[NSNumber floatValue](self->_itemStarRating, "floatValue");
  objc_msgSend(v5, "setStarRating:");
  objc_msgSend(v5, "setAgeRating:", self->_itemAgeRating);
  objc_msgSend(v5, "setProductType:", self->_productType);
  objc_msgSend(v5, "setIsActionUserDevice:", self->_isActionUserDevice);
  objc_msgSend(v5, "setStoreLink:", self->_storeLink);
  return v5;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventTime"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemTitle, CFSTR("itemTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemDescription, CFSTR("itemDescription"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_thumbnailPath, CFSTR("thumbnailPath"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemLocalizedPrice, CFSTR("itemLocalizedPrice"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userID, CFSTR("userID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionUserID, CFSTR("actionUserID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemStarRating, CFSTR("starRating"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemAgeRating, CFSTR("ageRating"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_productType, CFSTR("productType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActionUserDevice);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isActionUserDevice"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_storeLink, CFSTR("storeLink"));
  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMAskToBuyEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent json].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_requestID, "hash");
  return -[NSString hash](self->_userID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __CFString *v21;
  int v22;
  int v23;
  void *v24;
  __CFString *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  float v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  __CFString *v61;
  int v62;
  void *v63;
  __CFString *v64;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAskToBuyEvent eventTime](self, "eventTime");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longValue");

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "eventTime");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longValue");

    -[BMAskToBuyEvent requestID](self, "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    LODWORD(v12) = -[BMAskToBuyEvent status](self, "status");
    if ((_DWORD)v12 == objc_msgSend(v5, "status"))
      v15 = v14;
    else
      v15 = 0;
    if (v8 == v11)
      v16 = v15;
    else
      v16 = 0;
    -[BMAskToBuyEvent userID](self, "userID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    -[BMAskToBuyEvent actionUserID](self, "actionUserID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[BMAskToBuyEvent actionUserID](self, "actionUserID");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("___");
    }
    v23 = v16 & v19;

    objc_msgSend(v5, "actionUserID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v5, "actionUserID");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = CFSTR("___");
    }

    v26 = -[__CFString isEqualToString:](v21, "isEqualToString:", v25);
    -[BMAskToBuyEvent itemAgeRating](self, "itemAgeRating");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemAgeRating");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23 & v26 & objc_msgSend(v27, "isEqualToString:", v28);

    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAskToBuyEvent itemStarRating](self, "itemStarRating");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatValue");
    objc_msgSend(v30, "numberWithInteger:", (uint64_t)(float)(v32 * 100.0));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "longValue");

    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "itemStarRating");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    objc_msgSend(v35, "numberWithInteger:", (uint64_t)(float)(v37 * 100.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "longValue");

    if (v34 == v39)
      v40 = v29;
    else
      v40 = 0;
    -[BMAskToBuyEvent itemAgeRating](self, "itemAgeRating");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemAgeRating");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToString:", v42);

    -[BMAskToBuyEvent itemTitle](self, "itemTitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v43 & objc_msgSend(v44, "isEqualToString:", v45);

    -[BMAskToBuyEvent itemDescription](self, "itemDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v46 & objc_msgSend(v47, "isEqualToString:", v48);

    -[BMAskToBuyEvent itemLocalizedPrice](self, "itemLocalizedPrice");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemLocalizedPrice");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v49 & objc_msgSend(v50, "isEqualToString:", v51);

    -[BMAskToBuyEvent thumbnailPath](self, "thumbnailPath");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailPath");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v52 & objc_msgSend(v53, "isEqualToString:", v54);

    -[BMAskToBuyEvent productType](self, "productType");
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productType");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v55 & objc_msgSend((id)v56, "isEqualToString:", v57);

    LODWORD(v56) = -[BMAskToBuyEvent isActionUserDevice](self, "isActionUserDevice");
    v59 = v58 & (v56 ^ objc_msgSend(v5, "isActionUserDevice") ^ 1);
    -[BMAskToBuyEvent storeLink](self, "storeLink");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      -[BMAskToBuyEvent storeLink](self, "storeLink");
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = CFSTR("___");
    }
    v62 = v40 & v59;

    objc_msgSend(v5, "storeLink");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v5, "storeLink");
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = CFSTR("___");
    }

    v22 = v62 & -[__CFString isEqualToString:](v61, "isEqualToString:", v64);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(double)a3
{
  self->_eventTime = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (void)setActionUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (void)setThumbnailPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (void)setItemLocalizedPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)itemStarRating
{
  return self->_itemStarRating;
}

- (void)setItemStarRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)itemAgeRating
{
  return self->_itemAgeRating;
}

- (void)setItemAgeRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  self->_isActionUserDevice = a3;
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void)setStoreLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemAgeRating, 0);
  objc_storeStrong((id *)&self->_itemStarRating, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_actionUserID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)validNonOptionalProperty:(uint64_t)a3 propertyName:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "%@ is required", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)validNonOptionalProperty:(uint64_t)a3 propertyName:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "%@ is empty", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)initWithRequestID:(uint64_t)a3 status:(uint64_t)a4 eventTime:(uint64_t)a5 userID:(uint64_t)a6 actionUserID:(uint64_t)a7 itemTitle:(uint64_t)a8 itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "starRating is required", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRequestID:(os_log_t)log status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "itemDescription fallback to empty string", v1, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 2;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMAskToBuyEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBAskToBuyEvent proto", (uint8_t *)&v5, 0xCu);

}

- (void)json
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Unable to create JSON from object", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
