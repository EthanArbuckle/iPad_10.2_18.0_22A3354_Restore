@implementation ATXUserNotification

- (ATXUserNotification)initWithUUID:(id)a3 timestamp:(double)a4
{
  id v6;
  ATXUserNotification *v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  ATXUserNotificationDerivedData *derivedData;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUserNotification;
  v7 = -[ATXUserNotification init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_timestamp = a4;
    v10 = objc_opt_new();
    derivedData = v7->_derivedData;
    v7->_derivedData = (ATXUserNotificationDerivedData *)v10;

  }
  return v7;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 rawIdentifiers:(id)a15 isGroupMessage:(BOOL)a16 derivedData:(id)a17 urgency:(int64_t)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  ATXUserNotification *v32;
  uint64_t v33;
  NSUUID *uuid;
  uint64_t v35;
  NSString *title;
  uint64_t v37;
  NSString *subtitle;
  uint64_t v39;
  NSString *body;
  uint64_t v41;
  NSData *userInfo;
  uint64_t v43;
  NSString *bundleID;
  uint64_t v45;
  NSString *threadID;
  uint64_t v47;
  NSString *categoryID;
  uint64_t v49;
  NSString *sectionID;
  uint64_t v51;
  NSArray *contactIDs;
  uint64_t v53;
  NSArray *rawIdentifiers;
  uint64_t v55;
  ATXUserNotificationDerivedData *derivedData;
  id v60;
  id v61;
  id v62;
  objc_super v63;

  v62 = a3;
  v61 = a5;
  v60 = a6;
  v23 = a7;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a17;
  v63.receiver = self;
  v63.super_class = (Class)ATXUserNotification;
  v32 = -[ATXUserNotification init](&v63, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v62, "copy");
    uuid = v32->_uuid;
    v32->_uuid = (NSUUID *)v33;

    v32->_timestamp = a4;
    v35 = objc_msgSend(v61, "copy");
    title = v32->_title;
    v32->_title = (NSString *)v35;

    v37 = objc_msgSend(v60, "copy");
    subtitle = v32->_subtitle;
    v32->_subtitle = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    body = v32->_body;
    v32->_body = (NSString *)v39;

    v32->_bodyLength = objc_msgSend(v23, "length");
    v32->_badge = a8;
    v41 = objc_msgSend(v24, "copy");
    userInfo = v32->_userInfo;
    v32->_userInfo = (NSData *)v41;

    v43 = objc_msgSend(v25, "copy");
    bundleID = v32->_bundleID;
    v32->_bundleID = (NSString *)v43;

    v45 = objc_msgSend(v26, "copy");
    threadID = v32->_threadID;
    v32->_threadID = (NSString *)v45;

    v47 = objc_msgSend(v27, "copy");
    categoryID = v32->_categoryID;
    v32->_categoryID = (NSString *)v47;

    v49 = objc_msgSend(v28, "copy");
    sectionID = v32->_sectionID;
    v32->_sectionID = (NSString *)v49;

    v51 = objc_msgSend(v29, "copy");
    contactIDs = v32->_contactIDs;
    v32->_contactIDs = (NSArray *)v51;

    v53 = objc_msgSend(v30, "copy");
    rawIdentifiers = v32->_rawIdentifiers;
    v32->_rawIdentifiers = (NSArray *)v53;

    v32->_isGroupMessage = a16;
    v32->_urgency = a18;
    if (v31)
      v55 = objc_msgSend(v31, "copy");
    else
      v55 = objc_opt_new();
    derivedData = v32->_derivedData;
    v32->_derivedData = (ATXUserNotificationDerivedData *)v55;

  }
  return v32;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16 urgency:(int64_t)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v50;
  id v51;

  if (a4 == 0.0)
  {
    v45 = (void *)MEMORY[0x1E0C99D68];
    v43 = a16;
    v22 = a14;
    v42 = a13;
    v23 = a11;
    v24 = a10;
    v25 = a9;
    v26 = a7;
    v27 = a6;
    v28 = a5;
    v29 = a3;
    objc_msgSend(v45, "now");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSinceReferenceDate");
    LOBYTE(v41) = a15;
    v50 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v29, v28, v27, v26, a8, v25, v24, v23, 0, v42, v22, 0, v41, v43, a17);

    v30 = v50;
  }
  else
  {
    v47 = a16;
    v32 = a14;
    v44 = a13;
    v33 = a11;
    v34 = a10;
    v35 = a9;
    v36 = a7;
    v37 = a6;
    v38 = a5;
    v39 = a3;
    LOBYTE(v41) = a15;
    v51 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v39, v38, v37, v36, a8, v35, a4, v34, v33, 0, v44, v32, 0, v41, v47, a17);

    v30 = v51;
  }

  return v30;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 sectionID:(id)a12 contactIDs:(id)a13 isGroupMessage:(BOOL)a14 derivedData:(id)a15 urgency:(int64_t)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v49;
  id v50;

  if (a4 == 0.0)
  {
    v44 = (void *)MEMORY[0x1E0C99D68];
    v42 = a15;
    v21 = a13;
    v41 = a12;
    v40 = a11;
    v22 = a10;
    v23 = a9;
    v24 = a7;
    v25 = a6;
    v26 = a5;
    v27 = a3;
    objc_msgSend(v44, "now");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "timeIntervalSinceReferenceDate");
    LOBYTE(v39) = a14;
    v49 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v27, v26, v25, v24, a8, v23, v22, v40, 0, v41, v21, v39, v42, a16);

    v28 = v49;
  }
  else
  {
    v46 = a15;
    v30 = a13;
    v43 = a12;
    v31 = a11;
    v32 = a10;
    v33 = a9;
    v34 = a7;
    v35 = a6;
    v36 = a5;
    v37 = a3;
    LOBYTE(v39) = a14;
    v50 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v37, v36, v35, v34, a8, v33, a4, v32, v31, 0, v43, v30, v39, v46, a16);

    v28 = v50;
  }

  return v28;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  void *v49;
  id v52;
  id v53;

  if (a4 == 0.0)
  {
    v41 = (void *)MEMORY[0x1E0C99D68];
    v43 = a16;
    v19 = a14;
    v20 = a13;
    v39 = a12;
    v21 = a5;
    v22 = a11;
    v23 = a10;
    v37 = a9;
    v24 = a7;
    v25 = a6;
    v46 = v21;
    v26 = a3;
    objc_msgSend(v41, "now");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "timeIntervalSinceReferenceDate");
    LOBYTE(v36) = a15;
    v52 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v26, v46, v25, v24, a8, v37, v23, v22, v39, v20, v19, v36, v43, 4);

    v27 = v52;
  }
  else
  {
    v44 = a16;
    v29 = a14;
    v30 = a13;
    v42 = a12;
    v40 = a11;
    v31 = a10;
    v38 = a9;
    v32 = a7;
    v47 = a6;
    v33 = a5;
    v34 = a3;
    LOBYTE(v36) = a15;
    v53 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v34, v33, v47, v32, a8, v38, a4, v31, v40, v42, v30, v29, v36, v44, 4);

    v27 = v53;
  }

  return v27;
}

