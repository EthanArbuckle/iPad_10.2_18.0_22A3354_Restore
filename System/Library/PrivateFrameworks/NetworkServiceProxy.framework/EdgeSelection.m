@implementation EdgeSelection

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[EdgeSelection alpha](self, "alpha");
  v5 = v4;
  v6 = -[EdgeSelection windowSize](self, "windowSize");
  v7 = -[EdgeSelection trialCount](self, "trialCount");
  -[EdgeSelection networkSignature](self, "networkSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EdgeSelection interfaceType](self, "interfaceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EdgeSelection edgeAttributesDict](self, "edgeAttributesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("(alpha %f windowSize %ld, trialCount %ld, signature %@, interfaceType %@, edgeAttributesDict %@"), v5, v6, v7, v8, v9, v10);

  return v3;
}

- (EdgeSelection)initWithNetworkSignature:(id)a3 interfaceType:(id)a4 modelParams:(id)a5
{
  id v9;
  id v10;
  id v11;
  EdgeSelection *v12;
  EdgeSelection *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *edgeAttributesDict;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)EdgeSelection;
  v12 = -[EdgeSelection init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkSignature, a3);
    objc_storeStrong((id *)&v13->_interfaceType, a4);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kESSAlpha"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kESSAlpha"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v13->_alpha = v16;

    }
    else
    {
      v13->_alpha = 2.0;
    }

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kESSWindowSize"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kESSWindowSize"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_windowSize = objc_msgSend(v18, "integerValue");

    }
    else
    {
      v13->_windowSize = 10;
    }

    v13->_trialCount = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    edgeAttributesDict = v13->_edgeAttributesDict;
    v13->_edgeAttributesDict = (NSMutableDictionary *)v19;

  }
  nplog_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[EdgeSelection alpha](v13, "alpha");
    v24 = v23;
    v25 = -[EdgeSelection windowSize](v13, "windowSize");
    v26 = -[EdgeSelection trialCount](v13, "trialCount");
    -[EdgeSelection edgeAttributesDict](v13, "edgeAttributesDict");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EdgeSelection networkSignature](v13, "networkSignature");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EdgeSelection interfaceType](v13, "interfaceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v32 = v24;
    v33 = 2048;
    v34 = v25;
    v35 = 2048;
    v36 = v26;
    v37 = 2112;
    v38 = v27;
    v39 = 2112;
    v40 = v28;
    v41 = 2112;
    v42 = v29;
    _os_log_debug_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_DEBUG, "ESS: EdgeSelection object initialized with alpha: %f, windowsize: %ld, trial count: %ld, edgeAttributesDict: %@ (%@ %@)", buf, 0x3Eu);

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EdgeSelection)initWithCoder:(id)a3
{
  id v4;
  EdgeSelection *v5;
  void *v6;
  uint64_t v7;
  NSData *networkSignature;
  uint64_t v9;
  NSNumber *interfaceType;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *edgeAttributesDict;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EdgeSelection;
  v5 = -[EdgeSelection init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AEA848]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkSignature"));
    v7 = objc_claimAutoreleasedReturnValue();
    networkSignature = v5->_networkSignature;
    v5->_networkSignature = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceType"));
    v9 = objc_claimAutoreleasedReturnValue();
    interfaceType = v5->_interfaceType;
    v5->_interfaceType = (NSNumber *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("alpha"));
    v5->_alpha = v11;
    v5->_windowSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("windowSize"));
    v5->_trialCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trialCount"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("edgeAttributesDict"));
    v18 = objc_claimAutoreleasedReturnValue();
    edgeAttributesDict = v5->_edgeAttributesDict;
    v5->_edgeAttributesDict = (NSMutableDictionary *)v18;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1A1AEA848]();
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkSignature, CFSTR("networkSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interfaceType, CFSTR("interfaceType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("alpha"), self->_alpha);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_windowSize, CFSTR("windowSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trialCount, CFSTR("trialCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_edgeAttributesDict, CFSTR("edgeAttributesDict"));
  objc_autoreleasePoolPop(v4);

}

