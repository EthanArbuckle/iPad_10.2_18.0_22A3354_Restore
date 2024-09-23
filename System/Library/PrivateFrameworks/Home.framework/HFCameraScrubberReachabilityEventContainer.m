@implementation HFCameraScrubberReachabilityEventContainer

- (HFCameraScrubberReachabilityEventContainer)initWithStartEvent:(id)a3 endEvent:(id)a4
{
  id v8;
  id v9;
  HFCameraScrubberReachabilityEventContainer *v10;
  HFCameraScrubberReachabilityEventContainer *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraScrubberReachabilityEventContainer.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startEvent"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HFCameraScrubberReachabilityEventContainer;
  v10 = -[HFCameraScrubberReachabilityEventContainer init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_startEvent, a3);
    objc_storeStrong((id *)&v11->_endEvent, a4);
  }

  return v11;
}

- (unint64_t)containerType
{
  return 2;
}

- (NSDate)dateOfOccurrence
{
  void *v2;
  void *v3;

  -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSUUID)uniqueIdentifier
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

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSUUID *)v11;
}

- (NSSet)eventUniqueIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObject:", v8);

  return (NSSet *)v6;
}

- (double)hf_duration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double result;

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 4.0;
  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  result = 4.0;
  if (v9 >= 0.0)
    return v9;
  return result;
}

- (BOOL)hf_isPlayable
{
  return 0;
}

- (BOOL)hf_hasInsufficientAnalysis
{
  return 0;
}

- (id)hf_endDate
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateOfOccurrence");
  }
  else
  {
    -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraScrubberReachabilityEventContainer hf_duration](self, "hf_duration");
    objc_msgSend(v4, "dateByAddingTimeInterval:");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_dateInterval
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraScrubberReachabilityEventContainer hf_duration](self, "hf_duration");
  v5 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v4);

  return v5;
}

- (BOOL)isComplete
{
  void *v2;
  BOOL v3;

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)targetFragmentDuration
{
  return 4.0;
}

- (id)encryptionKey
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (id)videoAssetRequiredHTTPHeaders
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)canAskForUserFeedback
{
  return 0;
}

- (NSString)description
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraScrubberReachabilityEventContainer duration](self, "duration");
  objc_msgSend(v8, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ – %@ %@"), v5, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v12, CFSTR("dateRange"));

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraScrubberReachabilityEventContainer duration](self, "duration");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ + %f = %@"), v14, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:withName:", v16, CFSTR("dateInterval"));
  -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hf_prettyDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("startEvent"));

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hf_prettyDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:withName:", v21, CFSTR("endEvent"));

  objc_msgSend(v3, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (NSString)displayDescription
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
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  -[HFCameraScrubberReachabilityEventContainer dateOfOccurrence](self, "dateOfOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities attributedShortTimeStringFromDate:](HFCameraUtilities, "attributedShortTimeStringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateOfOccurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraUtilities attributedShortTimeStringFromDate:](HFCameraUtilities, "attributedShortTimeStringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateOfOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = +[HFCameraUtilities isDateToday:](HFCameraUtilities, "isDateToday:", v13);

    -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateOfOccurrence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[HFCameraUtilities isDateToday:](HFCameraUtilities, "isDateToday:", v15);

    -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateOfOccurrence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateOfOccurrence");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v20);
    v22 = v21;

    if ((_DWORD)v8)
    {
      if (v22 >= 60.0)
        v29 = CFSTR("HFCameraReachabilityOfflineDurationTodayFormat");
      else
        v29 = CFSTR("HFCameraReachabilityOfflineAtTodayFormat");
      HFLocalizedStringWithFormat(v29, CFSTR("%@%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v16)
    {
      -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dateOfOccurrence");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCameraUtilities localizerKeyDayNameFromDate:](HFCameraUtilities, "localizerKeyDayNameFromDate:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraReachabilityOfflineDurationIncludesToday%@Format"), v42);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dateOfOccurrence");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "dateOfOccurrence");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v52, "isDate:inSameDayAsDate:", v54, v56);

      if (!v57)
      {
        -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "dateOfOccurrence");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFCameraUtilities localizerKeyDayNameFromDate:](HFCameraUtilities, "localizerKeyDayNameFromDate:", v83);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "dateOfOccurrence");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFCameraUtilities localizerKeyDayNameFromDate:](HFCameraUtilities, "localizerKeyDayNameFromDate:", v85);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraReachabilityOfflineDurationMultiDay%@%@Format"), v42, v67);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(v86, CFSTR("%@%@"), v87, v88, v89, v90, v91, v92, (uint64_t)v5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      -[HFCameraScrubberReachabilityEventContainer endEvent](self, "endEvent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "dateOfOccurrence");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCameraUtilities localizerKeyDayNameFromDate:](HFCameraUtilities, "localizerKeyDayNameFromDate:", v59);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "dateOfOccurrence");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v60, "component:fromDate:", 32, v62);

      v64 = CFSTR("HFCameraReachabilityOfflineAtSameDay%@Format");
      v65 = CFSTR("HFCameraReachabilityOfflineDurationSameDay%@Format");
      if (v63 == 1)
      {
        v64 = CFSTR("HFCameraReachabilityOfflineAtSameDay%@SingularFormat");
        v65 = CFSTR("HFCameraReachabilityOfflineDurationSameDay%@SingularFormat");
      }
      if (v22 >= 60.0)
        v66 = v65;
      else
        v66 = v64;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v66, v42);
    }
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedStringWithFormat(v67, CFSTR("%@%@"), v68, v69, v70, v71, v72, v73, (uint64_t)v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dateOfOccurrence");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = +[HFCameraUtilities isDateToday:](HFCameraUtilities, "isDateToday:", v32);

  if (v33)
  {
    HFLocalizedStringWithFormat(CFSTR("HFCameraReachabilityOfflineCurrentlyTodayFormat"), CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v5);
  }
  else
  {
    -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dateOfOccurrence");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = +[HFCameraUtilities isDateYesterday:](HFCameraUtilities, "isDateYesterday:", v44);

    if (!v45)
    {
      -[HFCameraScrubberReachabilityEventContainer startEvent](self, "startEvent");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "dateOfOccurrence");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCameraUtilities localizerKeyDayNameFromDate:](HFCameraUtilities, "localizerKeyDayNameFromDate:", v75);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraReachabilityOfflineCurrently%@Format"), v11);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedStringWithFormat(v42, CFSTR("%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    HFLocalizedStringWithFormat(CFSTR("HFCameraReachabilityOfflineCurrentlyYesterdayFormat"), CFSTR("%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v5);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return (NSString *)v30;
}

- (HFCameraRecordingEvent)startEvent
{
  return self->_startEvent;
}

- (HFCameraRecordingEvent)endEvent
{
  return self->_endEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

@end
