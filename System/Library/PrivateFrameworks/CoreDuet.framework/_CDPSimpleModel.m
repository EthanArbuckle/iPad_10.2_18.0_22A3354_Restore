@implementation _CDPSimpleModel

- (void)_reallocModel
{
  unint64_t size;

  size = self->_size;
  self->_size = 2 * size;
  self->_timestamp = (double *)malloc_type_realloc(self->_timestamp, 16 * size, 0x100004000313F17uLL);
  self->_userIsSender = (BOOL *)malloc_type_realloc(self->_userIsSender, self->_size, 0x100004077774924uLL);
  self->_userIsThreadInitiator = (BOOL *)malloc_type_realloc(self->_userIsThreadInitiator, self->_size, 0x100004077774924uLL);
}

- (void)dealloc
{
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  objc_super v8;

  free(self->_timestamp);
  free(self->_userIsSender);
  free(self->_userIsThreadInitiator);
  if (self->_NEmail)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      free(self->_email[v3]);
      v3 = v4;
      v5 = self->_NEmail > v4++;
    }
    while (v5);
  }
  free(self->_email);
  free(self->_emailLength);
  free(self->_email2LogScore);
  if (self->_NPeople)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      free(self->_people2Email[v6]);
      v6 = v7;
      v5 = self->_NPeople > v7++;
    }
    while (v5);
  }
  free(self->_people2Email);
  free(self->_people2EmailLength);
  v8.receiver = self;
  v8.super_class = (Class)_CDPSimpleModel;
  -[_CDPSimpleModel dealloc](&v8, sel_dealloc);
}

- (void)loadModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  self->_loaded = 1;
  *(_OWORD *)&self->_NEmail = xmmword_18DF4C690;
  self->_timestamp = (double *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  self->_userIsSender = (BOOL *)malloc_type_calloc(self->_size, 1uLL, 0x100004077774924uLL);
  self->_userIsThreadInitiator = (BOOL *)malloc_type_calloc(self->_size, 1uLL, 0x100004077774924uLL);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 256);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPSimpleModel harvester](self, "harvester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29___CDPSimpleModel_loadModel___block_invoke;
  v13[3] = &unk_1E26E4410;
  v13[4] = self;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __29___CDPSimpleModel_loadModel___block_invoke_2;
  v10[3] = &unk_1E26E4438;
  v11 = v14;
  v12 = v4;
  v10[4] = self;
  v8 = v14;
  v9 = v4;
  objc_msgSend(v6, "loadWithLimit:dataPointReader:completion:", 2500, v13, v10);

}

- (unsigned)_newIdsForPeople:(id)a3 length:(unint64_t *)a4
{
  id v5;
  unsigned int *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int *)malloc_type_calloc(objc_msgSend(v5, "count"), 4uLL, 0x100004052888210uLL);
  v7 = self->_people;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), 0, -[NSArray count](v7, "count"), 256, &__block_literal_global_26);
        if (-[NSArray count](v7, "count") && v14 != 0x7FFFFFFFFFFFFFFFLL)
          v6[v11++] = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (a4)
    *a4 = v11;

  return v6;
}

- (void)setLambda:(float)a3 w0:(float)a4
{
  self->_lambda = a3;
  self->_w0 = a4;
  self->_scoresAreDirty = 1;
}

