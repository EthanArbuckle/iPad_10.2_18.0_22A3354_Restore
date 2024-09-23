@implementation _KSUserWordsInfo

+ (id)keyNamesExcludingData
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("DynSize");
  v3[1] = CFSTR("DynDate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyForData
{
  return CFSTR("Data");
}

+ (id)keyboardDirectory
{
  return +[_KSUtilities keyboardDirectory](_KSUtilities, "keyboardDirectory");
}

+ (id)filesForLanguage:(id)a3
{
  id v4;
  _KSFileDirectory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _KSFileFile *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  _KSFileFile *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _KSFileDirectory *v30;
  _KSFileDirectory *v31;

  v4 = a3;
  v5 = -[_KSFileDirectory initWithName:]([_KSFileDirectory alloc], "initWithName:", &stru_24E206F98);
  objc_msgSend(a1, "keyboardDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SharedAcrossLanguagesNegativeLearning")))
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("AutocorrectionRejections.db"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    {
LABEL_3:
      v10 = -[_KSFileFile initWithURL:]([_KSFileFile alloc], "initWithURL:", v9);
      -[_KSFileDirectory addEntry:](v5, "addEntry:", v10);
LABEL_20:

    }
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SharedAcrossLanguagesVulgarWordUsage")))
  {
    v11 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("VulgarWordUsage.db"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
      goto LABEL_3;
    goto LABEL_21;
  }
  _KSGetSetting(ksDefaultSaveDynamicData, MEMORY[0x24BDBD1C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDBCF48];
    v16 = v4;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("en_US")) & 1) != 0)
    {
      v17 = CFSTR("dynamic-text.dat");
    }
    else
    {
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("-dynamic-text.dat"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v6, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0))
    {
      v20 = -[_KSFileFile initWithURL:]([_KSFileFile alloc], "initWithURL:", v19);
      -[_KSFileDirectory addEntry:](v5, "addEntry:", v20);

    }
  }
  _KSGetSetting(ksDefaultSaveLanguageModel, MEMORY[0x24BDBD1C8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    v23 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDBCB40]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@-dynamic.lm"), v25, v26);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-dynamic.lm"), v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fileURLWithPath:", v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
      goto LABEL_21;
    v10 = -[_KSFileDirectory initWithDirectory:captureContents:storeRoot:]([_KSFileDirectory alloc], "initWithDirectory:captureContents:storeRoot:", v9, 1, 1);
    -[_KSFileDirectory addEntry:](v5, "addEntry:", v10);
    goto LABEL_20;
  }
LABEL_22:

  -[_KSFileDirectory contents](v5, "contents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    v30 = v5;
  else
    v30 = 0;
  v31 = v30;

  return v31;
}

+ (id)infoWithFiles:(id)a3
{
  id v3;
  _KSUserWordsInfo *v4;

  v3 = a3;
  v4 = -[_KSUserWordsInfo initWithFiles:]([_KSUserWordsInfo alloc], "initWithFiles:", v3);

  return v4;
}

+ (id)infoWithRecord:(id)a3
{
  id v3;
  _KSUserWordsInfo *v4;

  v3 = a3;
  v4 = -[_KSUserWordsInfo initWithRecord:]([_KSUserWordsInfo alloc], "initWithRecord:", v3);

  return v4;
}

