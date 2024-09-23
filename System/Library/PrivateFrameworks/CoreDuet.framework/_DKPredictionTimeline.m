@implementation _DKPredictionTimeline

- (BOOL)isUnavailable
{
  return -[NSArray count](self->_values, "count") == 0;
}

- (id)valueAtDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDate timeIntervalSinceDate:](self->_startDate, "timeIntervalSinceDate:", v4);
  if (v5 <= 0.0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_transitionDates;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        v13 = v10 + v9;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "timeIntervalSinceDate:", v4, (_QWORD)v16);
          if (v14 > 0.0)
          {
            -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v10 + v12);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("start"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_values, CFSTR("values"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transitionDates, CFSTR("transitions"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_endHistogram, 0);
  objc_storeStrong((id *)&self->_startHistogram, 0);
  objc_storeStrong((id *)&self->_transitionDates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (_DKPredictionTimeline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  _DKPredictionTimeline *v43;
  void *v44;
  void *v46;
  _DKPredictionTimeline *v47;
  id v48;
  void *v49;
  id v50;
  void *context;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x193FEE914]();
  v50 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("values"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v46 = v11;
      v47 = self;
      v48 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v16, "mutableCopy");

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v12;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v60 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x193FEE914]();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __39___DKPredictionTimeline_initWithCoder___block_invoke;
            v57[3] = &unk_1E26E43C8;
            v24 = v17;
            v58 = v24;
            objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v57);
            v25 = (void *)objc_msgSend(v24, "copy");
            objc_msgSend(v15, "addObject:", v25);

            objc_autoreleasePoolPop(v23);
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        }
        while (v19);
      }

      v12 = (void *)objc_msgSend(v15, "copy");
      v11 = v46;
      self = v47;
    }
    else
    {
      objc_msgSend(v12, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
        goto LABEL_21;
      v48 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v17 = v12;
      v28 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v54 != v30)
              objc_enumerationMutation(v17);
            v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            v33 = (void *)MEMORY[0x193FEE914]();
            objc_msgSend(v32, "dk_dedup");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v34);

            objc_autoreleasePoolPop(v33);
          }
          v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        }
        while (v29);
      }

      v12 = (void *)objc_msgSend(v15, "copy");
    }

    v4 = v48;
  }
LABEL_21:
  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("transitions"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");

  if (objc_msgSend(v39, "count"))
  {
    v40 = 0;
    do
    {
      objc_msgSend(v39, "objectAtIndexedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dk_dedup");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:atIndexedSubscript:", v42, v40);

      ++v40;
    }
    while (v40 < objc_msgSend(v39, "count"));
  }
  v43 = 0;
  if (v49 && v12 && v39)
  {
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v50, v49);
    -[_DKSyncType setXpcActivity:]((uint64_t)v50, v12);
    v44 = (void *)objc_msgSend(v39, "copy");
    -[_DKSyncWindow setStartDate:]((uint64_t)v50, v44);

    v43 = (_DKPredictionTimeline *)v50;
  }

  objc_autoreleasePoolPop(context);
  return v43;
}

- (_DKHistogram)startHistogram
{
  return self->_startHistogram;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_startHistogram, a3);
}

- (void)setStartDate:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setEndHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_endHistogram, a3);
}

- (_DKHistogram)endHistogram
{
  return self->_endHistogram;
}

+ (id)predictionUnavailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___DKPredictionTimeline_predictionUnavailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predictionUnavailable_onceToken != -1)
    dispatch_once(&predictionUnavailable_onceToken, block);
  return (id)predictionUnavailable_prediction;
}

- (_QWORD)initWithValues:(void *)a3 forDurations:(void *)a4 startingAt:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)_DKPredictionTimeline;
    v10 = objc_msgSendSuper2(&v31, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 1, a4);
      v26 = v7;
      v11 = objc_msgSend(v7, "copy");
      v12 = (void *)a1[5];
      a1[5] = v11;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        v18 = 0.0;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "doubleValue");
            v18 = v18 + v20;
            objc_msgSend(v9, "dateByAddingTimeInterval:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "dk_dedup");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v16);
      }

      v23 = objc_msgSend(v13, "copy");
      v24 = (void *)a1[2];
      a1[2] = v23;

      v7 = v26;
    }
  }

  return a1;
}