- (_cdp_prediction_result)_newPredictionResultWithSeed:(unsigned int *)a3 seedLength:(unint64_t)a4 realSeedLength:(unint64_t)a5 maxTrainingEmailID:(unsigned int)a6
{
  _cdp_prediction_result *v6;
  uint64_t v11;
  unsigned int v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  char *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  uint64_t v25;
  unint64_t NEmail;
  double *timestamp;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int **people2Email;
  unint64_t *people2EmailLength;
  uint64_t v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int *v37;
  uint64_t v38;
  int v39;
  unint64_t v40;
  unsigned int *v41;
  unsigned int v42;
  float v43;
  float *email2LogScore;
  unsigned int *v45;
  uint64_t v46;
  unsigned int v47;
  float v48;
  int v49;
  float v50;
  _cdp_prediction_result *v51;
  unint64_t NPeople;
  unint64_t v53;
  _cdp_prediction_result *v54;
  uint64_t v55;
  unint64_t *emailLength;
  uint64_t v57;
  unint64_t v58;
  unsigned int *v59;
  float v60;
  int v61;
  BOOL v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  double v66;
  int v67;
  unint64_t v68;
  unsigned __int8 *v69;
  int v70;
  unsigned int *v71;
  int v72;
  uint64_t v74;
  unint64_t v75;
  id v76;
  void *v77;
  uint64_t *v78;
  int v79;
  _DWORD v80[2500];
  _DWORD v81[2500];
  _DWORD v82[2500];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (self->_NEmail - 2501 < 0xFFFFFFFFFFFFF63CLL)
    return 0;
  v75 = a5;
  if (self->_scoresAreDirty)
  {
    v11 = 0;
    v12 = 1;
    do
    {
      if (self->_userIsSender[v11])
      {
        -[_CDPSimpleModel w0](self, "w0");
        v14 = log2f(v13);
      }
      else
      {
        v14 = 0.0;
      }
      v15 = self->_timestamp[v11];
      -[_CDPSimpleModel lambda](self, "lambda");
      v17 = v15 / (float)(v16 * 86400.0);
      self->_email2LogScore[v11] = v14 + v17;
      v11 = v12;
    }
    while (self->_NEmail > v12++);
    self->_scoresAreDirty = 0;
  }
  bzero(v82, 0x2710uLL);
  bzero(v81, 0x2710uLL);
  v78 = &v74;
  v19 = (char *)&v74 - ((self->_NPeople * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v19, self->_NPeople * a4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", CFSTR("com.apple.coreduetd.people.social.min_seed_proportion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v21;
  if (v21)
  {
    objc_msgSend(v21, "floatValue");
    v23 = v22;
  }
  else
  {
    v23 = 0.5;
  }
  objc_msgSend(v20, "objectForKey:", CFSTR("com.apple.coreduetd.people.social.improved_scoring"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    v79 = objc_msgSend(v20, "BOOLForKey:", CFSTR("com.apple.coreduetd.people.social.improved_scoring"));
  else
    v79 = 1;
  v77 = v20;
  v25 = a6;
  NEmail = self->_NEmail;
  timestamp = self->_timestamp;
  if (NEmail <= a6)
    v25 = (int)NEmail - 1;
  v28 = timestamp[v25];
  bzero(v80, 0x2710uLL);
  LOBYTE(v29) = 1;
  if (a4)
  {
    v30 = 0;
    v31 = 0;
    people2Email = self->_people2Email;
    people2EmailLength = self->_people2EmailLength;
    do
    {
      v34 = a3[v30];
      v35 = people2EmailLength[v34];
      if (v35 >= 1)
      {
        v36 = people2Email[v34];
        v37 = &v36[v35];
        do
        {
          v38 = *v36;
          if (v38 <= a6 && timestamp[v38] >= v28 + (float)((float)(self->_lambda * -13.288) * 86400.0))
          {
            v39 = v80[v38];
            v80[v38] = v39 + 1;
            if (!v39)
              v81[v31++] = v38;
            if (self->_userIsSender[v38])
            {
              v40 = self->_emailLength[v38];
              if (v40)
              {
                v41 = self->_email[v38];
                do
                {
                  v42 = *v41++;
                  v19[v30 + v42 * a4] = 1;
                  --v40;
                }
                while (v40);
              }
            }
          }
          ++v36;
        }
        while (v36 < v37);
      }
      ++v30;
    }
    while (v30 != a4);
    if (v31)
    {
      v43 = v28 / (float)(self->_lambda * 86400.0);
      email2LogScore = self->_email2LogScore;
      v29 = v31;
      v45 = v81;
      do
      {
        v47 = *v45++;
        v46 = v47;
        v48 = exp2f(email2LogScore[v47] - v43);
        v49 = v80[v47];
        if (v79)
          v50 = (float)(v48 * (float)(v49 * v49)) / (float)self->_emailLength[v46];
        else
          v50 = v48 * (float)v49;
        *(float *)&v82[v46] = v50;
        --v29;
      }
      while (v29);
    }
    else
    {
      LOBYTE(v29) = 1;
    }
  }
  else
  {
    v31 = 0;
  }
  v51 = (_cdp_prediction_result *)malloc_type_calloc(self->_NPeople, 0x10uLL, 0x1000040451B5BE8uLL);
  v6 = v51;
  NPeople = self->_NPeople;
  if (NPeople)
  {
    LODWORD(v53) = 0;
    v54 = v51;
    do
    {
      v54->var0 = v53;
      ++v54;
      v53 = (v53 + 1);
    }
    while (NPeople > v53);
  }
  if ((v29 & 1) == 0)
  {
    v55 = 0;
    emailLength = self->_emailLength;
    do
    {
      v57 = v81[v55];
      v58 = emailLength[v57];
      if (v58)
      {
        v59 = self->_email[v57];
        v60 = *(float *)&v82[v57];
        do
        {
          v61 = *v59++;
          v51[v61].var1 = v60 + v51[v61].var1;
          --v58;
        }
        while (v58);
      }
      ++v55;
    }
    while (v55 != v31);
  }
  v62 = -[_CDPSimpleModel requireOutgoingInteraction](self, "requireOutgoingInteraction");
  v63 = v77;
  if (v62)
  {
    v64 = self->_NPeople;
    if (v64)
    {
      v65 = 0;
      v66 = v23 * (double)v75;
      do
      {
        v67 = 0;
        if (a4)
        {
          v68 = a4;
          v69 = (unsigned __int8 *)v19;
          do
          {
            v70 = *v69++;
            v67 += v70;
            --v68;
          }
          while (v68);
        }
        if (v66 >= (double)v67)
          v6[v65].var1 = -1.0;
        ++v65;
        v19 += a4;
      }
      while (v65 != v64);
    }
  }
  if ((uint64_t)a4 >= 1)
  {
    v71 = &a3[a4];
    do
    {
      v72 = *a3++;
      v6[v72].var1 = -1.0;
    }
    while (a3 < v71);
  }

  return v6;
}

- (void)makePredictionForGroup:(id)a3 clientType:(int64_t)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, _CDPPredictionResult *);
  unint64_t NPeople;
  void *v12;
  void *v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  _cdp_prediction_result *p_var1;
  void *v18;
  void *v19;
  unint64_t v20;
  _CDPPredictionResult *v21;
  unsigned int *v22;
  _cdp_prediction_result *v23;
  uint64_t v24;

  v9 = a3;
  v10 = (void (**)(id, _CDPPredictionResult *))a6;
  v24 = 0;
  v22 = -[_CDPSimpleModel _newIdsForPeople:length:](self, "_newIdsForPeople:length:", v9, &v24);
  v23 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](self, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v22, v24, objc_msgSend(v9, "count"), LODWORD(self->_NEmail));
  if (self->_NPeople >= a5)
    NPeople = a5;
  else
    NPeople = self->_NPeople;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", NPeople);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", NPeople);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_NPeople;
  if (v15 >= a5)
    v15 = a5;
  if (v15)
  {
    v16 = 0;
    p_var1 = (_cdp_prediction_result *)&v23->var1;
    do
    {
      LODWORD(v14) = p_var1->var0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v18);

      -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", p_var1[-1].var3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v19);

      ++v16;
      v20 = self->_NPeople;
      if (v20 >= a5)
        v20 = a5;
      ++p_var1;
    }
    while (v20 > v16);
  }
  v21 = -[_CDPPredictionResult initWithMembers:andScores:]([_CDPPredictionResult alloc], "initWithMembers:andScores:", v13, v12);
  v10[2](v10, v21);

  free(v22);
  free(v23);

}

