@implementation StabilizationSuccessClassifier

- (StabilizationSuccessClassifier)init
{
  self->classifierMode = 444;
  *(_OWORD *)&self->subsegmentLength = xmmword_1D4DB2520;
  self->lastClassifierScore = 0.0;
  return self;
}

- (float)calcLogisticForStats:(id)a3 paramsForStats:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  float v26;
  long double v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = a4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
      objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
        break;
      objc_msgSend(v15, "doubleValue");
      v18 = v17;
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v11 = v11 + (v18 - v21) * v24;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", qword_1EFEFADB8, 555200, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_15;
    v26 = NAN;
    if (!a5)
      goto LABEL_17;
LABEL_16:
    *a5 = objc_retainAutorelease(v25);
    goto LABEL_17;
  }
  v11 = 0.0;
LABEL_14:

LABEL_15:
  v27 = exp(v11);
  v25 = 0;
  v26 = v27 / (v27 + 1.0);
  if (a5)
    goto LABEL_16;
LABEL_17:

  return v26;
}

- (id)getSequentialParamDict
{
  return &unk_1E9896C78;
}

- (id)getTripodCorrectionParamDict
{
  return &unk_1E9896CA0;
}

- (id)getSequentialAnalysisCoeffsDict
{
  return &unk_1E9896CC8;
}

- (id)getDefaultParamDict
{
  int classifierMode;
  void *v3;

  classifierMode = self->classifierMode;
  if (classifierMode == 445)
  {
    -[StabilizationSuccessClassifier getSequentialParamDict](self, "getSequentialParamDict");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (classifierMode == 444)
  {
    -[StabilizationSuccessClassifier getTripodCorrectionParamDict](self, "getTripodCorrectionParamDict");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)AddStats:(StabStatsRecord *)a3 toDict:(id)a4 withBaseName:(id)a5
{
  id v7;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_min"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_max"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_mean"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_std"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_absmax"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var2 - a3->var1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_range"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_rms"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v21);

}

- (id)calcStatsDictForArray:(id)a3 withKey:(id)a4 firstIndex:(int)a5 lastIndex:(int)a6 usingTempStorage:(void *)a7 outErr:(id *)a8
{
  id v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v26;
  void *v27;
  id *v28;
  StabilizationSuccessClassifier *v29;
  void *__p;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36[6];

  v14 = a3;
  v15 = a4;
  if (a5 < 0
    || objc_msgSend(v14, "count") <= (unint64_t)a5
    || (v16 = a6 - a5, a6 < a5)
    || a6 < 0
    || objc_msgSend(v14, "count") <= (unint64_t)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", qword_1EFEFADB8, 555201, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = a8;
    v29 = self;
    v18 = (v16 + 1);
    sub_1D4D6455C((uint64_t)a7, (int)v18);
    v19 = 0;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", a5 + v19, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v21)
        break;
      objc_msgSend(v21, "floatValue");
      *(double *)(*(_QWORD *)a7 + 8 * v19) = v23;

      if (v18 == ++v19)
      {
        v24 = 0;
        goto LABEL_16;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", qword_1EFEFADB8, 555202, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    -[StabilizationSuccessClassifier AddStats:toDict:withBaseName:](v29, "AddStats:toDict:withBaseName:", v36, v17, v15, sub_1D4D8CDB0((double **)a7, v36));
    v33 = 0;
    v34 = 0;
    v35 = 0;
    sub_1D4D8CE70(a7, (double **)&v33);
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("_delta"), sub_1D4D8CDB0((double **)&v33, v36));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[StabilizationSuccessClassifier AddStats:toDict:withBaseName:](v29, "AddStats:toDict:withBaseName:", v36, v17, v26);
    a8 = v28;

    __p = 0;
    v31 = 0;
    v32 = 0;
    sub_1D4D8CE70(&v33, (double **)&__p);
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("_2ndderiv"), sub_1D4D8CDB0((double **)&__p, v36));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[StabilizationSuccessClassifier AddStats:toDict:withBaseName:](v29, "AddStats:toDict:withBaseName:", v36, v17, v27);

    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
    if (v33)
    {
      v34 = v33;
      operator delete(v33);
    }
  }
  if (v24)
  {

    v17 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v24);
  }

  return v17;
}

