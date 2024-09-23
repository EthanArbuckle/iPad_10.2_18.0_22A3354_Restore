@implementation BMNotificationEvent

- (BMNotificationEvent)initWithUniqueID:(id)a3 absoluteTimestamp:(double)a4 usageType:(unint64_t)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 badge:(unint64_t)a11 threadID:(id)a12 categoryID:(id)a13 sectionID:(id)a14 contactIDs:(id)a15 isGroupMessage:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BMNotificationEvent *v30;
  BMNotificationEvent *v31;
  uint64_t v32;
  NSString *bundleID;
  uint64_t v34;
  NSString *notificationID;
  uint64_t v36;
  NSString *deviceID;
  uint64_t v38;
  NSString *title;
  uint64_t v40;
  NSString *subtitle;
  uint64_t v42;
  NSString *threadID;
  uint64_t v44;
  NSString *categoryID;
  uint64_t v46;
  NSString *sectionID;
  uint64_t v48;
  NSArray *contactIDs;
  id v54;
  id v55;
  objc_super v56;

  v54 = a3;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v55 = a9;
  v24 = a10;
  v25 = v22;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v56.receiver = self;
  v56.super_class = (Class)BMNotificationEvent;
  v30 = -[BMEventBase init](&v56, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    v31->_absoluteTimestamp = a4;
    v31->_usageType = a5;
    v32 = objc_msgSend(v21, "copy");
    bundleID = v31->_bundleID;
    v31->_bundleID = (NSString *)v32;

    v34 = objc_msgSend(v25, "copy");
    notificationID = v31->_notificationID;
    v31->_notificationID = (NSString *)v34;

    v36 = objc_msgSend(v23, "copy");
    deviceID = v31->_deviceID;
    v31->_deviceID = (NSString *)v36;

    v38 = objc_msgSend(v55, "copy");
    title = v31->_title;
    v31->_title = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    subtitle = v31->_subtitle;
    v31->_subtitle = (NSString *)v40;

    v31->_badge = a11;
    v42 = objc_msgSend(v26, "copy");
    threadID = v31->_threadID;
    v31->_threadID = (NSString *)v42;

    v44 = objc_msgSend(v27, "copy");
    categoryID = v31->_categoryID;
    v31->_categoryID = (NSString *)v44;

    v46 = objc_msgSend(v28, "copy");
    sectionID = v31->_sectionID;
    v31->_sectionID = (NSString *)v46;

    v48 = objc_msgSend(v29, "copy");
    contactIDs = v31->_contactIDs;
    v31->_contactIDs = (NSArray *)v48;

    v31->_isGroupMessage = a16;
  }

  return v31;
}

