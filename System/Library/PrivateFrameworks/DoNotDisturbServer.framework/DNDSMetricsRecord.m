@implementation DNDSMetricsRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4;
  DNDSJSONBackingStore *v5;

  v4 = a3;
  v5 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:versionNumber:", a1, v4, 1);

  return v5;
}

- (DNDSMetricsRecord)init
{
  return (DNDSMetricsRecord *)-[DNDSMetricsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "metricsByDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastDailyHeartbeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsByWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastWeeklyHeartbeat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsByMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastMonthlyHeartbeat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDSMetricsRecord _initWithMetricsByDay:lastDailyHeartbeat:metricsByWeek:lastWeeklyHeartbeat:metricsByMonth:lastMonthlyHeartbeat:](self, "_initWithMetricsByDay:lastDailyHeartbeat:metricsByWeek:lastWeeklyHeartbeat:metricsByMonth:lastMonthlyHeartbeat:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)_initWithMetricsByDay:(id)a3 lastDailyHeartbeat:(id)a4 metricsByWeek:(id)a5 lastWeeklyHeartbeat:(id)a6 metricsByMonth:(id)a7 lastMonthlyHeartbeat:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  DNDSMetricsRecord *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *metricsByDay;
  void *v25;
  void *v26;
  NSDate *v27;
  NSDate *lastDailyHeartbeat;
  void *v29;
  void *v30;
  NSDictionary *v31;
  NSDictionary *metricsByWeek;
  void *v33;
  void *v34;
  NSDate *v35;
  NSDate *lastWeeklyHeartbeat;
  void *v37;
  void *v38;
  NSDictionary *v39;
  NSDictionary *metricsByMonth;
  void *v41;
  void *v42;
  NSDate *v43;
  NSDate *lastMonthlyHeartbeat;
  objc_super v46;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v46.receiver = self;
  v46.super_class = (Class)DNDSMetricsRecord;
  v20 = -[DNDSMetricsRecord init](&v46, sel_init);
  if (v20)
  {
    v21 = (void *)objc_msgSend(v14, "copy");
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    metricsByDay = v20->_metricsByDay;
    v20->_metricsByDay = v23;

    v25 = (void *)objc_msgSend(v15, "copy");
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    lastDailyHeartbeat = v20->_lastDailyHeartbeat;
    v20->_lastDailyHeartbeat = v27;

    v29 = (void *)objc_msgSend(v16, "copy");
    v30 = v29;
    if (v29)
      v31 = v29;
    else
      v31 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    metricsByWeek = v20->_metricsByWeek;
    v20->_metricsByWeek = v31;

    v33 = (void *)objc_msgSend(v17, "copy");
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v35 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    lastWeeklyHeartbeat = v20->_lastWeeklyHeartbeat;
    v20->_lastWeeklyHeartbeat = v35;

    v37 = (void *)objc_msgSend(v18, "copy");
    v38 = v37;
    if (v37)
      v39 = v37;
    else
      v39 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    metricsByMonth = v20->_metricsByMonth;
    v20->_metricsByMonth = v39;

    v41 = (void *)objc_msgSend(v19, "copy");
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v43 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    lastMonthlyHeartbeat = v20->_lastMonthlyHeartbeat;
    v20->_lastMonthlyHeartbeat = v43;

  }
  return v20;
}

- (unint64_t)hash
{
  void *v3;
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
  unint64_t v14;

  -[DNDSMetricsRecord metricsByDay](self, "metricsByDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSMetricsRecord lastDailyHeartbeat](self, "lastDailyHeartbeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSMetricsRecord metricsByWeek](self, "metricsByWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSMetricsRecord lastWeeklyHeartbeat](self, "lastWeeklyHeartbeat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSMetricsRecord metricsByMonth](self, "metricsByMonth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSMetricsRecord lastMonthlyHeartbeat](self, "lastMonthlyHeartbeat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSMetricsRecord *v5;
  DNDSMetricsRecord *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
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

  v5 = (DNDSMetricsRecord *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSMetricsRecord metricsByDay](self, "metricsByDay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSMetricsRecord metricsByDay](v6, "metricsByDay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSMetricsRecord metricsByDay](self, "metricsByDay");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_73;
        }
        v10 = (void *)v9;
        -[DNDSMetricsRecord metricsByDay](v6, "metricsByDay");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_72:

          goto LABEL_73;
        }
        -[DNDSMetricsRecord metricsByDay](self, "metricsByDay");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSMetricsRecord metricsByDay](v6, "metricsByDay");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v12))
        {
          v13 = 0;
LABEL_71:

          goto LABEL_72;
        }
        v75 = v10;
        v76 = v12;
        v77 = v3;
        v78 = v11;
      }
      -[DNDSMetricsRecord lastDailyHeartbeat](self, "lastDailyHeartbeat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSMetricsRecord lastDailyHeartbeat](v6, "lastDailyHeartbeat");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSMetricsRecord lastDailyHeartbeat](self, "lastDailyHeartbeat");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v79 = v14;
          -[DNDSMetricsRecord lastDailyHeartbeat](v6, "lastDailyHeartbeat");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v3 = (void *)v18;
            -[DNDSMetricsRecord lastDailyHeartbeat](self, "lastDailyHeartbeat");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSMetricsRecord lastDailyHeartbeat](v6, "lastDailyHeartbeat");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
            {
              v72 = v20;
              v73 = v19;
              v69 = v3;
              v70 = v17;
              goto LABEL_17;
            }

          }
        }
        else
        {

        }
