@implementation ARPAnalyticsEvent

- (ARPAnalyticsEvent)init
{
  ARPAnalyticsEvent *v2;
  ARPAnalyticsEvent *v3;
  NSString *prediction;
  NSString *predictionReason;
  NSString *suppressionReason;
  NSString *predictedDevice;
  NSString *actualDevice;
  NSString *correction;
  NSString *correctionTiming;
  NSString *failure;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ARPAnalyticsEvent;
  v2 = -[ARPAnalyticsEvent init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    prediction = v2->_prediction;
    v2->_prediction = (NSString *)CFSTR("none");

    predictionReason = v3->_predictionReason;
    v3->_predictionReason = (NSString *)CFSTR("none");

    suppressionReason = v3->_suppressionReason;
    v3->_suppressionReason = (NSString *)CFSTR("none");

    v3->_predictionCorrect = 0;
    predictedDevice = v3->_predictedDevice;
    v3->_predictedDevice = (NSString *)CFSTR("none");

    actualDevice = v3->_actualDevice;
    v3->_actualDevice = (NSString *)CFSTR("none");

    correction = v3->_correction;
    v3->_correction = (NSString *)CFSTR("none");

    correctionTiming = v3->_correctionTiming;
    v3->_correctionTiming = (NSString *)CFSTR("none");

    failure = v3->_failure;
    v3->_failure = (NSString *)CFSTR("none");

    v3->_numberOfMicrolocations = 0;
  }
  return v3;
}