- (id)_testingIndices
{
  NSIndexSet *testingIndices;
  NSIndexSet **p_testingIndices;
  NSIndexSet *v4;
  unint64_t NEmail;
  unint64_t v7;

  p_testingIndices = &self->_testingIndices;
  testingIndices = self->_testingIndices;
  if (testingIndices)
  {
    v4 = testingIndices;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    NEmail = self->_NEmail;
    if (NEmail > (int)NEmail / 3)
    {
      v7 = (int)NEmail / 3;
      do
      {
        if (self->_userIsSender[v7] && self->_userIsThreadInitiator[v7] && self->_emailLength[v7] - 3 <= 7)
        {
          -[NSIndexSet addIndex:](v4, "addIndex:", v7);
          NEmail = self->_NEmail;
        }
        ++v7;
      }
      while (NEmail > v7);
    }
    objc_storeStrong((id *)p_testingIndices, v4);
  }
  return v4;
}

- (void)getEmail:(unsigned int *)a3 emailLength:(unint64_t *)a4 atIndex:(unint64_t)a5
{
  *a3 = self->_email[a5];
  *a4 = self->_emailLength[a5];
}

- (unint64_t)nPeople
{
  return self->_NPeople;
}

- (unint64_t)nEmail
{
  return self->_NEmail;
}

