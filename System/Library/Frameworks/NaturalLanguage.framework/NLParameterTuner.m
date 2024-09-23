@implementation NLParameterTuner

+ (id)tunedParameterBundleWithParameters:(id)a3 options:(id)a4 delegate:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;

  objc_msgSend(a1, "parameterTunerWithParameters:options:delegate:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tunedParameterBundleWithError:", a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)parameterTunerWithParameters:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParameters:options:delegate:", v10, v9, v8);

  return v11;
}

- (NLParameterTuner)initWithParameters:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NLParameterTuner *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  NSArray *parameters;
  NSArray *parameterNames;
  NSArray *v25;
  uint64_t v26;
  NSDictionary *options;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)NLParameterTuner;
  v11 = -[NLParameterTuner init](&v35, sel_init);
  if (v11)
  {
    v29 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v18, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[NSArray containsObject:](v12, "containsObject:", v19);

          if (!v20)
          {
            objc_msgSend(v18, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v12, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    v22 = objc_msgSend(v13, "copy");
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v22;

    parameterNames = v11->_parameterNames;
    v11->_parameterNames = v12;
    v25 = v12;

    v9 = v29;
    v26 = objc_msgSend(v29, "copy");
    options = v11->_options;
    v11->_options = (NSDictionary *)v26;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v8 = v30;
  }

  return v11;
}

- (id)_hyperTuneParameterArray
{
  void *v3;
  void *v4;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NLParameterTuner parameters](self, "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_hyperTuneDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)tunedParameterBundleWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD *v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  const __CFString *v48;
  _BYTE v49[128];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x1E0C80C00];
  -[NLParameterTuner _hyperTuneParameterArray](self, "_hyperTuneParameterArray");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameterTuner options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Metadata"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameterTuner delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_respondsToSelector();
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = CFSTR("Algorithm");
  v50[1] = CFSTR("MaximumIterations");
  v50[2] = CFSTR("PreferLowerScore");
  v50[3] = CFSTR("RandomSeed");
  v50[4] = CFSTR("Metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(v8, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "objectForKey:", CFSTR("Algorithm"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "isEqual:", CFSTR("Random"));
    v18 = (_QWORD *)MEMORY[0x1E0D50500];
    if (!v17)
      v18 = (_QWORD *)MEMORY[0x1E0D504F0];
  }
  else
  {
    v18 = (_QWORD *)MEMORY[0x1E0D504F0];
  }
  objc_msgSend(v6, "setObject:forKey:", *v18, *MEMORY[0x1E0D504F8]);
  v19 = BOOLForKey(v8, (uint64_t)CFSTR("PreferLowerScore"), 0);
  v20 = (_QWORD *)MEMORY[0x1E0D50520];
  if (!v19)
    v20 = (_QWORD *)MEMORY[0x1E0D50518];
  objc_msgSend(v6, "setObject:forKey:", *v20, *MEMORY[0x1E0D50510]);
  objc_msgSend(v8, "objectForKey:", CFSTR("MaximumIterations"));
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
    v22 = (void *)v21;
  else
    v22 = &unk_1E4A47C90;
  objc_msgSend(v6, "setObject:forKey:", v22, *MEMORY[0x1E0D50568]);
  objc_msgSend(v8, "objectForKey:", CFSTR("RandomSeed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v6, "setObject:forKey:", v23, *MEMORY[0x1E0D50560]);
  objc_msgSend(v8, "objectForKey:", CFSTR("InitialParameterValues"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v6, "setObject:forKey:", v24, *MEMORY[0x1E0D50508]);

  v25 = v6;
  v41 = v38;
  v42 = v39;
  v26 = v41;
  v27 = v42;
  v28 = HTTuneParameters();
  if (v28)
  {
    v29 = (void *)v28;
    -[NLParameterTuner parameters](self, "parameters");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _parameterValuesForHyperTuneValues(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[NLParameterBundle parameterBundleWithParameters:values:metadata:](NLParameterBundle, "parameterBundleWithParameters:values:metadata:", v30, v31, v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v29);
  }
  else
  {
    if (a3)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("Failed to tune parameter bundle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 9, v34);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v35;

    }
    v32 = 0;
  }

  return v32;
}

double __50__NLParameterTuner_tunedParameterBundleWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _parameterValuesForHyperTuneValues(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NLParameterBundle parameterBundleWithParameters:values:metadata:](NLParameterBundle, "parameterBundleWithParameters:values:metadata:", v4, v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "parameterTuner:scoreForBundle:", *(_QWORD *)(a1 + 32), v6);
  v8 = v7;

  return v8;
}

void __50__NLParameterTuner_tunedParameterBundleWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4, double a5)
{
  void *v10;
  void *v11;
  void *v12;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _parameterValuesForHyperTuneValues(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NLParameterBundle parameterBundleWithParameters:values:metadata:](NLParameterBundle, "parameterBundleWithParameters:values:metadata:", v10, v11, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(a2) = objc_msgSend(*(id *)(a1 + 48), "parameterTuner:shouldStopWithTunedBundle:score:iterationNumber:", *(_QWORD *)(a1 + 32), v12, a2, a5);
    if ((_DWORD)a2)
      *a4 = 1;
  }
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NLParameterTuningDelegate)delegate
{
  return (NLParameterTuningDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
