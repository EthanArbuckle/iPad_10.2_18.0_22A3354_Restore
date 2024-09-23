@implementation AlgosScoreFaceTimeDataCSV

+ (id)facetimeDataCSV
{
  return objc_alloc_init(AlgosScoreFaceTimeDataCSV);
}

- (id)setUpMethods
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD130, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("RealTimeStats"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("CallSegmentReport"));

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C3CD160, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("CallEnd"));

  return v2;
}

- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[AlgosScoreFaceTimeDataCSV methods](self, "methods");
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
  -[AlgosScoreFaceTimeDataCSV methods](self, "methods");
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
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3, (_QWORD)v14);
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

- (AlgosScoreFaceTimeDataCSV)init
{
  AlgosScoreFaceTimeDataCSV *v2;
  AlgosScoreFaceTimeDataCSV *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AlgosScoreFaceTimeDataCSV;
  v2 = -[AlgosScoreDataCSV init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AlgosScoreFaceTimeDataCSV setUpMethods](v2, "setUpMethods");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AlgosScoreFaceTimeDataCSV setMethods:](v3, "setMethods:", v4);

  }
  return v3;
}

- (int)transformer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t *csvData;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  __n128 v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  _BYTE *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  _BOOL8 v65;
  id v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  void *v70;
  __n128 v71;
  double v72;
  unint64_t v73;
  uint64_t v74;
  __n128 v75;
  unint64_t v76;
  uint64_t v77;
  __n128 v78;
  unint64_t v79;
  uint64_t v80;
  double v81;
  void *v82;
  void *v83;
  id v85;
  int v86;
  unint64_t v87;
  double v88;
  id obj;
  double v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  void *v98;
  void *v99;
  void *v100[2];
  char v101;
  void *__p[2];
  char v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortOnColumn:ascending:", CFSTR("eventTime"), 1);

  -[AlgosScoreDataCSV clearStreamingData](self, "clearStreamingData");
  -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleAtRow:col:defaultValue:", v6, CFSTR("eventTime"), 0.0);
  v93 = v7;

  csvData = (uint64_t *)self->super.csvData;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
  if (!v11)
  {

    v81 = 0.0;
    goto LABEL_86;
  }
  v12 = 0;
  v13 = 0;
  v87 = 0;
  v91 = *(_QWORD *)v105;
  v90 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v88 = 0.0;
  v16 = 0.0;
  do
  {
    v95 = 0;
    v92 = v11;
    v94 = v13;
    v86 = v13 + v11;
    v17 = v12;
    v18 = v16;
    do
    {
      if (*(_QWORD *)v105 != v91)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v95);
      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleAtRow:col:defaultValue:", v19, CFSTR("eventTime"), 0.0);
      v22 = v21;

      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v23, "intAtRow:col:defaultValue:", v19, CFSTR("TTxR"), v17);

      if (v96)
        v24 = fmin((double)v96 / 1949.0, 1.0);
      else
        v24 = 0.0;
      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intAtRow:col:defaultValue:", v19, CFSTR("_method"), 0);

      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intAtRow:col:defaultValue:", v19, CFSTR("DERR"), 0);

      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleAtRow:col:defaultValue:", v19, CFSTR("VST"), v15);
      v31 = v30;

      v32 = v31;
      -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleAtRow:col:defaultValue:", v19, CFSTR("APT"), v14);
      v35 = v34;

      v36 = v35;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22 - v93;
      v38 = (v16 - v18) * 1000.0;
      if (v94)
        goto LABEL_10;
      std::string::basic_string[abi:ne180100]<0>(v100, "start");
      v40.n128_u64[0] = 0;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, 0, v28 != 0, v38, v40, v16, 1.0, v24);
      v41 = csvData[1];
      if (v41 >= csvData[2])
      {
        v42 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        v42 = v41 + 72;
        csvData[1] = v41 + 72;
      }
      csvData[1] = v42;
      if (v103 < 0)
        operator delete(__p[0]);
      if (v101 < 0)
        operator delete(v100[0]);
      if (v32 == 0.0)
      {
LABEL_10:
        v39 = v16;
      }
      else
      {
        v93 = v93 - v32;
        v39 = v32;
        v38 = v32;
      }
      if (-[AlgosScoreFaceTimeDataCSV matchesMethod:code:](self, "matchesMethod:code:", CFSTR("CallEnd"), v26))
      {
        -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleAtRow:col:defaultValue:", v19, CFSTR("AEAP"), 0.0);
        v44 = 0;
        v32 = 0.0;
        v36 = 0.0;
        v45 = CFSTR("end");
        v88 = v46 / 10000.0;
        goto LABEL_46;
      }
      if (-[AlgosScoreFaceTimeDataCSV matchesMethod:code:](self, "matchesMethod:code:", CFSTR("CallSegmentReport"), v26))
      {
        -[AlgosScoreDataCSV rawStreamData](self, "rawStreamData");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "atRow:col:", v19, CFSTR("CONFIG"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v43, "isEqualToString:", &stru_24C3CB9B8) & 1) != 0)
        {
          v44 = 0;
        }
        else
        {
          objc_msgSend(v43, "componentsSeparatedByString:", CFSTR(":"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v53, "count") <= 3)
          {
            objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Not enough components for CONFIG"), 0, 0);
            v85 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v85);
          }
          objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v54, "isEqualToString:", CFSTR("W")) & 1) != 0)
          {
            v44 = 1;
          }
          else
          {
            objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v55, "isEqualToString:", CFSTR("W"));

          }
        }
        v56 = 0x8E38E38E38E38E39 * ((csvData[1] - *csvData) >> 3);
        v57 = v56 - v87;
        if (v56 > v87)
        {
          v58 = (_BYTE *)(*csvData + 72 * v87 + 64);
          do
          {
            *v58 = v44;
            v58 += 72;
            --v57;
          }
          while (v57);
        }
        v87 = v56 + 1;