- (id)initFromNotificationData:(id)a3 date:(id)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 bundleID:(id)a8 threadID:(id)a9 categoryID:(id)a10
{
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v31;

  v15 = a4;
  v16 = (objc_class *)MEMORY[0x1E0CB3A28];
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  v24 = (void *)objc_msgSend([v16 alloc], "initWithUUIDString:", v23);

  v25 = v15;
  if (v15)
  {
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    LOBYTE(v31) = 0;
    v26 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", v24, v22, v21, v20, 0, 0, v19, v18, v17, 0, 0, v31, 0);

    v27 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    LOBYTE(v31) = 0;
    v29 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", v24, v22, v21, v20, 0, 0, v19, v18, v17, 0, 0, v31, 0);

    v27 = v29;
  }

  return v27;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 derivedData:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = 0;
  return -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", a3, a5, a6, a7, 0, 0, a4, a10, a11, 0, 0, 0, v13, a12);
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 derivedData:(id)a13
{
  uint64_t v14;

  LOBYTE(v14) = 0;
  return -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", a3, a5, a6, a7, 0, 0, a4, a10, a11, a12, 0, 0, v14, a13);
}

- (id)digestRankingHardcodedComparisonValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
}

- (int64_t)compareForDigestRanking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[ATXUserNotification digestRankingHardcodedComparisonValue](self, "digestRankingHardcodedComparisonValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "digestRankingHardcodedComparisonValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXUserNotification appSpecifiedScore](self, "appSpecifiedScore");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "appSpecifiedScore");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "compare:", v11);

    if (!v7)
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[ATXUserNotification timestamp](self, "timestamp");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "timestamp");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "compare:", v15);

    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXUserNotification *v4;
  ATXUserNotification *v5;
  BOOL v6;

  v4 = (ATXUserNotification *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUserNotification isEqualToATXUserNotification:](self, "isEqualToATXUserNotification:", v5);

  return v6;
}

