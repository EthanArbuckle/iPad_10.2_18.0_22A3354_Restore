@implementation _ATXActiveMissedNotificationRankingTuple

- (_ATXActiveMissedNotificationRankingTuple)initWithActiveUpcomingRanking:(id)a3 activeDeliveredRanking:(id)a4 justCompletedRanking:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ATXActiveMissedNotificationRankingTuple *v12;
  _ATXActiveMissedNotificationRankingTuple *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ATXActiveMissedNotificationRankingTuple;
  v12 = -[_ATXActiveMissedNotificationRankingTuple init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeUpcomingRanking, a3);
    objc_storeStrong((id *)&v13->_activeDeliveredRanking, a4);
    objc_storeStrong((id *)&v13->_justCompletedRanking, a5);
  }

  return v13;
}

- (_ATXActiveMissedNotificationRankingTuple)initWithPreviousTuple:(id)a3 nextRankingEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _ATXActiveMissedNotificationRankingTuple *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  _ATXActiveMissedNotificationRankingTuple *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _ATXActiveMissedNotificationRankingTuple *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  int v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v7, "eventType"))
  {
    case 0:
    case 1:
      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "eventType");
        objc_msgSend(v7, "missedNotificationRanking");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 138412802;
        v74 = v12;
        v75 = 2048;
        v76 = v13;
        v77 = 2112;
        v78 = v16;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "%@ - Received unsupported deprecated event type %ld on ranking with UUID %@", (uint8_t *)&v73, 0x20u);

      }
      goto LABEL_17;
    case 2:
    case 4:
      objc_msgSend(v6, "activeUpcomingRanking");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        objc_msgSend(v7, "missedNotificationRanking");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_opt_new();
        objc_msgSend(v22, "setDigestTimeline:", v60);

        objc_msgSend(v22, "digestTimeline");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setFirstUpcomingViewTimestamp:", v9);
        goto LABEL_24;
      }
      objc_msgSend(v6, "activeUpcomingRanking");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "missedNotificationRanking");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "doesRankingShareContentWithOtherRanking:", v35);

      objc_msgSend(v7, "missedNotificationRanking");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        objc_msgSend(v6, "activeUpcomingRanking");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "digestTimeline");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDigestTimeline:", v38);

LABEL_24:
        goto LABEL_25;
      }
      v61 = (void *)objc_opt_new();
      objc_msgSend(v22, "setDigestTimeline:", v61);

      objc_msgSend(v22, "digestTimeline");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setFirstUpcomingViewTimestamp:", v9);

      objc_msgSend(v6, "activeUpcomingRanking");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "digestTimeline");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setFirstScheduledViewTimestamp:", v9);

      objc_msgSend(v6, "activeDeliveredRanking");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v64;
      if (v64)
      {
        objc_msgSend(v64, "digestTimeline");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setDigestRemovedTimestamp:", v9);

      }
      v56 = self;
      v57 = v22;
      v58 = v27;
      v59 = v55;
LABEL_30:
      v46 = -[_ATXActiveMissedNotificationRankingTuple initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:](v56, "initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:", v57, v58, v59);

      goto LABEL_36;
    case 3:
    case 5:
      objc_msgSend(v6, "activeUpcomingRanking");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v6, "activeUpcomingRanking");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "missedNotificationRanking");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "doesRankingShareContentWithOtherRanking:", v20);

        if (v21)
        {
          objc_msgSend(v7, "missedNotificationRanking");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "activeUpcomingRanking");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "digestTimeline");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDigestTimeline:", v24);

          objc_msgSend(v22, "digestTimeline");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFirstScheduledViewTimestamp:", v9);

          objc_msgSend(v6, "activeDeliveredRanking");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "digestTimeline");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setDigestRemovedTimestamp:", v9);

          }
          v29 = self;
          v30 = 0;
          v31 = v22;
          v32 = v27;
          goto LABEL_35;
        }
      }
      objc_msgSend(v6, "activeDeliveredRanking");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        objc_msgSend(v6, "activeDeliveredRanking");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "missedNotificationRanking");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "doesRankingShareContentWithOtherRanking:", v42);

        if (v43)
        {
          objc_msgSend(v7, "missedNotificationRanking");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "activeDeliveredRanking");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "digestTimeline");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDigestTimeline:", v45);

          objc_msgSend(v6, "activeUpcomingRanking");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = self;
          v30 = v27;
          v31 = v22;
          goto LABEL_26;
        }
      }
      objc_msgSend(v7, "missedNotificationRanking");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_opt_new();
      objc_msgSend(v22, "setDigestTimeline:", v51);

      objc_msgSend(v22, "digestTimeline");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFirstScheduledViewTimestamp:", v9);

      objc_msgSend(v6, "activeDeliveredRanking");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v53;
      if (v53)
      {
        objc_msgSend(v53, "digestTimeline");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setDigestRemovedTimestamp:", v9);

      }
      objc_msgSend(v6, "activeUpcomingRanking");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = self;
      v57 = v55;
      v58 = v22;
      v59 = v27;
      goto LABEL_30;
    case 6:
      objc_msgSend(v6, "activeUpcomingRanking");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "missedNotificationRanking");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "doesRankingShareContentWithOtherRanking:", v48);

      if (v49)
      {
        objc_msgSend(v6, "activeUpcomingRanking");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "digestTimeline");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setDigestRemovedTimestamp:", v9);

        objc_msgSend(v6, "activeDeliveredRanking");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = self;
        v30 = 0;
        v31 = v27;