- (_KSUserWordsInfo)initWithFiles:(id)a3
{
  id v5;
  _KSUserWordsInfo *v6;
  _KSUserWordsInfo *v7;
  void **p_file;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSDate *modifiedDate;
  void *v41;
  NSDate *v42;
  _KSUserWordsInfo *v43;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)_KSUserWordsInfo;
  v6 = -[_KSUserWordsInfo init](&v48, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_14;
  v47 = v5;
  p_file = (void **)&v6->_file;
  objc_storeStrong((id *)&v6->_file, a3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FindEntry(v7->_file, CFSTR("AutocorrectionRejections.db"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v55[0] = CFSTR("size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v10, "size"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v12;
    v55[1] = CFSTR("date");
    objc_msgSend(v11, "lastModified");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _KSGetSetting(ksDefaultSortNegativeLearning, &unk_24E20FC90);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v14, v15);

  }
  v45 = v11;
  FindEntry(*p_file, CFSTR("VulgarWordUsage.db"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v53[0] = CFSTR("size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v16, "size", v11));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = CFSTR("date");
    v54[0] = v18;
    objc_msgSend(v17, "lastModified");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _KSGetSetting(ksDefaultSortVulgarWordUsageDatabase, &unk_24E20FC90);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v20, v21);

  }
  FindEntry(*p_file, CFSTR("dynamic-text.dat"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v51[0] = CFSTR("size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v22, "size"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = CFSTR("date");
    v52[0] = v24;
    objc_msgSend(v23, "lastModified");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _KSGetSetting(ksDefaultSortDynamicData, &unk_24E20FCA8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v26, v27);

  }
  FindEntry(*p_file, CFSTR("dynamic.lm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  FindEntry(v28, CFSTR("dynamic.dat"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v49[0] = CFSTR("size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v29, "size"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = CFSTR("date");
    v50[0] = v31;
    objc_msgSend(v30, "lastModified");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _KSGetSetting(ksDefaultSortLanguageModel, &unk_24E20FCC0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v33, v34);

  }
  objc_msgSend(v9, "allKeys", v45);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v36, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }
  v5 = v47;
  objc_msgSend(v38, "objectForKey:", CFSTR("date"));
  v39 = objc_claimAutoreleasedReturnValue();
  modifiedDate = v7->_modifiedDate;
  v7->_modifiedDate = (NSDate *)v39;

  objc_msgSend(v38, "objectForKey:", CFSTR("size"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_size = (int)objc_msgSend(v41, "intValue");

  v42 = v7->_modifiedDate;
  if (!v42)
    v43 = 0;
  else
LABEL_14:
    v43 = v7;

  return v43;
}

- (_KSUserWordsInfo)initWithRecord:(id)a3
{
  id v4;
  _KSUserWordsInfo *v5;
  void *v6;
  NSDate *v7;
  NSDate *modifiedDate;
  _KSUserWordsInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSUserWordsInfo;
  v5 = -[_KSUserWordsInfo init](&v11, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DynSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v5->_size = (int)objc_msgSend(v6, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DynDate"));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_9;
  }
  modifiedDate = v5->_modifiedDate;
  v5->_modifiedDate = v7;

LABEL_7:
  v9 = v5;
LABEL_10:

  return v9;
}

- (BOOL)isBetterThan:(id)a3
{
  double v4;
  __CFString *v5;
  _QWORD *v6;
  void *v7;
  float v8;
  double v9;
  NSDate *modifiedDate;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  float v15;
  double v16;

  if (!a3)
    return 1;
  v4 = (double)self->_size - (double)*((unint64_t *)a3 + 2);
  v5 = ksDefaultSizeNormalise;
  v6 = a3;
  _KSGetSetting(v5, &unk_24E20FD08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v4 * v8;

  modifiedDate = self->_modifiedDate;
  v11 = v6[1];

  -[NSDate timeIntervalSinceDate:](modifiedDate, "timeIntervalSinceDate:", v11);
  v13 = v12;
  _KSGetSetting(ksDefaultDateNormalise, &unk_24E20FD18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v13 * v15;

  return v9 + v16 > 0.0;
}

- (void)saveToRecord:(id)a3
{
  void *v4;
  unint64_t size;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  size = self->_size;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLong:", size);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("DynSize"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_modifiedDate, CFSTR("DynDate"));
  v8 = objc_alloc(MEMORY[0x24BDB9010]);
  -[_KSFileEntry serialiseToTemporaryFile](self->_file, "serialiseToTemporaryFile");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithFileURL:", v10);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Data"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)_KSUserWordsInfo;
  -[_KSUserWordsInfo description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_file)
    v6 = CFSTR("; local");
  else
    v6 = &stru_24E206F98;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; size = %zu; date = %@%@>"),
    v4,
    self->_size,
    self->_modifiedDate,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
}

+ (void)filesForLanguage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "+[_KSUserWordsInfo filesForLanguage:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  Failed to get files for language '%@': %@", (uint8_t *)&v3, 0x20u);
}

@end
