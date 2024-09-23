@implementation NPHMMClassifier

- (NPHMMClassifier)initWithHMMProbabilities:(id *)a3 nameComponentsDate:(id)a4
{
  id v7;
  NPHMMClassifier *v8;
  NPHMMClassifier *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _OWORD v15[3];
  double var2;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NPHMMClassifier;
  v8 = -[NPHMMClassifier init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->var0.var2;
    v15[0] = *(_OWORD *)&a3->var0.var0;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a3->var1.var1;
    var2 = a3->var2;
    -[NPHMMClassifier setStateProbabilities:](v8, "setStateProbabilities:", v15);
    objc_storeStrong((id *)&v9->_nameComponentsData, a4);
    pthread_mutex_lock(&_NPHMMClassifierLock);
    v11 = _NPHMMClassifierInstanceCount;
    if (!_nameFrequencyTrie && !_NPHMMClassifierInstanceCount)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathForResource:ofType:", CFSTR("name_frequencies"), CFSTR("trie"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _nameFrequencyTrie = CFBurstTrieCreateFromFile();
      v11 = _NPHMMClassifierInstanceCount;
    }
    _NPHMMClassifierInstanceCount = v11 + 1;
    pthread_mutex_unlock(&_NPHMMClassifierLock);
    v9->_totalGivenNamesCount = -[NPHMMClassifier extractMetricForType:](v9, "extractMetricForType:", 2);
    v9->_totalFamilyNamesCount = -[NPHMMClassifier extractMetricForType:](v9, "extractMetricForType:", 3);
    v9->_uniqueGivenNamesCount = -[NPHMMClassifier extractMetricForType:](v9, "extractMetricForType:", 1);
    v9->_uniqueFamilyNamesCount = -[NPHMMClassifier extractMetricForType:](v9, "extractMetricForType:", 1);
  }

  return v9;
}

- (unint64_t)payloadForName:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("!"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "length");
  if (CFBurstTrieContains())
    v9 = 0;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (unint64_t)frequencyForName:(id)a3 type:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;

  v5 = -[NPHMMClassifier payloadForName:type:](self, "payloadForName:type:", a3);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5 / 0xA + 1;
    if (a4)
      return v5 + 1;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3;
  BOOL v4;
  objc_super v5;

  pthread_mutex_lock(&_NPHMMClassifierLock);
  v3 = --_NPHMMClassifierInstanceCount;
  if (_nameFrequencyTrie)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
  {
    CFBurstTrieRelease();
    _nameFrequencyTrie = 0;
  }
  pthread_mutex_unlock(&_NPHMMClassifierLock);
  v5.receiver = self;
  v5.super_class = (Class)NPHMMClassifier;
  -[NPHMMClassifier dealloc](&v5, sel_dealloc);
}

- (unint64_t)extractMetricForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("#"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "length");
  CFBurstTrieContains();

  return 0;
}

- (id)hiddenStatesFromObservationSequence:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  int v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NPHMMClassifier *v49;
  void *v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  unint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  id obj;
  NPHMMClassifier *v80;
  void *context;
  void *contexta;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = v4;
  v80 = self;
  if (v5)
  {
    for (i = 0; v5 != i; ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR(","));

      if (v10)
      {
        self = v80;
        if (!i || v5 - 1 == i)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v11);
      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _NPTrimNonLetters(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          objc_msgSend(v11, "lowercaseString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        self = v80;
      }

LABEL_11:
      v4 = v71;
    }
  }
  v15 = objc_msgSend(v6, "count");
  context = (void *)objc_msgSend(v69, "count");
  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v6;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v88;
    v20 = 4;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        v22 = v20;
        if (*(_QWORD *)v88 != v19)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        if (-[NPHMMClassifier isInitial:](self, "isInitial:", v23))
        {
          v24 = 0;
          v25 = 0;
          v20 = 2;
        }
        else if (-[NPHMMClassifier isGivenNameAbbreviation:](self, "isGivenNameAbbreviation:", v23))
        {
          v24 = 0;
          v25 = 0;
          v20 = 3;
        }
        else
        {
          objc_msgSend(v23, "uppercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v26, "isEqualToString:", v23);

          self = v80;
          v24 = v25 ^ 1;
          v20 = v25;
        }
        if (v22 != 1)
          v24 = 0;
        if (v22)
          v27 = 0;
        else
          v27 = v25;
        v28 = v18 + (v24 | v27);
        if (v22 != 4)
          v18 = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v29);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  v76 = (void *)objc_opt_new();
  v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = v30;
  if (v18 == 1)
  {
    -[NPHMMClassifier candidatesBasedOnFormatSequence:](self, "candidatesBasedOnFormatSequence:", v78);
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v75 = (void *)v32;
    v30 = (id)objc_msgSend(v31, "addObject:", v32);
    goto LABEL_39;
  }
  if (context == (void *)1)
  {
    objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPHMMClassifier candidatesBasedOnCommaDelimiterIndex:sequenceSize:](self, "candidatesBasedOnCommaDelimiterIndex:sequenceSize:", objc_msgSend(v33, "integerValue"), objc_msgSend(v7, "count"));
    v32 = objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  v75 = 0;