- (BOOL)isEqualToATXUserNotification:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSString *title;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *subtitle;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *body;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSData *userInfo;
  NSData *v26;
  NSData *v27;
  NSData *v28;
  char v29;
  NSString *bundleID;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  NSString *threadID;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  NSString *categoryID;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  char v44;
  NSString *sectionID;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  char v49;
  NSArray *contactIDs;
  NSArray *v51;
  NSArray *v52;
  NSArray *v53;
  char v54;
  NSArray *rawIdentifiers;
  NSArray *v56;
  NSArray *v57;
  NSArray *v58;
  char v59;
  ATXUserNotificationDerivedData *derivedData;
  ATXUserNotificationDerivedData *v61;
  ATXUserNotificationDerivedData *v62;
  ATXUserNotificationDerivedData *v63;
  BOOL v64;
  NSDate *recordDate;
  NSDate *v66;
  NSDate *v67;
  NSDate *v68;
  char v69;
  NSString *notificationID;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  char v74;
  BOOL v75;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[3];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_57;
  }
  title = self->_title;
  v11 = (NSString *)v4[6];
  if (title == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = title;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_57;
  }
  subtitle = self->_subtitle;
  v16 = (NSString *)v4[7];
  if (subtitle == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = subtitle;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_57;
  }
  body = self->_body;
  v21 = (NSString *)v4[8];
  if (body == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = body;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_57;
  }
  if ((id)self->_badge == v4[12])
  {
    userInfo = self->_userInfo;
    v26 = (NSData *)v4[13];
    if (userInfo == v26)
    {

    }
    else
    {
      v27 = v26;
      v28 = userInfo;
      v29 = -[NSData isEqual:](v28, "isEqual:", v27);

      if ((v29 & 1) == 0)
        goto LABEL_57;
    }
    bundleID = self->_bundleID;
    v31 = (NSString *)v4[14];
    if (bundleID == v31)
    {

    }
    else
    {
      v32 = v31;
      v33 = bundleID;
      v34 = -[NSString isEqual:](v33, "isEqual:", v32);

      if ((v34 & 1) == 0)
        goto LABEL_57;
    }
    threadID = self->_threadID;
    v36 = (NSString *)v4[15];
    if (threadID == v36)
    {

    }
    else
    {
      v37 = v36;
      v38 = threadID;
      v39 = -[NSString isEqual:](v38, "isEqual:", v37);

      if ((v39 & 1) == 0)
        goto LABEL_57;
    }
    categoryID = self->_categoryID;
    v41 = (NSString *)v4[16];
    if (categoryID == v41)
    {

    }
    else
    {
      v42 = v41;
      v43 = categoryID;
      v44 = -[NSString isEqual:](v43, "isEqual:", v42);

      if ((v44 & 1) == 0)
        goto LABEL_57;
    }
    sectionID = self->_sectionID;
    v46 = (NSString *)v4[17];
    if (sectionID == v46)
    {

    }
    else
    {
      v47 = v46;
      v48 = sectionID;
      v49 = -[NSString isEqual:](v48, "isEqual:", v47);

      if ((v49 & 1) == 0)
        goto LABEL_57;
    }
    contactIDs = self->_contactIDs;
    v51 = (NSArray *)v4[18];
    if (contactIDs == v51)
    {

    }
    else
    {
      v52 = v51;
      v53 = contactIDs;
      v54 = -[NSArray isEqual:](v53, "isEqual:", v52);

      if ((v54 & 1) == 0)
        goto LABEL_57;
    }
    rawIdentifiers = self->_rawIdentifiers;
    v56 = (NSArray *)v4[19];
    if (rawIdentifiers == v56)
    {

    }
    else
    {
      v57 = v56;
      v58 = rawIdentifiers;
      v59 = -[NSArray isEqual:](v58, "isEqual:", v57);

      if ((v59 & 1) == 0)
        goto LABEL_57;
    }
    if (self->_isGroupMessage == *((unsigned __int8 *)v4 + 9))
    {
      derivedData = self->_derivedData;
      v61 = (ATXUserNotificationDerivedData *)v4[23];
      if (derivedData == v61)
      {

      }
      else
      {
        v62 = v61;
        v63 = derivedData;
        v64 = -[ATXUserNotificationDerivedData isEqual:](v63, "isEqual:", v62);

        if (!v64)
          goto LABEL_57;
      }
      recordDate = self->_recordDate;
      v66 = (NSDate *)v4[4];
      if (recordDate == v66)
      {

      }
      else
      {
        v67 = v66;
        v68 = recordDate;
        v69 = -[NSDate isEqual:](v68, "isEqual:", v67);

        if ((v69 & 1) == 0)
          goto LABEL_57;
      }
      notificationID = self->_notificationID;
      v71 = (NSString *)v4[5];
      if (notificationID == v71)
      {

      }
      else
      {
        v72 = v71;
        v73 = notificationID;
        v74 = -[NSString isEqual:](v73, "isEqual:", v72);

        if ((v74 & 1) == 0)
          goto LABEL_57;
      }
      v75 = self->_bodyLength == (_QWORD)v4[11];
      goto LABEL_58;
    }
  }
