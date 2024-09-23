@implementation PHImportResults

- (PHImportResults)init
{
  PHImportResults *v2;
  uint64_t v3;
  NSMutableArray *importRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHImportResults;
  v2 = -[PHImportExceptionRecorder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    importRecords = v2->_importRecords;
    v2->_importRecords = (NSMutableArray *)v3;

  }
  return v2;
}

- (unsigned)result
{
  int v2;
  void *v4;
  uint64_t v5;

  v2 = self->_result;
  if (v2 != 3)
  {
    if (-[PHImportResults importedCount](self, "importedCount"))
    {
      -[PHImportResults exceptions](self, "exceptions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
        LOBYTE(v2) = 2;
      else
        LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = 4;
    }
    self->_result = v2;
  }
  return v2;
}

- (void)addUnsupportedPath:(id)a3
{
  id v3;

  v3 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 1, a3, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportResults.m", 104);
}

- (void)addImportRecord:(id)a3
{
  -[NSMutableArray addObject:](self->_importRecords, "addObject:", a3);
}

- (unint64_t)importedCount
{
  return -[NSMutableArray count](self->_importRecords, "count");
}

- (unint64_t)failedToImportCount
{
  void *v2;
  unint64_t v3;

  -[PHImportResults importRecordExceptions](self, "importRecordExceptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)importRecordExceptions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_importRecords;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "exceptions", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)exceptions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10.receiver = self;
  v10.super_class = (Class)PHImportResults;
  -[PHImportExceptionRecorder exceptions](&v10, sel_exceptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHImportResults;
    -[PHImportExceptionRecorder exceptions](&v9, sel_exceptions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[PHImportResults importRecordExceptions](self, "importRecordExceptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (NSError)error
{
  void *v2;
  void *v3;
  void *v4;

  -[PHImportResults exceptions](self, "exceptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "underlyingError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

- (double)runTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[PHImportResults startTime](self, "startTime");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[PHImportResults endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[PHImportResults endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportResults startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (id)generatePMRInfo
{
  PHImportResults *v2;
  NSMutableDictionary *pmrInfo;
  void *v4;
  uint64_t i;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  id obj;
  uint64_t v44;
  uint64_t v45;
  PHImportResults *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[3];
  _QWORD v59[3];
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  _BYTE v64[128];
  _QWORD v65[2];
  _QWORD v66[2];
  _BYTE v67[128];
  _OWORD v68[8];
  uint64_t v69;
  _OWORD v70[8];
  uint64_t v71;
  uint64_t v72;

  v2 = self;
  v72 = *MEMORY[0x1E0C80C00];
  pmrInfo = self->_pmrInfo;
  if (!pmrInfo)
  {
    if (generatePMRInfo_onceToken != -1)
      dispatch_once(&generatePMRInfo_onceToken, &__block_literal_global_34345);
    v71 = 0;
    memset(v70, 0, sizeof(v70));
    v69 = 0;
    memset(v68, 0, sizeof(v68));
    v4 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = v2;
    -[PHImportResults importRecords](v2, "importRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(obj);
          v6 = 0;
          v7 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          do
          {
            if (objc_msgSend(v4, "count") <= v6)
            {
              v8 = (void *)objc_opt_new();
              objc_msgSend(v4, "addObject:", v8);
            }
            else
            {
              objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "timers");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "duration:", v6);
            v11 = v10;

            if (v11 > 0.0)
            {
              ++*((_QWORD *)v70 + v6);
              *((double *)v68 + v6) = v11 + *((double *)v68 + v6);
              objc_msgSend(v7, "timers");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __34__PHImportResults_generatePMRInfo__block_invoke_2;
              v51[3] = &unk_1E35DDD38;
              v51[4] = v2;
              v52 = v8;
              v53 = v6;
              objc_msgSend(v12, "processTimesOfType:withBlock:", v6, v51);

            }
            ++v6;
          }
          while (v6 != 17);
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v45);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 17);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v2->_pmrInfo;
    v2->_pmrInfo = (NSMutableDictionary *)v13;

    v65[0] = CFSTR("Count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHImportResults importedCount](v2, "importedCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = CFSTR("Duration");
    v66[0] = v15;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportResults runTime](v2, "runTime");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v2->_pmrInfo;
    objc_msgSend((id)pmrKey, "objectAtIndexedSubscript:", 17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

    for (j = 0; j != 17; ++j)
    {
      v22 = *((_QWORD *)v70 + j);
      if (v22)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
        if (!v25)
        {

LABEL_38:
          _PFAssertFailHandler();
        }
        v26 = v25;
        v27 = *(_QWORD *)v48;
        v28 = 0.0;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(v24);
            v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
            objc_msgSend(v30, "end");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "start");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceDate:", v32);
            v28 = v28 + v33;

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
        }
        while (v26);

        v2 = v46;
        if (v28 == 0.0)
          goto LABEL_38;
        v34 = *((double *)v68 + j);
        if (v34 == 0.0)
          goto LABEL_38;
        if (v28 > v34)
        {
          PLImportGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349312;
            v61 = v28;
            v62 = 2050;
            v63 = v34;
            _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "It is unexpected for duration (%{public}g) to be <= absoluteDuration (%{public}g)", buf, 0x16u);
          }

        }
        v58[0] = CFSTR("Count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v36;
        v58[1] = CFSTR("Duration");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v37;
        v58[2] = CFSTR("Absolute Duration");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v46->_pmrInfo;
        objc_msgSend((id)pmrKey, "objectAtIndexedSubscript:", j);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v39, v41);

      }
    }

    pmrInfo = v2->_pmrInfo;
  }
  return pmrInfo;
}

- (void)insertStart:(id)a3 end:(id)a4 intoGroups:(id)a5 ofType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  DurationGroup *v15;
  uint64_t v16;
  uint64_t v17;
  DurationGroup *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = a5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v13)
  {
LABEL_13:

LABEL_22:
    v15 = -[DurationGroup initWithStart:end:]([DurationGroup alloc], "initWithStart:end:", v10, v11);
    objc_msgSend(v12, "addObject:", v15);
    goto LABEL_23;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v37;
LABEL_3:
  v17 = 0;
  v18 = v15;
  while (1)
  {
    if (*(_QWORD *)v37 != v16)
      objc_enumerationMutation(v12);
    v15 = (DurationGroup *)*(id *)(*((_QWORD *)&v36 + 1) + 8 * v17);

    -[DurationGroup start](v15, "start", (_QWORD)v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v19);
    v21 = v20;

    if (v21 < 0.0)
      break;
    -[DurationGroup end](v15, "end");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v25);
    v27 = v26;

    if (v27 < 0.0)
    {
      -[DurationGroup end](v15, "end");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v31);
      v33 = v32;

      if (v33 < 0.0)
        goto LABEL_19;
      goto LABEL_17;
    }
LABEL_10:
    ++v17;
    v18 = v15;
    if (v14 == v17)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v14)
        goto LABEL_3;

      goto LABEL_13;
    }
  }
  -[DurationGroup start](v15, "start");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v22);
  v24 = v23;

  if (v24 < 0.0)
    goto LABEL_10;
  -[DurationGroup setStart:](v15, "setStart:", v10);
  -[DurationGroup end](v15, "end");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v28);
  v30 = v29;

  if (v30 >= 0.0)
