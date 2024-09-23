@implementation ATXUserNotificationDigestNotificationGroup

+ (id)groupsFromNotifications:(id)a3 modeId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "groupId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__ATXUserNotificationDigestNotificationGroup_groupsFromNotifications_modeId___block_invoke;
  v22[3] = &unk_1E4D58080;
  v23 = v6;
  v19 = v6;
  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

ATXUserNotificationDigestNotificationGroup *__77__ATXUserNotificationDigestNotificationGroup_groupsFromNotifications_modeId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ATXUserNotificationDigestNotificationGroup *v4;

  v3 = a2;
  v4 = -[ATXUserNotificationDigestNotificationGroup initWithNotifications:modeId:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithNotifications:modeId:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3
{
  return -[ATXUserNotificationDigestNotificationGroup initWithNotifications:useDigestOrder:](self, "initWithNotifications:useDigestOrder:", a3, 0);
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 useDigestOrder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ATXUserNotificationDigestNotificationGroup *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *rankedNotifications;
  void *v30;
  ATXUserNotificationDigestNotificationGroup *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSString *groupId;
  uint64_t v41;
  NSString *title;
  uint64_t v43;
  NSString *groupDescription;
  uint64_t v45;
  NSUUID *representativeNotificationUUID;
  uint64_t v48;
  uint64_t v49;
  id (*v50)(uint64_t, void *);
  void *v51;
  ATXUserNotificationDigestNotificationGroup *v52;
  _QWORD v53[4];
  NSArray *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  NSArray *v64;
  _BYTE v65[128];
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  v7 = -[ATXUserNotificationDigestNotificationGroup init](&v59, sel_init);
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && objc_msgSend(v6, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    if (v4
      && (objc_msgSend(v6, "firstObject"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isMessage"),
          v10,
          (v11 & 1) == 0))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v56 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            if (objc_msgSend(v20, "hasPreviewableAttachment"))
            {
              if (!v17
                || (objc_msgSend(v17, "appSpecifiedScore"), v22 = v21, objc_msgSend(v20, "appSpecifiedScore"), v22 < v23))
              {
                v24 = v20;

                v17 = v24;
              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }

      v53[0] = v9;
      v53[1] = 3221225472;
      v53[2] = __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke;
      v53[3] = &unk_1E4D5D010;
      v13 = v17;
      v54 = v13;
      objc_msgSend(v14, "_pas_filteredArrayWithTest:", v53);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_93);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v64 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0C9AA60];
      }
      objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v26);
      v28 = objc_claimAutoreleasedReturnValue();
      rankedNotifications = v7->_rankedNotifications;
      v7->_rankedNotifications = (NSArray *)v28;

    }
    else
    {
      objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_11_3);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v7->_rankedNotifications;
      v7->_rankedNotifications = (NSArray *)v12;
    }

    v30 = (void *)MEMORY[0x1E0C99E60];
    v48 = v9;
    v49 = 3221225472;
    v50 = __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_4;
    v51 = &unk_1E4D5D058;
    v31 = v7;
    v52 = v31;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &v48);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v32, v48, v49, v50, v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count") != 1)
    {
      __atxlog_handle_notification_management();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 138412546;
        v61 = v36;
        v62 = 2048;
        v63 = v37;
        _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_INFO, "[%@] Expected 1 bundleId in notification stack, but found %lu. Proceeding with first bundleId.", buf, 0x16u);

      }
    }
    -[NSArray objectAtIndexedSubscript:](v31->_rankedNotifications, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "groupId");
    v39 = objc_claimAutoreleasedReturnValue();
    groupId = v31->_groupId;
    v31->_groupId = (NSString *)v39;

    objc_msgSend(v38, "title");
    v41 = objc_claimAutoreleasedReturnValue();
    title = v31->_title;
    v31->_title = (NSString *)v41;

    objc_msgSend(v38, "subtitle");
    v43 = objc_claimAutoreleasedReturnValue();
    groupDescription = v31->_groupDescription;
    v31->_groupDescription = (NSString *)v43;

    objc_msgSend(v38, "uuid");
    v45 = objc_claimAutoreleasedReturnValue();
    representativeNotificationUUID = v31->_representativeNotificationUUID;
    v31->_representativeNotificationUUID = (NSUUID *)v45;

  }
  return v7;
}