- (void)trainEdgeSelectionModel:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[7];
  _QWORD v13[6];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 1;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke;
  v16[3] = &unk_1E41371E0;
  v18 = v19;
  v16[4] = self;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  -[EdgeSelection edgeAttributesDict](self, "edgeAttributesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_60;
  v13[3] = &unk_1E4137208;
  v13[4] = v15;
  v13[5] = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  -[EdgeSelection edgeAttributesDict](self, "edgeAttributesDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_2;
  v12[3] = &unk_1E4137230;
  v12[4] = self;
  v12[5] = v15;
  v12[6] = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);

  if (v9)
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v19, 8);
}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  const __CFString *v41;
  double v42;
  uint64_t v43;
  double v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint8_t buf[4];
  const __CFString *v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (!v7)
  {
    v14 = 0;
    v13 = 0.0;
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kESSRTT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kESSRTT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kESSRank"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v14 = 0;
    goto LABEL_11;
  }
  v16 = (void *)v15;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kESSRank"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "unsignedIntegerValue");

  if (v13 <= 0.0 || !v14)
    goto LABEL_11;
LABEL_12:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kESSIsSelected"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    v73 = a1;
    objc_msgSend(*(id *)(a1 + 32), "edgeAttributesDict");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSRTTSamples"));
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSRewardSamples"));
      v25 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSRewardSampleMean"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSSelectionCount"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (int)objc_msgSend(v29, "intValue");

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSPolicyMetric"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSNoRTTCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "integerValue");

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kESSRank"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v36, "unsignedIntegerValue");

      v37 = v30 + 1;
      v38 = v35 + 1;
      v18 = (void *)v24;
      v19 = (void *)v25;
      if (!v21)
        goto LABEL_35;
    }
    else
    {
      v71 = v14;
      v28 = 0.0;
      v37 = 1;
      v33 = 0.0;
      v38 = 1;
      if (!v21)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    if (v13 != 4294967300.0)
      v38 = 0;
    v72 = v19;
    v69 = v9;
    v70 = v7;
    v68 = v38;
    if (v13 == 4294967300.0 && v38 < 3)
    {
      v41 = CFSTR("not ");
      v42 = 0.0;
    }
    else
    {
      v43 = v37;
      objc_msgSend(*(id *)(v73 + 32), "_stochasticRewardFromRTT:", v13);
      v42 = v44;
      v45 = objc_msgSend(v19, "count");
      if (v45 >= objc_msgSend(*(id *)(v73 + 32), "windowSize"))
      {
        objc_msgSend(v19, "removeObjectAtIndex:", 0);
        objc_msgSend(v18, "removeObjectAtIndex:", 0);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v46);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v47);

      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v19, "valueForKeyPath:", CFSTR("@sum.self"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        v28 = v49 / (double)(unint64_t)objc_msgSend(v19, "count");

      }
      else
      {
        v28 = 0.0;
      }
      v37 = v43;
      v41 = &stru_1E4138CF8;
    }
    v67 = v23;
    nplog_obj();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(v73 + 32), "networkSignature");
      v63 = v37;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v73 + 32), "interfaceType");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v75 = v41;
      v76 = 2112;
      v77 = *(double *)&v70;
      v78 = 2048;
      v79 = v13;
      v80 = 2048;
      v81 = v42;
      v82 = 2048;
      v83 = v28;
      v84 = 2112;
      v85 = v64;
      v86 = 2112;
      v87 = v65;
      _os_log_debug_impl(&dword_19E8FE000, v50, OS_LOG_TYPE_DEBUG, "ESS: (%@training) Received new RTT for edge: %@, RTT: %f, reward: %.15f, reward mean: %.15f (%@ %@)", buf, 0x48u);

      v37 = v63;
    }

    v66 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(v73 + 32), "trialCount"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v68);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v51;
    v19 = v72;
    objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v18, CFSTR("kESSRTTSamples"), v72, CFSTR("kESSRewardSamples"), v51, CFSTR("kESSRewardSampleMean"), v52, CFSTR("kESSSelectionCount"), v53, CFSTR("kESSPolicyMetric"), v54, CFSTR("kESSTrialCount"), v55, CFSTR("kESSNoRTTCount"), v56, CFSTR("kESSRank"), v57,
      CFSTR("kESSLastUsedTimestamp"),
      0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v73 + 32), "edgeAttributesDict");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v70;
    objc_msgSend(v60, "setObject:forKey:", v59, v70);

    v9 = v69;
    v23 = v67;
    goto LABEL_35;
  }
  *a4 = 1;
  nplog_obj();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "networkSignature");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "interfaceType");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v75 = v7;
    v76 = 2048;
    v77 = v13;
    v78 = 2048;
    v79 = *(double *)&v14;
    v80 = 2112;
    v81 = *(double *)&v61;
    v82 = 2112;
    v83 = *(double *)&v62;
    _os_log_debug_impl(&dword_19E8FE000, v39, OS_LOG_TYPE_DEBUG, "ESS: Failed updating attributes for edge: %@, RTT: %f, rank: %ld (%@ %@)", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 33, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *(_QWORD *)(a1 + 40);
  if (v40)
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v18);
LABEL_36:

}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kESSRewardSamples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v8 > *(double *)(v9 + 24))
    *(double *)(v9 + 24) = v8;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kESSRewardSampleMean"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v12 > *(double *)(v13 + 24))
    *(double *)(v13 + 24) = v12;
}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  double v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0.0;
  v9 = 0.0;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0.0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kESSRewardSamples"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v9 = v12 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("kESSGoodness"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSRank"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "interfaceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  if (v17 == 1)
    v18 = (unint64_t)((double)v15 * (double)v15);
  else
    v18 = v15;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 0.0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSRewardSampleMean"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v8 = v20 / (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) * (double)(10 * v18 - 9));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("kESSFairness"));

  nplog_obj();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "networkSignature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "interfaceType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413314;
    v26 = v5;
    v27 = 2048;
    v28 = v18;
    v29 = 2048;
    v30 = v8;
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v24;
    _os_log_debug_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_DEBUG, "ESS: Setting fairness for edge: %@, rank: %ld, fairness: %.15f (%@ %@)", (uint8_t *)&v25, 0x34u);

  }
}