LABEL_39:
  v34 = v15 - 1;
  if (v15 != 1)
  {
    for (k = 0; v34 != k; ++k)
    {
      v36 = (void *)MEMORY[0x1DF09A480](v30);
      objc_msgSend(v7, "subarrayWithRange:", k, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[NPHMMClassifier formCompoundGivenName:](v80, "formCompoundGivenName:", v37);
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", k);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", &unk_1EA0BD860, v39);

      }
      if (-[NPHMMClassifier formCompoundFamilyName:](v80, "formCompoundFamilyName:", v37))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", k);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", &unk_1EA0BD878, v40);

        if (!v38)
          goto LABEL_52;
      }
      else
      {
        if (k)
          v41 = v38;
        else
          v41 = 1;
        if ((v41 & 1) != 0)
          goto LABEL_52;
        objc_msgSend(v71, "objectAtIndexedSubscript:", k);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[NPHMMClassifier isParticle:](v80, "isParticle:", v42);

        if (!v43)
          goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", k);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setObject:forKeyedSubscript:", &unk_1EA0BD860, v44);

LABEL_52:
      objc_msgSend(v78, "objectAtIndexedSubscript:", k);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "integerValue");

      if (v46 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", k);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKeyedSubscript:", &unk_1EA0BD860, v47);

      }
      objc_autoreleasePoolPop(v36);
    }
  }
  v48 = objc_msgSend(v7, "count");
  v49 = v80;
  -[NPHMMClassifier candidatesOfSize:constraints:compoundsConstraints:labelsContraints:](v80, "candidatesOfSize:constraints:compoundsConstraints:labelsContraints:", v48, (unint64_t)(v48 - objc_msgSend(v72, "count")) > 1, v72, v70);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unionSet:");
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v73 = v31;
  v50 = v75;
  v77 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v77)
  {
    v74 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v77; ++m)
      {
        if (*(_QWORD *)v84 != v74)
          objc_enumerationMutation(v73);
        v52 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
        contexta = (void *)MEMORY[0x1DF09A480]();
        if (v50 && objc_msgSend(v52, "isEqualToArray:", v50))
        {
          -[NPHMMClassifier probabilityForHiddenSequence:knowingObservationSequence:boost:](v49, "probabilityForHiddenSequence:knowingObservationSequence:boost:", v52, v7, 1000);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setFavorite:", 1);
        }
        else
        {
          -[NPHMMClassifier probabilityForHiddenSequence:knowingObservationSequence:boost:](v49, "probabilityForHiddenSequence:knowingObservationSequence:boost:", v52, v7, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v54 = (void *)objc_msgSend(obj, "copy");
        objc_msgSend(v53, "setObservation:", v54);

        v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v52, "count"))
        {
          v57 = 0;
          do
          {
            objc_msgSend(v52, "objectAtIndexedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "isEqual:", &unk_1EA0BD860);

            if (v59)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v60);

              objc_msgSend(v7, "objectAtIndexedSubscript:", v57);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObject:", v61);

            }
            ++v57;
          }
          while (objc_msgSend(v52, "count") > v57);
        }
        if ((unint64_t)objc_msgSend(v55, "count") > 1)
        {
          objc_msgSend(v55, "lastObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "integerValue");

          if (!-[NPHMMClassifier isCoupleName:](v80, "isCoupleName:", v56))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63 - 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "objectForKey:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v65)
              objc_msgSend(v53, "setValue:atSequenceIndex:", &unk_1EA0BD890, v63);
          }
        }
        objc_msgSend(v76, "addObject:", v53);

        objc_autoreleasePoolPop(contexta);
        v49 = v80;
        v50 = v75;
      }
      v77 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v77);
  }

  v66 = (void *)objc_msgSend(v76, "copy");
  return v66;
}