BOOL __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

uint64_t __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compareForDigestRanking:", a2);
}

uint64_t __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

id __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    __atxlog_handle_notification_management();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "[%@] Found nil bundleId in notification stack", (uint8_t *)&v9, 0xCu);

    }
  }
  objc_msgSend(v2, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6;
  id v7;
  ATXUserNotificationDigestNotificationGroup *v8;
  BOOL v9;
  uint64_t v10;
  NSArray *rankedNotifications;
  void *v12;
  uint64_t v13;
  NSString *groupId;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *groupDescription;
  double v19;
  uint64_t v20;
  NSUUID *representativeNotificationUUID;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  v8 = -[ATXUserNotificationDigestNotificationGroup init](&v23, sel_init);
  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_15_1);
    v10 = objc_claimAutoreleasedReturnValue();
    rankedNotifications = v8->_rankedNotifications;
    v8->_rankedNotifications = (NSArray *)v10;

    -[NSArray objectAtIndexedSubscript:](v8->_rankedNotifications, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupId");
    v13 = objc_claimAutoreleasedReturnValue();
    groupId = v8->_groupId;
    v8->_groupId = (NSString *)v13;

    objc_msgSend(v12, "title");
    v15 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v15;

    objc_msgSend(v12, "subtitle");
    v17 = objc_claimAutoreleasedReturnValue();
    groupDescription = v8->_groupDescription;
    v8->_groupDescription = (NSString *)v17;

    objc_msgSend(v12, "finalDigestScoreForMode:", v7);
    v8->_priority = v19;
    objc_msgSend(v12, "uuid");
    v20 = objc_claimAutoreleasedReturnValue();
    representativeNotificationUUID = v8->_representativeNotificationUUID;
    v8->_representativeNotificationUUID = (NSUUID *)v20;

  }
  return v8;
}

uint64_t __75__ATXUserNotificationDigestNotificationGroup_initWithNotifications_modeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compareForDigestRanking:", a2);
}