- (void)getMinimumLatencyEdge:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[8];
  _QWORD v16[4];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[EdgeSelection setTrialCount:](self, "setTrialCount:", -[EdgeSelection trialCount](self, "trialCount") + 1);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0x41EFFFFFFFE00000;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  -[EdgeSelection edgeAttributesDict](self, "edgeAttributesDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__EdgeSelection_getMinimumLatencyEdge___block_invoke;
  v15[3] = &unk_1E4137258;
  v15[4] = self;
  v15[5] = v16;
  v15[6] = &v21;
  v15[7] = &v17;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);

  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = v22[5];
    v12 = *((_QWORD *)v18 + 3);
    -[EdgeSelection networkSignature](self, "networkSignature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EdgeSelection interfaceType](self, "interfaceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v11;
    v31 = 2048;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    _os_log_debug_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEBUG, "ESS: Returning selected edge: %@, last RTT: %f (%@ %@)", buf, 0x2Au);

  }
  v27[0] = CFSTR("kESSSelectedEdgeLabel");
  v7 = v22[5];
  if (v7)
  {
    v8 = (void *)v22[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = CFSTR("kESSRTT");
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18[3]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (v4)
    v4[2](v4, v10, 0);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

void __39__EdgeSelection_getMinimumLatencyEdge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  long double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  __int16 v47;
  long double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  double v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSRTTSamples"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSRewardSampleMean"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSSelectionCount"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSGoodness"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSFairness"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      v20 = 0.0;
      if (v13 >= 1 && objc_msgSend(*(id *)(a1 + 32), "trialCount") >= 1 && v19 >= 0.0 && v16 >= 0.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "alpha");
        if (v21 > 0.0)
        {
          v22 = (double)objc_msgSend(*(id *)(a1 + 32), "trialCount");
          objc_msgSend(*(id *)(a1 + 32), "alpha");
          v24 = pow(v16, v23);
          v25 = pow(v22, v19 * v24);
          v26 = log(v25);
          v20 = v11 + sqrt((v26 + v26) / (double)v13);
        }
      }
      nplog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v34 = objc_msgSend(*(id *)(a1 + 32), "trialCount");
        objc_msgSend(*(id *)(a1 + 32), "networkSignature");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "interfaceType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138414338;
        v40 = v6;
        v41 = 2048;
        v42 = v11;
        v43 = 2048;
        v44 = v34;
        v45 = 2048;
        v46 = v19;
        v47 = 2048;
        v48 = v16;
        v49 = 2048;
        v50 = v13;
        v51 = 2048;
        v52 = v20;
        v53 = 2112;
        v54 = v35;
        v55 = 2112;
        v56 = v36;
        _os_log_debug_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_DEBUG, "ESS: Computing metric for edge: %@, reward mean: %.15f, trial: %ld, fairness: %.15f, goodness: %.15f, selections: %ld, metric: %.15f (%@ %@)", (uint8_t *)&v39, 0x5Cu);

      }
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v20 > *(double *)(v28 + 24))
      {
        *(double *)(v28 + 24) = v20;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        objc_msgSend(v8, "lastObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v30;

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v31, CFSTR("kESSPolicyMetric"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "trialCount"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v32, CFSTR("kESSTrialCount"));

      nplog_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "networkSignature");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "interfaceType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138413058;
        v40 = v6;
        v41 = 2112;
        v42 = *(double *)&v7;
        v43 = 2112;
        v44 = (uint64_t)v37;
        v45 = 2112;
        v46 = *(double *)&v38;
        _os_log_debug_impl(&dword_19E8FE000, v33, OS_LOG_TYPE_DEBUG, "ESS: Updated attributes for edge: %@, attributes: %@ (%@ %@)", (uint8_t *)&v39, 0x2Au);

      }
    }
  }

}

