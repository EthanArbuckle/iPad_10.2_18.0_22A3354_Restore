@implementation CertUICertificatePropertiesInfo

- (CertUICertificatePropertiesInfo)initWithCertificate:(__SecCertificate *)a3
{
  CertUICertificatePropertiesInfo *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CertUICertificatePropertiesInfo;
  v3 = -[CertUICertificatePropertiesInfo init](&v8, sel_init);
  if (v3)
  {
    v4 = (id)SecCertificateCopyProperties();
    -[CertUICertificatePropertiesInfo _sendablePropertiesFromProperties:](v3, "_sendablePropertiesFromProperties:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUICertificatePropertiesInfo _sectionsFromProperties:](v3, "_sectionsFromProperties:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CertUICertificatePropertiesInfo _setup:](v3, "_setup:", v6);
    CFRelease(v4);

  }
  return v3;
}

- (CertUICertificatePropertiesInfo)initWithCertificateProperties:(id)a3
{
  id v4;
  CertUICertificatePropertiesInfo *v5;
  CertUICertificatePropertiesInfo *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CertUICertificatePropertiesInfo;
  v5 = -[CertUICertificatePropertiesInfo init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CertUICertificatePropertiesInfo _sendablePropertiesFromProperties:](v5, "_sendablePropertiesFromProperties:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUICertificatePropertiesInfo _sectionsFromProperties:](v6, "_sectionsFromProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CertUICertificatePropertiesInfo _setup:](v6, "_setup:", v8);
  }

  return v6;
}

- (CertUICertificatePropertiesInfo)initWithSendableCertificateProperties:(id)a3
{
  id v4;
  CertUICertificatePropertiesInfo *v5;
  CertUICertificatePropertiesInfo *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CertUICertificatePropertiesInfo;
  v5 = -[CertUICertificatePropertiesInfo init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CertUICertificatePropertiesInfo _sectionsFromProperties:](v5, "_sectionsFromProperties:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUICertificatePropertiesInfo _setup:](v6, "_setup:", v7);

  }
  return v6;
}

- (CertUICertificatePropertiesInfo)initWithTrust:(__SecTrust *)a3
{
  CertUICertificatePropertiesInfo *v4;
  CertUICertificatePropertiesInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CertUICertificatePropertiesInfo;
  v4 = -[CertUICertificatePropertiesInfo init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CertUICertificatePropertiesInfo _sendablePropertiesFromTrust:](v4, "_sendablePropertiesFromTrust:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUICertificatePropertiesInfo _sectionsFromProperties:](v5, "_sectionsFromProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUICertificatePropertiesInfo _setup:](v5, "_setup:", v8);

  }
  return v5;
}

- (void)_setup:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  id obj;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v24 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v6 = (void *)objc_opt_new();
        v27 = v5;
        objc_msgSend(v5, "objectForKey:", CFSTR("cell infos"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v12, "objectForKey:", CFSTR("cell title"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKey:", CFSTR("cell value"));
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              if (v13)
                v16 = v14 == 0;
              else
                v16 = 1;
              if (!v16)
              {
                objc_msgSend(v6, "addObject:", v13);
                objc_msgSend(v6, "addObject:", v15);
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v9);
        }
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(v24, "addObject:", v6);
          objc_msgSend(v27, "objectForKey:", CFSTR("header title"));
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          v19 = &stru_24C813780;
          if (v17)
            v19 = (__CFString *)v17;
          v20 = v19;

          objc_msgSend(v23, "addObject:", v20);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_storeStrong((id *)&self->_sections, v24);
    objc_storeStrong((id *)&self->_sectionTitles, v23);
  }

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
          -[CertUICertificatePropertiesInfo _cellInfosForSection:](self, "_cellInfosForSection:", v12);
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
  -[CertUICertificatePropertiesInfo _cellInfosForSection:](self, "_cellInfosForSection:", a3);
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
  CertUICertificatePropertiesInfo *v15;
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
          -[CertUICertificatePropertiesInfo _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v11, v9);
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
    -[CertUICertificatePropertiesInfo _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v13);

  }
  return v17;
}

- (id)_sendablePropertyFromProperty:(id)a3
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
    -[CertUICertificatePropertiesInfo _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)_sendablePropertiesFromProperties:(id)a3
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
        -[CertUICertificatePropertiesInfo _sendablePropertyFromProperty:](self, "_sendablePropertyFromProperty:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
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
  v4 = -[CertUICertificatePropertiesInfo _copyPropertiesFromTrust:](self, "_copyPropertiesFromTrust:", a3);
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
        -[CertUICertificatePropertiesInfo _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