- (NSString)bundleId
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_rankedNotifications, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)appSpecifiedScore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[ATXUserNotificationDigestNotificationGroup rankedNotifications](self, "rankedNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXUserNotificationDigestNotificationGroup rankedNotifications](self, "rankedNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appSpecifiedScore");
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (BOOL)isCommunicationGroup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[ATXUserNotificationDigestNotificationGroup rankedNotifications](self, "rankedNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[ATXUserNotificationDigestNotificationGroup rankedNotifications](self, "rankedNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMessage");

  return v7;
}

- (BOOL)hasPreviewableAttachment
{
  void *v2;
  void *v3;
  char v4;

  -[ATXUserNotificationDigestNotificationGroup rankedNotifications](self, "rankedNotifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPreviewableAttachment");

  return v4;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationDigestNotificationGroup *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationDigestNotificationGroup initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationDigestNotificationGroup proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationDigestNotificationGroup)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationDigestNotificationGroup *v5;
  ATXUserNotificationDigestNotificationGroup *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationDigestNotificationGroup initWithData:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initWithData:", v4);

    self = -[ATXUserNotificationDigestNotificationGroup initWithProto:](self, "initWithProto:", v5);
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

  -[ATXUserNotificationDigestNotificationGroup proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)groupsFromProtos:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ATXUserNotificationDigestNotificationGroup_groupsFromProtos___block_invoke;
  v4[3] = &__block_descriptor_40_e63___ATXUserNotificationDigestNotificationGroup_16__0__PBCodable_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __63__ATXUserNotificationDigestNotificationGroup_groupsFromProtos___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = *(objc_class **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithProto:", v3);

  return v4;
}

+ (id)protosFromGroups:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_19_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

uint64_t __63__ATXUserNotificationDigestNotificationGroup_protosFromGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (ATXUserNotificationDigestNotificationGroup)initWithProto:(id)a3
{
  id v4;
  ATXUserNotificationDigestNotificationGroup *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *rankedNotifications;
  uint64_t v10;
  NSString *groupId;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *groupDescription;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSUUID *representativeNotificationUUID;
  void *v21;
  void *v22;
  char isKindOfClass;
  ATXSharedDigestEngagementTrackingMetrics *v24;
  NSObject *v25;
  ATXSharedDigestEngagementTrackingMetrics *v26;
  NSObject *v27;
  ATXUserNotificationDigestNotificationGroup *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  v5 = -[ATXUserNotificationDigestNotificationGroup init](&v30, sel_init);
  if (!v5)
  {
LABEL_15:
    v28 = v5;
    goto LABEL_16;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "rankedNotifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_21_0);
      v8 = objc_claimAutoreleasedReturnValue();
      rankedNotifications = v5->_rankedNotifications;
      v5->_rankedNotifications = (NSArray *)v8;

      objc_msgSend(v6, "groupId");
      v10 = objc_claimAutoreleasedReturnValue();
      groupId = v5->_groupId;
      v5->_groupId = (NSString *)v10;

      objc_msgSend(v6, "title");
      v12 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v12;

      objc_msgSend(v6, "groupDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      groupDescription = v5->_groupDescription;
      v5->_groupDescription = (NSString *)v14;

      objc_msgSend(v6, "priority");
      v5->_priority = v16;
      v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "representativeNotificationUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "initWithUUIDString:", v18);
      representativeNotificationUUID = v5->_representativeNotificationUUID;
      v5->_representativeNotificationUUID = (NSUUID *)v19;

      objc_msgSend(v6, "sharedEngagementTracker");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v6, "sharedEngagementTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v24 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          objc_msgSend(v6, "sharedEngagementTracker");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](v24, "initWithProto:", v25);
          -[ATXUserNotificationDigestNotificationGroup setDigestEngagementTrackingMetrics:](v5, "setDigestEngagementTrackingMetrics:", v26);

        }
        else
        {
          __atxlog_handle_notification_management();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            -[ATXUserNotificationLoggingEvent initWithProto:].cold.1();
        }

      }
      goto LABEL_15;
    }
    __atxlog_handle_notification_management();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[ATXUserNotificationLoggingEvent initWithProto:].cold.1();

  }
  v28 = 0;
LABEL_16:

  return v28;
}

ATXUserNotification *__60__ATXUserNotificationDigestNotificationGroup_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotification *v3;

  v2 = a2;
  v3 = -[ATXUserNotification initWithProto:]([ATXUserNotification alloc], "initWithProto:", v2);

  return v3;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setGroupId:", self->_groupId);
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setGroupDescription:", self->_groupDescription);
  objc_msgSend(v3, "setPriority:", self->_priority);
  -[NSUUID UUIDString](self->_representativeNotificationUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRepresentativeNotificationUUID:", v4);

  -[ATXUserNotificationDigestNotificationGroup digestEngagementTrackingMetrics](self, "digestEngagementTrackingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedEngagementTracker:", v6);

  -[NSArray _pas_mappedArrayWithTransform:](self->_rankedNotifications, "_pas_mappedArrayWithTransform:", &__block_literal_global_27_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRankedNotifications:", v8);

  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v3, "rankedNotifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v7);

  }
  return v3;
}

uint64_t __51__ATXUserNotificationDigestNotificationGroup_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
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
  -[ATXUserNotificationDigestNotificationGroup encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationDigestNotificationGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationDigestNotificationGroup *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationDigestNotificationGroup initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void)setGroupDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (NSUUID)representativeNotificationUUID
{
  return self->_representativeNotificationUUID;
}

- (void)setRepresentativeNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_representativeNotificationUUID, a3);
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, a3);
}

- (NSArray)rankedNotifications
{
  return self->_rankedNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedNotifications, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_representativeNotificationUUID, 0);
  objc_storeStrong((id *)&self->_groupDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end
