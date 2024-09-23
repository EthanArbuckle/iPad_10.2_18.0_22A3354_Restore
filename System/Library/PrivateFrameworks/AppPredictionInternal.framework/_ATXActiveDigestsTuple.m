@implementation _ATXActiveDigestsTuple

- (_ATXActiveDigestsTuple)init
{
  return -[_ATXActiveDigestsTuple initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:](self, "initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:", 0, 0, 0);
}

- (_ATXActiveDigestsTuple)initWithActiveUpcomingDigest:(id)a3 activeScheduledDigest:(id)a4 justCompletedDigest:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ATXActiveDigestsTuple *v12;
  _ATXActiveDigestsTuple *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ATXActiveDigestsTuple;
  v12 = -[_ATXActiveDigestsTuple init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeUpcomingDigest, a3);
    objc_storeStrong((id *)&v13->_activeScheduledDigest, a4);
    objc_storeStrong((id *)&v13->_justCompletedDigest, a5);
  }

  return v13;
}

- (_ATXActiveDigestsTuple)initWithPreviousTuple:(id)a3 nextDigestEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _ATXActiveDigestsTuple *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _ATXActiveDigestsTuple *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  int v68;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v7, "eventType"))
  {
    case 0:
      objc_msgSend(v6, "activeUpcomingDigest");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v6, "activeUpcomingDigest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "notificationDigest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "doesDigestShareContentWithOtherDigest:", v13);

        if (v14)
        {
          objc_msgSend(v7, "notificationDigest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "activeUpcomingDigest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "digestTimeline");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDigestTimeline:", v17);

          objc_msgSend(v15, "digestTimeline");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setFirstScheduledViewTimestamp:", v9);

          objc_msgSend(v6, "activeScheduledDigest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "digestTimeline");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setDigestRemovedTimestamp:", v9);

          v21 = self;
          v22 = 0;
          v23 = v15;
          v24 = v19;
          goto LABEL_20;
        }
      }
      objc_msgSend(v6, "activeScheduledDigest");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        objc_msgSend(v6, "activeScheduledDigest");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "notificationDigest");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "doesDigestShareContentWithOtherDigest:", v50);

        if (v51)
        {
          objc_msgSend(v7, "notificationDigest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "activeScheduledDigest");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "digestTimeline");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDigestTimeline:", v52);

          goto LABEL_24;
        }
      }
      objc_msgSend(v7, "notificationDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_opt_new();
      objc_msgSend(v15, "setDigestTimeline:", v61);

      objc_msgSend(v15, "digestTimeline");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setFirstScheduledViewTimestamp:", v9);

      objc_msgSend(v6, "activeScheduledDigest");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v63;
      if (v63)
      {
        objc_msgSend(v63, "digestTimeline");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setDigestRemovedTimestamp:", v9);

      }
      objc_msgSend(v6, "activeUpcomingDigest");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = self;
      v59 = v57;
      v60 = v15;
      goto LABEL_31;
    case 1:
      objc_msgSend(v6, "activeUpcomingDigest");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        objc_msgSend(v6, "activeUpcomingDigest");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "digestTimeline");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstCollapsedViewTimestamp");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          objc_msgSend(v6, "activeUpcomingDigest");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "notificationDigest");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v66, "doesDigestShareContentWithOtherDigest:", v67);

          if (v68)
          {
            objc_msgSend(v7, "notificationDigest");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "digestTimeline");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setFirstCollapsedViewTimestamp:", v9);
LABEL_36:

LABEL_18:
            objc_msgSend(v6, "activeScheduledDigest");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = self;
            v22 = v15;
            v23 = v19;
            goto LABEL_19;
          }