LABEL_57:
  v75 = 0;
LABEL_58:

  return v75;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("User notification: uuid: %@, bundle-id: %@, thread-id: %@, category-id: %@, section-id: %@, contact-ids: %@, is group message: %d, "), self->_uuid, self->_bundleID, self->_threadID, self->_categoryID, self->_sectionID, self->_contactIDs, self->_isGroupMessage);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXUserNotification *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = +[ATXUserNotification allocWithZone:](ATXUserNotification, "allocWithZone:", a3);
  LOBYTE(v12) = self->_isGroupMessage;
  v5 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:](v4, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", self->_uuid, self->_title, self->_subtitle, self->_body, self->_badge, self->_userInfo, self->_timestamp, self->_bundleID, self->_threadID, self->_categoryID, self->_sectionID, self->_contactIDs, self->_rawIdentifiers, v12, self->_derivedData, self->_urgency);
  objc_msgSend(v5, "setIsMessage:", -[ATXUserNotification isMessage](self, "isMessage"));
  -[ATXUserNotification summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSummary:", v6);

  objc_msgSend(v5, "setSummaryLength:", -[ATXUserNotification summaryLength](self, "summaryLength"));
  objc_msgSend(v5, "setIsSummarized:", -[ATXUserNotification isSummarized](self, "isSummarized"));
  objc_msgSend(v5, "setIsPartOfStack:", -[ATXUserNotification isPartOfStack](self, "isPartOfStack"));
  objc_msgSend(v5, "setIsStackSummary:", -[ATXUserNotification isStackSummary](self, "isStackSummary"));
  objc_msgSend(v5, "setPositionInStack:", -[ATXUserNotification positionInStack](self, "positionInStack"));
  objc_msgSend(v5, "setNumberOfNotificationsInStack:", -[ATXUserNotification numberOfNotificationsInStack](self, "numberOfNotificationsInStack"));
  objc_msgSend(v5, "setAttachmentType:", -[ATXUserNotification attachmentType](self, "attachmentType"));
  -[ATXUserNotification appSpecifiedScore](self, "appSpecifiedScore");
  objc_msgSend(v5, "setAppSpecifiedScore:");
  -[ATXUserNotification digestEngagementTrackingMetrics](self, "digestEngagementTrackingMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setDigestEngagementTrackingMetrics:", v8);

  -[ATXUserNotification recordDate](self, "recordDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordDate:", v9);

  -[ATXUserNotification notificationID](self, "notificationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationID:", v10);

  objc_msgSend(v5, "setTitleLength:", -[ATXUserNotification titleLength](self, "titleLength"));
  objc_msgSend(v5, "setSubtitleLength:", -[ATXUserNotification subtitleLength](self, "subtitleLength"));
  objc_msgSend(v5, "setBodyLength:", -[ATXUserNotification bodyLength](self, "bodyLength"));
  objc_msgSend(v5, "setIsDeterminedUrgentByModel:", -[ATXUserNotification isDeterminedUrgentByModel](self, "isDeterminedUrgentByModel"));
  objc_msgSend(v5, "setPriorityStatus:", -[ATXUserNotification priorityStatus](self, "priorityStatus"));
  return v5;
}

- (double)finalDigestScoreForMode:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "getDigestScoreForNotification:modeId:", self, v4);
  v7 = v6;

  return v7;
}