LABEL_34:
        v32 = v22;
        goto LABEL_35;
      }
      objc_msgSend(v6, "activeDeliveredRanking");
      v66 = objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        v67 = (void *)v66;
        objc_msgSend(v6, "activeDeliveredRanking");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "missedNotificationRanking");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "doesRankingShareContentWithOtherRanking:", v69);

        if (v70)
        {
          objc_msgSend(v6, "activeDeliveredRanking");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "digestTimeline");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setDigestRemovedTimestamp:", v9);

          objc_msgSend(v6, "activeUpcomingRanking");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = self;
          v30 = v27;
          v31 = 0;
          goto LABEL_34;
        }
      }
      objc_msgSend(v6, "activeUpcomingRanking");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      objc_msgSend(v6, "activeDeliveredRanking");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self;
      v30 = v22;
      v31 = v27;
LABEL_26:
      v32 = 0;
LABEL_35:
      v46 = -[_ATXActiveMissedNotificationRankingTuple initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:](v29, "initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:", v30, v31, v32);
LABEL_36:

LABEL_37:
      return v46;
    default:
      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_ATXActiveMissedNotificationRankingTuple initWithPreviousTuple:nextRankingEvent:].cold.1((uint64_t)self, v7, v10);
LABEL_17:

      v46 = -[_ATXActiveMissedNotificationRankingTuple initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:](self, "initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:", 0, 0, 0);
      goto LABEL_37;
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
  -[_ATXActiveMissedNotificationRankingTuple activeUpcomingRanking](self, "activeUpcomingRanking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForActiveUpcomingMNR"));

  -[_ATXActiveMissedNotificationRankingTuple activeDeliveredRanking](self, "activeDeliveredRanking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForActiveDeliveredMNR"));

  -[_ATXActiveMissedNotificationRankingTuple justCompletedRanking](self, "justCompletedRanking");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForJustCompletedMNR"));

}

- (_ATXActiveMissedNotificationRankingTuple)initWithCoder:(id)a3
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
  _ATXActiveMissedNotificationRankingTuple *v17;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForActiveUpcomingMNR"), v5, 0, CFSTR("com.apple.ATXCompletedMNRBiomeStream"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  __atxlog_handle_notification_management();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("codingKeyForActiveDeliveredMNR"), v5, 0, CFSTR("com.apple.ATXCompletedMNRBiomeStream"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  __atxlog_handle_notification_management();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("codingKeyForJustCompletedMNR"), v5, 0, CFSTR("com.apple.ATXCompletedMNRBiomeStream"), -1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_ATXActiveMissedNotificationRankingTuple initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:](self, "initWithActiveUpcomingRanking:activeDeliveredRanking:justCompletedRanking:", v8, v12, v16);
  return v17;
}

- (ATXMissedNotificationRanking)activeUpcomingRanking
{
  return self->_activeUpcomingRanking;
}

- (ATXMissedNotificationRanking)activeDeliveredRanking
{
  return self->_activeDeliveredRanking;
}

- (ATXMissedNotificationRanking)justCompletedRanking
{
  return self->_justCompletedRanking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justCompletedRanking, 0);
  objc_storeStrong((id *)&self->_activeDeliveredRanking, 0);
  objc_storeStrong((id *)&self->_activeUpcomingRanking, 0);
}

- (void)initWithPreviousTuple:(NSObject *)a3 nextRankingEvent:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "eventType");
  objc_msgSend(a2, "missedNotificationRanking");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v6;
  v13 = 2048;
  v14 = v7;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - Received unknown event type %ld on ranking with UUID %@", (uint8_t *)&v11, 0x20u);

}

@end
