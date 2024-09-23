@implementation AlgosScoreStreamDataCSV

+ (id)streamDataCSV:(BOOL)a3
{
  return -[AlgosScoreStreamDataCSV initIsMusic:]([AlgosScoreStreamDataCSV alloc], "initIsMusic:", a3);
}

- (id)setUpMethods
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD028, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("PlayEnded"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD040, &unk_24C3CD058, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("PlayRateChanged"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD070, &unk_24C3CD088, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("PlayStalled"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD0A0, &unk_24C3CD0B8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("PlayLikelyToKeepUp"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD0D0, &unk_24C3CD0E8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("PlayerError"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD100, &unk_24C3CD118, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("PlayerSwitchComplete"));

  return v2;
}

- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[AlgosScoreStreamDataCSV methods](self, "methods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "containsObject:", v9);

  return a4;
}

- (BOOL)validMethod:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AlgosScoreStreamDataCSV methods](self, "methods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

        if ((v10 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)initIsMusic:(BOOL)a3
{
  _BOOL8 v3;
  AlgosScoreStreamDataCSV *v4;
  AlgosScoreStreamDataCSV *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AlgosScoreStreamDataCSV;
  v4 = -[AlgosScoreDataCSV init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[AlgosScoreStreamDataCSV setIsMusic:](v4, "setIsMusic:", v3);
    -[AlgosScoreStreamDataCSV setUpMethods](v5, "setUpMethods");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AlgosScoreStreamDataCSV setMethods:](v5, "setMethods:", v6);

  }
  return v5;
}

- (int)transformer
{
  void *v3;
  uint64_t *csvData;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __CFString *v21;
  double v22;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  __n128 v28;
  unint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  __n128 v35;
  unint64_t v36;
  uint64_t v37;
  __n128 v38;
  unint64_t v39;
  uint64_t v40;
  __n128 v41;
  unint64_t v42;
  uint64_t v43;
  __n128 v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  int v48;
  uint64_t v49;
  __n128 v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  __n128 v55;
  unint64_t v56;
  uint64_t v57;
  __n128 v58;
  unint64_t v59;
  uint64_t v60;
  void *v62;
  void *v63;
  id v64;
  int v65;
  id obj;
  double v67;
  char v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  char v77;
  AlgosScoreStreamDataCSV *v78;
  void *v79[2];
  char v80;
  void *__p[2];
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  -[AlgosScoreDataCSV clearStreamingData](self, "clearStreamingData");
  v78 = self;
  -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  csvData = (uint64_t *)v78->super.csvData;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v3, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (!v75)
  {

    v65 = 0;
    v17 = 0;
    v19 = 0;
    v31 = 1.0;
    v5 = 0.0;
    v6 = 0.0;
    v25 = 0.0;
    v24 = 0.0;
    v26 = 1.0;
    goto LABEL_112;
  }
  v68 = 0;
  v65 = 0;
  v76 = 0;
  v77 = 0;
  v74 = *(_QWORD *)v84;
  v70 = -1;
  v71 = -1;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v73 = 0.0;
  v67 = 0.0;
  v72 = -1;
  v69 = -1;
  do
  {
    v8 = 0;
    v9 = v5;
    do
    {
      if (*(_QWORD *)v84 != v74)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v8);
      objc_msgSend(v3, "atRow:col:", v10, CFSTR("timedelta_ms"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v5 = v12;

      objc_msgSend(v3, "doubleAtRow:col:defaultValue:", v10, CFSTR("VaRk"), v7 * 100.0);
      v14 = v13;
      objc_msgSend(v3, "atRow:col:", v10, CFSTR("IfTy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");
      v17 = v16 == 3;

      v18 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("method"), -1);
      v19 = -[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayerError"), v18);
      v20 = v76 + v8;
      if (v76 + (_DWORD)v8)
      {
        v21 = CFSTR("None");
      }
      else
      {
        v6 = v5;
        v21 = CFSTR("start");
      }
      objc_msgSend(v3, "doubleAtRow:col:defaultValue:", v10, CFSTR("StartupTime"), 0.0);
      if (v22 == 0.0 && v20 == 0)
        v24 = 0.0;
      else
        v24 = v22;
      v25 = v5 - v9;
      v26 = v14 / 100.0;
      if (!-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayEnded"), v18))
      {
        if (-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayerError"), v18))
        {
          if (-[AlgosScoreStreamDataCSV isMusic](v78, "isMusic"))
            v31 = 0.3;
          else
            v31 = 1.0;
          v32 = v7;
          v21 = CFSTR("error");
          goto LABEL_55;
        }
        if (-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayRateChanged"), v18))
        {
          v33 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("Rate"), -1);
          v24 = v5 - v6;
          if ((v77 & 1) == 0 && !v33)
          {
            v72 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("IABR"), v72);
            v71 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("VaRk"), v71);
            v31 = 1.0;
LABEL_87:
            v6 = v5;
            v32 = v26;
            v21 = CFSTR("rate");
            v26 = v7;
            goto LABEL_55;
          }
          if ((v77 & (v33 == 100)) != 1)
          {
            v31 = 1.0;
            if ((v77 & (v33 == 0)) == 1)
            {
              v72 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("IABR"), v72);
              v71 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("VaRk"), v71);
              v77 = 1;
            }
            goto LABEL_87;
          }
          v24 = v5 - v73;
          v31 = 1.0;
          if (v5 - v73 >= 0.5)
          {
            v77 = 0;
          }
          else
          {
            printf("Unexpected stallduration cannot be less than %1.2f start: %1.2f, stop: %1.2f\n", 0.5, v73, v5);
            v77 = 0;
            ++v65;
          }
          v6 = v5;
          v32 = v26;
          v21 = CFSTR("stall-end-1");
          v26 = v7;
LABEL_99:
          v67 = v5;
          goto LABEL_55;
        }
        if (-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayLikelyToKeepUp"), v18))
        {
          v34 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("SwCnt"), v70);
          v69 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("OBRLast"), v69);
          v70 = v34;
          v31 = 1.0;
          if ((v77 & 1) != 0)
          {
            if (!-[AlgosScoreStreamDataCSV isMusic](v78, "isMusic"))
            {
              v24 = v5 - v73;
              if (v5 - v73 < 0.5)
              {
                printf("Unexpected stallduration cannot be less than %1.2f start: %1.2f, stop: %1.2f\n", 0.5, v73, v5);
                ++v65;
              }
              v72 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("IABR"), v72);
              v71 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("VaRk"), v71);
              v68 = 0;
              v77 = 0;
              v32 = v7;
              v21 = CFSTR("stall-end-2");
              goto LABEL_99;
            }
            v68 = 0;
            v77 = 1;
          }
          else
          {
            v68 = 0;
            v77 = 0;
          }
LABEL_95:
          v32 = v7;
          goto LABEL_55;
        }
        if (-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayStalled"), v18))
        {
          if ((v77 & 1) == 0)
            v21 = CFSTR("stall");
          v47 = v73;
          if ((v77 & 1) == 0)
            v47 = v5;
          v73 = v47;
          v77 = 1;
        }
        else
        {
          if (-[AlgosScoreStreamDataCSV matchesMethod:code:](v78, "matchesMethod:code:", CFSTR("PlayerSwitchComplete"), v18))
          {
            v48 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("SwCnt"), v70);
            v69 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("OBRLast"), v69);
            v31 = 1.0;
            v70 = v48;
            goto LABEL_95;
          }
          printf("Unused method %lld. Unexpected\n", v18);
        }
        v31 = 1.0;
        goto LABEL_95;
      }
      v27 = objc_msgSend(v3, "intAtRow:col:defaultValue:", v10, CFSTR("TimeWorkingToLTKU"), 0);
      if (v27 >= 500)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "stall-end-4-startup");
        v28.n128_f64[0] = (double)v27;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v28, v5, 0.5, v26);
        v29 = csvData[1];
        if (v29 >= csvData[2])
        {
          v30 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          v30 = v29 + 72;
          csvData[1] = v29 + 72;
        }
        csvData[1] = v30;
        if (v82 < 0)
          operator delete(__p[0]);
        if (v80 < 0)
          operator delete(v79[0]);
      }
      if ((v77 & 1) != 0)
      {
        if (v5 - v73 < 0.0)
        {
          printf("Unexpected stallduration cannot be less than zero start: %1.2f, stop: %1.2f\n", v73, v5);
          ++v65;
        }
        std::string::basic_string[abi:ne180100]<0>(v79, "stall-end-3");
        v35.n128_f64[0] = v5 - v73;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v35, v5, 1.0, v26);
        v36 = csvData[1];
        if (v36 >= csvData[2])
        {
          v37 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          v37 = v36 + 72;
          csvData[1] = v36 + 72;
        }
        csvData[1] = v37;
        if (v82 < 0)
          operator delete(__p[0]);
        if (v80 < 0)
          operator delete(v79[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(v79, "rate");
      v38.n128_f64[0] = v5 - v6;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v38, v5, 1.0, v26);
      v39 = csvData[1];
      if (v39 >= csvData[2])
      {
        v40 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        v40 = v39 + 72;
        csvData[1] = v39 + 72;
      }
      csvData[1] = v40;
      if (v82 < 0)
        operator delete(__p[0]);
      if (v80 < 0)
        operator delete(v79[0]);
      v77 = 0;
      v73 = 0.0;
      v31 = 1.0;
      v70 = -1;
      v71 = -1;
      v68 = 1;
      v72 = -1;
      v69 = -1;
      v32 = v7;
      v67 = 0.0;
      v21 = CFSTR("end");
LABEL_55:
      if (!v20 && (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("start")) & 1) == 0)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "start");
        v41.n128_f64[0] = v24;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v41, v5, v31, v26);
        v42 = csvData[1];
        if (v42 >= csvData[2])
        {
          v43 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          v43 = v42 + 72;
          csvData[1] = v42 + 72;
        }
        csvData[1] = v43;
        if (v82 < 0)
          operator delete(__p[0]);
        if (v80 < 0)
          operator delete(v79[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(v79, (char *)-[__CFString cStringUsingEncoding:](v21, "cStringUsingEncoding:", 4));
      v44.n128_f64[0] = v24;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v44, v5, v31, v26);
      v45 = csvData[1];
      if (v45 >= csvData[2])
      {
        v46 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        v46 = v45 + 72;
        csvData[1] = v45 + 72;
      }
      csvData[1] = v46;
      if (v82 < 0)
        operator delete(__p[0]);
      if (v80 < 0)
        operator delete(v79[0]);
      if (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("rate")))
        v7 = v32;
      else
        v7 = v26;
      ++v8;
      v9 = v5;
    }
    while (v75 != v8);
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    v75 = v49;
    v76 += v8;
  }
  while (v49);

  if ((v77 & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(v79, (char *)objc_msgSend(CFSTR("fake-stall-end"), "cStringUsingEncoding:", 4));
    v50.n128_f64[0] = v24;
    AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v50, v5, 1.0, v26);
    v51 = csvData[1];
    if (v51 >= csvData[2])
    {
      v52 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
    }
    else
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
      v52 = v51 + 72;
      csvData[1] = v51 + 72;
    }
    csvData[1] = v52;
    if (v82 < 0)
      operator delete(__p[0]);
    if (v80 < 0)
      operator delete(v79[0]);
    puts("Received no stall end messages");
    if (v67 - v73 < 0.0)
    {
      v62 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected stallduration cannot be less than zero start: %1.2f, stop: %1.2f"), *(_QWORD *)&v73, *(_QWORD *)&v67, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "errorWithDomain:code:userInfo:", v63, -1, 0);
      v64 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v64);
    }
  }
  if ((v68 & 1) == 0)
  {
LABEL_112:
    objc_msgSend(v3, "rows");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count") == 0;

    if (!v54)
    {
      puts("Received no play end messages, inserting fake rate and end");
      std::string::basic_string[abi:ne180100]<0>(v79, "rate");
      v55.n128_f64[0] = v5 - v6;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v17, v19, v25, v55, v5, v31, v26);
      v56 = csvData[1];
      if (v56 >= csvData[2])
      {
        v57 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        v57 = v56 + 72;
        csvData[1] = v56 + 72;
      }
      csvData[1] = v57;
      if (v82 < 0)
        operator delete(__p[0]);
      if (v80 < 0)
        operator delete(v79[0]);
      std::string::basic_string[abi:ne180100]<0>(v79, (char *)objc_msgSend(CFSTR("end"), "cStringUsingEncoding:", 4));
      v58.n128_f64[0] = v24;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v17, v19, v25, v58, v5, 1.0, v26);
      v59 = csvData[1];
      if (v59 >= csvData[2])
      {
        v60 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        v60 = v59 + 72;
        csvData[1] = v59 + 72;
      }
      csvData[1] = v60;
      if (v82 < 0)
        operator delete(__p[0]);
      if (v80 < 0)
        operator delete(v79[0]);
    }
  }

  return v65;
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
  objc_storeStrong((id *)&self->_methods, a3);
}

- (BOOL)isMusic
{
  return self->_isMusic;
}

- (void)setIsMusic:(BOOL)a3
{
  self->_isMusic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
}

@end