+ (id)feedbackEventsFromAppUsageEvents:(id)a3 playingEvents:(id)a4 microLocationEvents:(id)a5 feedbackEvents:(id)a6
{
  id v9;
  id v10;
  ARPAnalyticsEvent *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  ARPAnalyticsEvent *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  unint64_t v56;
  BOOL v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  __CFString *v66;
  ARPAnalyticsEvent *v67;
  const __CFString *v68;
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
  char v79;
  void *v80;
  void *v82;
  id v83;
  id obj;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  ARPAnalyticsEvent *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  _QWORD v106[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v90 = a4;
  v10 = a5;
  v89 = a6;
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &UUID_NULL_0);
  v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(ARPAnalyticsEvent);
  -[ARPAnalyticsEvent analyticsDictionary](v11, "analyticsDictionary");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v9;
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
  if (v91)
  {
    v13 = MEMORY[0x1E0C809B0];
    v86 = *(_QWORD *)v108;
    v87 = v10;
    do
    {
      v14 = 0;
      v98 = v12;
      do
      {
        if (*(_QWORD *)v108 != v86)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v14);
        v16 = objc_alloc_init(ARPAnalyticsEvent);
        v106[0] = v13;
        v106[1] = 3221225472;
        v106[2] = __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke;
        v106[3] = &unk_1EA7D48B8;
        v96 = v15;
        v106[4] = v15;
        v17 = objc_msgSend(v90, "indexOfObjectPassingTest:", v106);
        v93 = v14;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v90, "objectAtIndexedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "metadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15AA0], "outputDeviceIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v94 = v21;
        ARPExtractLongFormVideoOutputDeviceIDs(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_alloc_init(MEMORY[0x1E0C99E60]);
        v95 = v22;
        if (v22 && objc_msgSend(v22, "count"))
        {
          if (objc_msgSend(v22, "count") != 1
            || (objc_msgSend(v22, "firstObject"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Speaker")),
                v23,
                v25 = CFSTR("local"),
                (v24 & 1) == 0))
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1EA7D7898);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", &unk_1EA7D78B0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            v25 = CFSTR("appletv");
            if (!v28)
            {
              objc_msgSend(v94, "objectForKeyedSubscript:", &unk_1EA7D7898);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1EA7D78C8);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "count");

              if (v31)
                v25 = CFSTR("tv");
              else
                v25 = CFSTR("other");
            }
          }
          v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v95);

          v99 = (id)v32;
        }
        else
        {
          v25 = CFSTR("none");
        }
        -[ARPAnalyticsEvent setActualDevice:](v16, "setActualDevice:", v25);
        v105[0] = v13;
        v105[1] = 3221225472;
        v105[2] = __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke_42;
        v105[3] = &unk_1EA7D48B8;
        v105[4] = v96;
        v33 = objc_msgSend(v10, "indexOfObjectPassingTest:", v105);
        if (v33 == 0x7FFFFFFFFFFFFFFFLL
          || (objc_msgSend(v10, "objectAtIndexedSubscript:", v33),
              (v34 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v92 = 0;
        }
        else
        {
          v92 = v34;
          objc_msgSend(v34, "metadata");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = objc_msgSend(v37, "count");
          objc_msgSend(v37, "objectForKeyedSubscript:", v82);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39 != 0;

          -[ARPAnalyticsEvent setNumberOfMicrolocations:](v16, "setNumberOfMicrolocations:", v38 - v40);
        }
        v41 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v18, "startDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (!v42)
        {
          objc_msgSend(v96, "endDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v85;
        }
        v97 = v18;
        objc_msgSend(v41, "predicateWithFormat:", CFSTR("%@ <= startDate && endDate <= %@"), v98, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "filteredArrayUsingPredicate:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        v100 = v16;

        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        if (!v47)
        {
          v49 = 0;
          v50 = 0;
          v51 = 0;
          v52 = 0;
          goto LABEL_54;
        }
        v48 = v47;
        v49 = 0;
        v50 = 0;
        v51 = 0;
        v52 = 0;
        v53 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v102 != v53)
              objc_enumerationMutation(v46);
            v55 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            v56 = objc_msgSend(v55, "integerValue");
            if (!v50 && v56 <= 1)
            {
              v49 = v56 == 1;
              v50 = v55;
LABEL_46:
              v59 = v52;
              goto LABEL_47;
            }
            if (v56 == 2 && v51 == 0)
            {
              v51 = v55;
              goto LABEL_46;
            }
            v58 = v56 == 3 && v52 == 0;
            v59 = v55;
            if (!v58)
            {
              if (!v50)
                continue;
              goto LABEL_48;
            }
LABEL_47:
            v60 = v55;
            v52 = v59;
            if (!v50)
              continue;
LABEL_48:
            if (v51 && v52)
              goto LABEL_54;
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        }
        while (v48);
LABEL_54:

        objc_msgSend(v97, "endDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
        {
          v63 = v61;
        }
        else
        {
          objc_msgSend(v96, "endDate");
          v63 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v63;

        if (v50)
        {
          objc_msgSend(v50, "metadata");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15960], "subtype");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", v65);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            -[ARPAnalyticsEvent setSuppressionReason:](v100, "setSuppressionReason:", v66);
            v67 = v100;
            v68 = CFSTR("suppressed");
          }
          else
          {
            v67 = v100;
            v68 = v66;
          }
          -[ARPAnalyticsEvent setPrediction:](v67, "setPrediction:", v68);
          objc_msgSend(v50, "metadata");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15960], "outputDeviceID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectForKeyedSubscript:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71 && objc_msgSend(v99, "containsObject:", v71))
            -[ARPAnalyticsEvent setPredictionCorrect:](v100, "setPredictionCorrect:", 1);

        }
        if (v51)
        {
          objc_msgSend(v51, "metadata");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15960], "subtype");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARPAnalyticsEvent setCorrection:](v100, "setCorrection:", v74);

        }
        if (v52)
        {
          objc_msgSend(v51, "metadata");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15960], "subtype");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectForKeyedSubscript:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARPAnalyticsEvent setFailure:](v100, "setFailure:", v77);

        }
        -[ARPAnalyticsEvent analyticsDictionary](v100, "analyticsDictionary");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "isEqualToDictionary:", v88);

        if ((v79 & 1) == 0)
          objc_msgSend(v83, "addObject:", v100);

        v14 = v93 + 1;
        v98 = v12;
        v10 = v87;
        v13 = MEMORY[0x1E0C809B0];
      }
      while (v93 + 1 != v91);
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
    }
    while (v91);
  }

  v80 = (void *)objc_msgSend(v83, "copy");
  return v80;
}