LABEL_17:
    -[DurationGroup setEnd:](v15, "setEnd:", v11);
  -[DurationGroup setWasChanged:](v15, "setWasChanged:", 1);
LABEL_19:

  if (!v15)
    goto LABEL_22;
  if (-[DurationGroup wasChanged](v15, "wasChanged"))
  {
    objc_msgSend(v12, "removeObject:", v15);
    -[DurationGroup start](v15, "start");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DurationGroup end](v15, "end");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults insertStart:end:intoGroups:ofType:](self, "insertStart:end:intoGroups:ofType:", v34, v35, v12, a6);

  }
LABEL_23:

}

- (void)verifyGroups:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v3 = 0;
  v30 = *MEMORY[0x1E0C80C00];
  do
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_88);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          v11 = v8;
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          PLImportGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend((id)pmrKey, "objectAtIndexedSubscript:", v3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v26 = v14;
            v27 = 2112;
            v28 = v12;
            _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "%@: created group: %@", buf, 0x16u);

          }
          if (v11)
          {
            objc_msgSend(v12, "start");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "end");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeIntervalSinceDate:", v16);
            v18 = v17;

            if (v18 < 0.0)
            {
              PLImportGetLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v26 = v11;
                v27 = 2112;
                v28 = v12;
                _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "!!!!!!!!!!ERROR: Found a group (%@) which overlaps another group (%@)", buf, 0x16u);
              }

            }
          }
          v8 = v12;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v7);

    }
    ++v3;
  }
  while (v3 != 17);
}