- (id)initWithValues:(void *)a3 eachWithDuration:(double)a4 startingAt:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  objc_super v28;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v28.receiver = a1;
    v28.super_class = (Class)_DKPredictionTimeline;
    a1 = (id *)objc_msgSendSuper2(&v28, sel_init);
    if (a1)
    {
      objc_msgSend(v8, "dk_dedup");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[1];
      a1[1] = (id)v9;

      v11 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[1];
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
      {
        v15 = a4;
      }
      else
      {
        v14 = 1;
        v15 = a4;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v14 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {
            v15 = v15 + a4;
            objc_msgSend(v11, "removeObjectAtIndex:", v14);
          }
          else
          {
            objc_msgSend(v13, "dateByAddingTimeInterval:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "dk_dedup");
            v20 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "addObject:", v20);
            ++v14;
            v15 = a4;
            v13 = (id)v20;
          }
        }
        while (v14 < objc_msgSend(v11, "count"));
      }
      objc_msgSend(v13, "dateByAddingTimeInterval:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dk_dedup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v22);

      v23 = objc_msgSend(v12, "copy");
      v24 = a1[2];
      a1[2] = (id)v23;

      v25 = objc_msgSend(v11, "copy");
      v26 = a1[5];
      a1[5] = (id)v25;

    }
  }

  return a1;
}

+ (id)timelineWithValues:(id)a3 forDurations:(id)a4 startingAt:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_DKPredictionTimeline initWithValues:forDurations:startingAt:](objc_alloc((Class)a1), v10, v9, v8);

  return v11;
}

+ (id)timelineWithValues:(id)a3 eachWithDuration:(double)a4 startingAt:(id)a5
{
  id v8;
  id v9;
  id *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_DKPredictionTimeline initWithValues:eachWithDuration:startingAt:]((id *)objc_alloc((Class)a1), v9, v8, a4);

  return v10;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSArray lastObject](self->_transitionDates, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSDate *)v5;
}