LABEL_17:
          objc_msgSend(v6, "activeUpcomingDigest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      objc_msgSend(v6, "activeScheduledDigest");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_17;
      v31 = (void *)v30;
      objc_msgSend(v6, "activeScheduledDigest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "digestTimeline");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstCollapsedViewTimestamp");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        goto LABEL_17;
      objc_msgSend(v6, "activeScheduledDigest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "notificationDigest");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "doesDigestShareContentWithOtherDigest:", v36);

      if (!v37)
        goto LABEL_17;
      objc_msgSend(v7, "notificationDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "digestTimeline");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFirstCollapsedViewTimestamp:", v9);
LABEL_24:

      objc_msgSend(v6, "activeUpcomingDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = v19;
      v23 = v15;
LABEL_19:
      v24 = 0;
LABEL_20:
      self = -[_ATXActiveDigestsTuple initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:](v21, "initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:", v22, v23, v24);
LABEL_32:

LABEL_33:
      return self;
    case 2:
      objc_msgSend(v6, "activeUpcomingDigest");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        objc_msgSend(v6, "activeUpcomingDigest");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "notificationDigest");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "doesDigestShareContentWithOtherDigest:", v42);

        if ((v43 & 1) != 0)
        {
          objc_msgSend(v7, "notificationDigest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "activeUpcomingDigest");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "digestTimeline");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDigestTimeline:", v45);

          goto LABEL_36;
        }
      }
      objc_msgSend(v7, "notificationDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_opt_new();
      objc_msgSend(v15, "setDigestTimeline:", v53);

      objc_msgSend(v15, "digestTimeline");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setFirstUpcomingViewTimestamp:", v9);

      objc_msgSend(v6, "activeUpcomingDigest");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v55;
      if (v55)
      {
        objc_msgSend(v55, "digestTimeline");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setDigestRemovedTimestamp:", v9);

      }
      objc_msgSend(v6, "activeScheduledDigest");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = self;
      v59 = v15;
      v60 = v57;
LABEL_31:
      self = -[_ATXActiveDigestsTuple initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:](v58, "initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:", v59, v60, v19);

      goto LABEL_32;
    case 3:
      __atxlog_handle_notification_management();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[_ATXActiveDigestsTuple initWithPreviousTuple:nextDigestEvent:].cold.1(v46);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Received ATXUserNotificationDigestEventTypeTotal in digest Biome stream."));
      goto LABEL_17;
    default:
      goto LABEL_33;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_ATXActiveDigestsTuple activeUpcomingDigest](self, "activeUpcomingDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForActiveUpcomingDigest"));

  -[_ATXActiveDigestsTuple activeScheduledDigest](self, "activeScheduledDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForActiveScheduledDigest"));

  -[_ATXActiveDigestsTuple justCompletedDigest](self, "justCompletedDigest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForJustCompletedDigest"));

}

- (_ATXActiveDigestsTuple)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _ATXActiveDigestsTuple *v17;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForActiveUpcomingDigest"), v5, 0, CFSTR("com.apple.ATXCompletedDigestBiomeStream"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  __atxlog_handle_notification_management();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("codingKeyForActiveScheduledDigest"), v5, 0, CFSTR("com.apple.ATXCompletedDigestBiomeStream"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  __atxlog_handle_notification_management();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("codingKeyForJustCompletedDigest"), v5, 0, CFSTR("com.apple.ATXCompletedDigestBiomeStream"), -1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_ATXActiveDigestsTuple initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:](self, "initWithActiveUpcomingDigest:activeScheduledDigest:justCompletedDigest:", v8, v12, v16);
  return v17;
}

- (ATXUserNotificationDigest)activeUpcomingDigest
{
  return self->_activeUpcomingDigest;
}

- (ATXUserNotificationDigest)activeScheduledDigest
{
  return self->_activeScheduledDigest;
}

- (ATXUserNotificationDigest)justCompletedDigest
{
  return self->_justCompletedDigest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justCompletedDigest, 0);
  objc_storeStrong((id *)&self->_activeScheduledDigest, 0);
  objc_storeStrong((id *)&self->_activeUpcomingDigest, 0);
}

- (void)initWithPreviousTuple:(os_log_t)log nextDigestEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Received ATXUserNotificationDigestEventTypeTotal in digest Biome stream.", v1, 2u);
}

@end
