@implementation ATXNotificationDigestFeedbackLogger

- (ATXNotificationDigestFeedbackLogger)init
{
  void *v3;
  ATXNotificationDigestFeedbackLogger *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXNotificationDigestFeedbackLogger initWithDigestFeedback:](self, "initWithDigestFeedback:", v3);

  return v4;
}

- (ATXNotificationDigestFeedbackLogger)initWithDigestFeedback:(id)a3
{
  id v5;
  ATXNotificationDigestFeedbackLogger *v6;
  ATXNotificationDigestFeedbackLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationDigestFeedbackLogger;
  v6 = -[ATXNotificationDigestFeedbackLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digestFeedback, a3);

  return v7;
}

- (void)logFeedbackForAnnotatedDigest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v4, "highlightedGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  v47 = v5;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v55;
    *(_QWORD *)&v8 = 138412802;
    v43 = v8;
    v45 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      v48 = v9;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v6);
        -[ATXNotificationDigestFeedbackLogger _getBundleIdAndEngagementsForDigestGroup:onDigest:](self, "_getBundleIdAndEngagementsForDigestGroup:onDigest:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v11), v4, v43);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "first");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "containsObject:", v14))
          {
            __atxlog_handle_notification_management();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v17 = v6;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "UUIDString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v43;
              v60 = v18;
              v61 = 2112;
              v62 = v14;
              v63 = 2112;
              v64 = v20;
              _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "[%@] Found unexpected duplicate bundle ID %@ in marquee spots for digest %@", buf, 0x20u);

              v9 = v48;
              v5 = v47;

              v6 = v17;
              v10 = v45;
            }
          }
          else
          {
            objc_msgSend(v13, "second");
            v15 = objc_claimAutoreleasedReturnValue();
            -[ATXNotificationDigestFeedbackProtocol logMarqueeAppearanceForBundleId:](self->_digestFeedback, "logMarqueeAppearanceForBundleId:", v14);
            v21 = -[NSObject numEngagementsInUpcoming](v15, "numEngagementsInUpcoming");
            v22 = -[NSObject numEngagementsInScheduled](v15, "numEngagementsInScheduled") + v21;
            if (v22 + -[NSObject numEngagementsAfterExpiration](v15, "numEngagementsAfterExpiration"))
              -[ATXNotificationDigestFeedbackProtocol logMarqueeEngagementForBundleId:](self->_digestFeedback, "logMarqueeEngagementForBundleId:", v14);
            objc_msgSend(v5, "addObject:", v14);
            v9 = v48;
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v9);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "messageGroups");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedGroups");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v25;
  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v51;
    *(_QWORD *)&v28 = 138412802;
    v44 = v28;
    v46 = *(_QWORD *)v51;
    do
    {
      v31 = 0;
      v49 = v29;
      do
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v26);
        -[ATXNotificationDigestFeedbackLogger _getBundleIdAndEngagementsForDigestGroup:onDigest:](self, "_getBundleIdAndEngagementsForDigestGroup:onDigest:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v31), v4, v44);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "first");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "containsObject:", v34))
          {
            __atxlog_handle_notification_management();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = (objc_class *)objc_opt_class();
              NSStringFromClass(v36);
              v37 = v26;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "uuid");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "UUIDString");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v44;
              v60 = v38;
              v61 = 2112;
              v62 = v34;
              v63 = 2112;
              v64 = v40;
              _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_INFO, "[%@] Skipping duplicate bundle ID %@ in digest %@", buf, 0x20u);

              v29 = v49;
              v5 = v47;

              v26 = v37;
              v30 = v46;
            }
          }
          else
          {
            objc_msgSend(v33, "second");
            v35 = objc_claimAutoreleasedReturnValue();
            -[ATXNotificationDigestFeedbackProtocol logNonMarqueeAppearanceForBundleId:](self->_digestFeedback, "logNonMarqueeAppearanceForBundleId:", v34);
            v41 = -[NSObject numEngagementsInUpcoming](v35, "numEngagementsInUpcoming");
            v42 = -[NSObject numEngagementsInScheduled](v35, "numEngagementsInScheduled") + v41;
            if (v42 + -[NSObject numEngagementsAfterExpiration](v35, "numEngagementsAfterExpiration"))
              -[ATXNotificationDigestFeedbackProtocol logNonMarqueeEngagementForBundleId:](self->_digestFeedback, "logNonMarqueeEngagementForBundleId:", v34);
            objc_msgSend(v5, "addObject:", v34);
            v29 = v49;
          }

        }
        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v29);
  }

}

- (id)_getBundleIdAndEngagementsForDigestGroup:(id)a3 onDigest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  objc_class *v16;
  void *v17;
  int v18;
  NSObject *v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v9 = 0;
      goto LABEL_9;
    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupId");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject UUIDString](v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v14;
    _os_log_error_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_ERROR, "[%@] Could not get bundle ID for digest group with group ID %@ on digest %@", (uint8_t *)&v18, 0x20u);
    goto LABEL_11;
  }
  objc_msgSend(v5, "digestEngagementTrackingMetrics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupId");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_ERROR, "[%@] Could not get engagement metrics for digest group with group ID %@ on digest %@", (uint8_t *)&v18, 0x20u);

LABEL_11:
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end
