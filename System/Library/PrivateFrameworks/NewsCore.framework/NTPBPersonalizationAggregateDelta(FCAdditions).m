@implementation NTPBPersonalizationAggregateDelta(FCAdditions)

- (uint64_t)addAction:()FCAdditions count:
{
  uint64_t v7;
  uint64_t result;
  unsigned int v9;

  v7 = objc_msgSend(a1, "eventsCount");
  result = objc_msgSend(a1, "events");
  if (!v7)
    return objc_msgSend(a1, "addEvents:", a3 | (a4 << 6));
  v9 = *(_DWORD *)(result + 4 * (v7 - 1));
  if ((v9 & 0x3F) != a3)
    return objc_msgSend(a1, "addEvents:", a3 | (a4 << 6));
  *(_DWORD *)(result + 4 * (v7 - 1)) = a3 | ((a4 + (v9 >> 6)) << 6);
  return result;
}

- (uint64_t)applyToAggregate:()FCAdditions withTreatment:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  long double v33;
  long double v34;
  double v35;
  double v36;
  void *v37;
  long double v38;
  double v39;
  double v40;
  double v41;
  char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v48;
  char *v49;
  char *v50;
  char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  char *v63;
  NSObject *log;
  void *v65;
  double v66;
  double v67;
  char *v68;
  os_log_t v69;
  NSObject *v70;
  uint64_t v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  char *v75;
  __int16 v76;
  _BYTE v77[18];
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "treatment");
    *(_DWORD *)buf = 136315906;
    v73 = "-[NTPBPersonalizationAggregateDelta(FCAdditions) applyToAggregate:withTreatment:]";
    v74 = 2080;
    v75 = "NTPBPersonalizationAggregateDelta+FCAdditions.m";
    v76 = 1024;
    *(_DWORD *)v77 = 42;
    *(_WORD *)&v77[4] = 2114;
    *(_QWORD *)&v77[6] = v60;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "featureKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("f0"));

  if (!objc_msgSend(v6, "eventCount"))
  {
    objc_msgSend(a1, "defaultClicks");
    objc_msgSend(v6, "setClicks:");
    objc_msgSend(a1, "defaultImpressions");
    objc_msgSend(v6, "setImpressions:");
  }
  if (v9)
  {
    v69 = (os_log_t)objc_msgSend(v7, "baselineClicksByAction");
    v10 = objc_msgSend(v7, "baselineImpressionsByAction");
  }
  else
  {
    v69 = (os_log_t)objc_msgSend(v7, "featureClicksByAction");
    v10 = objc_msgSend(v7, "featureImpressionsByAction");
  }
  v11 = v10;
  objc_msgSend(v6, "clicks");
  v13 = v12;
  objc_msgSend(v6, "impressions");
  v15 = v14;
  v71 = objc_msgSend(v6, "eventCount");
  v16 = objc_msgSend(a1, "events");
  objc_msgSend(a1, "impressionBias");
  if (v17 == 0.0)
    v18 = 1.0;
  else
    v18 = v17;
  objc_msgSend(a1, "groupBias");
  v20 = v19;
  v21 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v48 = v21;
    objc_msgSend(v6, "featureKey");
    v49 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "eventsCount"));
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v73 = v49;
    v74 = 2112;
    v75 = v50;
    _os_log_debug_impl(&dword_1A1B90000, v48, OS_LOG_TYPE_DEBUG, "%@ - Applying %@ events to aggregate", buf, 0x16u);

  }
  v65 = v6;
  v62 = a1;
  v22 = objc_msgSend(a1, "eventsCount");
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = 0;
    v66 = v20;
    v67 = v18;
    v61 = v11;
    do
    {
      v26 = *(unsigned int *)(v16 + 4 * v25);
      v27 = v20 * *(double *)&v69[v26 & 0x3F].isa;
      v28 = v20 * (v18 * *(double *)(v11 + 8 * (v26 & 0x3F)));
      v29 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        log = v29;
        objc_msgSend(v65, "featureKey");
        v42 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromFCPersonalizationAction(v26 & 0x3F);
        v63 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v44 = v24;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v73 = v42;
        v74 = 2112;
        v75 = v63;
        v76 = 2112;
        *(_QWORD *)v77 = v43;
        *(_WORD *)&v77[8] = 2112;
        *(_QWORD *)&v77[10] = v45;
        _os_log_debug_impl(&dword_1A1B90000, log, OS_LOG_TYPE_DEBUG, "%@ - Applying action %@ C : %@, I : %@", buf, 0x2Au);

        v24 = v44;
        v11 = v61;

      }
      if (v27 != 0.0 || v28 != 0.0)
      {
        v30 = v26 >> 6;
        if (v26 >= 0x40)
        {
          if (v30 <= 1)
            v31 = 1;
          else
            v31 = v26 >> 6;
          do
          {
            objc_msgSend(v7, "defaultScoringConfig");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "decayFactor");
            v34 = v33;
            v35 = v27;
            if (v33 != 1.0)
              v35 = (1.0 - pow(v33, v27)) / (1.0 - v33);
            v36 = pow(v34, v28);

            objc_msgSend(v7, "defaultScoringConfig");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "decayFactor");
            v39 = v38;
            v40 = pow(v38, v28);
            v41 = v28;
            if (v39 != 1.0)
              v41 = (1.0 - v40) / (1.0 - v39);
            v13 = v35 + v13 * v36;
            v15 = v41 + v15 * v40;

            --v31;
          }
          while (v31);
        }
        v71 += v30;
        v24 = 1;
        v20 = v66;
        v18 = v67;
      }
      ++v25;
    }
    while (v25 != v23);
  }
  else
  {
    LOBYTE(v24) = 0;
  }
  v46 = (void *)FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v70 = v46;
    objc_msgSend(v65, "featureKey");
    v68 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v62, "timestamp"));
    v51 = (char *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v65, "clicks");
    objc_msgSend(v52, "numberWithDouble:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v65, "impressions");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v65, "eventCount"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v71);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v73 = v68;
    v74 = 2112;
    v75 = v51;
    v76 = 2112;
    *(_QWORD *)v77 = v53;
    *(_WORD *)&v77[8] = 2112;
    *(_QWORD *)&v77[10] = v55;
    v78 = 2112;
    v79 = v56;
    v80 = 2112;
    v81 = v57;
    v82 = 2112;
    v83 = v58;
    v84 = 2112;
    v85 = v59;
    _os_log_debug_impl(&dword_1A1B90000, v70, OS_LOG_TYPE_DEBUG, "%@ - Updating aggregate at %@ from C : %@ I : %@ EC : %@ to C : %@ I : %@ EC : %@", buf, 0x52u);

  }
  objc_msgSend(v65, "setClicks:", v13);
  objc_msgSend(v65, "setImpressions:", v15);
  objc_msgSend(v65, "setEventCount:", v71);
  objc_msgSend(v65, "setTimestamp:", objc_msgSend(v62, "timestamp"));

  return v24 & 1;
}

- (void)applyToDelta:()FCAdditions
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  if (!objc_msgSend(v8, "eventsCount"))
  {
    objc_msgSend(a1, "defaultClicks");
    objc_msgSend(v8, "setDefaultClicks:");
    objc_msgSend(a1, "defaultImpressions");
    objc_msgSend(v8, "setDefaultImpressions:");
    objc_msgSend(a1, "impressionBias");
    objc_msgSend(v8, "setImpressionBias:");
    objc_msgSend(a1, "groupBias");
    objc_msgSend(v8, "setGroupBias:");
  }
  v4 = (unsigned int *)objc_msgSend(a1, "events");
  v5 = objc_msgSend(a1, "eventsCount");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = *v4++;
      objc_msgSend(v8, "addAction:count:", v7 & 0x3F, (unint64_t)v7 >> 6);
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v8, "setTimestamp:", objc_msgSend(a1, "timestamp"));

}

@end