- (BOOL)isCoupleName:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 3)
  {
    v7 = v5;
    v8 = 3;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8 - 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NPHMMClassifier isLinkingToken:](self, "isLinkingToken:", v9);

      if (v6)
        break;
    }
    while (v7 != v8++);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isLinkingToken:(id)a3
{
  return -[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 5, a3);
}

- (id)candidatesBasedOnFormatSequence:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  _BOOL4 v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = 4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "doubleValue", (_QWORD)v19);
        v12 = (unint64_t)v11;
        v13 = &unk_1EA0BD878;
        if ((unint64_t)v11 != 1)
        {
          v14 = v12 == 2 && v9 == 1;
          v13 = &unk_1EA0BD878;
          if (!v14)
          {
            v15 = v12 == 2 && v9 == 0;
            v16 = v15;
            v17 = v12 && !v16;
            v13 = &unk_1EA0BD860;
            if (v17)
              continue;
          }
        }
        objc_msgSend(v4, "addObject:", v13);
        v9 = v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)candidatesBasedOnCommaDelimiterIndex:(unint64_t)a3 sequenceSize:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;

  v6 = (void *)objc_opt_new();
  if (a4)
  {
    v7 = 0;
    do
    {
      if (v7 >= a3)
        v8 = &unk_1EA0BD860;
      else
        v8 = &unk_1EA0BD878;
      objc_msgSend(v6, "addObject:", v8);
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (BOOL)validSequence:(id)a3 compoundsConstraints:(id)a4 labelsConstraints:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  BOOL v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35 = a5;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "integerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v15 + 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 != v19)
        {
LABEL_23:
          v33 = 0;
          v24 = v35;
          goto LABEL_26;
        }
        if (v17 == 2)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "integerValue");

          if (v23 != 2)
            goto LABEL_23;
        }
        else if (v17 == 1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "integerValue");

          if (v21)
            goto LABEL_23;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v11)
        continue;
      break;
    }
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = v35;
  objc_msgSend(v35, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v9);
        v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v29, "integerValue"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        if (!v32)
        {
          v33 = 0;
          goto LABEL_26;
        }
      }
      v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v33 = 1;
      if (v26)
        continue;
      break;
    }
  }
  else
  {
    v33 = 1;
  }
LABEL_26:

  return v33;
}

- (id)candidatesOfSize:(unint64_t)a3 constraints:(unint64_t)a4 compoundsConstraints:(id)a5 labelsContraints:(id)a6
{
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t i;
  unint64_t v16;
  void *v17;
  unint64_t j;
  void *v19;
  unint64_t k;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;

  v27 = a5;
  v10 = a6;
  v26 = (void *)objc_opt_new();
  v11 = a4 == 1;
  v12 = a3 - v11;
  if (a3 != v11)
  {
    v13 = 1;
    do
    {
      v14 = (void *)objc_opt_new();
      if (v13)
      {
        for (i = 1; i <= v13; ++i)
          objc_msgSend(v14, "addObject:", &unk_1EA0BD860, v26);
      }
      if (a3 != v13)
      {
        v16 = 1;
        do
        {
          objc_msgSend(v14, "addObject:", &unk_1EA0BD878, v26);
          ++v16;
        }
        while (v16 <= a3 - v13);
      }
      if (-[NPHMMClassifier validSequence:compoundsConstraints:labelsConstraints:](self, "validSequence:compoundsConstraints:labelsConstraints:", v14, v27, v10, v26))
      {
        v17 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v26, "addObject:", v17);

      }
      ++v13;
    }
    while (v13 <= v12);
    if (v12)
    {
      for (j = 1; j <= v12; ++j)
      {
        v19 = (void *)objc_opt_new();
        if (j)
        {
          for (k = 1; k <= j; ++k)
            objc_msgSend(v19, "addObject:", &unk_1EA0BD878);
        }
        if (a3 != j)
        {
          v21 = 1;
          do
          {
            objc_msgSend(v19, "addObject:", &unk_1EA0BD860);
            ++v21;
          }
          while (v21 <= a3 - j);
        }
        if (-[NPHMMClassifier validSequence:compoundsConstraints:labelsConstraints:](self, "validSequence:compoundsConstraints:labelsConstraints:", v19, v27, v10))
        {
          v22 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v26, "addObject:", v22);

        }
      }
    }
  }
  v23 = v26;
  v24 = (void *)objc_msgSend(v26, "copy", v26);

  return v24;
}