- (void)_printEmailWithID:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_timestamp[a3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("%s ", (const char *)objc_msgSend(v6, "UTF8String"));

  -[_CDPSimpleModel _printUsers:length:](self, "_printUsers:length:", self->_email[a3], self->_emailLength[a3]);
}

- (void)_printUsers:(unsigned int *)a3 length:(unint64_t)a4
{
  unsigned int *v4;
  unsigned int *v6;
  unsigned int v7;
  id v8;

  if ((uint64_t)a4 >= 1)
  {
    v4 = a3;
    v6 = &a3[a4];
    do
    {
      v7 = *v4++;
      -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", v7);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("%s ", (const char *)objc_msgSend(v8, "UTF8String"));

    }
    while (v4 < v6);
  }
  putchar(10);
}

- (void)_printUserWithID:(unint64_t)a3
{
  id v3;

  -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  puts((const char *)objc_msgSend(v3, "UTF8String"));

}

- (void)_printPrediction:(_cdp_prediction_result *)a3
{
  char *v5;
  uint64_t i;
  id v7;

  v5 = (char *)malloc_type_calloc(self->_NPeople, 0x10uLL, 0x1000040451B5BE8uLL);
  memcpy(v5, a3, 16 * self->_NPeople);
  qsort_b(v5, self->_NPeople, 0x10uLL, &__block_literal_global_31);
  for (i = 0; i != 80; i += 16)
  {
    -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", *(int *)&v5[i]);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("%s %g\n", (const char *)objc_msgSend(v7, "UTF8String"), *(float *)&v5[i + 4]);

  }
  free(v5);
}

- (id)peopleWithID:(unsigned int)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", a3);
}

- (NSArray)people
{
  return self->_people;
}

+ (int)maxNumberOfEmailsSupported
{
  return 2500;
}

- (_CDPDataHarvester)harvester
{
  return self->_harvester;
}

- (void)setHarvester:(id)a3
{
  objc_storeStrong((id *)&self->_harvester, a3);
}

- (float)lambda
{
  return self->_lambda;
}

- (float)w0
{
  return self->_w0;
}

- (BOOL)requireOutgoingInteraction
{
  return self->_requireOutgoingInteraction;
}

- (void)setRequireOutgoingInteraction:(BOOL)a3
{
  self->_requireOutgoingInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_testingIndices, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

@end
