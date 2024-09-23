@implementation _LTLocaleModalities

- (_LTLocaleModalities)initWithSupportedLocales:(id)a3 asrLocales:(id)a4 ttsLocales:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTLocaleModalities *v11;
  _LTLocaleModalities *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSDictionary *modalitiesPerLocale;
  _LTLocaleModalities *v39;
  _LTLocaleModalities *v41;
  id v42;
  id v43;
  void *v44;
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
  objc_super v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v57.receiver = self;
  v57.super_class = (Class)_LTLocaleModalities;
  v11 = -[_LTLocaleModalities init](&v57, sel_init);
  v12 = v11;
  if (v11)
  {
    v44 = v10;
    v41 = v11;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_2506A41E0, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v16);
    }
    v43 = v8;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v42 = v9;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v13, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            v26 = _LTOSLogAssets();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v24;
              _os_log_fault_impl(&dword_235438000, v26, OS_LOG_TYPE_FAULT, "ASR locale is not present in supported locale list, %{public}@", buf, 0xCu);
            }
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v25, "integerValue") | 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v21);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = v44;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
          objc_msgSend(v13, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            v35 = _LTOSLogAssets();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v33;
              _os_log_fault_impl(&dword_235438000, v35, OS_LOG_TYPE_FAULT, "TTS locale is not present in supported locale list, %{public}@", buf, 0xCu);
            }
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v34, "integerValue") | 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v30);
    }

    v37 = objc_msgSend(v13, "copy");
    v12 = v41;
    modalitiesPerLocale = v41->_modalitiesPerLocale;
    v41->_modalitiesPerLocale = (NSDictionary *)v37;

    v39 = v41;
    v9 = v42;
    v8 = v43;
    v10 = v44;
  }

  return v12;
}

- (_LTLocaleModalities)initWithModalitiesPerLocale:(id)a3
{
  id v4;
  _LTLocaleModalities *v5;
  uint64_t v6;
  NSDictionary *modalitiesPerLocale;
  _LTLocaleModalities *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTLocaleModalities;
  v5 = -[_LTLocaleModalities init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    modalitiesPerLocale = v5->_modalitiesPerLocale;
    v5->_modalitiesPerLocale = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)modalitiesForLocale:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_modalitiesPerLocale, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)locale:(id)a3 supportsModality:(unint64_t)a4
{
  return (a4 & ~-[_LTLocaleModalities modalitiesForLocale:](self, "modalitiesForLocale:", a3)) == 0;
}

- (_LTLocaleModalities)initWithCoder:(id)a3
{
  id v4;
  _LTLocaleModalities *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *modalitiesPerLocale;
  _LTLocaleModalities *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTLocaleModalities;
  v5 = -[_LTLocaleModalities init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("modalitiesPerLocale"));
    v9 = objc_claimAutoreleasedReturnValue();
    modalitiesPerLocale = v5->_modalitiesPerLocale;
    v5->_modalitiesPerLocale = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_modalitiesPerLocale, CFSTR("modalitiesPerLocale"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LTLocaleModalities initWithModalitiesPerLocale:]([_LTLocaleModalities alloc], "initWithModalitiesPerLocale:", self->_modalitiesPerLocale);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("{\n"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_modalitiesPerLocale;
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
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "_ltLocaleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_modalitiesPerLocale, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@: %@,\n"), v10, v11, (_QWORD)v13);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (NSDictionary)modalitiesPerLocale
{
  return self->_modalitiesPerLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalitiesPerLocale, 0);
}

@end