- (id)statsDictFromFrameArray:(id)a3 firstIndex:(int)a4 lastIndex:(int)a5 errorOut:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p;
  void *v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 0x80000000) != 0
    || objc_msgSend(v9, "count") <= (unint64_t)v7
    || (int)v7 > (int)v6
    || (v6 & 0x80000000) != 0
    || objc_msgSend(v9, "count") <= (unint64_t)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", qword_1EFEFADB8, 555201, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    __p = 0;
    v28 = 0;
    v29 = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = 0;
          -[StabilizationSuccessClassifier calcStatsDictForArray:withKey:firstIndex:lastIndex:usingTempStorage:outErr:](self, "calcStatsDictForArray:withKey:firstIndex:lastIndex:usingTempStorage:outErr:", v9, v14, v7, v6, &__p, &v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v22;
          if (v16)
          {
            v17 = v16;

            goto LABEL_21;
          }
          objc_msgSend(v10, "addEntriesFromDictionary:", v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_21:

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E9895D58, CFSTR("_intercept"));
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }

  }
  if (v17)
  {

    v10 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v17);
  }

  return v10;
}

- (BOOL)testForHomographies:(const void *)a3 movieSize:(Int32Size)a4 firstIndex:(int)a5 lastIndex:(int)a6 scoreThreshold:(float)a7 errorOut:(id *)a8 verbose:(BOOL)a9
{
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  int subsegmentLength;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;
  float v24;
  float v25;
  float lastClassifierScore;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v32;

  v29 = a9;
  self->lastClassifierScore = 0.0;
  sub_1D4D5249C((uint64_t *)a3, *(_QWORD *)&a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[StabilizationSuccessClassifier getDefaultParamDict](self, "getDefaultParamDict");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 1;
  v14 = 1;
  while (1)
  {
    subsegmentLength = self->subsegmentLength;
    v16 = objc_msgSend(v11, "count");
    v17 = v12 + subsegmentLength;
    v18 = v17 - 1;
    v19 = v16 - 1;
    if (v16 - 1 <= (unint64_t)(v17 - 1))
    {
      v21 = objc_msgSend(v11, "count") - 1;
      v12 = ((_DWORD)v12 - v18 + v21) & ~(((int)v12 - v18 + v21) >> 31);
      v20 = v21 & ~(v21 >> 31);
    }
    else
    {
      v20 = (v17 - 1);
    }
    v32 = 0;
    -[StabilizationSuccessClassifier statsDictFromFrameArray:firstIndex:lastIndex:errorOut:](self, "statsDictFromFrameArray:firstIndex:lastIndex:errorOut:", v11, v12, v20, &v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v23)
      break;
    v31 = 0;
    -[StabilizationSuccessClassifier calcLogisticForStats:paramsForStats:error:](self, "calcLogisticForStats:paramsForStats:error:", v22, v30, &v31);
    v25 = v24;
    v23 = v31;
    if (v29)
      NSLog(CFSTR("subsegment classifier yscore from frame %d to %d (relative to start) : %f\n"), v12, v20, v25);
    lastClassifierScore = v25;
    if ((v14 & 1) == 0)
    {
      lastClassifierScore = self->lastClassifierScore;
      if (v25 < lastClassifierScore)
        lastClassifierScore = v25;
    }
    self->lastClassifierScore = lastClassifierScore;
    v13 &= v25 >= a7;
    if (v19 <= v18 || objc_msgSend(v11, "count") - 1 == (int)v20)
      break;
    v12 = (v12 + LODWORD(self->subsegmentStep));

    v14 = 0;
    if (v23)
      goto LABEL_16;
  }

LABEL_16:
  if (a8)
    *a8 = objc_retainAutorelease(v23);

  return v13 & 1;
}

- (id)applyClassifierToOverlappedSegments:(void *)a3 withCoefficientsDict:(id)a4 movieSize:(Int32Size)a5 firstIndex:(int)a6 lastIndex:(int)a7 stride:(int)a8 length:(int)a9 result:(float *)a10 verbose:(BOOL)a11 minThreshold:(float)a12
{
  uint64_t v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  float v29;
  float v30;
  id v31;
  float lastClassifierScore;
  char v34;
  id v36;
  void *v37;
  id v38;
  id v39;

  v18 = a9;
  v36 = a4;
  if (a7 <= a6 || (a7 - a6 + 1 >= a9 ? (v19 = a9 <= 2) : (v19 = 1), v19))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", qword_1EFEFADB8, 555201, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->lastClassifierScore = 0.0;
    sub_1D4D5249C((uint64_t *)a3, *(_QWORD *)&a5, a6, a7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v34 = 1;
    while (1)
    {
      v22 = objc_msgSend(v37, "count");
      v23 = v21 + v18;
      v24 = v21 + v18;
      if (v22 <= (int)v21 + (int)v18)
      {
        v25 = objc_msgSend(v37, "count");
        v21 = (v25 - (_DWORD)v18) & ~((v25 - (int)v18) >> 31);
        if (v25 <= 1)
          v24 = 1;
        else
          v24 = v25;
      }
      v26 = v18;
      v39 = 0;
      -[StabilizationSuccessClassifier statsDictFromFrameArray:firstIndex:lastIndex:errorOut:](self, "statsDictFromFrameArray:firstIndex:lastIndex:errorOut:", v37, v21, (v24 - 1), &v39);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v39;
      if (v28)
        break;
      v38 = 0;
      -[StabilizationSuccessClassifier calcLogisticForStats:paramsForStats:error:](self, "calcLogisticForStats:paramsForStats:error:", v27, v36, &v38);
      v30 = v29;
      v31 = v38;
      if (a11)
        NSLog(CFSTR("subsegment classifier yscore from frame %d to %d (relative to start) : %f\n"), v21, (v24 - 1), v30);
      if (!v31)
      {
        lastClassifierScore = v30;
        if ((v34 & 1) == 0)
        {
          lastClassifierScore = self->lastClassifierScore;
          if (v30 < lastClassifierScore)
            lastClassifierScore = v30;
        }
        self->lastClassifierScore = lastClassifierScore;
        if (v30 < a12)
          break;
        v34 = 0;
      }
      if (v22 <= v23 || (v18 = v26, objc_msgSend(v37, "count") == v24))
      {
        v28 = v31;
        break;
      }
      v21 = (v21 + a8);

      if (v31)
        goto LABEL_27;
    }

    v31 = v28;
LABEL_27:
    *a10 = self->lastClassifierScore;
    v20 = v31;

  }
  return v20;
}

- (id)classifySequentialAnalysisSuccess:(void *)a3 movieSize:(Int32Size)a4 precalcedFeatures:(id)a5 result:(float *)a6
{
  void *v10;
  double v11;
  int v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  -[StabilizationSuccessClassifier getSequentialAnalysisCoeffsDict](self, "getSequentialAnalysisCoeffsDict", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)(678152731 * ((*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4) - 1) >= 95)
    v12 = 95;
  else
    v12 = 678152731 * ((*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4) - 1;
  LOBYTE(v16) = 1;
  LODWORD(v15) = v12;
  LODWORD(v11) = 0;
  -[StabilizationSuccessClassifier applyClassifierToOverlappedSegments:withCoefficientsDict:movieSize:firstIndex:lastIndex:stride:length:result:verbose:minThreshold:](self, "applyClassifierToOverlappedSegments:withCoefficientsDict:movieSize:firstIndex:lastIndex:stride:length:result:verbose:minThreshold:", a3, v10, a4, 1, v11, v15, a6, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int)classifierMode
{
  return self->classifierMode;
}

- (void)setClassifierMode:(int)a3
{
  self->classifierMode = a3;
}

- (unint64_t)subsegmentLength
{
  return self->subsegmentLength;
}

- (void)setSubsegmentLength:(unint64_t)a3
{
  self->subsegmentLength = a3;
}

- (unint64_t)subsegmentStep
{
  return self->subsegmentStep;
}

- (void)setSubsegmentStep:(unint64_t)a3
{
  self->subsegmentStep = a3;
}

- (float)lastClassifierScore
{
  return self->lastClassifierScore;
}

@end