- (id)largestDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5
{
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSDate *startDate;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  id v39;
  void *v40;
  void *v41;
  double v42;
  id v43;
  double v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  NSDate *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (-[_DKPredictionTimeline isUnavailable](self, "isUnavailable"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.1();
LABEL_12:

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v21, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[NSArray lastObject](self->_transitionDates, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", self->_startDate);
  v12 = v11;

  if (v12 < a5)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      startDate = self->_startDate;
      -[NSArray lastObject](self->_transitionDates, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = v13;
      v53 = 2112;
      v54 = startDate;
      v55 = 2112;
      v56 = v15;
      _os_log_error_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_ERROR, "Unable to satisfy minimum duration %@ between %@ and %@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  -[NSArray firstObject](self->_values, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.3((uint64_t)&self->_values, v9, v23, v24, v25, v26, v27, v28);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_startDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", self->_transitionDates);
  if (objc_msgSend(v18, "count") == 1)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0.0;
    goto LABEL_38;
  }
  v31 = 0;
  v32 = 0;
  v20 = 0;
  v50 = 0;
  v33 = 0.0;
  v22 = 0.0;
  do
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v31 + 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    if (v37 < a3 || v37 > a4)
    {
      if (v20)
      {
        if (v33 > v22)
        {
          v39 = v20;

          v50 = v39;
          v22 = v33;
        }

        v33 = 0.0;
      }
      v40 = v32;
      v41 = 0;
      v20 = 0;
      v32 = v34;
      if (!v40)
      {
LABEL_27:
        v43 = v34;
        v20 = v41;
        v40 = v32;
      }
    }
    else
    {
      objc_msgSend(v35, "timeIntervalSinceDate:", v34);
      v33 = v33 + v42;
      v41 = v34;
      v40 = v32;
      if (!v20)
        goto LABEL_27;
    }
    v32 = v40;

    ++v31;
  }
  while (v31 < objc_msgSend(v18, "count") - 1);
  if (v33 <= 0.0 || v32 == 0)
  {
    v46 = v33 <= 0.0;
  }
  else
  {
    objc_msgSend(v32, "timeIntervalSinceDate:", self->_startDate);
    v33 = v33 + v45;
    v46 = v33 <= v22;
  }
  v21 = v50;
  if (!v46)
  {
    v20 = v20;

    v21 = v20;
    v22 = v33;
  }
  v19 = v32;
LABEL_38:
  if (v22 >= a5)
  {
    +[_CDDateRange periodWithStart:duration:](_CDDateRange, "periodWithStart:duration:", v21, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v48, v49);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v29;
}

- (id)nextDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5
{
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSDate *startDate;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v37;
  void *v38;
  double v39;
  id v40;
  void *v42;
  double v43;
  double v44;
  NSObject *v45;
  void *v46;
  NSArray **p_values;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  NSDate *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (-[_DKPredictionTimeline isUnavailable](self, "isUnavailable"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.1();
LABEL_12:

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v18, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[NSArray lastObject](self->_transitionDates, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", self->_startDate);
  v12 = v11;

  if (v12 < a5)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      startDate = self->_startDate;
      -[NSArray lastObject](self->_transitionDates, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v13;
      v50 = 2112;
      v51 = startDate;
      v52 = 2112;
      v53 = v15;
      _os_log_error_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_ERROR, "Unable to satisfy minimum duration %@ between %@ and %@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  p_values = &self->_values;
  -[NSArray firstObject](self->_values, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.3((uint64_t)p_values, v9, v22, v23, v24, v25, v26, v27);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_startDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", self->_transitionDates);
  if (objc_msgSend(v18, "count") == 1)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0.0;
    goto LABEL_33;
  }
  v30 = 0;
  v31 = 0;
  v20 = 0;
  v21 = 0.0;
  do
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v30 + 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](*p_values, "objectAtIndexedSubscript:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    if (v35 < a3 || v35 > a4)
    {
      if (v20)
      {
        if (v21 >= a5)
        {
          +[_CDDateRange periodWithStart:duration:](_CDDateRange, "periodWithStart:duration:", v20, v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_40;
        }

        v21 = 0.0;
      }
      v37 = 0;
      v20 = 0;
      v38 = v32;
      if (!v31)
      {
LABEL_26:
        v40 = v32;
        v20 = v37;
        v31 = v38;
      }
    }
    else
    {
      objc_msgSend(v33, "timeIntervalSinceDate:", v32);
      v21 = v21 + v39;
      v37 = v32;
      v38 = v31;
      if (!v20)
        goto LABEL_26;
    }

    ++v30;
  }
  while (v30 < objc_msgSend(v18, "count") - 1);
  v19 = v31;
  if (v21 > 0.0 && v31 != 0)
  {
    objc_msgSend(v31, "timeIntervalSinceDate:", self->_startDate);
    v43 = v21 + v44;
    if (v43 < a5)
      goto LABEL_36;
    v42 = v20;
LABEL_42:
    +[_CDDateRange periodWithStart:duration:](_CDDateRange, "periodWithStart:duration:", v42, v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
LABEL_33:
  v31 = v19;
  if (v21 >= a5)
  {
    v42 = v20;
    v43 = v21;
    goto LABEL_42;
  }
LABEL_36:
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v32, v46);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
LABEL_43:

LABEL_13:
  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_DKPredictionTimeline setStartDate:]((uint64_t)v4, self->_startDate);
  v5 = (void *)-[NSArray copy](self->_values, "copy");
  -[_DKSyncType setXpcActivity:]((uint64_t)v4, v5);

  v6 = (void *)-[NSArray copy](self->_transitionDates, "copy");
  -[_DKSyncWindow setStartDate:]((uint64_t)v4, v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DKPredictionTimeline *v4;
  _DKPredictionTimeline *v5;
  int v6;
  int v7;
  char v8;
  NSDate *startDate;
  void *v10;
  NSArray *values;
  NSArray *v12;
  NSArray *v13;
  NSArray *transitionDates;
  void *v15;

  v4 = (_DKPredictionTimeline *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_DKPredictionTimeline isUnavailable](self, "isUnavailable");
      v7 = -[_DKPredictionTimeline isUnavailable](v5, "isUnavailable");
      if (v6 && (v7 & 1) != 0)
      {
        v8 = 1;
      }
      else if (v6 == v7)
      {
        startDate = self->_startDate;
        -[_DKPredictionTimeline startDate](v5, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqual:](startDate, "isEqual:", v10))
        {
          values = self->_values;
          if (v5)
            v12 = v5->_values;
          else
            v12 = 0;
          v13 = v12;
          if (-[NSArray isEqual:](values, "isEqual:", v13))
          {
            transitionDates = self->_transitionDates;
            -[_DKPredictionTimeline transitionDates](v5, "transitionDates");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[NSArray isEqual:](transitionDates, "isEqual:", v15);

          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  NSDate *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[_DKPredictionTimeline isUnavailable](self, "isUnavailable"))
    return CFSTR("<_DKPrediction> [ Prediction Unavailable ]");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", "<_DKPrediction>: [\n");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = self->_startDate;
  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_62);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_transitionDates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend((id)description_formatter, "stringFromDate:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)description_formatter, "stringFromDate:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v7 + v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR("\t(%@ - %@): %@\n"), v12, v13, v14);

        v4 = v11;
        ++v9;
        v10 = v4;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 += v9;
    }
    while (v6);
  }

  objc_msgSend(v16, "appendString:", CFSTR("]"));
  return v16;
}

- (NSArray)transitionDates
{
  return self->_transitionDates;
}

- (void)largestDateRangeWithValuesBetween:and:ofMinimumDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Prediction is unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)largestDateRangeWithValuesBetween:and:ofMinimumDuration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Unknown prediction timeline failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)largestDateRangeWithValuesBetween:(uint64_t)a3 and:(uint64_t)a4 ofMinimumDuration:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Values are not NSNumber... %@", a5, a6, a7, a8, 2u);
}

@end
