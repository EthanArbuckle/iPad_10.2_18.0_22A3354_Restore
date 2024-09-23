@implementation ATXNotificationEventMetric

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.Notification.event");
}

- (ATXNotificationEventMetric)initWithQueryResult:(id)a3
{
  id v5;
  ATXNotificationEventMetric *v6;
  ATXNotificationEventMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationEventMetric;
  v6 = -[_ATXCoreAnalyticsMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queryResult, a3);

  return v7;
}

- (id)coreAnalyticsDictionary
{
  return -[ATXNotificationEventMetric coreAnalyticsDictionaryFromQueryResult:](self, "coreAnalyticsDictionaryFromQueryResult:", self->_queryResult);
}

+ (id)atxComputedModeStringForTimestamp:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D80E48], "currrentModeEventAtGivenTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "atx_dndModeSemanticType");
    ATXModeForDNDSemanticType();
    ATXModeToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATXModeToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)coreAnalyticsDictionaryFromQueryResult:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[25];
  _QWORD v87[27];

  v87[25] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v86[0] = CFSTR("bundleId");
  objc_msgSend(v3, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v4;
  v87[0] = v4;
  v86[1] = CFSTR("destinationReason");
  objc_msgSend(v3, "destinationReason");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v82 = v7;
  v83 = v5;
  v52 = (void *)v6;
  v87[1] = v6;
  v86[2] = CFSTR("handleDestination");
  objc_msgSend(v3, "finalDestination");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v8;
  v87[2] = v8;
  v86[3] = CFSTR("handleMode");
  objc_msgSend(v3, "resolution");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "resolutionTimestamp");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v10;
  v87[3] = v10;
  v86[4] = CFSTR("isMessage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isMessage"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v77;
  v86[5] = CFSTR("notificationUrgency");
  objc_msgSend(v3, "urgency");
  ATXUserNotificationDeliveryUrgencyToString();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v12;
  v87[5] = v12;
  v86[6] = CFSTR("originalDestination");
  objc_msgSend(v3, "originalDestination");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v14;
  v87[6] = v14;
  v86[7] = CFSTR("deliveryMethod");
  objc_msgSend(v3, "deliveryMethod");
  ATXUserNotificationDeliveryMethodToString();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v16;
  v87[7] = v16;
  v86[8] = CFSTR("receiveDestination");
  objc_msgSend(v3, "deliveryMethod");
  ATXUserNotificationDeliveryMethodToString();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v18;
  v87[8] = v18;
  v86[9] = CFSTR("receiveMode");
  objc_msgSend(v3, "receiveTimestamp");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v20;
  v87[9] = v20;
  v86[10] = CFSTR("resolutionType");
  objc_msgSend(v3, "resolution");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  ATXUserNotificationResolutionTypeToString(objc_msgSend(v71, "resolutionType"));
  v22 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v22;
  v87[10] = v22;
  v86[11] = CFSTR("secureBundleId");
  objc_msgSend(v3, "bundleId");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  v23 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v23;
  v87[11] = v23;
  v86[12] = CFSTR("timeToResolution");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "resolution");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "resolutionTimestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receiveTimestamp");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v25;
  objc_msgSend(v25, "timeIntervalSinceDate:");
  objc_msgSend(v24, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v87[12] = v66;
  v86[13] = CFSTR("receiveInferredMode");
  v26 = (void *)MEMORY[0x1E0D80E50];
  objc_msgSend(v3, "receiveTimestamp");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentModeEventAtGivenTime:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "eventBody");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  ATXModeToString();
  v27 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v72 = v21;
  v74 = v19;
  v75 = v15;
  v76 = v13;
  v78 = v11;
  v81 = v9;
  v42 = (void *)v27;
  v87[13] = v27;
  v86[14] = CFSTR("handleInferredMode");
  v28 = (void *)MEMORY[0x1E0D80E50];
  objc_msgSend(v3, "resolution");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "resolutionTimestamp");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "currentModeEventAtGivenTime:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "eventBody");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  ATXModeToString();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v87[14] = v29;
  v86[15] = CFSTR("lengthOfNotificationBody");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "bodyLength", v29));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v87[15] = v57;
  v86[16] = CFSTR("bodyLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "bodyLength"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[16] = v56;
  v86[17] = CFSTR("titleLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "titleLength"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87[17] = v55;
  v86[18] = CFSTR("subtitleLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "subtitleLength"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v87[18] = v31;
  v86[19] = CFSTR("summaryTopLineLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "summaryLength"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v87[19] = v32;
  v86[20] = CFSTR("deliveredInPrioritySection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isDeliveredInPrioritySection"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v87[20] = v33;
  v86[21] = CFSTR("isSummarized");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isSummarized"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87[21] = v34;
  v86[22] = CFSTR("isPartOfStack");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isPartOfStack"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v87[22] = v35;
  v86[23] = CFSTR("isStackSummary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isStackSummary"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v87[23] = v36;
  v86[24] = CFSTR("isDeterminedUrgentByModel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isDeterminedUrgentByModel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[24] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 25);
  v54 = (id)objc_claimAutoreleasedReturnValue();

  if (!v30)
  if (!v62)

  v38 = v84;
  if (!v84)
  {

    v38 = 0;
  }

  v39 = v85;
  if (!v85)
  {

    v39 = 0;
  }

  if (!v72)
  if (!v74)

  if (!v17)
  if (!v75)

  if (!v76)
  if (!v78)

  if (!v81)
  if (!v82)

  if (!v83)
  return v54;
}

- (ATXNotificationTelemetryQueryResult)queryResult
{
  return self->_queryResult;
}

- (void)setQueryResult:(id)a3
{
  objc_storeStrong((id *)&self->_queryResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResult, 0);
}

@end