- (id)probabilityForHiddenSequence:(id)a3 knowingObservationSequence:(id)a4 boost:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  NPHMMClassifier *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NPComponentSequence *v38;
  void *v39;
  NPComponentSequence *v40;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *context;
  unsigned __int8 v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v43 = (void *)objc_opt_new();
  v45 = v8;
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0x1ED556000uLL;
    v13 = 0.0;
    v14 = 0x1ED556000uLL;
    v15 = 0.0;
    do
    {
      context = (void *)MEMORY[0x1DF09A480]();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v11);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11 - 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPHMMClassifier stateTransitionProbabilityFrom:to:](self, "stateTransitionProbabilityFrom:to:", v18, v16);
        v20 = v19;

      }
      else
      {
        -[NPHMMClassifier startProbability:](self, "startProbability:", v16);
        v20 = v21;
      }
      if (*(_QWORD *)(v12 + 2368) != -1)
        dispatch_once(&probabilityForHiddenSequence_knowingObservationSequence_boost__onceToken, &__block_literal_global_1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v17, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v14 + 2360), "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v17;
      v25 = v23;
      v48 = 0;
      v46 = v24;
      if (v23)
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        v28 = v27;

        objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v29, "BOOLValue");
      }
      else
      {
        objc_msgSend(v16, "doubleValue");
        -[NPHMMClassifier emissionProbability:hiddenState:isOOV:](self, "emissionProbability:hiddenState:isOOV:", v24, (unint64_t)v30, &v48);
        v28 = v31;
        v44 = *(void **)(v14 + 2360);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v29;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48);
        v32 = v10;
        v33 = self;
        v34 = v7;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v36, v22);

        v14 = 0x1ED556000;
        v7 = v34;
        self = v33;
        v10 = v32;
        v12 = 0x1ED556000;
      }

      if (v48)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v37);

        v14 = 0x1ED556000;
      }
      v13 = v13 + v20;
      v15 = v15 + v28;

      objc_autoreleasePoolPop(context);
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    v15 = 0.0;
    v13 = 0.0;
  }
  v38 = [NPComponentSequence alloc];
  v39 = (void *)objc_msgSend(v43, "copy");
  v40 = -[NPComponentSequence initWithObservationSequence:hiddenSequence:oovIndices:emissionModelScore:stateModelScore:boost:](v38, "initWithObservationSequence:hiddenSequence:oovIndices:emissionModelScore:stateModelScore:boost:", v45, v7, v39, v15, v13, (double)log((double)a5));

  return v40;
}

uint64_t __81__NPHMMClassifier_probabilityForHiddenSequence_knowingObservationSequence_boost___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache;
  probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache = (uint64_t)v0;

  return objc_msgSend((id)probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache, "setCountLimit:", 100);
}

- (double)startProbability:(id)a3
{
  long double *v4;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(a3, "unsignedIntegerValue"))
  {
    -[NPHMMClassifier stateProbabilities](self, "stateProbabilities");
    v4 = (long double *)&v6;
  }
  else
  {
    -[NPHMMClassifier stateProbabilities](self, "stateProbabilities");
    v4 = (long double *)&v7;
  }
  return log(*v4);
}

- (double)stateTransitionProbabilityFrom:(id)a3 to:(id)a4
{
  id v6;
  double v7;
  double *v8;
  double v9;
  uint64_t v10;
  long double v11;
  double v13;
  _QWORD v14[4];
  uint64_t v15;

  v6 = a4;
  if (objc_msgSend(a3, "unsignedIntegerValue"))
  {
    -[NPHMMClassifier stateProbabilities](self, "stateProbabilities");
    v7 = v13;
    v8 = (double *)v14;
  }
  else
  {
    -[NPHMMClassifier stateProbabilities](self, "stateProbabilities");
    v7 = *(double *)&v14[3];
    v8 = (double *)&v15;
  }
  v9 = *v8;
  v10 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v10)
    v11 = v9;
  else
    v11 = v7;
  return log(v11);
}

