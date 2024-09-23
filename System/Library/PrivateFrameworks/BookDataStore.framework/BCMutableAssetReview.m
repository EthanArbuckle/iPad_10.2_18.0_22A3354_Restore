@implementation BCMutableAssetReview

- (BCMutableAssetReview)initWithAssetReviewID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5B240();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableAssetReview;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableAssetReview *)*((_QWORD *)v9 + 9);
    *((_QWORD *)v9 + 9) = v10;
LABEL_7:

  }
  return (BCMutableAssetReview *)v9;
}

- (BCMutableAssetReview)initWithCloudData:(id)a3
{
  id v4;
  BCMutableAssetReview *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *assetReviewID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *reviewTitle;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *reviewBody;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BCMutableAssetReview;
  v5 = -[BCMutableCloudData initWithCloudData:](&v46, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_assetReviewID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      assetReviewID = v5->_assetReviewID;
      v5->_assetReviewID = (NSString *)v17;

      v5->_starRating = objc_msgSend_starRating(v11, v19, v20, v21, v22);
      objc_msgSend_reviewTitle(v11, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_copy(v27, v28, v29, v30, v31);
      reviewTitle = v5->_reviewTitle;
      v5->_reviewTitle = (NSString *)v32;

      objc_msgSend_reviewBody(v11, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_copy(v38, v39, v40, v41, v42);
      reviewBody = v5->_reviewBody;
      v5->_reviewBody = (NSString *)v43;
    }
    else
    {
      BDSCloudKitLog();
      reviewBody = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR))
        sub_227E5B0D4();
      v38 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableAssetReview)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableAssetReview *v8;
  uint64_t v9;
  NSString *assetReviewID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *reviewTitle;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *reviewBody;
  objc_super v29;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    reviewBody = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR))
      sub_227E5B26C();
    v8 = 0;
    goto LABEL_7;
  }
  v29.receiver = self;
  v29.super_class = (Class)BCMutableAssetReview;
  v8 = -[BCMutableCloudData initWithRecord:](&v29, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    assetReviewID = v8->_assetReviewID;
    v8->_assetReviewID = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("starRating"), v12, v13);
    self = (BCMutableAssetReview *)objc_claimAutoreleasedReturnValue();
    v8->_starRating = objc_msgSend_intValue(self, v14, v15, v16, v17);
    objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("reviewTitle"), v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    reviewTitle = v8->_reviewTitle;
    v8->_reviewTitle = (NSString *)v21;

    objc_msgSend_objectForKey_(v4, v23, (uint64_t)CFSTR("reviewBody"), v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    reviewBody = v8->_reviewBody;
    v8->_reviewBody = (NSString *)v26;
LABEL_7:

  }
  return v8;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetReviewID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_starRating(self, v8, v9, v10, v11);
  objc_msgSend_reviewTitle(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reviewBody(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@"), v24, v25, v7, v12, v17, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (id)recordType
{
  return CFSTR("assetReview");
}

- (double)normalizedStarRating
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  double v16;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend_starRating(self, a2, v2, v3, v4);
  objc_msgSend_numberWithShort_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v10, v11, v12, v13, v14);
  v16 = v15 / 5.0;

  return v16;
}

- (void)setNormalizedStarRating:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, v3, v4, v5, floor(a3 * 5.0));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_integerValue(v15, v7, v8, v9, v10);
  objc_msgSend_setStarRating_(self, v12, v11, v13, v14);

}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (id)configuredRecordFromAttributes
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)BCMutableAssetReview;
  -[BCMutableCloudData configuredRecordFromAttributes](&v31, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_starRating(self, v5, v6, v7, v8);
  objc_msgSend_numberWithShort_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("starRating"), v15);

  objc_msgSend_reviewTitle(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("reviewTitle"), v22);

  objc_msgSend_reviewBody(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v28, (uint64_t)v27, (uint64_t)CFSTR("reviewBody"), v29);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BCMutableAssetReview;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  v9 = objc_msgSend_starRating(self, v5, v6, v7, v8, v26.receiver, v26.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v10, v9, (uint64_t)CFSTR("starRating"), v11);
  objc_msgSend_reviewTitle(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("reviewTitle"), v18);

  objc_msgSend_reviewBody(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("reviewBody"), v25);

}

- (BCMutableAssetReview)initWithCoder:(id)a3
{
  id v4;
  BCMutableAssetReview *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCMutableAssetReview *v10;
  uint64_t v11;
  NSString *assetReviewID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *reviewTitle;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *reviewBody;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BCMutableAssetReview;
  v5 = -[BCMutableCloudData initWithCoder:](&v27, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    assetReviewID = v10->_assetReviewID;
    v10->_assetReviewID = (NSString *)v11;

    v10->_starRating = objc_msgSend_decodeIntForKey_(v4, v13, (uint64_t)CFSTR("starRating"), v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("reviewTitle"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    reviewTitle = v10->_reviewTitle;
    v10->_reviewTitle = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("reviewBody"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    reviewBody = v10->_reviewBody;
    v10->_reviewBody = (NSString *)v24;

  }
  return v10;
}

- (NSString)assetReviewID
{
  return self->_assetReviewID;
}

- (void)setAssetReviewID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (signed)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(signed __int16)a3
{
  self->_starRating = a3;
}

- (NSString)reviewTitle
{
  return self->_reviewTitle;
}

- (void)setReviewTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)reviewBody
{
  return self->_reviewBody;
}

- (void)setReviewBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_reviewBody, 0);
  objc_storeStrong((id *)&self->_reviewTitle, 0);
  objc_storeStrong((id *)&self->_assetReviewID, 0);
}

@end