- (id)groupId
{
  NSString *threadID;
  NSString *v3;

  threadID = self->_threadID;
  if (threadID || (threadID = self->_bundleID) != 0)
  {
    v3 = threadID;
  }
  else
  {
    -[NSUUID UUIDString](self->_uuid, "UUIDString");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)hasPreviewableAttachment
{
  return ((-[ATXUserNotification attachmentType](self, "attachmentType") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotification *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotification initFromJSON:]([ATXPBUserNotification alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotification initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotification)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotification *v5;
  ATXUserNotification *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotification initWithData:]([ATXPBUserNotification alloc], "initWithData:", v4);

    self = -[ATXUserNotification initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUserNotification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotification)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  ATXUserNotificationDerivedData *v9;
  void *v10;
  ATXUserNotificationDerivedData *v11;
  ATXUserNotification *v12;
  NSObject *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  ATXSharedDigestEngagementTrackingMetrics *v29;
  NSObject *v30;
  ATXSharedDigestEngagementTrackingMetrics *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXMissedNotificationRanking initWithProto:].cold.1();
      v12 = 0;
      goto LABEL_25;
    }
    v47 = v4;
    v5 = v4;
    -[NSObject derivedData](v5, "derivedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject derivedData](v5, "derivedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v9 = [ATXUserNotificationDerivedData alloc];
        -[NSObject derivedData](v5, "derivedData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[ATXUserNotificationDerivedData initWithProto:](v9, "initWithProto:", v10);

LABEL_14:
        v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[NSObject uuid](v5, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v14, "initWithUUIDString:", v46);
        -[NSObject timestamp](v5, "timestamp");
        v16 = v15;
        -[NSObject title](v5, "title");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject subtitle](v5, "subtitle");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject body](v5, "body");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[NSObject badge](v5, "badge");
        -[NSObject userInfo](v5, "userInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleID](v5, "bundleID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject threadID](v5, "threadID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject categoryID](v5, "categoryID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject sectionID](v5, "sectionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contactIDs](v5, "contactIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject rawIdentifiers](v5, "rawIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v36) = -[NSObject isGroupMessage](v5, "isGroupMessage");
        v20 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v45, v42, v44, v43, v41, v40, v16, v39, v38, v37, v17, v18, v19, v36, v11, (int)-[NSObject urgency](v5, "urgency"));

        objc_msgSend(v20, "setIsMessage:", -[NSObject isMessage](v5, "isMessage"));
        -[NSObject summary](v5, "summary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSummary:", v21);

        -[NSObject summary](v5, "summary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSummaryLength:", objc_msgSend(v22, "length"));

        objc_msgSend(v20, "setIsSummarized:", -[NSObject isSummarized](v5, "isSummarized"));
        objc_msgSend(v20, "setIsPartOfStack:", -[NSObject isPartOfStack](v5, "isPartOfStack"));
        objc_msgSend(v20, "setIsStackSummary:", -[NSObject isStackSummary](v5, "isStackSummary"));
        objc_msgSend(v20, "setPositionInStack:", -[NSObject positionInStack](v5, "positionInStack"));
        objc_msgSend(v20, "setNumberOfNotificationsInStack:", -[NSObject numberOfNotificationsInStack](v5, "numberOfNotificationsInStack"));
        objc_msgSend(v20, "setAttachmentType:", (int)-[NSObject attachmentType](v5, "attachmentType"));
        -[NSObject appSpecifiedScore](v5, "appSpecifiedScore");
        objc_msgSend(v20, "setAppSpecifiedScore:");
        -[NSObject title](v5, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTitleLength:", objc_msgSend(v23, "length"));

        -[NSObject subtitle](v5, "subtitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSubtitleLength:", objc_msgSend(v24, "length"));

        -[NSObject body](v5, "body");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBodyLength:", objc_msgSend(v25, "length"));

        objc_msgSend(v20, "setIsDeterminedUrgentByModel:", -[NSObject isDeterminedUrgentByModel](v5, "isDeterminedUrgentByModel"));
        objc_msgSend(v20, "setPriorityStatus:", (int)-[NSObject priorityStatus](v5, "priorityStatus"));
        -[NSObject sharedEngagementTracker](v5, "sharedEngagementTracker");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          -[NSObject sharedEngagementTracker](v5, "sharedEngagementTracker");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v28 = objc_opt_isKindOfClass();

          if ((v28 & 1) != 0)
          {
            v29 = [ATXSharedDigestEngagementTrackingMetrics alloc];
            -[NSObject sharedEngagementTracker](v5, "sharedEngagementTracker");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](v29, "initWithProto:", v30);
            objc_msgSend(v20, "setDigestEngagementTrackingMetrics:", v31);

          }
          else
          {
            __atxlog_handle_notification_management();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              -[ATXMissedNotificationRanking initWithProto:].cold.1();
          }

        }
        if (-[NSObject hasRecordTimestamp](v5, "hasRecordTimestamp"))
        {
          v32 = (void *)MEMORY[0x1E0C99D68];
          -[NSObject recordTimestamp](v5, "recordTimestamp");
          objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setRecordDate:", v33);

        }
        v4 = v47;
        if (-[NSObject hasNotificationID](v5, "hasNotificationID"))
        {
          -[NSObject notificationID](v5, "notificationID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setNotificationID:", v34);

        }
        self = (ATXUserNotification *)v20;

        v12 = self;
