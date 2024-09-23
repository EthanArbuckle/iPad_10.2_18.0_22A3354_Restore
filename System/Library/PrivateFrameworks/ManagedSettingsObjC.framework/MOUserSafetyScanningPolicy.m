@implementation MOUserSafetyScanningPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interventionType, 0);
  objc_storeStrong((id *)&self->_allApplications, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
}

- (id)persistableValue
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = -[MOUserSafetyScanningPolicy policy](self, "policy");
  if (v3 == 2)
  {
    -[MOUserSafetyScanningPolicy interventionType](self, "interventionType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v28, "copy");

    v41 = CFSTR("interventionType");
    v42 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
    {
      v27 = (void *)MEMORY[0x1E0C9AA70];
      return v27;
    }
    v32 = objc_opt_new();
    v31 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[MOUserSafetyScanningPolicy allServices](self, "allServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v38;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v38 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v8);
          -[MOUserSafetyScanningPolicy allServices](self, "allServices");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "BOOLValue");

          if (v12)
            v13 = (void *)v32;
          else
            v13 = v31;
          objc_msgSend(v13, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v6);
    }

    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[MOUserSafetyScanningPolicy allApplications](self, "allApplications");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
          -[MOUserSafetyScanningPolicy allApplications](self, "allApplications");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          objc_msgSend(v20, "persistableValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            v25 = v14;
          else
            v25 = v15;
          objc_msgSend(v25, "addObject:", v24);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v17);
    }

    v43[0] = CFSTR("onServices");
    v43[1] = CFSTR("offServices");
    v26 = (void *)v32;
    v44[0] = v32;
    v44[1] = v31;
    v43[2] = CFSTR("onApplications");
    v43[3] = CFSTR("offApplications");
    v44[2] = v14;
    v44[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

- (int64_t)policy
{
  return self->_policy;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E675D000uLL;
  if (+[MOUserSafetyScanningPolicy isValidPersistableRepresentation:](MOUserSafetyScanningPolicy, "isValidPersistableRepresentation:", v3))
  {
    v5 = v3;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offServices"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onApplications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offApplications"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v48 = v8;
    v49 = (void *)v7;
    v47 = (void *)v9;
    if (v6 && v7 && v8)
    {
      v11 = 0;
      if (v9)
      {
        v46 = v3;
        v11 = (void *)objc_opt_new();
        v10 = (void *)objc_opt_new();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v63;
          v16 = MEMORY[0x1E0C9AAB0];
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v63 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          }
          while (v14);
        }

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v18 = v49;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v59;
          v22 = MEMORY[0x1E0C9AAA0];
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v59 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v20);
        }
        v45 = v6;

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v24 = v8;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v55;
          v28 = MEMORY[0x1E0C9AAB0];
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v55 != v27)
                objc_enumerationMutation(v24);
              +[MOApplication initializeWithPersistableValue:](MOApplication, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, v30);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          }
          while (v26);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v31 = v47;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v51;
          v35 = MEMORY[0x1E0C9AAA0];
          do
          {
            for (m = 0; m != v33; ++m)
            {
              if (*(_QWORD *)v51 != v34)
                objc_enumerationMutation(v31);
              +[MOApplication initializeWithPersistableValue:](MOApplication, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * m));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, v37);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          }
          while (v33);
        }

        v6 = v45;
        v3 = v46;
        v4 = 0x1E675D000;
      }
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interventionType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc(*(Class *)(v4 + 3464));
    v41 = (void *)objc_msgSend(v11, "copy");
    v42 = (void *)objc_msgSend(v10, "copy");
    v43 = (void *)objc_msgSend(v39, "copy");
    v38 = (void *)objc_msgSend(v40, "initWithAllServices:allApplications:interventionType:", v41, v42, v43);

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (MOUserSafetyScanningPolicy)initWithAllServices:(id)a3 allApplications:(id)a4 interventionType:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOUserSafetyScanningPolicy *v12;
  MOUserSafetyScanningPolicy *v13;
  id *p_interventionType;
  id v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOUserSafetyScanningPolicy;
  v12 = -[MOUserSafetyScanningPolicy init](&v17, sel_init);
  v13 = v12;
  if (v11)
  {
    v12->_policy = 2;
    p_interventionType = (id *)&v12->_interventionType;
    v15 = a5;
  }
  else
  {
    if (!v9 || !v10)
    {
      v12->_policy = 0;
      goto LABEL_8;
    }
    v12->_policy = 1;
    objc_storeStrong((id *)&v12->_allServices, a3);
    p_interventionType = (id *)&v13->_allApplications;
    v15 = a4;
  }
  objc_storeStrong(p_interventionType, v15);
LABEL_8:

  return v13;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interventionType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offServices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onApplications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offApplications"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v6 && v7 && v8 && v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = 0;
        goto LABEL_55;
      }
      v31 = v8;
      v32 = v7;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v46;
LABEL_11:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v14)
            objc_enumerationMutation(v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_53;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
            if (v13)
              goto LABEL_11;
            break;
          }
        }
      }

      objc_opt_class();
      v7 = v32;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = 0;
        goto LABEL_55;
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v11 = v32;
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v42;
LABEL_20:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
            if (v17)
              goto LABEL_20;
            goto LABEL_26;
          }
        }
LABEL_53:

        v29 = 0;
        v7 = v32;
        goto LABEL_55;
      }
LABEL_26:

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = 0;
        v7 = v32;
        goto LABEL_55;
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = v8;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
LABEL_29:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          if (!+[MOApplication isValidPersistableRepresentation:](MOApplication, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v24)))goto LABEL_59;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
            if (v22)
              goto LABEL_29;
            break;
          }
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:
        v29 = 0;
        v8 = v31;
        v7 = v32;
        goto LABEL_55;
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = v10;
      v25 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v34;
LABEL_38:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v20);
          if (!+[MOApplication isValidPersistableRepresentation:](MOApplication, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v28)))break;
          if (v26 == ++v28)
          {
            v26 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
            if (v26)
              goto LABEL_38;
            goto LABEL_44;
          }
        }
LABEL_59:

        goto LABEL_60;
      }
LABEL_44:

      v8 = v31;
      v7 = v32;
    }
    else
    {
      v29 = 0;
      if (v6 || v7 || v8 || v9)
        goto LABEL_55;
    }
    v29 = 1;
LABEL_55:

    goto LABEL_56;
  }
  v29 = 0;
LABEL_57:

  return v29;
}

+ (id)nonePolicy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllServices:allApplications:interventionType:", 0, 0, 0);
}

- (NSSet)services
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_allServices)
  {
    v3 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_allServices;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_allServices, "objectForKeyedSubscript:", v9, (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v11)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)applications
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_allApplications)
  {
    v3 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_allApplications;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_allApplications, "objectForKeyedSubscript:", v9, (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v11)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

+ (id)nudityDetectionPolicyWithServices:(id)a3 applications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = MEMORY[0x1E0C9AAB0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13++));
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    v19 = MEMORY[0x1E0C9AAB0];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), (_QWORD)v23);
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllServices:allApplications:interventionType:", v7, v14, 0);
  return v21;
}

+ (id)nudityDetectionPolicyWithAllServices:(id)a3 allApplications:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllServices:allApplications:interventionType:", v6, v5, 0);

  return v7;
}

+ (id)communicationSafetyWithInterventionType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllServices:allApplications:interventionType:", 0, 0, v3);

  return v4;
}

- (NSDictionary)allServices
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)allApplications
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)interventionType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

@end
