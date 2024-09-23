@implementation DMCCertificateProperties

- (DMCCertificateProperties)initWithCertificate:(__SecCertificate *)a3
{
  DMCCertificateProperties *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateProperties;
  v3 = -[DMCCertificateProperties init](&v6, sel_init);
  if (v3)
  {
    v4 = (id)SecCertificateCopyProperties();
    -[DMCCertificateProperties _setup:](v3, "_setup:", v4);
    CFRelease(v4);

  }
  return v3;
}

- (DMCCertificateProperties)initWithCertificateProperties:(id)a3
{
  id v4;
  DMCCertificateProperties *v5;
  DMCCertificateProperties *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCCertificateProperties;
  v5 = -[DMCCertificateProperties init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DMCCertificateProperties _setup:](v5, "_setup:", v4);

  return v6;
}

- (DMCCertificateProperties)initWithTrust:(__SecTrust *)a3
{
  DMCCertificateProperties *v4;
  DMCCertificateProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMCCertificateProperties;
  v4 = -[DMCCertificateProperties init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[DMCCertificateProperties _sendablePropertiesFromTrust:](v4, "_sendablePropertiesFromTrust:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCCertificateProperties _sectionsFromProperties:](v5, "_sectionsFromProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCCertificateProperties _setup:](v5, "_setup:", v8);

  }
  return v5;
}

- (void)_setup:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSArray *keyValueSections;
  DMCCertificateProperties *v29;
  id obj;
  NSArray *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  +[DMCCertificateProperties sendablePropertiesFromProperties:](DMCCertificateProperties, "sendablePropertiesFromProperties:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  -[DMCCertificateProperties _sectionsFromProperties:](self, "_sectionsFromProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v31 = (NSArray *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v5;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v44;
    v6 = CFSTR("cell title");
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(obj);
        v37 = v7;
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        v10 = (void *)objc_opt_new();
        v36 = v8;
        objc_msgSend(v8, "objectForKey:", CFSTR("cell infos"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v38 = v11;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(v38);
              v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKey:", v6);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", CFSTR("cell value"));
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (v17)
                v20 = v18 == 0;
              else
                v20 = 1;
              if (!v20)
              {
                objc_msgSend(v9, "addObject:", v17);
                objc_msgSend(v9, "addObject:", v19);
                v21 = v6;
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63C68]), "initWithValue:localizedKey:", v19, v17);
                objc_msgSend(v10, "addObject:", v22);

                v6 = v21;
              }

            }
            v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v13);
        }
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v33, "addObject:", v9);
          objc_msgSend(v36, "objectForKey:", CFSTR("header title"));
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = &stru_24D52F990;
          if (v23)
            v25 = (__CFString *)v23;
          v26 = v25;

          objc_msgSend(v32, "addObject:", v26);
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63C70]), "initWithSectionTitle:footer:keyValues:", v26, 0, v10);

          -[NSArray addObject:](v31, "addObject:", v27);
        }

        v7 = v37 + 1;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v35);
  }

  if (objc_msgSend(v33, "count"))
  {
    objc_storeStrong((id *)&v29->_sections, v33);
    objc_storeStrong((id *)&v29->_sectionTitles, v32);
  }
  keyValueSections = v29->_keyValueSections;
  v29->_keyValueSections = v31;

}

- (id)_cellInfosForSection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKey:", CFSTR("localized label"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("value"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("section")))
        {
          -[DMCCertificateProperties _cellInfosForSection:](self, "_cellInfosForSection:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v13);
        }
        else
        {
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("string")) & 1) != 0
            || objc_msgSend(v11, "isEqualToString:", CFSTR("url"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("data"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("date")))
          {
            v14 = v12;
          }
          else
          {
            objc_msgSend(v12, "description");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v14;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v10, CFSTR("cell title"), v14, CFSTR("cell value"), 0);
          objc_msgSend(v4, "addObject:", v15);

        }
        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v6 = v16;
    }
    while (v16);
  }

  return v4;
}

- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  -[DMCCertificateProperties _cellInfosForSection:](self, "_cellInfosForSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, CFSTR("cell infos"), v7, CFSTR("header title"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sectionsFromProperties:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DMCCertificateProperties *v15;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v15 = self;
  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("localized label"), v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("section")))
        {
          -[DMCCertificateProperties _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v11, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v16, "addObject:", v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v16, "count"))
  {
    -[DMCCertificateProperties _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v13);

  }
  return v17;
}

+ (id)sendablePropertiesFromProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_sendablePropertyFromProperty:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_sendablePropertyFromProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9480]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE94B0]))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BDE9488];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9488]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v6, "setObject:forKey:", v9, v7);

    goto LABEL_6;
  }
  v6 = v4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE94A0]))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BDE9488];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9488]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sendablePropertiesFromProperties:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)_copyPropertiesFromTrust:(__SecTrust *)a3
{
  id v4;
  int CertificateCount;
  CFIndex v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    v6 = 0;
    v7 = CertificateCount;
    do
    {
      SecTrustGetCertificateAtIndex(a3, v6);
      v8 = SecCertificateCopyProperties();
      if (v8)
      {
        v9 = (const void *)v8;
        objc_msgSend(v4, "addObject:", v8);
        CFRelease(v9);
      }
      ++v6;
    }
    while (v7 != v6);
  }
  return v4;
}

- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[DMCCertificateProperties _copyPropertiesFromTrust:](self, "_copyPropertiesFromTrust:", a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[DMCCertificateProperties sendablePropertiesFromProperties:](DMCCertificateProperties, "sendablePropertiesFromProperties:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