LABEL_25:

        goto LABEL_26;
      }
      __atxlog_handle_notification_management();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[ATXMissedNotificationRanking initWithProto:].cold.1();

    }
    v11 = 0;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_26:

  return v12;
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
  NSDate *recordDate;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setTimestamp:", self->_timestamp);
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setSubtitle:", self->_subtitle);
  objc_msgSend(v3, "setBody:", self->_body);
  objc_msgSend(v3, "setTitleLength:", self->_titleLength);
  objc_msgSend(v3, "setSubtitleLength:", self->_subtitleLength);
  objc_msgSend(v3, "setBodyLength:", self->_bodyLength);
  objc_msgSend(v3, "setBadge:", self->_badge);
  objc_msgSend(v3, "setUserInfo:", self->_userInfo);
  objc_msgSend(v3, "setBundleID:", self->_bundleID);
  objc_msgSend(v3, "setThreadID:", self->_threadID);
  objc_msgSend(v3, "setCategoryID:", self->_categoryID);
  objc_msgSend(v3, "setSectionID:", self->_sectionID);
  v5 = (void *)-[NSArray mutableCopy](self->_contactIDs, "mutableCopy");
  objc_msgSend(v3, "setContactIDs:", v5);

  v6 = (void *)-[NSArray mutableCopy](self->_rawIdentifiers, "mutableCopy");
  objc_msgSend(v3, "setRawIdentifiers:", v6);

  objc_msgSend(v3, "setIsMessage:", self->_isMessage);
  objc_msgSend(v3, "setSummary:", self->_summary);
  objc_msgSend(v3, "setIsSummarized:", self->_isSummarized);
  objc_msgSend(v3, "setSummaryLength:", self->_summaryLength);
  objc_msgSend(v3, "setIsPartOfStack:", self->_isPartOfStack);
  objc_msgSend(v3, "setIsStackSummary:", self->_isStackSummary);
  objc_msgSend(v3, "setPositionInStack:", self->_positionInStack);
  objc_msgSend(v3, "setNumberOfNotificationsInStack:", self->_numberOfNotificationsInStack);
  objc_msgSend(v3, "setIsDeterminedUrgentByModel:", self->_isDeterminedUrgentByModel);
  objc_msgSend(v3, "setPriorityStatus:", LODWORD(self->_priorityStatus));
  objc_msgSend(v3, "setIsGroupMessage:", self->_isGroupMessage);
  -[ATXUserNotificationDerivedData proto](self->_derivedData, "proto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDerivedData:", v7);

  objc_msgSend(v3, "setUrgency:", LODWORD(self->_urgency));
  objc_msgSend(v3, "setAttachmentType:", LODWORD(self->_attachmentType));
  -[ATXUserNotification appSpecifiedScore](self, "appSpecifiedScore");
  objc_msgSend(v3, "setAppSpecifiedScore:");
  -[ATXUserNotification digestEngagementTrackingMetrics](self, "digestEngagementTrackingMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proto");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedEngagementTracker:", v9);

  recordDate = self->_recordDate;
  if (recordDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](recordDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setRecordTimestamp:");
  }
  objc_msgSend(v3, "setNotificationID:", self->_notificationID);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXUserNotification encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotification initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (void)setRecordDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)titleLength
{
  return self->_titleLength;
}

