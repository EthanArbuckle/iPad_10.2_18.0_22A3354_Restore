@implementation WDElectrocardiogramActivityItemSource

- (id)pdfFileNameForSampleDate:(id)a3 firstName:(id)a4 lastName:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setDateFormat:", CFSTR("HH.mm"));
  v12 = *MEMORY[0x24BDBCA18];
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalendar:", v13);

  v49 = v11;
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCalendar:", v14);

  v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v15, "setDateStyle:", 0);
  objc_msgSend(v15, "setTimeStyle:", 1);
  objc_msgSend(v15, "setFormattingContext:", 5);
  objc_msgSend(v15, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v15, "stringFromDate:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "invertedSet");
  v18 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v18;
  v54 = v16;
  objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", &stru_24D38E7C8);
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x24BDD16F0]);
  v52 = (void *)v20;
  objc_msgSend(v21, "numberFromString:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v22;
  if (v22)
  {
    v23 = v7;
    v24 = objc_msgSend(v22, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    v24 = objc_msgSend(v25, "component:fromDate:", 32, v7);

  }
  v55 = v9;
  v56 = v8;
  if (objc_msgSend(v8, "length") || objc_msgSend(v9, "length"))
  {
    v26 = objc_alloc_init(MEMORY[0x24BDD1730]);
    objc_msgSend(v26, "setGivenName:", v8);
    objc_msgSend(v26, "setFamilyName:", v9);
    objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v26, 2, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/\\"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x24BDD17C8];
    v30 = objc_retainAutorelease(v27);
    objc_msgSend(v29, "stringWithUTF8String:", objc_msgSend(v30, "UTF8String"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hk_stringByRemovingCharactersInSet:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  v33 = objc_msgSend(v32, "length");
  v34 = (void *)MEMORY[0x24BDD17C8];
  WDBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v23;
  v36 = v23;
  if (v33)
  {
    if (v24 == 1)
      v37 = CFSTR("PDF_FILE_NAME_SINGULAR_HOUR");
    else
      v37 = CFSTR("PDF_FILE_NAME_PLURAL_HOUR");
    v38 = v35;
    objc_msgSend(v35, "localizedStringForKey:value:table:", v37, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v49;
    objc_msgSend(v49, "stringFromDate:", v36);
    v43 = v10;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", v40, v32, v41, v44);
  }
  else
  {
    if (v24 == 1)
      v45 = CFSTR("PDF_FILE_NAME_SINGULAR_HOUR_WITHOUT_NAME");
    else
      v45 = CFSTR("PDF_FILE_NAME_PLURAL_HOUR_WITHOUT_NAME");
    v38 = v35;
    objc_msgSend(v35, "localizedStringForKey:value:table:", v45, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v49;
    objc_msgSend(v49, "stringFromDate:", v36);
    v43 = v10;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", v40, v41, v44, v48);
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (WDElectrocardiogramActivityItemSource)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6 provenance:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WDElectrocardiogramActivityItemSource *v16;
  WDElectrocardiogramActivityItemSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *pdfTemporaryFileURL;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSURL *v43;
  WDElectrocardiogramActivityItemSource *v44;
  unint64_t v46;
  id v47;
  id v48;
  objc_super v49;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v49.receiver = self;
  v49.super_class = (Class)WDElectrocardiogramActivityItemSource;
  v16 = -[WDElectrocardiogramActivityItemSource init](&v49, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_11;
  v46 = a7;
  -[WDElectrocardiogramActivityItemSource pdfFileNameForSampleDate:firstName:lastName:](v16, "pdfFileNameForSampleDate:firstName:lastName:", v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("pdf"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  pdfTemporaryFileURL = v17->_pdfTemporaryFileURL;
  v17->_pdfTemporaryFileURL = (NSURL *)v22;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v24, "fileExistsAtPath:", v21);

  if (!(_DWORD)v20)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramActivityItemSource pdfTemporaryFileURL](v17, "pdfTemporaryFileURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v25, "removeItemAtURL:error:", v26, &v48);
  v27 = v48;

  if (!v27)
  {
LABEL_6:
    -[WDElectrocardiogramActivityItemSource pdfTemporaryFileURL](v17, "pdfTemporaryFileURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v12, "writeToURL:options:error:", v35, 536870913, &v47);
    v27 = v47;

    if (v27)
    {
      _HKInitializeLogging();
      v36 = *MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:].cold.1((uint64_t)v27, v36, v37, v38, v39, v40, v41, v42);
      goto LABEL_9;
    }
    v17->_provenance = v46;

LABEL_11:
    v44 = v17;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  v28 = *MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
    -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:].cold.2((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
LABEL_9:
  v43 = v17->_pdfTemporaryFileURL;
  v17->_pdfTemporaryFileURL = 0;

  v44 = 0;
LABEL_12:

  return v44;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE4C0C8], "sharedManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackElectrocardiogramPDFSharedFrom:", -[WDElectrocardiogramActivityItemSource provenance](self, "provenance"));
  -[WDElectrocardiogramActivityItemSource pdfTemporaryFileURL](self, "pdfTemporaryFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramActivityItemSource pdfTemporaryFileURL](self, "pdfTemporaryFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramActivityItemSource;
  -[WDElectrocardiogramActivityItemSource dealloc](&v5, sel_dealloc);
}

- (NSURL)pdfTemporaryFileURL
{
  return self->_pdfTemporaryFileURL;
}

- (unint64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(unint64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfTemporaryFileURL, 0);
}

- (void)initWithPDFData:(uint64_t)a3 sampleDate:(uint64_t)a4 firstName:(uint64_t)a5 lastName:(uint64_t)a6 provenance:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "Could not write PDF temporary file: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithPDFData:(uint64_t)a3 sampleDate:(uint64_t)a4 firstName:(uint64_t)a5 lastName:(uint64_t)a6 provenance:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "Could not delete existing PDF temporary file: %@", a5, a6, a7, a8, 2u);
}

@end