- (void)log:(id)a3 activity:(id)a4 description:(id)a5 digits:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Duration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v18, "appendFormat:", CFSTR("%@%8.4f"), v9, *(_QWORD *)&v14);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Absolute Duration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    if (v14 != v17)
      objc_msgSend(v18, "appendFormat:", CFSTR(" (ab: %.3f, av: %.3f)"), *(_QWORD *)&v17, v17 / (double)v11);
    objc_msgSend(v18, "appendString:", CFSTR("\n"));
  }

}

- (void)logPMR
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    -[PHImportResults generatePMRInfo](self, "generatePMRInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportTotalTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8)
    {
      LODWORD(v9) = 0;
      v10 = v8;
      do
      {
        v9 = (v9 + 1);
        v11 = v10 > 9;
        v10 /= 0xAuLL;
      }
      while (v11);
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", CFSTR("\t============================================================\n"));
    objc_msgSend(v12, "appendString:", CFSTR("\t                    Import Performance                      \n"));
    objc_msgSend(v12, "appendString:", CFSTR("\t============================================================\n"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportTotalTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Duration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v12, "appendFormat:", CFSTR("\tTotal time to import %lu items: %8.4f\n"), v8, v15);

    objc_msgSend(v12, "appendString:", CFSTR("\t------------------------------------------------------------\n"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportDownload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults log:activity:description:digits:](self, "log:activity:description:digits:", v12, v16, CFSTR("\tDownload files:           "), v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportReadMetadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults log:activity:description:digits:](self, "log:activity:description:digits:", v12, v17, CFSTR("\tRead metadata:            "), v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportAdjustments"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults log:activity:description:digits:](self, "log:activity:description:digits:", v12, v18, CFSTR("\tApply adjustments:        "), v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportLivePhotoPairing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults log:activity:description:digits:](self, "log:activity:description:digits:", v12, v19, CFSTR("\tPair LivePhotos:          "), v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportMisc"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportResults log:activity:description:digits:](self, "log:activity:description:digits:", v12, v20, CFSTR("\tMiscellaneous processing: "), v9);

    objc_msgSend(v12, "appendString:", CFSTR("\t============================================================\n"));
    PLImportGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEBUG, "PMR %@", buf, 0xCu);
    }

  }
}

- (PHImportSource)importSource
{
  return (PHImportSource *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)importRecords
{
  return self->_importRecords;
}

- (void)setImportRecords:(id)a3
{
  objc_storeStrong((id *)&self->_importRecords, a3);
}

- (void)setResult:(unsigned __int8)a3
{
  self->_result = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSMutableDictionary)pmrInfo
{
  return self->_pmrInfo;
}

- (void)setPmrInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pmrInfo, a3);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PHImportException)highestPriorityException
{
  return (PHImportException *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestPriorityException, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pmrInfo, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_importRecords, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
}

uint64_t __32__PHImportResults_verifyGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 >= 0.0)
  {
    objc_msgSend(v4, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v10 = v13 > 0.0;

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

uint64_t __34__PHImportResults_generatePMRInfo__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertStart:end:intoGroups:ofType:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __34__PHImportResults_generatePMRInfo__block_invoke()
{
  void *v0;

  v0 = (void *)pmrKey;
  pmrKey = (uint64_t)&unk_1E36575A0;

}

+ (PHImportResults)resultsWithException:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addException:", v3);

  return (PHImportResults *)v4;
}

+ (PHImportResults)resultsWithExceptions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addExceptions:", v3);

  return (PHImportResults *)v4;
}

@end