- (void)setTitleLength:(unint64_t)a3
{
  self->_titleLength = a3;
}

- (unint64_t)subtitleLength
{
  return self->_subtitleLength;
}

- (void)setSubtitleLength:(unint64_t)a3
{
  self->_subtitleLength = a3;
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (void)setBodyLength:(unint64_t)a3
{
  self->_bodyLength = a3;
}

- (unint64_t)badge
{
  return self->_badge;
}

- (void)setBadge:(unint64_t)a3
{
  self->_badge = a3;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)rawIdentifiers
{
  return self->_rawIdentifiers;
}

- (void)setRawIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (void)setIsMessage:(BOOL)a3
{
  self->_isMessage = a3;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  self->_isGroupMessage = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->_attachmentType = a3;
}

- (double)appSpecifiedScore
{
  return self->_appSpecifiedScore;
}

- (void)setAppSpecifiedScore:(double)a3
{
  self->_appSpecifiedScore = a3;
}

- (ATXUserNotificationDerivedData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedData, a3);
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, a3);
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (void)setIsSummarized:(BOOL)a3
{
  self->_isSummarized = a3;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unint64_t)summaryLength
{
  return self->_summaryLength;
}

- (void)setSummaryLength:(unint64_t)a3
{
  self->_summaryLength = a3;
}

- (BOOL)isPartOfStack
{
  return self->_isPartOfStack;
}

- (void)setIsPartOfStack:(BOOL)a3
{
  self->_isPartOfStack = a3;
}

- (BOOL)isStackSummary
{
  return self->_isStackSummary;
}

- (void)setIsStackSummary:(BOOL)a3
{
  self->_isStackSummary = a3;
}

- (unint64_t)positionInStack
{
  return self->_positionInStack;
}

- (void)setPositionInStack:(unint64_t)a3
{
  self->_positionInStack = a3;
}

- (unint64_t)numberOfNotificationsInStack
{
  return self->_numberOfNotificationsInStack;
}

- (void)setNumberOfNotificationsInStack:(unint64_t)a3
{
  self->_numberOfNotificationsInStack = a3;
}

- (BOOL)isDeterminedUrgentByModel
{
  return self->_isDeterminedUrgentByModel;
}

- (void)setIsDeterminedUrgentByModel:(BOOL)a3
{
  self->_isDeterminedUrgentByModel = a3;
}

- (unint64_t)priorityStatus
{
  return self->_priorityStatus;
}

- (void)setPriorityStatus:(unint64_t)a3
{
  self->_priorityStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_derivedData, 0);
  objc_storeStrong((id *)&self->_rawIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