LABEL_69:
        v13 = 0;
        goto LABEL_70;
      }
      v79 = v14;
LABEL_17:
      -[DNDSMetricsRecord metricsByWeek](self, "metricsByWeek");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSMetricsRecord metricsByWeek](v6, "metricsByWeek");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
        goto LABEL_25;
      -[DNDSMetricsRecord metricsByWeek](self, "metricsByWeek");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v71 = (void *)v23;
        -[DNDSMetricsRecord metricsByWeek](v6, "metricsByWeek");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v67 = (void *)v24;
          -[DNDSMetricsRecord metricsByWeek](self, "metricsByWeek");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSMetricsRecord metricsByWeek](v6, "metricsByWeek");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isEqual:", v25) & 1) != 0)
          {
            v62 = v25;
            v63 = v3;
LABEL_25:
            -[DNDSMetricsRecord lastWeeklyHeartbeat](self, "lastWeeklyHeartbeat");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSMetricsRecord lastWeeklyHeartbeat](v6, "lastWeeklyHeartbeat");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 == v74)
            {
              v68 = v22;
              v30 = v21;
LABEL_33:
              -[DNDSMetricsRecord metricsByMonth](self, "metricsByMonth");
              v31 = objc_claimAutoreleasedReturnValue();
              -[DNDSMetricsRecord metricsByMonth](v6, "metricsByMonth");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = (void *)v31;
              if ((void *)v31 == v65)
              {
                v33 = v30;
                goto LABEL_44;
              }
              -[DNDSMetricsRecord metricsByMonth](self, "metricsByMonth");
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = v30;
              if (v32)
              {
                v56 = (void *)v32;
                v60 = v26;
                -[DNDSMetricsRecord metricsByMonth](v6, "metricsByMonth");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v66;
                if (v34)
                {
                  v53 = v34;
                  -[DNDSMetricsRecord metricsByMonth](self, "metricsByMonth");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDSMetricsRecord metricsByMonth](v6, "metricsByMonth");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v36, "isEqual:", v37) & 1) != 0)
                  {
                    v51 = v37;
                    v52 = v36;
                    v26 = v60;
LABEL_44:
                    -[DNDSMetricsRecord lastMonthlyHeartbeat](self, "lastMonthlyHeartbeat");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSMetricsRecord lastMonthlyHeartbeat](v6, "lastMonthlyHeartbeat");
                    v40 = objc_claimAutoreleasedReturnValue();
                    v54 = v3;
                    v57 = v33;
                    if (v39 == (void *)v40)
                    {

                      v13 = 1;
                    }
                    else
                    {
                      v61 = (void *)v40;
                      -[DNDSMetricsRecord lastMonthlyHeartbeat](self, "lastMonthlyHeartbeat");
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (v41)
                      {
                        v50 = (void *)v41;
                        -[DNDSMetricsRecord lastMonthlyHeartbeat](v6, "lastMonthlyHeartbeat");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v42)
                        {
                          v49 = v42;
                          -[DNDSMetricsRecord lastMonthlyHeartbeat](self, "lastMonthlyHeartbeat");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDSMetricsRecord lastMonthlyHeartbeat](v6, "lastMonthlyHeartbeat");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          v13 = objc_msgSend(v43, "isEqual:", v44);

                          v42 = v49;
                        }
                        else
                        {
                          v13 = 0;
                        }

                      }
                      else
                      {

                        v13 = 0;
                      }
                    }
                    if (v66 != v65)
                    {

                    }
                    if (v26 != v74)
                    {

                    }
                    if (v57 != v68)
                    {

                    }
                    if (v79 != v15)
                    {

                    }