- (BMNotificationEvent)initWithDKEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BMNotificationEvent *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "itemID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BMNotificationEventUsageTypeFromDKIdentifierValue(v20);
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNotificationUsageMetadataKeyClass(), "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNotificationUsageMetadataKeyClass(), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "deviceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = 0;
  v16 = -[BMNotificationEvent initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:](self, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:", v19, v7, v10, v13, v15, 0, v6, 0, 0, 0, 0, 0, 0, v18);

  return v16;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Notification event with unique ID: %@"), self->_uniqueID);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMNotificationEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNotificationEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BMNotificationEvent *v13;
  NSObject *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BMNotificationEvent initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "uniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  v24 = (int)objc_msgSend(v5, "usageType");
  objc_msgSend(v5, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "badge");
  objc_msgSend(v5, "threadID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isGroupMessage");

  LOBYTE(v16) = v12;
  self = -[BMNotificationEvent initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:](self, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:", v22, v24, v23, v21, v20, v19, v7, v18, v8, v17, v9, v10, v11, v16);

  v13 = self;
LABEL_8:

  return v13;
}

- (BMNotificationEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBNotificationEvent *v5;
  BMNotificationEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNotificationEvent initWithData:]([BMPBNotificationEvent alloc], "initWithData:", v4);

    self = -[BMNotificationEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  unint64_t usageType;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setUniqueID:", self->_uniqueID);
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  usageType = self->_usageType;
  if (usageType >= 0x16)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMNotificationEvent proto].cold.1(usageType, v7);

    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "setUsageType:", dword_18DC0B710[usageType]);
    objc_msgSend(v3, "setBundleID:", self->_bundleID);
    objc_msgSend(v3, "setNotificationID:", self->_notificationID);
    objc_msgSend(v3, "setDeviceID:", self->_deviceID);
    objc_msgSend(v3, "setTitle:", self->_title);
    objc_msgSend(v3, "setSubtitle:", self->_subtitle);
    objc_msgSend(v3, "setBadge:", self->_badge);
    objc_msgSend(v3, "setThreadID:", self->_threadID);
    objc_msgSend(v3, "setCategoryID:", self->_categoryID);
    objc_msgSend(v3, "setSectionID:", self->_sectionID);
    v5 = (void *)-[NSArray mutableCopy](self->_contactIDs, "mutableCopy");
    objc_msgSend(v3, "setContactIDs:", v5);

    objc_msgSend(v3, "setIsGroupMessage:", self->_isGroupMessage);
    v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSString *uniqueID;
  NSString *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  NSString *bundleID;
  NSString *v15;
  uint64_t v16;
  int v17;
  NSString *notificationID;
  uint64_t v19;
  void *v20;
  NSString *deviceID;
  uint64_t v22;
  void *v23;
  double absoluteTimestamp;
  double v25;
  unint64_t usageType;
  BOOL v27;
  NSString *title;
  NSString *v29;
  uint64_t v30;
  NSString *subtitle;
  uint64_t v33;
  NSString *threadID;
  uint64_t v35;
  NSString *categoryID;
  uint64_t v37;
  NSString *sectionID;
  uint64_t v39;
  NSArray *contactIDs;
  uint64_t v41;
  int v42;
  int isGroupMessage;
  void *v44;
  void *v45;
  void *v46;
  NSArray *v47;
  int v48;
  void *v49;
  void *v50;
  NSString *v51;
  int v52;
  void *v53;
  void *v54;
  NSString *v55;
  int v56;
  void *v57;
  void *v58;
  NSString *v59;
  int v60;
  void *v61;
  void *v62;
  NSString *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  NSString *v71;
  int v72;
  void *v73;
  void *v74;
  NSString *v75;
  int v76;
  void *v77;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_54;
  }
  v7 = v6;
  v8 = v7;
  uniqueID = self->_uniqueID;
  v10 = uniqueID;
  if (!uniqueID)
  {
    objc_msgSend(v7, "uniqueID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v77 = 0;
      v12 = 0;
      goto LABEL_10;
    }
    v77 = (void *)v11;
    v10 = self->_uniqueID;
  }
  objc_msgSend(v8, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v10, "isEqual:", v3) & 1) == 0)
  {

    v13 = 0;
    goto LABEL_51;
  }
  v12 = 1;
LABEL_10:
  bundleID = self->_bundleID;
  v15 = bundleID;
  if (!bundleID)
  {
    objc_msgSend(v8, "bundleID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = v12;
      v74 = 0;
      v76 = 0;
      goto LABEL_17;
    }
    v74 = (void *)v16;
    v15 = self->_bundleID;
  }
  objc_msgSend(v8, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v15, "isEqual:", v4) & 1) == 0)
  {

    v13 = 0;
    goto LABEL_48;
  }
  v17 = v12;
  v76 = 1;
LABEL_17:
  notificationID = self->_notificationID;
  v75 = notificationID;
  if (!notificationID)
  {
    objc_msgSend(v8, "notificationID");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v70 = 0;
      v72 = 0;
      goto LABEL_24;
    }
    v70 = (void *)v19;
    notificationID = self->_notificationID;
  }
  objc_msgSend(v8, "notificationID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](notificationID, "isEqual:", v20))
  {
    v13 = 0;
    v12 = v17;
    goto LABEL_44;
  }
  v73 = v20;
  v72 = 1;
LABEL_24:
  deviceID = self->_deviceID;
  v71 = deviceID;
  if (!deviceID)
  {
    objc_msgSend(v8, "deviceID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v68 = 0;
      v69 = 0;
      goto LABEL_31;
    }
    v68 = (void *)v22;
    deviceID = self->_deviceID;
  }
  objc_msgSend(v8, "deviceID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](deviceID, "isEqual:", v23) & 1) == 0)
  {

    v13 = 0;
    v12 = v17;
    v20 = v73;
    goto LABEL_42;
  }
  v67 = v23;
  v69 = 1;
LABEL_31:
  v12 = v17;
  v20 = v73;
  absoluteTimestamp = self->_absoluteTimestamp;
  objc_msgSend(v8, "absoluteTimestamp");
  if (absoluteTimestamp != v25
    || (usageType = self->_usageType, v27 = usageType == objc_msgSend(v8, "usageType"), v20 = v73, !v27))
  {
    v13 = 0;
    goto LABEL_40;
  }
  v66 = v17;
  title = self->_title;
  v29 = title;
  if (!title)
  {
    objc_msgSend(v8, "title");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v61 = 0;
      v64 = 0;
      goto LABEL_63;
    }
    v61 = (void *)v30;
    v29 = self->_title;
  }
  objc_msgSend(v8, "title");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](v29, "isEqual:"))
  {
    v13 = 0;
    v12 = v66;
    v20 = v73;
    goto LABEL_114;
  }
  v64 = 1;