BOOL __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  if (v6 <= v8)
  {
    objc_msgSend(v3, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v9 = v12 <= v14;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  return v9 <= v6 + 5.0 && v6 <= v9;
}

- (id)description
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[ARPAnalyticsEvent prediction](self, "prediction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent predictionReason](self, "predictionReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent suppressionReason](self, "suppressionReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ARPAnalyticsEvent predictionCorrect](self, "predictionCorrect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent predictedDevice](self, "predictedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent actualDevice](self, "actualDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent correction](self, "correction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent correctionTiming](self, "correctionTiming");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPAnalyticsEvent failure](self, "failure");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ARPAnalyticsEvent numberOfMicrolocations](self, "numberOfMicrolocations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %p> prediction: %@, predictionReason: %@, suppressionReason: %@, predictionCorrect: %@, predictedDevice: %@, actualDevice: %@, correction: %@, correctionTiming: %@, failure: %@, numberOfMicrolocations: %@"), v15, self, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)analyticsDictionary
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[10];
  _QWORD v20[11];

  v20[10] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("predicted");
  -[ARPAnalyticsEvent prediction](self, "prediction");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1EA7D4DC0;
  v20[0] = v5;
  v19[1] = CFSTR("suppression_reason");
  -[ARPAnalyticsEvent suppressionReason](self, "suppressionReason");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1EA7D4DC0;
  v20[1] = v8;
  v19[2] = CFSTR("prediction_correct");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ARPAnalyticsEvent predictionCorrect](self, "predictionCorrect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  v19[3] = CFSTR("actual_device");
  -[ARPAnalyticsEvent actualDevice](self, "actualDevice");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1EA7D4DC0;
  v20[3] = v12;
  v19[4] = CFSTR("failure");
  -[ARPAnalyticsEvent failure](self, "failure");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1EA7D4DC0;
  v20[4] = v15;
  v19[5] = CFSTR("number_of_microlocations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ARPAnalyticsEvent numberOfMicrolocations](self, "numberOfMicrolocations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v16;
  v20[6] = CFSTR("unknown");
  v19[6] = CFSTR("prediction_reason");
  v19[7] = CFSTR("predicted_device");
  v20[7] = CFSTR("unknown");
  v20[8] = CFSTR("unknown");
  v19[8] = CFSTR("correction");
  v19[9] = CFSTR("correction_timing");
  v20[9] = CFSTR("unknown");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)predictionReason
{
  return self->_predictionReason;
}

- (void)setPredictionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suppressionReason
{
  return self->_suppressionReason;
}

- (void)setSuppressionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)predictionCorrect
{
  return self->_predictionCorrect;
}

- (void)setPredictionCorrect:(BOOL)a3
{
  self->_predictionCorrect = a3;
}

- (NSString)predictedDevice
{
  return self->_predictedDevice;
}

- (void)setPredictedDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)actualDevice
{
  return self->_actualDevice;
}

- (void)setActualDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)correction
{
  return self->_correction;
}

- (void)setCorrection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)correctionTiming
{
  return self->_correctionTiming;
}

- (void)setCorrectionTiming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)failure
{
  return self->_failure;
}

- (void)setFailure:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)numberOfMicrolocations
{
  return self->_numberOfMicrolocations;
}

- (void)setNumberOfMicrolocations:(unint64_t)a3
{
  self->_numberOfMicrolocations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_correctionTiming, 0);
  objc_storeStrong((id *)&self->_correction, 0);
  objc_storeStrong((id *)&self->_actualDevice, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_suppressionReason, 0);
  objc_storeStrong((id *)&self->_predictionReason, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

@end