LABEL_70:
                    v3 = v77;
                    v11 = v78;
                    v10 = v75;
                    v12 = v76;
                    if (v7 != v8)
                      goto LABEL_71;
LABEL_73:

                    goto LABEL_74;
                  }

                  v34 = v53;
                  v35 = v66;
                }

                v47 = v74;
                v46 = v60;
              }
              else
              {

                v46 = v26;
                v47 = v74;
              }
              if (v46 != v47)
              {

              }
              v45 = v73;
              if (v33 != v68)
              {

              }
              v38 = v79;
              if (v79 == v15)
                goto LABEL_67;
LABEL_65:

LABEL_66:
LABEL_67:

              goto LABEL_68;
            }
            -[DNDSMetricsRecord lastWeeklyHeartbeat](self, "lastWeeklyHeartbeat");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v64 = (void *)v27;
              -[DNDSMetricsRecord lastWeeklyHeartbeat](v6, "lastWeeklyHeartbeat");
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v58 = (void *)v28;
                v59 = v26;
                -[DNDSMetricsRecord lastWeeklyHeartbeat](self, "lastWeeklyHeartbeat");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSMetricsRecord lastWeeklyHeartbeat](v6, "lastWeeklyHeartbeat");
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "isEqual:", v3) & 1) != 0)
                {
                  v68 = v22;
                  v30 = v21;
                  v55 = v29;
                  v26 = v59;
                  goto LABEL_33;
                }

LABEL_51:
                if (v21 == v22)
                {

                }
                else
                {

                }
                v38 = v79;
                v45 = v73;
                if (v79 == v15)
                  goto LABEL_67;
                goto LABEL_65;
              }

            }
            goto LABEL_51;
          }

        }
      }

      v38 = v79;
      if (v79 == v15)
      {

LABEL_68:
        goto LABEL_69;
      }

      goto LABEL_66;
    }
    v13 = 0;
  }
LABEL_74:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSMetricsRecord metricsByDay](self, "metricsByDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsRecord lastDailyHeartbeat](self, "lastDailyHeartbeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsRecord metricsByWeek](self, "metricsByWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsRecord lastWeeklyHeartbeat](self, "lastWeeklyHeartbeat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsRecord metricsByMonth](self, "metricsByMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsRecord lastMonthlyHeartbeat](self, "lastMonthlyHeartbeat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; metricsByDay: %@; lastDailyHeartbeat: %@; metricsByWeek: %@; lastWeeklyHeartbeat: %@; metricsByMonth: %@; lastMonthlyHeartbeat: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSMetricsRecord _initWithRecord:]([DNDSMutableMetricsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("metricsByDay"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("lastDailyHeartbeat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("metricsByWeek"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("lastWeeklyHeartbeat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("metricsByMonth"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("lastMonthlyHeartbeat"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMetricsByDay:lastDailyHeartbeat:metricsByWeek:lastWeeklyHeartbeat:metricsByMonth:lastMonthlyHeartbeat:", v6, v9, v10, v13, v14, v17);
  return v18;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", self->_metricsByDay, CFSTR("metricsByDay"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastDailyHeartbeat, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("lastDailyHeartbeat"));

  objc_msgSend(v4, "setObject:forKey:", self->_metricsByWeek, CFSTR("metricsByWeek"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastWeeklyHeartbeat, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("lastWeeklyHeartbeat"));

  objc_msgSend(v4, "setObject:forKey:", self->_metricsByMonth, CFSTR("metricsByMonth"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastMonthlyHeartbeat, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("lastMonthlyHeartbeat"));

  return v4;
}

- (NSDictionary)metricsByDay
{
  return self->_metricsByDay;
}

- (NSDate)lastDailyHeartbeat
{
  return self->_lastDailyHeartbeat;
}

- (NSDictionary)metricsByWeek
{
  return self->_metricsByWeek;
}

- (NSDate)lastWeeklyHeartbeat
{
  return self->_lastWeeklyHeartbeat;
}

- (NSDictionary)metricsByMonth
{
  return self->_metricsByMonth;
}

- (NSDate)lastMonthlyHeartbeat
{
  return self->_lastMonthlyHeartbeat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMonthlyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByMonth, 0);
  objc_storeStrong((id *)&self->_lastWeeklyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByWeek, 0);
  objc_storeStrong((id *)&self->_lastDailyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByDay, 0);
}

@end