- (void)getAttributesForEdge:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  EdgeSelection *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[EdgeSelection edgeAttributesDict](self, "edgeAttributesDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__EdgeSelection_getAttributesForEdge_reply___block_invoke;
    v14[3] = &unk_1E4137280;
    v15 = v6;
    v16 = self;
    v17 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

    v10 = 0;
    if (v7)
LABEL_3:
      v7[2](v7, v8, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[EdgeSelection networkSignature](self, "networkSignature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "ESS: Attributes queried for null edge (%@ %@)", buf, 0x16u);

    }
    if (v7)
      goto LABEL_3;
  }

}

void __44__EdgeSelection_getAttributesForEdge_reply___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "networkSignature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "interfaceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "ESS: Queried attributes for edge: %@, attributes: %@ (%@ %@)", (uint8_t *)&v12, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

- (double)_stochasticRewardFromRTT:(double)a3
{
  return pow(a3 / -4294967300.0 + 1.0, 3.0);
}

- (NSData)networkSignature
{
  return self->_networkSignature;
}

- (void)setNetworkSignature:(id)a3
{
  objc_storeStrong((id *)&self->_networkSignature, a3);
}

- (NSNumber)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceType, a3);
}

- (int64_t)trialCount
{
  return self->_trialCount;
}

- (void)setTrialCount:(int64_t)a3
{
  self->_trialCount = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (void)setWindowSize:(int64_t)a3
{
  self->_windowSize = a3;
}

- (NSMutableDictionary)edgeAttributesDict
{
  return self->_edgeAttributesDict;
}

- (void)setEdgeAttributesDict:(id)a3
{
  objc_storeStrong((id *)&self->_edgeAttributesDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeAttributesDict, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_networkSignature, 0);
}

@end