LABEL_63:
  subtitle = self->_subtitle;
  v63 = subtitle;
  if (!subtitle)
  {
    objc_msgSend(v8, "subtitle");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v57 = 0;
      v60 = 0;
      goto LABEL_70;
    }
    v57 = (void *)v33;
    subtitle = self->_subtitle;
  }
  objc_msgSend(v8, "subtitle");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](subtitle, "isEqual:"))
  {
    v13 = 0;
    v12 = v66;
    v20 = v73;
    goto LABEL_111;
  }
  v60 = 1;
LABEL_70:
  threadID = self->_threadID;
  v59 = threadID;
  if (!threadID)
  {
    objc_msgSend(v8, "threadID");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      v53 = 0;
      v56 = 0;
      goto LABEL_77;
    }
    v53 = (void *)v35;
    threadID = self->_threadID;
  }
  objc_msgSend(v8, "threadID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](threadID, "isEqual:"))
  {
    v13 = 0;
    v12 = v66;
    v20 = v73;
    goto LABEL_108;
  }
  v56 = 1;
LABEL_77:
  categoryID = self->_categoryID;
  v55 = categoryID;
  if (!categoryID)
  {
    objc_msgSend(v8, "categoryID");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      v49 = 0;
      v52 = 0;
      goto LABEL_84;
    }
    v49 = (void *)v37;
    categoryID = self->_categoryID;
  }
  objc_msgSend(v8, "categoryID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](categoryID, "isEqual:"))
  {
    v13 = 0;
    v12 = v66;
    v20 = v73;
    goto LABEL_105;
  }
  v52 = 1;
LABEL_84:
  sectionID = self->_sectionID;
  v51 = sectionID;
  if (!sectionID)
  {
    objc_msgSend(v8, "sectionID");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v45 = 0;
      v48 = 0;
      goto LABEL_91;
    }
    v45 = (void *)v39;
    sectionID = self->_sectionID;
  }
  objc_msgSend(v8, "sectionID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](sectionID, "isEqual:"))
  {
    v13 = 0;
    v12 = v66;
    v20 = v73;
    goto LABEL_102;
  }
  v48 = 1;
LABEL_91:
  contactIDs = self->_contactIDs;
  v47 = contactIDs;
  if (!contactIDs)
  {
    objc_msgSend(v8, "contactIDs");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      v44 = 0;
      v42 = 0;
LABEL_98:
      v12 = v66;
      isGroupMessage = self->_isGroupMessage;
      v13 = isGroupMessage == objc_msgSend(v8, "isGroupMessage");
      if (!v42)
        goto LABEL_100;
      goto LABEL_99;
    }
    v44 = (void *)v41;
    contactIDs = self->_contactIDs;
  }
  objc_msgSend(v8, "contactIDs");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSArray isEqual:](contactIDs, "isEqual:") & 1) != 0)
  {
    v42 = 1;
    goto LABEL_98;
  }
  v13 = 0;
  v12 = v66;
LABEL_99:

LABEL_100:
  v20 = v73;
  if (v47)
  {
    if (!v48)
      goto LABEL_103;
    goto LABEL_102;
  }

  if ((v48 & 1) != 0)
LABEL_102:

LABEL_103:
  if (v51)
  {
    if (!v52)
      goto LABEL_106;
    goto LABEL_105;
  }

  if ((v52 & 1) != 0)
LABEL_105:

LABEL_106:
  if (v55)
  {
    if (!v56)
      goto LABEL_109;
    goto LABEL_108;
  }

  if ((v56 & 1) != 0)
LABEL_108:

LABEL_109:
  if (v59)
  {
    if (!v60)
      goto LABEL_112;
    goto LABEL_111;
  }

  if ((v60 & 1) != 0)
LABEL_111:

LABEL_112:
  if (v63)
  {
    if (!v64)
      goto LABEL_115;
    goto LABEL_114;
  }

  if ((v64 & 1) != 0)
LABEL_114:

LABEL_115:
  if (!title)
  {

LABEL_40:
    if ((v69 & 1) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (v69)
LABEL_41:

LABEL_42:
  if (!v71)
  {

    if ((v72 & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  if (v72)
LABEL_44:

LABEL_45:
  if (!v75)
  {

    if ((v76 & 1) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  if (v76)
LABEL_47:

LABEL_48:
  if (!bundleID)
  {

    if ((v12 & 1) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
  if (v12)
LABEL_50:

LABEL_51:
  if (!uniqueID)

LABEL_54:
  return v13;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)usageType
{
  return self->_usageType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)badge
{
  return self->_badge;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBNotificationEvent proto", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNotificationEvent: unable to convert BMNotificationEventUsageType enum value: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

@end