LABEL_45:
        v45 = &stru_24C3CB9B8;
LABEL_46:

        v15 = v32;
        v14 = v36;
        if (!v17)
          goto LABEL_49;
        goto LABEL_47;
      }
      if (-[AlgosScoreFaceTimeDataCSV matchesMethod:code:](self, "matchesMethod:code:", CFSTR("RealTimeStats"), v26))
      {
        if (v32 != v15)
        {
          objc_msgSend(v37, "addObject:", CFSTR("stall-end-1"));
          v48 = (v32 - v15) * 1000.0;
          if (v48 < 500.0)
            v48 = 0.0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v49);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v50);

        }
        if (v36 != v14)
        {
          objc_msgSend(v37, "addObject:", CFSTR("stall-end-2"));
          v51 = (v36 - v14) * 1000.0;
          if (v51 < 500.0)
            v51 = 0.0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v52);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v43);
          v44 = 0;
          goto LABEL_45;
        }
      }
      v44 = 0;
      v15 = v32;
      v14 = v36;
      v45 = &stru_24C3CB9B8;
      if (!v17)
        goto LABEL_49;
LABEL_47:
      if (v17 == v96)
      {
        v96 = v17;
        goto LABEL_54;
      }
LABEL_49:
      if (-[__CFString isEqualToString:](v45, "isEqualToString:", &stru_24C3CB9B8)
        && !objc_msgSend(v37, "count"))
      {
        v90 = v39;
      }
      else
      {
        if (!objc_msgSend(v37, "count"))
        {
          objc_msgSend(v37, "addObject:", v45);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v59);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v60);

        }
        objc_msgSend(v37, "addObject:", CFSTR("rate"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v39 - v90) * 1000.0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "addObject:", v61);

        objc_msgSend(v98, "addObject:", &unk_24C3CD1B0);
        v90 = v39;
      }
LABEL_54:
      v62 = objc_msgSend(v37, "count");
      v63 = v39 * 1000.0;
      if (v62)
      {
        v64 = 0;
        v65 = v28 != 0;
        do
        {
          objc_msgSend(v37, "objectAtIndexedSubscript:", v64);
          v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(v100, (char *)objc_msgSend(v66, "cStringUsingEncoding:", 4));
          objc_msgSend(v99, "objectAtIndexedSubscript:", v64);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          v69 = v68;
          objc_msgSend(v98, "objectAtIndexedSubscript:", v64);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "doubleValue");
          v71.n128_u64[0] = v69;
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, v44, v65, v38, v71, v63, v72, v24);
          v73 = csvData[1];
          if (v73 >= csvData[2])
          {
            v74 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
          }
          else
          {
            AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
            v74 = v73 + 72;
            csvData[1] = v73 + 72;
          }
          csvData[1] = v74;
          if (v103 < 0)
            operator delete(__p[0]);

          if (v101 < 0)
            operator delete(v100[0]);

          ++v64;
        }
        while (v62 != v64);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v100, (char *)-[__CFString cStringUsingEncoding:](v45, "cStringUsingEncoding:", 4));
        v75.n128_u64[0] = 0;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, v44, v28 != 0, v38, v75, v63, 1.0, v24);
        v76 = csvData[1];
        if (v76 >= csvData[2])
        {
          v77 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          v77 = v76 + 72;
          csvData[1] = v76 + 72;
        }
        csvData[1] = v77;
        if (v103 < 0)
          operator delete(__p[0]);
        if (v101 < 0)
          operator delete(v100[0]);
      }

      ++v94;
      v12 = v96;
      v17 = v96;
      v18 = v16;
      ++v95;
    }
    while (v95 != v92);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
    v13 = v86;
  }
  while (v11);

  if (v88 != 0.0)
  {
    std::string::basic_string[abi:ne180100]<0>(v100, "fixed-penalty");
    v78.n128_u64[0] = 0;
    AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, 0, 0, 0.0, v78, v63, v88 * 35.0, 0.0);
    v79 = csvData[1];
    if (v79 >= csvData[2])
    {
      v80 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
    }
    else
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
      v80 = v79 + 72;
      csvData[1] = v79 + 72;
    }
    csvData[1] = v80;
    if (v103 < 0)
      operator delete(__p[0]);
    if (v101 < 0)
      operator delete(v100[0]);
  }
  v81 = v88;
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlgosScoreDataCSV statsDict](self, "statsDict");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, CFSTR("audio-erasure"));

  return 0;
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
  objc_storeStrong((id *)&self->_methods, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
}

@end
