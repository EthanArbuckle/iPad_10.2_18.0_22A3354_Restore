@implementation NSMutableData(FIUIHeartRateData)

- (double)fiui_weightedAverageHeartRateWithStartDate:()FIUIHeartRateData endDate:
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  double v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if ((v7 & 0xF) != 0)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FA8];
    v9 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      -[NSMutableData(FIUIHeartRateData) fiui_weightedAverageHeartRateWithStartDate:endDate:].cold.1(v8);
  }
  else
  {
    v10 = v7;
    v38 = v6;
    v11 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    v12 = v11 + v10;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 < v11 + v10)
    {
      do
      {
        v14 = *(double *)(v11 + 8);
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *(double *)v11, v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v15, "timeIntervalSinceDate:", v39);
        objc_msgSend(v16, "numberWithDouble:", floor(v17 / 60.0));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v19, "fiui_incrementValueForKey:byValue:", CFSTR("totalBeats"), v14);
        objc_msgSend(v19, "fiui_incrementValueForKey:byValue:", CFSTR("numberOfReadings"), 1.0);
        objc_msgSend(v13, "setObject:forKey:", v19, v18);

        v11 += 16;
      }
      while (v11 < v12);
    }
    v6 = v38;
    objc_msgSend(v38, "timeIntervalSinceDate:", v39, v38);
    v21 = v20;
    if (objc_msgSend(v13, "count"))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v13, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v41;
        v26 = 0.0;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v28, "objectForKey:", CFSTR("totalBeats"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v31 = v30;

            objc_msgSend(v28, "objectForKey:", CFSTR("numberOfReadings"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = v33;

            v26 = v26 + v31 / v34;
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v24);
      }
      else
      {
        v26 = 0.0;
      }

      v9 = v26 / (double)(unint64_t)objc_msgSend(v13, "count");
    }
    else
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x24BDD2FA8];
      v9 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        *(_DWORD *)buf = 134218240;
        v45 = objc_msgSend(v13, "count");
        v46 = 2048;
        v47 = v21 / 60.0;
        _os_log_impl(&dword_21307C000, v36, OS_LOG_TYPE_DEFAULT, "[WRKT] Not enough data to compute heart rate average. Received data for %lu out of %.2f minutes.", buf, 0x16u);

      }
    }

  }
  return v9;
}

- (uint64_t)fiui_appendHeartRate:()FIUIHeartRateData date:
{
  uint64_t v6;
  _QWORD v8[2];

  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v8[0] = v6;
  *(double *)&v8[1] = a2;
  return objc_msgSend(a1, "appendBytes:length:", v8, 16);
}

- (void)fiui_weightedAverageHeartRateWithStartDate:()FIUIHeartRateData endDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21307C000, log, OS_LOG_TYPE_ERROR, "[FitnessUI] Heart rate data is in invalid format", v1, 2u);
}

@end
