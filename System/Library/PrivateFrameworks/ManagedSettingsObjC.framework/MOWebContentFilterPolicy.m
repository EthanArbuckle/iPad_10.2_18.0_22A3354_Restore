@implementation MOWebContentFilterPolicy

- (id)persistableValue
{
  int64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  const __CFString **v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  const __CFString *v59;
  void *v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[2];
  _BYTE v64[128];
  _BYTE v65[128];
  const __CFString *v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = -[MOWebContentFilterPolicy policy](self, "policy");
  switch(v3)
  {
    case 3:
      v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[MOWebContentFilterPolicy onlyAllow](self, "onlyAllow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[MOWebContentFilterPolicy onlyAllow](self, "onlyAllow", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v44;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v44 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v22), "persistableValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
        }
        while (v20);
      }

      v59 = CFSTR("onlyAllow");
      v60 = v6;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v60;
      v15 = &v59;
      break;
    case 2:
      v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[MOWebContentFilterPolicy autoAllow](self, "autoAllow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      -[MOWebContentFilterPolicy autoAllow](self, "autoAllow");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v52;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v52 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v31), "persistableValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v32);

            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        }
        while (v29);
      }

      v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[MOWebContentFilterPolicy neverAllow](self, "neverAllow");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[MOWebContentFilterPolicy neverAllow](self, "neverAllow");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v48;
        do
        {
          v40 = 0;
          do
          {
            if (*(_QWORD *)v48 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v40), "persistableValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v41);

            ++v40;
          }
          while (v38 != v40);
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
        }
        while (v38);
      }

      v62[0] = CFSTR("autoAllow");
      v62[1] = CFSTR("neverAllow");
      v63[0] = v6;
      v63[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    case 1:
      v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[MOWebContentFilterPolicy neverAllow](self, "neverAllow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[MOWebContentFilterPolicy neverAllow](self, "neverAllow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v56;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v56 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v11), "persistableValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        }
        while (v9);
      }

      v66 = CFSTR("neverAllow");
      v67 = v6;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v67;
      v15 = &v66;
      break;
    default:
      v24 = (void *)MEMORY[0x1E0C9AA70];
      return v24;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v24;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MOWebContentFilterPolicy *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  MOWebContentFilterPolicy *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[MOWebContentFilterPolicy isValidPersistableRepresentation:](MOWebContentFilterPolicy, "isValidPersistableRepresentation:", v3))
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoAllow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
      if (v7)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v50 != v11)
                objc_enumerationMutation(v8);
              +[MOWebDomain initializeWithPersistableValue:](MOWebDomain, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v13);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          }
          while (v10);
        }

      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neverAllow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v4;
    v38 = v15;
    if (v15)
    {
      v16 = v15;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v15, "count"));
      if (v17)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v46 != v21)
                objc_enumerationMutation(v18);
              +[MOWebDomain initializeWithPersistableValue:](MOWebDomain, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v20);
        }

      }
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onlyAllow"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v24, "count"));
      if (v25)
      {
        v37 = v3;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v26 = v24;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v42;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v42 != v29)
                objc_enumerationMutation(v26);
              +[MOWebDomain initializeWithPersistableValue:](MOWebDomain, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k), v37, v38, v39);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v31);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          }
          while (v28);
        }

        v3 = v37;
      }
    }
    else
    {
      v25 = 0;
    }
    v32 = [MOWebContentFilterPolicy alloc];
    v33 = (void *)objc_msgSend(v7, "copy");
    v34 = (void *)objc_msgSend(v17, "copy");
    v35 = (void *)objc_msgSend(v25, "copy");
    v14 = -[MOWebContentFilterPolicy initWithAutoAllow:neverAllow:onlyAllow:](v32, "initWithAutoAllow:neverAllow:onlyAllow:", v33, v34, v35);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoAllow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = 0;
LABEL_44:

        goto LABEL_45;
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v32;
LABEL_6:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          if (!+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10)))goto LABEL_36;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
            if (v8)
              goto LABEL_6;
            break;
          }
        }
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neverAllow"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_36:
        v21 = 0;
LABEL_43:

        goto LABEL_44;
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
LABEL_17:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          if (!+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15)))goto LABEL_38;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            if (v13)
              goto LABEL_17;
            break;
          }
        }
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onlyAllow"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v21 = 1;
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            if (!+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23))
            {
              v21 = 0;
              goto LABEL_41;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          if (v18)
            continue;
          break;
        }
      }
      v21 = 1;
LABEL_41:

      goto LABEL_42;
    }
LABEL_38:
    v21 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v21 = 0;
LABEL_45:

  return v21;
}

- (MOWebContentFilterPolicy)initWithAutoAllow:(id)a3 neverAllow:(id)a4 onlyAllow:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOWebContentFilterPolicy *v12;
  MOWebContentFilterPolicy *v13;
  id *p_onlyAllow;
  id v15;
  uint64_t v16;
  NSSet *neverAllow;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MOWebContentFilterPolicy;
  v12 = -[MOWebContentFilterPolicy init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v11)
    {
      v12->_policy = 3;
      p_onlyAllow = (id *)&v12->_onlyAllow;
      v15 = a5;
LABEL_10:
      objc_storeStrong(p_onlyAllow, v15);
      goto LABEL_11;
    }
    if (v9)
    {
      v12->_policy = 2;
      objc_storeStrong((id *)&v12->_autoAllow, a3);
      if (!v10)
      {
        v16 = objc_opt_new();
        neverAllow = v13->_neverAllow;
        v13->_neverAllow = (NSSet *)v16;

        goto LABEL_11;
      }
    }
    else
    {
      if (!v10)
      {
        v12->_policy = 0;
        goto LABEL_11;
      }
      v12->_policy = 1;
    }
    p_onlyAllow = (id *)&v13->_neverAllow;
    v15 = a4;
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

+ (id)nonePolicy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutoAllow:neverAllow:onlyAllow:", 0, 0, 0);
}

+ (id)specificPolicyWithDomains:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutoAllow:neverAllow:onlyAllow:", 0, v3, 0);

  return v4;
}

+ (id)autoPolicyWithDomains:(id)a3 exceptions:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutoAllow:neverAllow:onlyAllow:", v5, v6, 0);

  return v7;
}

+ (id)allPolicyWithExceptions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutoAllow:neverAllow:onlyAllow:", 0, 0, v3);

  return v4;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSSet)autoAllow
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)neverAllow
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)onlyAllow
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlyAllow, 0);
  objc_storeStrong((id *)&self->_neverAllow, 0);
  objc_storeStrong((id *)&self->_autoAllow, 0);
}

@end