- (double)emissionProbability:(id)a3 hiddenState:(unint64_t)a4 isOOV:(BOOL *)a5
{
  id v8;
  double v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double v15;
  unint64_t totalFamilyNamesCount;

  v8 = a3;
  if (a5)
    *a5 = 0;
  v9 = 0.0;
  if (!-[NPHMMClassifier isInitial:](self, "isInitial:", v8)
    && !-[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 6, v8))
  {
    _NPStripDiatritics(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPHMMClassifier compoundsFromName:](self, "compoundsFromName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("*"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[NPHMMClassifier frequencyForName:type:](self, "frequencyForName:type:", v13, a4);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a5)
        *a5 = 1;
      v9 = 0.0 - log((double)(self->_totalFamilyNamesCount + self->_totalGivenNamesCount));
      goto LABEL_14;
    }
    v9 = (double)v14;
    if (a4 == 2)
    {
      v15 = log((double)v14);
      totalFamilyNamesCount = self->_totalFamilyNamesCount;
    }
    else
    {
      if (a4)
      {
LABEL_14:

        goto LABEL_15;
      }
      v15 = log((double)v14);
      totalFamilyNamesCount = self->_totalGivenNamesCount;
    }
    v9 = v15 - log((double)totalFamilyNamesCount);
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (BOOL)isInitial:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = isInitial__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isInitial__onceToken, &__block_literal_global_27);
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", isInitial__initialDelimiterSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length") == 1;
  return v6;
}

void __29__NPHMMClassifier_isInitial___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isInitial__initialDelimiterSet;
  isInitial__initialDelimiterSet = v0;

}

- (BOOL)isGivenNameAbbreviation:(id)a3
{
  return -[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 8, a3);
}

- (_CFBurstTrie)nameFrequencyTrieRef
{
  return (_CFBurstTrie *)_nameFrequencyTrie;
}

- (BOOL)formCompoundGivenName:(id)a3
{
  void *v4;
  unint64_t v5;
  BOOL v7;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("*"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NPHMMClassifier frequencyForName:type:](self, "frequencyForName:type:", v4, 0);
  v7 = v5 != 0x7FFFFFFFFFFFFFFFLL && v5 > 0xA;

  return v7;
}

- (BOOL)formCompoundFamilyName:(id)a3
{
  void *v4;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("*"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NPHMMClassifier frequencyForName:type:](self, "frequencyForName:type:", v4, 2) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)self;
}

- (BOOL)isParticle:(id)a3
{
  return -[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 7, a3);
}

- (id)compoundsFromName:(id)a3
{
  return -[NPHMMClassifier compoundsFromName:includeSpaceAsDelimiter:](self, "compoundsFromName:includeSpaceAsDelimiter:", a3, 0);
}

- (id)compoundsFromName:(id)a3 includeSpaceAsDelimiter:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (v4)
  {
    if (compoundsFromName_includeSpaceAsDelimiter__onceToken != -1)
      dispatch_once(&compoundsFromName_includeSpaceAsDelimiter__onceToken, &__block_literal_global_31);
    v6 = &compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSetIncludingSpace;
  }
  else
  {
    if (compoundsFromName_includeSpaceAsDelimiter__onceToken_34 != -1)
      dispatch_once(&compoundsFromName_includeSpaceAsDelimiter__onceToken_34, &__block_literal_global_35);
    v6 = &compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSet;
  }
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __61__NPHMMClassifier_compoundsFromName_includeSpaceAsDelimiter___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-| "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSetIncludingSpace;
  compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSetIncludingSpace = v0;

}

void __61__NPHMMClassifier_compoundsFromName_includeSpaceAsDelimiter___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-|"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSet;
  compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSet = v0;

}

- (unint64_t)genderMajorityForGivenName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  _NPStripDiatritics(a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPHMMClassifier compoundsFromName:includeSpaceAsDelimiter:](self, "compoundsFromName:includeSpaceAsDelimiter:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("*"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NPHMMClassifier payloadForName:type:](self, "payloadForName:type:", v6, 0);
  if (v7 % 0xA == 1)
    v8 = 2;
  else
    v8 = v7 % 0xA == 2;

  return v8;
}

- ($00D837B2FE8B211969D4E4E0E8844E72)stateProbabilities
{
  $00D837B2FE8B211969D4E4E0E8844E72 *result;

  objc_copyStruct(retstr, &self->_stateProbabilities, 56, 1, 0);
  return result;
}

- (void)setStateProbabilities:(id *)a3
{
  objc_copyStruct(&self->_stateProbabilities, a3, 56, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponentsData, 0);
}

@end
