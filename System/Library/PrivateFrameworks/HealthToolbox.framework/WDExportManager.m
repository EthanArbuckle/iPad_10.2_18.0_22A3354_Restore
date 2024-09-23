@implementation WDExportManager

- (WDExportManager)initWithProfile:(id)a3
{
  id v5;
  WDExportManager *v6;
  WDExportManager *v7;
  uint64_t v8;
  OS_dispatch_queue *outputSerialQueue;
  void *v10;
  uint64_t v11;
  NSString *documentsPath;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *exportPath;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *filePath;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *CDAFilePath;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *archivePath;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WDExportManager;
  v6 = -[WDExportManager init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    outputSerialQueue = v7->_outputSerialQueue;
    v7->_outputSerialQueue = (OS_dispatch_queue *)v8;

    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    documentsPath = v7->_documentsPath;
    v7->_documentsPath = (NSString *)v11;

    v13 = v7->_documentsPath;
    WDBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_DIRECTORY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    exportPath = v7->_exportPath;
    v7->_exportPath = (NSString *)v16;

    v18 = v7->_exportPath;
    WDBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_FILE_XML"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR(".xml"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v18, "stringByAppendingPathComponent:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    filePath = v7->_filePath;
    v7->_filePath = (NSString *)v22;

    v24 = v7->_exportPath;
    WDBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_FILE_CDA"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingString:", CFSTR(".xml"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v24, "stringByAppendingPathComponent:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    CDAFilePath = v7->_CDAFilePath;
    v7->_CDAFilePath = (NSString *)v28;

    v30 = v7->_documentsPath;
    WDBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATE_FILE_ZIP"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingString:", CFSTR(".zip"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v30, "stringByAppendingPathComponent:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    archivePath = v7->_archivePath;
    v7->_archivePath = (NSString *)v34;

    -[WDExportManager setExportInProgress:](v7, "setExportInProgress:", 0);
    -[WDExportManager setExportFailed:](v7, "setExportFailed:", 0);
  }

  return v7;
}

- (void)cancelCurrentExport
{
  if (-[WDExportManager exportInProgress](self, "exportInProgress"))
    -[WDExportManager setExportFailed:](self, "setExportFailed:", 1);
}

- (void)cleanupExportFilesWithError:(id)a3
{
  id v4;
  void *v5;
  NSString *exportPath;
  id v7;
  NSString *archivePath;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", self->_exportPath))
  {
    exportPath = self->_exportPath;
    v11 = v4;
    objc_msgSend(v5, "removeItemAtPath:error:", exportPath, &v11);
    v7 = v11;

    v4 = v7;
  }
  if (objc_msgSend(v5, "fileExistsAtPath:", self->_archivePath))
  {
    archivePath = self->_archivePath;
    v10 = v4;
    objc_msgSend(v5, "removeItemAtPath:error:", archivePath, &v10);
    v9 = v10;

    v4 = v9;
  }

}

- (void)createExportFileWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDateFormatter *v11;
  NSDateFormatter *xmlDateFormatter;
  NSDateFormatter *v13;
  NSDateFormatter *cdaDateFormatter;
  id v15;

  v4 = a3;
  if (!-[WDExportManager exportInProgress](self, "exportInProgress"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_applicationProvider);
    objc_msgSend(WeakRetained, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdleTimerDisabled:", 1);

    -[WDExportManager setExportInProgress:](self, "setExportInProgress:", 1);
    v7 = (void *)MEMORY[0x24BDBCF38];
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZoneForSecondsFromGMT:", objc_msgSend(v8, "secondsFromGMT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSDateFormatter *)objc_opt_new();
    xmlDateFormatter = self->_xmlDateFormatter;
    self->_xmlDateFormatter = v11;

    -[NSDateFormatter setLocale:](self->_xmlDateFormatter, "setLocale:", v10);
    -[NSDateFormatter setDateFormat:](self->_xmlDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
    -[NSDateFormatter setTimeZone:](self->_xmlDateFormatter, "setTimeZone:", v9);
    v13 = (NSDateFormatter *)objc_opt_new();
    cdaDateFormatter = self->_cdaDateFormatter;
    self->_cdaDateFormatter = v13;

    -[NSDateFormatter setLocale:](self->_cdaDateFormatter, "setLocale:", v10);
    -[NSDateFormatter setDateFormat:](self->_cdaDateFormatter, "setDateFormat:", CFSTR("yyyyMMddHHmmssZZZ"));
    -[NSDateFormatter setTimeZone:](self->_cdaDateFormatter, "setTimeZone:", v9);
    v15 = v4;
    HKDispatchAsyncOnGlobalConcurrentQueue();

  }
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  xmlTextWriter *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  _QWORD *v72;
  uint64_t v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  _QWORD block[5];
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[5];
  id v101;
  id v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;
  _QWORD v120[3];

  v120[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id *)(a1 + 32);
  if (objc_msgSend(v85, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)))
  {
    v2 = *((_QWORD *)*v1 + 10);
    v115 = 0;
    objc_msgSend(v85, "removeItemAtPath:error:", v2, &v115);
    v3 = v115;
  }
  else
  {
    v3 = 0;
  }
  v4 = *((_QWORD *)*v1 + 10);
  v5 = *MEMORY[0x24BDD0CD0];
  v6 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *MEMORY[0x24BDD0CD0], *MEMORY[0x24BDD0CF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v7, 0);

  v8 = *((_QWORD *)*v1 + 11);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "createFileAtPath:contents:attributes:", v8, 0, v9);

  v10 = *((_QWORD *)*v1 + 12);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "createFileAtPath:contents:attributes:", v10, 0, v11);

  v12 = *((_QWORD *)*v1 + 13);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "createFileAtPath:contents:attributes:", v12, 0, v13);

  v14 = objc_msgSend(v85, "fileExistsAtPath:", *((_QWORD *)*v1 + 11));
  v15 = (os_log_t *)MEMORY[0x24BDD3070];
  if (v14 && (objc_msgSend(v85, "fileExistsAtPath:", *((_QWORD *)*v1 + 12)) & 1) != 0)
  {
    v16 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v17 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_6((uint64_t)v1, v17, v18);
    v119 = *MEMORY[0x24BDD0FC8];
    v120[0] = CFSTR("Export file(s) could not be created.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v120, &v119, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HealthExport"), 100, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  v20 = dispatch_semaphore_create(0);
  v21 = (void *)*((_QWORD *)*v1 + 5);
  *((_QWORD *)*v1 + 5) = v20;

  objc_msgSend(*v1, "_queryForDateRanges");
  *((_QWORD *)*v1 + 3) = xmlNewTextWriterFilename((const char *)objc_msgSend(*((id *)*v1 + 11), "UTF8String"), 0);
  xmlTextWriterSetIndent(*((xmlTextWriterPtr *)*v1 + 3), 1);
  xmlTextWriterSetIndentString(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)" ");
  xmlTextWriterStartDocument(*((xmlTextWriterPtr *)*v1 + 3), 0, "UTF-8", 0);
  xmlTextWriterWriteDTD(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)"HealthData", 0, 0, (const xmlChar *)aHealthkitExpor);
  xmlTextWriterStartElement(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)"HealthData");
  v22 = (xmlTextWriter *)*((_QWORD *)*v1 + 3);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localeIdentifier");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v22, (const xmlChar *)"locale", (const xmlChar *)objc_msgSend(v24, "UTF8String"));

  *((_QWORD *)*v1 + 4) = xmlNewTextWriterFilename((const char *)objc_msgSend(*((id *)*v1 + 12), "UTF8String"), 0);
  xmlTextWriterSetIndent(*((xmlTextWriterPtr *)*v1 + 4), 1);
  xmlTextWriterSetIndentString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)" ");
  xmlTextWriterStartDocument(*((xmlTextWriterPtr *)*v1 + 4), 0, 0, 0);
  xmlTextWriterStartPI(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xml-stylesheet");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"type=\"text/xsl\");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)" ");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"href=\"CDA.xsl\");
  xmlTextWriterEndPI(*((xmlTextWriterPtr *)*v1 + 4));
  xmlTextWriterStartElement(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"ClinicalDocument");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"xsi", 0, (const xmlChar *)"http://www.w3.org/2001/XMLSchema-instance");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xsi", (const xmlChar *)"schemaLocation", 0, (const xmlChar *)"urn:hl7-org:v3 ../../../CDA%20R2/cda-schemas-and-samples/infrastructure/cda/CDA.xsd");
  xmlTextWriterWriteAttribute(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"urn:hl7-org:v3");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"cda", 0, (const xmlChar *)"urn:hl7-org:v3");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"sdtc", 0, (const xmlChar *)"urn:l7-org:sdtc");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"fhir", 0, (const xmlChar *)"http://hl7.org/fhir/v3");

  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0;
  objc_msgSend(v25, "dateOfBirthComponentsWithError:", &v114);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v114;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateFromComponents:", v80);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    if (v26)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_5();
    }
  }

  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0;
  objc_msgSend(v29, "biologicalSexWithError:", &v113);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v113;

  if (!v30)
  {
    if (v31)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_4();
    }
  }

  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  objc_msgSend(v32, "bloodTypeWithError:", &v112);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v112;

  if (!v83)
  {
    if (v33)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_3();
    }
  }

  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0;
  objc_msgSend(v34, "fitzpatrickSkinTypeWithError:", &v111);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v111;

  if (!v82)
  {
    if (v35)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_2();
    }
  }

  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  objc_msgSend(v36, "_cardioFitnessMedicationsUseWithError:", &v110);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v110;

  if (!v37)
  {
    if (v84)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_1();
    }
  }
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v37, "takingCalciumChannelBlockers"))
  {
    WDBundle();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CALCIUM_CHANNEL_USE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v40);

  }
  if (objc_msgSend(v37, "takingBetaBlockers"))
  {
    WDBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("BETA_BLOCKERS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v42);

  }
  if ((objc_msgSend(v37, "medicationsAreSet") & 1) == 0)
  {
    WDBundle();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v44);

  }
  objc_msgSend(v38, "componentsJoinedByString:", CFSTR(", "));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "_writeXMLPersonWithDateOfBirth:biologicalSex:bloodType:skinType:cardioFitnessMedicationsUse:", v28, objc_msgSend(v30, "biologicalSex"), objc_msgSend(v83, "bloodType"), objc_msgSend(v82, "skinType"), v79);
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy_;
  v108 = __Block_byref_object_dispose_;
  v109 = 0;
  v45 = objc_alloc(MEMORY[0x24BDD3CF0]);
  objc_msgSend(*((id *)*v1 + 1), "healthStore");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v45, "initWithHealthStore:", v46);

  v100[0] = MEMORY[0x24BDAC760];
  v100[1] = 3221225472;
  v100[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_244;
  v100[3] = &unk_24D38D438;
  v48 = *v1;
  v103 = &v104;
  v100[4] = v48;
  v78 = v28;
  v101 = v78;
  v77 = v30;
  v102 = v77;
  objc_msgSend(v47, "fetchMedicalIDDataWithCompletion:", v100);
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  v49 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v51 = (void *)*((_QWORD *)*v1 + 6);
  *((_QWORD *)*v1 + 6) = v50;

  objc_msgSend(*v1, "_getAllOrdinaryDataTypesOfCategory:withArray:", 1, *((_QWORD *)*v1 + 6));
  objc_msgSend(v49, "addObjectsFromArray:", *((_QWORD *)*v1 + 6));
  v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v53 = (void *)*((_QWORD *)*v1 + 7);
  *((_QWORD *)*v1 + 7) = v52;

  objc_msgSend(*v1, "_getAllOrdinaryDataTypesOfCategory:withArray:", 0, *((_QWORD *)*v1 + 7));
  objc_msgSend(v49, "addObjectsFromArray:", *((_QWORD *)*v1 + 7));
  objc_msgSend(*v1, "_getAllOrdinaryDataTypesOfCategory:withArray:", 2, v49);
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    v54 = v38;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v55 = v49;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v97;
LABEL_39:
      v58 = 0;
      while (1)
      {
        if (*(_QWORD *)v97 != v57)
          objc_enumerationMutation(v55);
        objc_msgSend(*v1, "_writeQuantityType:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v58));
        if ((objc_msgSend(*v1, "exportFailed") & 1) != 0)
          break;
        if (v56 == ++v58)
        {
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
          if (v56)
            goto LABEL_39;
          break;
        }
      }
    }

    v38 = v54;
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*v1, "_getAllOrdinaryDataTypesOfClass:withArray:", objc_opt_class(), v59);
    v60 = v38;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v61 = v59;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v93;
LABEL_49:
      v64 = 0;
      while (1)
      {
        if (*(_QWORD *)v93 != v63)
          objc_enumerationMutation(v61);
        objc_msgSend(*v1, "_writeCategoryType:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v64));
        dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
        if ((objc_msgSend(*v1, "exportFailed") & 1) != 0)
          break;
        if (v62 == ++v64)
        {
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
          if (v62)
            goto LABEL_49;
          break;
        }
      }
    }

    v38 = v60;
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    v65 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*v1, "_getAllOrdinaryDataTypesOfClass:withArray:", objc_opt_class(), v65);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v66 = v65;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v89;
LABEL_59:
      v69 = 0;
      while (1)
      {
        if (*(_QWORD *)v89 != v68)
          objc_enumerationMutation(v66);
        objc_msgSend(*v1, "_writeCorrelationType:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v69));
        dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
        if ((objc_msgSend(*v1, "exportFailed") & 1) != 0)
          break;
        if (v67 == ++v69)
        {
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
          if (v67)
            goto LABEL_59;
          break;
        }
      }
    }

  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writeAudiogramType");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writeWorkoutType");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writeActivitySummaries");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writeHRVAndTachograms");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writePrescriptionType");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if ((objc_msgSend(*v1, "exportFailed") & 1) == 0)
  {
    objc_msgSend(*v1, "_writeMedicalRecords");
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_msgSend(*v1, "_completeAndCloseStreamingXML");
  objc_msgSend(*v1, "_exportHealthRecords");
  objc_msgSend(*v1, "_exportElectrocardiogramsWithName:dateOfBirth:", v105[5], v78);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_3;
  v87[3] = &unk_24D38D000;
  v87[4] = *v1;
  objc_msgSend(v70, "addOperationWithBlock:", v87);

  v71 = objc_msgSend(*v1, "exportFailed");
  v72 = *v1;
  if (v71)
  {
    objc_msgSend(v72, "cleanupExportFilesWithError:", v84);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v72, "_archiveExportDirectory:toFile:", v72[10], v72[13]);
    v73 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v73 + 16))(v73, v74, v84);

  }
  v75 = *v1;
  v76 = *((_QWORD *)*v1 + 2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_4;
  block[3] = &unk_24D38D000;
  block[4] = v75;
  dispatch_async(v76, block);

  _Block_object_dispose(&v104, 8);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 16);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_2;
  v11[3] = &unk_24D38D410;
  v11[4] = v7;
  v12 = v3;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v10 = v3;
  dispatch_async(v9, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));

}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_writeCDAHeaderWithName:birthData:biologicalSex:", v3, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "biologicalSex"));

}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "application");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdleTimerDisabled:", 0);

}

uint64_t __50__WDExportManager_createExportFileWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setExportInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 0);
}

+ (id)allSupportedMedicalTypes
{
  if (allSupportedMedicalTypes_onceToken != -1)
    dispatch_once(&allSupportedMedicalTypes_onceToken, &__block_literal_global_3);
  return (id)allSupportedMedicalTypes_sampleTypes;
}

void __43__WDExportManager_allSupportedMedicalTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3F08], "medicalRecordTypesWithOptions:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allSupportedMedicalTypes_sampleTypes;
  allSupportedMedicalTypes_sampleTypes = v0;

}

- (void)_queryForDateRanges
{
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, void *);
  void *v12;
  WDExportManager *v13;
  dispatch_semaphore_t v14;

  v3 = dispatch_semaphore_create(0);
  v4 = objc_alloc(MEMORY[0x24BDD41C8]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __38__WDExportManager__queryForDateRanges__block_invoke;
  v12 = &unk_24D38D4A8;
  v13 = self;
  v14 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithDateIntervalHandler:", &v9);
  -[WDProfile healthStore](self->_profile, "healthStore", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeQuery:", v6);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopQuery:", v6);

}

void __38__WDExportManager__queryForDateRanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;

  v7 = a3;
  v8 = a4;
  v9 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_storeStrong(v9 + 16, a3);
  }
  else
  {
    objc_msgSend(v9, "setExportFailed:", 1);
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __38__WDExportManager__queryForDateRanges__block_invoke_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_queryForSamplesOfType:(id)a3 batchHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v8 = dispatch_semaphore_create(0);
  do
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v35[5];
      *(_DWORD *)buf = 138543618;
      v41 = v6;
      v42 = 2114;
      v43 = v10;
      _os_log_impl(&dword_215814000, v9, OS_LOG_TYPE_DEFAULT, "Querying for %{public}@ starting with anchor: %{public}@", buf, 0x16u);
    }
    v11 = objc_alloc(MEMORY[0x24BDD3920]);
    v12 = v35[5];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke;
    v19[3] = &unk_24D38D4D0;
    v13 = v6;
    v20 = v13;
    v23 = &v30;
    v24 = &v26;
    v25 = &v34;
    v14 = v7;
    v22 = v14;
    v15 = v8;
    v21 = v15;
    v16 = (void *)objc_msgSend(v11, "initWithType:predicate:anchor:limit:resultsHandler:", v13, 0, v12, 2000, v19);
    -[WDProfile healthStore](self->_profile, "healthStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "executeQuery:", v16);

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    -[WDProfile healthStore](self->_profile, "healthStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stopQuery:", v16);

  }
  while (!*((_BYTE *)v31 + 24) && !-[WDExportManager exportFailed](self, "exportFailed"));
  if (*((_BYTE *)v27 + 24))
    -[WDExportManager setExportFailed:](self, "setExportFailed:", 1);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

void __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v17 = 134218242;
    v18 = objc_msgSend(v10, "count");
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_215814000, v15, OS_LOG_TYPE_DEFAULT, "Got %lld samples with anchor: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  if (v13)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a5);
    if (objc_msgSend(v10, "count"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_11;
    }
    if (objc_msgSend(v11, "count"))
      goto LABEL_11;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v16 + 24) = 1;
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_writeQuantityType:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *outputSerialQueue;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  char v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__WDExportManager__writeQuantityType___block_invoke;
  v11[3] = &unk_24D38D540;
  v13 = &v17;
  v14 = v16;
  v11[4] = self;
  v15 = v21;
  v6 = v4;
  v12 = v6;
  -[WDExportManager _queryForSamplesOfType:batchHandler:](self, "_queryForSamplesOfType:batchHandler:", v6, v11);
  if (v18[3] && !-[WDExportManager exportFailed](self, "exportFailed"))
  {
    outputSerialQueue = self->_outputSerialQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __38__WDExportManager__writeQuantityType___block_invoke_4;
    v8[3] = &unk_24D38D568;
    v8[4] = self;
    v9 = v6;
    v10 = &v17;
    dispatch_async(outputSerialQueue, v8);

  }
  dispatch_sync((dispatch_queue_t)self->_outputSerialQueue, &__block_literal_global_258);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

}

void __38__WDExportManager__writeQuantityType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v3, "count");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v3, "count");
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__WDExportManager__writeQuantityType___block_invoke_2;
  v8[3] = &unk_24D38D4F8;
  v11 = a1[8];
  v8[4] = v4;
  v9 = v5;
  v7 = v3;
  v10 = v7;
  dispatch_async(v6, v8);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) >> 4 >= 0x271uLL)
  {
    dispatch_sync(*(dispatch_queue_t *)(a1[4] + 16), &__block_literal_global_256);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  }

}

uint64_t __38__WDExportManager__writeQuantityType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_outputSerialQueue_beginWritingQuantityType:startDate:endDate:", v5, v6, v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_outputSerialQueue_writeSamples:forQuantityType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __38__WDExportManager__writeQuantityType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_outputSerialQueue_finishWritingQuantityType:count:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (void)_writeCategoryType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *, uint64_t);
  void *v15;
  WDExportManager *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD17C0]);
  v6 = (void *)objc_msgSend(v5, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v7 = objc_alloc(MEMORY[0x24BDD3F00]);
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __38__WDExportManager__writeCategoryType___block_invoke;
  v15 = &unk_24D38D5B0;
  v16 = self;
  v17 = v4;
  v9 = v4;
  v10 = (void *)objc_msgSend(v7, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, 0, 0, v8, &v12);

  -[WDProfile healthStore](self->_profile, "healthStore", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeQuery:", v10);

}

void __38__WDExportManager__writeCategoryType___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__WDExportManager__writeCategoryType___block_invoke_2;
    block[3] = &unk_24D38CEE8;
    block[4] = v7;
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __38__WDExportManager__writeCategoryType___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForCategoryType:", *(_QWORD *)(a1 + 48));
}

- (void)_writeCorrelationType:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, uint64_t);
  void *v12;
  WDExportManager *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD3AA0]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __41__WDExportManager__writeCorrelationType___block_invoke;
  v12 = &unk_24D38D5D8;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithType:predicate:samplePredicates:completion:", v6, 0, 0, &v9);
  -[WDProfile healthStore](self->_profile, "healthStore", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery:", v7);

}

void __41__WDExportManager__writeCorrelationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__WDExportManager__writeCorrelationType___block_invoke_2;
    block[3] = &unk_24D38CEE8;
    block[4] = v7;
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __41__WDExportManager__writeCorrelationType___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForCorrelationType:", *(_QWORD *)(a1 + 48));
}

- (void)_writeAudiogramType
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD17C0]);
  v4 = (void *)objc_msgSend(v3, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v5 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD3DC0], "audiogramSampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__WDExportManager__writeAudiogramType__block_invoke;
  v10[3] = &unk_24D38D270;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v6, 0, 0, v7, v10);

  -[WDProfile healthStore](self->_profile, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:", v8);

}

void __38__WDExportManager__writeAudiogramType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__WDExportManager__writeAudiogramType__block_invoke_2;
    v9[3] = &unk_24D38CEC0;
    v9[4] = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __38__WDExportManager__writeAudiogramType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForAudiogramType");
}

- (void)_writeWorkoutType
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD17C0]);
  v4 = (void *)objc_msgSend(v3, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v5 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__WDExportManager__writeWorkoutType__block_invoke;
  v10[3] = &unk_24D38D270;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v6, 0, 0, v7, v10);

  -[WDProfile healthStore](self->_profile, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:", v8);

}

void __36__WDExportManager__writeWorkoutType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__WDExportManager__writeWorkoutType__block_invoke_2;
    v9[3] = &unk_24D38CEC0;
    v9[4] = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __36__WDExportManager__writeWorkoutType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForWorkoutType");
}

- (void)_writeWorkoutRouteForWorkout:(id)a3 semaphore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  HKCreateSerialDispatchQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD17C0]);
  v10 = (void *)objc_msgSend(v9, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v11 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD3F28], "workoutRouteType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsFromWorkout:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke;
  v19[3] = &unk_24D38D600;
  v19[4] = self;
  v20 = v6;
  v21 = v8;
  v15 = v8;
  v16 = v6;
  v17 = (void *)objc_msgSend(v11, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v12, v13, 0, v14, v19);

  -[WDProfile healthStore](self->_profile, "healthStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeQuery:", v17);

}

void __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (v6 || !a4)
  {
    v8 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke_2;
    block[3] = &unk_24D38CEE8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

uint64_t __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForWorkoutRoutes:semaphore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_writeActivitySummaries
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x24BDD38F0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__WDExportManager__writeActivitySummaries__block_invoke;
  v6[3] = &unk_24D38D628;
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithPredicate:resultsHandler:", 0, v6);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", v4);

}

void __42__WDExportManager__writeActivitySummaries__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__WDExportManager__writeActivitySummaries__block_invoke_2;
    v9[3] = &unk_24D38CEC0;
    v9[4] = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __42__WDExportManager__writeActivitySummaries__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForActivitySummaries");
}

- (void)_writeHRVAndTachograms
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD17C0]);
  v4 = (void *)objc_msgSend(v3, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v5 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD3E80], "dataTypeWithCode:", 139);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__WDExportManager__writeHRVAndTachograms__block_invoke;
  v10[3] = &unk_24D38D270;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v6, 0, 0, v7, v10);

  -[WDProfile healthStore](self->_profile, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:", v8);

}

void __41__WDExportManager__writeHRVAndTachograms__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__WDExportManager__writeHRVAndTachograms__block_invoke_2;
    v9[3] = &unk_24D38CEC0;
    v9[4] = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __41__WDExportManager__writeHRVAndTachograms__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForHRVAndTachograms");
}

- (void)_writePrescriptionType
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD17C0]);
  v4 = (void *)objc_msgSend(v3, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 1);
  v5 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD3E20], "visionPrescriptionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__WDExportManager__writePrescriptionType__block_invoke;
  v10[3] = &unk_24D38D270;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v6, 0, 0, v7, v10);

  -[WDProfile healthStore](self->_profile, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:", v8);

}

void __41__WDExportManager__writePrescriptionType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 || !a4)
  {
    v8 = v7[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__WDExportManager__writePrescriptionType__block_invoke_2;
    v9[3] = &unk_24D38CEC0;
    v9[4] = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setExportFailed:", 1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  }

}

uint64_t __41__WDExportManager__writePrescriptionType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataForVisionRx");
}

- (void)_writeMedicalRecords
{
  OUTLINED_FUNCTION_3(&dword_215814000, a1, a3, "Export failed while attempting to query medical types; aborting.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_6();
}

void __39__WDExportManager__writeMedicalRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD **)(a1 + 32);
  if (v6 || !v7)
  {
    v9 = v8[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__WDExportManager__writeMedicalRecords__block_invoke_272;
    block[3] = &unk_24D38CEE8;
    block[4] = v8;
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(v8, "setExportFailed:", 1);
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __39__WDExportManager__writeMedicalRecords__block_invoke_cold_1();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

intptr_t __39__WDExportManager__writeMedicalRecords__block_invoke_272(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_writeDataForMedicalRecords:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_outputSerialQueue_beginWritingQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableArray firstObject](self->_resultsTypes, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v13)
    -[WDExportManager _writeCDAResultsHeader](self, "_writeCDAResultsHeader");
  -[NSMutableArray firstObject](self->_vitalsTypes, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v11 == v13)
  {
    -[WDExportManager _writeCDAVitalHeader](self, "_writeCDAVitalHeader");
    v12 = v13;
  }
  if (getCategoryOfType(v12))
  {
    if (getCategoryOfType(v13) == 1)
      -[WDExportManager _writeCDAResultsOrganizerStart](self, "_writeCDAResultsOrganizerStart");
  }
  else
  {
    -[WDExportManager _writeCDAVitalsOrganizerStartWithStartDate:endDate:](self, "_writeCDAVitalsOrganizerStartWithStartDate:endDate:", v8, v9);
  }

}

- (void)_outputSerialQueue_writeSamples:(id)a3 forQuantityType:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  WDExportManager *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = self;
  v41 = a4;
  -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "description");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v44;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(obj);
        v40 = v7;
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v8, "quantity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValueForUnit:", v31);
        objc_msgSend(v9, "numberWithDouble:");
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sourceRevision");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "source");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sourceRevision");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "version");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_creationDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)v11;
        -[WDExportManager _writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:](v34, "_writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:", v35, v12, v13, v15, v33, v16, 0, v17, v18, v19, v11);

        if (!getCategoryOfType(v41) || getCategoryOfType(v41) == 1)
        {
          objc_msgSend(v8, "sourceRevision");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "source");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "sourceRevision");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "version");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "device");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[WDExportManager _writeCDAEntryWithValue:type:sourceName:sourceVersion:device:unit:metadata:startDate:endDate:](v34, "_writeCDAEntryWithValue:type:sourceName:sourceVersion:device:unit:metadata:startDate:endDate:", v42, v41, v21, v23, v25, v33, v26, v27, v28);

        }
        v7 = v40 + 1;
      }
      while (v32 != v40 + 1);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v32);
  }

  if (-[NSArray count](v34->_completedRecords, "count") && (!getCategoryOfType(v41) || getCategoryOfType(v41) == 1))
    -[WDExportManager _writeCDAOrganizerEnd](v34, "_writeCDAOrganizerEnd");

}

- (void)_outputSerialQueue_finishWritingQuantityType:(id)a3 count:(unint64_t)a4
{
  unint64_t CategoryOfType;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  CategoryOfType = getCategoryOfType(v10);
  if (a4 && CategoryOfType <= 1)
    -[WDExportManager _writeCDAOrganizerEnd](self, "_writeCDAOrganizerEnd");
  -[NSMutableArray lastObject](self->_resultsTypes, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_8:
    -[WDExportManager _writeCDASectionFooter](self, "_writeCDASectionFooter");
    v9 = v10;
    goto LABEL_9;
  }
  -[NSMutableArray lastObject](self->_vitalsTypes, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 == v10)
    goto LABEL_8;
LABEL_9:

}

- (void)_writeDataForCategoryType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *completedRecords;
  NSArray *obj;
  uint64_t v16;
  id v17;
  WDExportManager *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = self;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_completedRecords;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v4);
        objc_msgSend(v17, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sourceRevision");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "source");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sourceRevision");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "version");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "device");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_creationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sampleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        stringForCategoryValue(objc_msgSend(v12, "code"), objc_msgSend(v5, "value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDExportManager _writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:](v18, "_writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:", v25, v6, v7, v20, 0, v8, 0, v9, v10, v11, v13);

        ++v4;
      }
      while (v19 != v4);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  completedRecords = v18->_completedRecords;
  v18->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)v18->_sem);
}

- (void)_writeDataForCorrelationType:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  NSArray *completedRecords;
  NSArray *obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
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
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = self->_completedRecords;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v55;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v55 != v32)
          objc_enumerationMutation(obj);
        v34 = v3;
        v4 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v3);
        objc_msgSend(v4, "sampleType");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sourceRevision");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "source");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sourceRevision");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "version");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "device");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_creationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDExportManager _writeXMLCorrelationStartWithType:sourceName:sourceVersion:device:metadata:creationDate:startDate:endDate:](self, "_writeXMLCorrelationStartWithType:sourceName:sourceVersion:device:metadata:creationDate:startDate:endDate:", v5, v6, v7, v9, v10, v11, v12, v13);

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v4, "objects");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v37)
        {
          v36 = *(_QWORD *)v51;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v51 != v36)
                objc_enumerationMutation(v35);
              v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
              objc_opt_class();
              v47 = v14;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "sampleType");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v15, "quantity");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "doubleValueForUnit:", v17);
                objc_msgSend(v18, "numberWithDouble:");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

                goto LABEL_17;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "sampleType");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                stringForCategoryValue(objc_msgSend(v19, "code"), objc_msgSend(v15, "value"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = 0;
                goto LABEL_15;
              }
              v49 = 0;
              v17 = 0;
LABEL_17:
              v39 = v17;
              objc_msgSend(v15, "sampleType");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "sourceRevision");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "source");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "sourceRevision");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "version");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "device");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "description");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "description");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "metadata");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "_creationDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "startDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "endDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[WDExportManager _writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:](self, "_writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:", v20, v21, v22, v24, v25, v26, 0, v27, v28, v29, v49);

              v14 = v47 + 1;
            }
            while (v37 != v47 + 1);
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v37);
        }

        -[WDExportManager _writeXMLCorrelationEnd](self, "_writeXMLCorrelationEnd");
        v3 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v33);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForAudiogramType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *completedRecords;
  NSArray *obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_completedRecords;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v23;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x2199E6CD0]();
        -[WDExportManager _writeXMLAudiogramStartWithAudiogram:](self, "_writeXMLAudiogramStartWithAudiogram:", v6);
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "sensitivityPoints");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
              v14 = (void *)MEMORY[0x2199E6CD0]();
              -[WDExportManager _writeXMLAudiogramSensitivityPoint:](self, "_writeXMLAudiogramSensitivityPoint:", v13);
              objc_autoreleasePoolPop(v14);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

        -[WDExportManager _writeXMLAudiogramEnd](self, "_writeXMLAudiogramEnd");
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v5 != v4);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForWorkoutType
{
  uint64_t i;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSArray *completedRecords;
  NSArray *obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = self->_completedRecords;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v43; i = v26 + 1)
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(obj);
        v49 = i;
        v4 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v4, "workoutActivityType");
        _HKWorkoutActivityNameForActivityType();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "duration");
        objc_msgSend(v5, "numberWithDouble:", v6 / 60.0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sourceRevision");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "source");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sourceRevision");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "version");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "device");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_creationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDExportManager _writeXMLWorkoutStartWithActivityType:duration:durationUnit:sourceName:sourceVersion:device:metadata:creationDate:startDate:endDate:](self, "_writeXMLWorkoutStartWithActivityType:duration:durationUnit:sourceName:sourceVersion:device:metadata:creationDate:startDate:endDate:", v52, v51, v50, v7, v8, v9, v10, v11, v12, v13);

        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v4, "workoutEvents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v62 != v17)
                objc_enumerationMutation(v14);
              -[WDExportManager _writeXMLWorkoutEvent:](self, "_writeXMLWorkoutEvent:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
          }
          while (v16);
        }

        objc_msgSend(v4, "workoutActivities");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v19, "count") >= 2)
        {

          v26 = v49;
LABEL_18:
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          objc_msgSend(v4, "workoutActivities");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v58;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v58 != v29)
                  objc_enumerationMutation(v19);
                -[WDExportManager _writeXMLWorkoutActivity:](self, "_writeXMLWorkoutActivity:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k));
              }
              v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
            }
            while (v28);
          }
LABEL_27:

          goto LABEL_28;
        }
        objc_msgSend(v4, "workoutActivities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count") != 1)
        {

          v26 = v49;
          goto LABEL_27;
        }
        objc_msgSend(v4, "workoutActivities");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        v26 = v49;
        if ((v25 & 1) == 0)
          goto LABEL_18;
LABEL_28:
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v4, "allStatistics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "allValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v54;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v54 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m);
              xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutStatistics");
              -[WDExportManager _writeXMLWorkoutStatistics:](self, "_writeXMLWorkoutStatistics:", v37);
              xmlTextWriterEndElement(self->_writer);
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          }
          while (v34);
        }

        v38 = dispatch_semaphore_create(0);
        -[WDExportManager _writeWorkoutRouteForWorkout:semaphore:](self, "_writeWorkoutRouteForWorkout:semaphore:", v4, v38);
        dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(v4, "metadata");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v39);

        -[WDExportManager _writeXMLWorkoutEnd](self, "_writeXMLWorkoutEnd");
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v43);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForWorkoutRoutes:(id)a3 semaphore:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  WDExportManager *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = *MEMORY[0x24BDD0CF0];
  v52[0] = *MEMORY[0x24BDD0CD8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  -[NSString stringByAppendingPathComponent:](self->_exportPath, "stringByAppendingPathComponent:", CFSTR("workout-routes"));
  v47 = 0;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
  v10 = 0;
  v11 = v10;
  if ((_DWORD)a4)
  {
    v29 = v10;
    v30 = v9;
    v31 = v7;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v6;
    obj = v6;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v36)
    {
      v34 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[WDExportManager _writeXMLWorkoutRouteStart:](v38, "_writeXMLWorkoutRouteStart:", v13);
          objc_msgSend(MEMORY[0x24BDD3C08], "fileNameForRoute:", v13);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByAppendingPathComponent:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C08]), "initWithURL:route:", v15, v13);
          WDBundle();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_DIRECTORY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsSeparatedByString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[WDExportManager _writeXMLWorkoutRouteFileReference:](v38, "_writeXMLWorkoutRouteFileReference:", v20);
          v21 = dispatch_semaphore_create(0);
          v22 = objc_alloc(MEMORY[0x24BDD4158]);
          v40[0] = MEMORY[0x24BDAC760];
          v40[1] = 3221225472;
          v40[2] = __56__WDExportManager__writeDataForWorkoutRoutes_semaphore___block_invoke;
          v40[3] = &unk_24D38D650;
          v23 = v16;
          v41 = v23;
          v24 = v21;
          v42 = v24;
          v25 = (void *)objc_msgSend(v22, "initWithRoute:dataHandler:", v13, v40);
          -[WDProfile healthStore](v38->_profile, "healthStore");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "executeQuery:", v25);

          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
          v39 = 0;
          LOBYTE(v22) = objc_msgSend(v23, "finishWithError:", &v39);
          v27 = v39;
          if ((v22 & 1) == 0)
          {
            _HKInitializeLogging();
            v28 = *MEMORY[0x24BDD2FE8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v27;
              _os_log_error_impl(&dword_215814000, v28, OS_LOG_TYPE_ERROR, "Error exporting workout route to GPX: %{public}@", buf, 0xCu);
            }
          }
          -[WDExportManager _writeXMLWorkoutRouteEnd](v38, "_writeXMLWorkoutRouteEnd");

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v36);
    }

    v7 = v31;
    v6 = v32;
    v9 = v30;
    v11 = v29;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[WDExportManager _writeDataForWorkoutRoutes:semaphore:].cold.1();
  }
  dispatch_semaphore_signal(v7);

}

intptr_t __56__WDExportManager__writeDataForWorkoutRoutes_semaphore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  intptr_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "appendLocations:error:", a3, 0);
  if (a5 || (a4 & 1) != 0 || !(_DWORD)result)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  return result;
}

- (void)_writeDataForActivitySummaries
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *completedRecords;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_completedRecords;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[WDExportManager _writeXMLActivitySummary:activeEnergyBurnedUnit:](self, "_writeXMLActivitySummary:activeEnergyBurnedUnit:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForHRVAndTachograms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSArray *completedRecords;
  NSArray *obj;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  id v19;
  dispatch_semaphore_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3E80], "dataTypeWithCode:", 139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_completedRecords;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v10 = dispatch_semaphore_create(0);
        v11 = (void *)MEMORY[0x24BDD3C68];
        -[WDProfile healthStore](self->_profile, "healthStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __48__WDExportManager__writeDataForHRVAndTachograms__block_invoke;
        v16[3] = &unk_24D38D678;
        v16[4] = self;
        v17 = v3;
        v18 = v9;
        v19 = v4;
        v20 = v10;
        v13 = v10;
        objc_msgSend(v11, "queryForParentSequenceOfHRV:healthStore:completion:", v9, v12, v16);

        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

void __48__WDExportManager__writeDataForHRVAndTachograms__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD3C68], "instantaneousBPMsForHeartbeatSeriesSample:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "sourceRevision");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "sourceRevision");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 48), "quantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_writeXMLRecordWithType:sourceName:sourceVersion:device:unit:metadata:hrvMetadataList:creationDate:startDate:endDate:value:", v19, v4, v5, v14, v13, v6, v20, v12, v7, v8, v11);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)_writeDataForVisionRx
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to create attachment directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__WDExportManager__writeDataForVisionRx__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6 || !a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  else
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __40__WDExportManager__writeDataForVisionRx__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v6 && v5 || (objc_msgSend(v6, "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_writeDataForMedicalRecords:(id)a3
{
  id v4;
  void *v5;
  NSString *exportPath;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  dispatch_semaphore_t v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  exportPath = self->_exportPath;
  WDBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_CR_DIRECTORY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](exportPath, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = *MEMORY[0x24BDD0CF0];
  v47[0] = *MEMORY[0x24BDD0CD0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v11 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, v10, &v44);
  v12 = v44;
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    v32 = v12;
    v33 = v10;
    v34 = v5;
    v35 = v4;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (-[WDExportManager exportFailed](self, "exportFailed", v32, v33, v34, v35))
          {
            _HKInitializeLogging();
            v24 = *MEMORY[0x24BDD3070];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
              -[WDExportManager _writeDataForMedicalRecords:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
            goto LABEL_16;
          }
          v20 = dispatch_semaphore_create(0);
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __47__WDExportManager__writeDataForMedicalRecords___block_invoke;
          v36[3] = &unk_24D38D6F0;
          v36[4] = self;
          v37 = v20;
          v38 = v19;
          v39 = v9;
          v21 = v20;
          v22 = (void *)MEMORY[0x2199E6E80](v36);
          -[WDProfile healthRecordsStore](self->_profile, "healthRecordsStore");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fetchExportedPropertiesForHealthRecord:completion:", v19, v22);

          dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_16:

    v5 = v34;
    v4 = v35;
    v13 = v32;
    v10 = v33;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[WDExportManager _writeDataForMedicalRecords:].cold.2();
    -[WDExportManager setExportFailed:](self, "setExportFailed:", 1);
  }

}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  void *v39;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "sourceRevision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30E0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;

    if (v13)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30D8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      HKSafeObject();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;

      if (!v13)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30E8]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        HKSafeObject();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;

        if (!v13)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30D0]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          HKSafeObject();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 0;

          if (!v13)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30C0]);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            HKSafeObject();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 0;

            if (!v13)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD30C8]);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              HKSafeObject();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;

              if (!v13)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@.json"), v12, v39);
                v13 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", v13);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "writeToFile:atomically:encoding:error:");
                v7 = 0;
                if (v7)
                {
                  _HKInitializeLogging();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
                    __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_1();
                  objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
                  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
                }
                else
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "stringFromDate:", v17);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  WDBundle();
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("EXPORT_DATA_DIRECTORY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "componentsSeparatedByString:", v32);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "lastObject");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(a1 + 32), "_writeXMLMedicalRecordWithType:identifier:sourceName:sourceURL:fhirVersion:receivedDate:jsonFilePath:", v12, v14, v38, v16, v18, v35, v34);
                  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

                }
                goto LABEL_15;
              }
LABEL_12:
              _HKInitializeLogging();
              v20 = *MEMORY[0x24BDD3070];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
                __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
              objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
              v7 = 0;
LABEL_15:

              goto LABEL_16;
            }
LABEL_11:
            v19 = 0;
            goto LABEL_12;
          }
LABEL_10:
          v18 = 0;
          goto LABEL_11;
        }
LABEL_9:
        v17 = 0;
        goto LABEL_10;
      }
    }
    v16 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_3();
  objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
LABEL_16:

}

- (void)_writeXMLRecordWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 unit:(id)a7 metadata:(id)a8 hrvMetadataList:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12 value:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _xmlTextWriter *writer;
  id v26;
  _xmlTextWriter *v27;
  void *v28;
  _xmlTextWriter *v29;
  id v30;
  _xmlTextWriter *v31;
  id v32;
  _xmlTextWriter *v33;
  id v34;
  void *v35;
  _xmlTextWriter *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  _xmlTextWriter *v45;
  id v46;
  _xmlTextWriter *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id obja;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  obja = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v57 = a8;
  v23 = a9;
  v55 = a10;
  v24 = a11;
  v56 = a12;
  v58 = a13;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Record");
  writer = self->_writer;
  v26 = objc_retainAutorelease(obja);
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)objc_msgSend(v26, "UTF8String"));
  v27 = self->_writer;
  v54 = objc_retainAutorelease(v19);
  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", (const xmlChar *)objc_msgSend(v54, "UTF8String"));
  if (objc_msgSend(v20, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
  if (objc_msgSend(v21, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
  v28 = v55;
  if (objc_msgSend(v22, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"unit", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
  if (v55)
  {
    v29 = self->_writer;
    -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v55);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"creationDate", (const xmlChar *)objc_msgSend(v30, "UTF8String"));

  }
  v31 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v24);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v31, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v32, "UTF8String"));

  v33 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v56);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v34, "UTF8String"));

  objc_opt_class();
  v35 = v58;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = self->_writer;
    v37 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v58, "doubleValue");
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%g"), v38);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v36, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v39, "UTF8String"));

    v35 = v58;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String"));
  }
  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v57);
  if (v23)
  {
    v49 = v26;
    v51 = v22;
    v52 = v21;
    v53 = v20;
    xmlTextWriterStartElement(self->_writer, (const xmlChar *)"HeartRateVariabilityMetadataList");
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v50 = v23;
    obj = v23;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v62 != v42)
            objc_enumerationMutation(obj);
          v44 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          xmlTextWriterStartElement(self->_writer, (const xmlChar *)"InstantaneousBeatsPerMinute");
          v45 = self->_writer;
          -[WDExportManager _formatBPMForBeatToBeatReading:](self, "_formatBPMForBeatToBeatReading:", v44);
          v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xmlTextWriterWriteAttribute(v45, (const xmlChar *)"bpm", (const xmlChar *)objc_msgSend(v46, "UTF8String"));

          v47 = self->_writer;
          -[WDExportManager _formatTimeForBeatToBeatReading:](self, "_formatTimeForBeatToBeatReading:", v44);
          v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xmlTextWriterWriteAttribute(v47, (const xmlChar *)"time", (const xmlChar *)objc_msgSend(v48, "UTF8String"));

          xmlTextWriterEndElement(self->_writer);
        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v41);
    }

    xmlTextWriterEndElement(self->_writer);
    v21 = v52;
    v20 = v53;
    v23 = v50;
    v22 = v51;
    v28 = v55;
    v26 = v49;
    v35 = v58;
  }
  xmlTextWriterEndElement(self->_writer);

}

- (void)_writeXMLCorrelationStartWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 metadata:(id)a7 creationDate:(id)a8 startDate:(id)a9 endDate:(id)a10
{
  id v16;
  id v17;
  id v18;
  _xmlTextWriter *writer;
  id v20;
  id v21;
  id v22;
  id v23;
  _xmlTextWriter *v24;
  id v25;
  const xmlChar *v26;
  _xmlTextWriter *v27;
  id v28;
  const xmlChar *v29;
  _xmlTextWriter *v30;
  id v31;
  _xmlTextWriter *v32;
  id v33;
  _xmlTextWriter *v34;
  void *v35;
  id v36;
  id v37;

  v37 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  writer = self->_writer;
  v20 = a10;
  v21 = a7;
  v22 = a4;
  v23 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"Correlation");
  v24 = self->_writer;
  v25 = objc_retainAutorelease(v23);
  v26 = (const xmlChar *)objc_msgSend(v25, "UTF8String");

  xmlTextWriterWriteAttribute(v24, (const xmlChar *)"type", v26);
  v27 = self->_writer;
  v28 = objc_retainAutorelease(v22);
  v29 = (const xmlChar *)objc_msgSend(v28, "UTF8String");

  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", v29);
  if (objc_msgSend(v37, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
  if (objc_msgSend(v16, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
  if (v17)
  {
    v30 = self->_writer;
    -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v17);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v30, (const xmlChar *)"creationDate", (const xmlChar *)objc_msgSend(v31, "UTF8String"));

  }
  v32 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v18);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v32, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v33, "UTF8String"));

  v34 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_retainAutorelease(v35);
  xmlTextWriterWriteAttribute(v34, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v36, "UTF8String"));

  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v21);
}

- (void)_writeXMLCorrelationEnd
{
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLAudiogramStartWithAudiogram:(id)a3
{
  _xmlTextWriter *writer;
  void *v5;
  id v6;
  _xmlTextWriter *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _xmlTextWriter *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _xmlTextWriter *v20;
  void *v21;
  id v22;
  void *v23;
  _xmlTextWriter *v24;
  NSDateFormatter *xmlDateFormatter;
  void *v26;
  id v27;
  _xmlTextWriter *v28;
  NSDateFormatter *v29;
  void *v30;
  id v31;
  _xmlTextWriter *v32;
  NSDateFormatter *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;

  v37 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Audiogram");
  writer = self->_writer;
  objc_msgSend(v37, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)objc_msgSend(v6, "UTF8String"));

  v7 = self->_writer;
  objc_msgSend(v37, "sourceRevision");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"sourceName", (const xmlChar *)objc_msgSend(v10, "UTF8String"));

  objc_msgSend(v37, "sourceRevision");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = self->_writer;
    objc_msgSend(v37, "sourceRevision");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "version");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v14, (const xmlChar *)"sourceVersion", (const xmlChar *)objc_msgSend(v16, "UTF8String"));

  }
  objc_msgSend(v37, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    v20 = self->_writer;
    objc_msgSend(v37, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v20, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(v22, "UTF8String"));

  }
  objc_msgSend(v37, "_creationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = self->_writer;
    xmlDateFormatter = self->_xmlDateFormatter;
    objc_msgSend(v37, "_creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v26);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"creationDate", (const xmlChar *)objc_msgSend(v27, "UTF8String"));

  }
  v28 = self->_writer;
  v29 = self->_xmlDateFormatter;
  objc_msgSend(v37, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v29, "stringFromDate:", v30);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v28, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v31, "UTF8String"));

  v32 = self->_writer;
  v33 = self->_xmlDateFormatter;
  objc_msgSend(v37, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v33, "stringFromDate:", v34);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v32, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v35, "UTF8String"));

  objc_msgSend(v37, "metadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v36);

}

- (void)_writeXMLAudiogramSensitivityPoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _xmlTextWriter *writer;
  id v10;
  _xmlTextWriter *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _xmlTextWriter *v16;
  uint64_t v17;
  id v18;
  _xmlTextWriter *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _xmlTextWriter *v24;
  uint64_t v25;
  id v26;
  _xmlTextWriter *v27;
  id v28;
  id v29;

  v29 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"SensitivityPoint");
  objc_msgSend(v29, "frequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v5);
  v8 = v7;

  writer = self->_writer;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g"), v8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"frequencyValue", (const xmlChar *)objc_msgSend(v10, "UTF8String"));

  v11 = self->_writer;
  objc_msgSend(v5, "unitString");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v11, (const xmlChar *)"frequencyUnit", (const xmlChar *)objc_msgSend(v12, "UTF8String"));

  objc_msgSend(v29, "leftEarSensitivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v15);
    v16 = self->_writer;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g"), v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v16, (const xmlChar *)"leftEarValue", (const xmlChar *)objc_msgSend(v18, "UTF8String"));

    v19 = self->_writer;
    objc_msgSend(v15, "unitString");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"leftEarUnit", (const xmlChar *)objc_msgSend(v20, "UTF8String"));

  }
  objc_msgSend(v29, "rightEarSensitivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "_unit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValueForUnit:", v23);
    v24 = self->_writer;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g"), v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"rightEarValue", (const xmlChar *)objc_msgSend(v26, "UTF8String"));

    v27 = self->_writer;
    objc_msgSend(v23, "unitString");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v27, (const xmlChar *)"rightEarUnit", (const xmlChar *)objc_msgSend(v28, "UTF8String"));

  }
  xmlTextWriterEndElement(self->_writer);

}

- (void)_writeXMLAudiogramEnd
{
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutStartWithActivityType:(id)a3 duration:(id)a4 durationUnit:(id)a5 sourceName:(id)a6 sourceVersion:(id)a7 device:(id)a8 metadata:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  _xmlTextWriter *writer;
  id v23;
  void *v24;
  _xmlTextWriter *v25;
  id v26;
  _xmlTextWriter *v27;
  id v28;
  _xmlTextWriter *v29;
  id v30;
  _xmlTextWriter *v31;
  id v32;
  _xmlTextWriter *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v40 = a3;
  v18 = a4;
  v39 = a5;
  v19 = a6;
  v20 = a7;
  v38 = a8;
  v21 = a10;
  v37 = a11;
  writer = self->_writer;
  v23 = a12;
  v36 = a9;
  xmlTextWriterStartElement(writer, (const xmlChar *)"Workout");
  if (objc_msgSend(v40, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"workoutActivityType", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v40), "UTF8String"));
  v24 = v18;
  if (v18 && objc_msgSend(v39, "length"))
  {
    v25 = self->_writer;
    objc_msgSend(v18, "description");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v25, (const xmlChar *)"duration", (const xmlChar *)objc_msgSend(v26, "UTF8String"));

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v39), "UTF8String"));
  }
  v27 = self->_writer;
  v28 = objc_retainAutorelease(v19);
  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", (const xmlChar *)objc_msgSend(v28, "UTF8String"));
  if (objc_msgSend(v20, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
  if (objc_msgSend(v38, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v38), "UTF8String"));
  if (v21)
  {
    v29 = self->_writer;
    -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v21);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"creationDate", (const xmlChar *)objc_msgSend(v30, "UTF8String"));

  }
  v31 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v37);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v31, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v32, "UTF8String"));

  v33 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_retainAutorelease(v34);
  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v35, "UTF8String"));

  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v36);
}

- (void)_writeXMLWorkoutEvent:(id)a3
{
  _xmlTextWriter *writer;
  unint64_t v5;
  __CFString *v6;
  _xmlTextWriter *v7;
  NSDateFormatter *xmlDateFormatter;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _xmlTextWriter *v19;
  id v20;
  void *v21;
  id v22;

  v22 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutEvent");
  writer = self->_writer;
  v5 = objc_msgSend(v22, "type") - 2;
  if (v5 > 6)
    v6 = CFSTR("HKWorkoutEventTypePause");
  else
    v6 = off_24D38D8D0[v5];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)-[__CFString UTF8String](v6, "UTF8String"));
  v7 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  objc_msgSend(v22, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"date", (const xmlChar *)objc_msgSend(v11, "UTF8String"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v22, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "duration");
  objc_msgSend(v12, "numberWithDouble:", v14 / 60.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "doubleValue");
  if (fabs(v18) > 2.22044605e-16 && objc_msgSend(v17, "length"))
  {
    v19 = self->_writer;
    objc_msgSend(v15, "description");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"duration", (const xmlChar *)objc_msgSend(v20, "UTF8String"));

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
  }
  objc_msgSend(v22, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v21);

  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutActivity:(id)a3
{
  id v4;
  _xmlTextWriter *writer;
  void *v6;
  id v7;
  _xmlTextWriter *v8;
  NSDateFormatter *xmlDateFormatter;
  void *v10;
  id v11;
  _xmlTextWriter *v12;
  NSDateFormatter *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  _xmlTextWriter *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutActivity");
  writer = self->_writer;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"uuid", (const xmlChar *)objc_msgSend(v7, "UTF8String"));

  v8 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  objc_msgSend(v4, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v8, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v11, "UTF8String"));

  v12 = self->_writer;
  v13 = self->_xmlDateFormatter;
  objc_msgSend(v4, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v15, "UTF8String"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "duration");
  objc_msgSend(v16, "numberWithDouble:", v17 / 60.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "doubleValue");
  if (fabs(v21) > 2.22044605e-16 && objc_msgSend(v20, "length"))
  {
    v22 = self->_writer;
    objc_msgSend(v18, "description");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v22, (const xmlChar *)"duration", (const xmlChar *)objc_msgSend(v23, "UTF8String"));

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "workoutEvents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        -[WDExportManager _writeXMLWorkoutEvent:](self, "_writeXMLWorkoutEvent:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v26);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "allStatistics", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutStatistics");
        -[WDExportManager _writeXMLWorkoutStatistics:](self, "_writeXMLWorkoutStatistics:", v35);
        xmlTextWriterEndElement(self->_writer);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v32);
  }

  objc_msgSend(v4, "metadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v36);

  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutEnd
{
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLObjectAttributes:(id)a3
{
  void *v4;
  void *v5;
  _xmlTextWriter *writer;
  id v7;
  void *v8;
  uint64_t v9;
  _xmlTextWriter *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _xmlTextWriter *v15;
  NSDateFormatter *xmlDateFormatter;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "sourceRevision");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  writer = self->_writer;
  objc_msgSend(v5, "name");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"sourceName", (const xmlChar *)objc_msgSend(v7, "UTF8String"));

  objc_msgSend(v4, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = self->_writer;
    objc_msgSend(v4, "version");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v10, (const xmlChar *)"sourceVersion", (const xmlChar *)objc_msgSend(v11, "UTF8String"));

  }
  objc_msgSend(v19, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  objc_msgSend(v19, "_creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = self->_writer;
    xmlDateFormatter = self->_xmlDateFormatter;
    objc_msgSend(v19, "_creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v15, (const xmlChar *)"creationDate", (const xmlChar *)objc_msgSend(v18, "UTF8String"));

  }
}

- (void)_writeXMLSampleAttributes:(id)a3
{
  id v4;
  _xmlTextWriter *writer;
  NSDateFormatter *xmlDateFormatter;
  void *v7;
  id v8;
  _xmlTextWriter *v9;
  NSDateFormatter *v10;
  id v11;
  id v12;

  v4 = a3;
  -[WDExportManager _writeXMLObjectAttributes:](self, "_writeXMLObjectAttributes:", v4);
  writer = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v8, "UTF8String"));

  v9 = self->_writer;
  v10 = self->_xmlDateFormatter;
  objc_msgSend(v4, "endDate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter stringFromDate:](v10, "stringFromDate:", v12);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v9, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v11, "UTF8String"));

}

- (void)_writeXMLMetadataEntries:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _xmlTextWriter *writer;
  id v12;
  void *v13;
  _xmlTextWriter *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          if ((_HKMetadataKeyIsPrivate() & 1) == 0)
          {
            xmlTextWriterStartElement(self->_writer, (const xmlChar *)"MetadataEntry");
            writer = self->_writer;
            v12 = objc_retainAutorelease(v10);
            xmlTextWriterWriteAttribute(writer, (const xmlChar *)"key", (const xmlChar *)objc_msgSend(v12, "UTF8String"));
            objc_msgSend(v5, "valueForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = self->_writer;
            objc_msgSend(v13, "description");
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            xmlTextWriterWriteAttribute(v14, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v15, "UTF8String"));

            xmlTextWriterEndElement(self->_writer);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }
  }

}

- (void)_writeXMLWorkoutRouteStart:(id)a3
{
  _xmlTextWriter *writer;
  id v5;
  id v6;

  writer = self->_writer;
  v5 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"WorkoutRoute");
  -[WDExportManager _writeXMLSampleAttributes:](self, "_writeXMLSampleAttributes:", v5);
  objc_msgSend(v5, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v6);
}

- (void)_writeXMLWorkoutRouteFileReference:(id)a3
{
  _xmlTextWriter *writer;
  id v5;
  _xmlTextWriter *v6;
  id v7;
  const xmlChar *v8;

  writer = self->_writer;
  v5 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"FileReference");
  v6 = self->_writer;
  v7 = objc_retainAutorelease(v5);
  v8 = (const xmlChar *)objc_msgSend(v7, "UTF8String");

  xmlTextWriterWriteAttribute(v6, (const xmlChar *)"path", v8);
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutRouteEnd
{
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutStatistics:(id)a3
{
  _xmlTextWriter *writer;
  void *v5;
  id v6;
  _xmlTextWriter *v7;
  NSDateFormatter *xmlDateFormatter;
  void *v9;
  id v10;
  _xmlTextWriter *v11;
  NSDateFormatter *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _xmlTextWriter *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _xmlTextWriter *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  _xmlTextWriter *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  _xmlTextWriter *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  _xmlTextWriter *v41;
  id v42;
  id v43;

  v43 = a3;
  writer = self->_writer;
  objc_msgSend(v43, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)objc_msgSend(v6, "UTF8String"));

  v7 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  objc_msgSend(v43, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"startDate", (const xmlChar *)objc_msgSend(v10, "UTF8String"));

  v11 = self->_writer;
  v12 = self->_xmlDateFormatter;
  objc_msgSend(v43, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v11, (const xmlChar *)"endDate", (const xmlChar *)objc_msgSend(v14, "UTF8String"));

  objc_msgSend(v43, "quantityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "averageQuantity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = self->_writer;
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v43, "averageQuantity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValueForUnit:", v16);
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%g"), v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"average", (const xmlChar *)objc_msgSend(v22, "UTF8String"));

  }
  objc_msgSend(v43, "minimumQuantity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = self->_writer;
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v43, "minimumQuantity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValueForUnit:", v16);
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%g"), v27);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"minimum", (const xmlChar *)objc_msgSend(v28, "UTF8String"));

  }
  objc_msgSend(v43, "maximumQuantity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = self->_writer;
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v43, "maximumQuantity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValueForUnit:", v16);
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%g"), v33);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v30, (const xmlChar *)"maximum", (const xmlChar *)objc_msgSend(v34, "UTF8String"));

  }
  objc_msgSend(v43, "sumQuantity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = self->_writer;
    v37 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v43, "sumQuantity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValueForUnit:", v16);
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%g"), v39);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v36, (const xmlChar *)"sum", (const xmlChar *)objc_msgSend(v40, "UTF8String"));

  }
  v41 = self->_writer;
  objc_msgSend(v16, "unitString");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v41, (const xmlChar *)"unit", (const xmlChar *)objc_msgSend(v42, "UTF8String"));

}

- (void)_writeXMLActivitySummary:(id)a3 activeEnergyBurnedUnit:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _xmlTextWriter *writer;
  id v10;
  void *v11;
  _xmlTextWriter *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _xmlTextWriter *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  _xmlTextWriter *v25;
  id v26;
  void *v27;
  _xmlTextWriter *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  _xmlTextWriter *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  _xmlTextWriter *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  _xmlTextWriter *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  _xmlTextWriter *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  _xmlTextWriter *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;

  v69 = a3;
  v6 = a4;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"ActivitySummary");
  objc_msgSend(v69, "_gregorianDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    writer = self->_writer;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld"), objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"dateComponents", (const xmlChar *)objc_msgSend(v10, "UTF8String"));

  }
  objc_msgSend(v69, "activeEnergyBurned");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = self->_writer;
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "activeEnergyBurned");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v6);
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%g"), v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v12, (const xmlChar *)"activeEnergyBurned", (const xmlChar *)objc_msgSend(v16, "UTF8String"));

  }
  objc_msgSend(v69, "activeEnergyBurnedGoal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = self->_writer;
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "activeEnergyBurnedGoal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValueForUnit:", v6);
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%g"), v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"activeEnergyBurnedGoal", (const xmlChar *)objc_msgSend(v22, "UTF8String"));

  }
  objc_msgSend(v69, "activeEnergyBurned");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

  }
  else
  {
    objc_msgSend(v69, "activeEnergyBurnedGoal");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_11;
  }
  v25 = self->_writer;
  objc_msgSend(v6, "unitString");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v25, (const xmlChar *)"activeEnergyBurnedUnit", (const xmlChar *)objc_msgSend(v26, "UTF8String"));

LABEL_11:
  objc_msgSend(v69, "appleMoveTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = self->_writer;
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleMoveTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValueForUnit:", v31);
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%g"), v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v28, (const xmlChar *)"appleMoveTime", (const xmlChar *)objc_msgSend(v33, "UTF8String"));

  }
  objc_msgSend(v69, "appleMoveTimeGoal");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = self->_writer;
    v36 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleMoveTimeGoal");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValueForUnit:", v38);
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%g"), v39);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v35, (const xmlChar *)"appleMoveTimeGoal", (const xmlChar *)objc_msgSend(v40, "UTF8String"));

  }
  objc_msgSend(v69, "appleExerciseTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = self->_writer;
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleExerciseTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValueForUnit:", v45);
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%g"), v46);
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"appleExerciseTime", (const xmlChar *)objc_msgSend(v47, "UTF8String"));

  }
  objc_msgSend(v69, "appleExerciseTimeGoal");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = self->_writer;
    v50 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleExerciseTimeGoal");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "doubleValueForUnit:", v52);
    objc_msgSend(v50, "stringWithFormat:", CFSTR("%g"), v53);
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v49, (const xmlChar *)"appleExerciseTimeGoal", (const xmlChar *)objc_msgSend(v54, "UTF8String"));

  }
  objc_msgSend(v69, "appleStandHours");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = self->_writer;
    v57 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleStandHours");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValueForUnit:", v59);
    objc_msgSend(v57, "stringWithFormat:", CFSTR("%g"), v60);
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v56, (const xmlChar *)"appleStandHours", (const xmlChar *)objc_msgSend(v61, "UTF8String"));

  }
  objc_msgSend(v69, "appleStandHoursGoal");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = self->_writer;
    v64 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v69, "appleStandHoursGoal");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "doubleValueForUnit:", v66);
    objc_msgSend(v64, "stringWithFormat:", CFSTR("%g"), v67);
    v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v63, (const xmlChar *)"appleStandHoursGoal", (const xmlChar *)objc_msgSend(v68, "UTF8String"));

  }
  xmlTextWriterEndElement(self->_writer);

}

- (void)_writeCDAVitalsOrganizerStartWithStartDate:(id)a3 endDate:(id)a4
{
  _xmlTextWriter *writerCDA;
  id v7;
  id v8;
  _xmlTextWriter *v9;
  void *v10;
  id v11;
  _xmlTextWriter *v12;
  void *v13;
  id v14;

  writerCDA = self->_writerCDA;
  v7 = a4;
  v8 = a3;
  xmlTextWriterStartElement(writerCDA, (const xmlChar *)"entry");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"typeCode", (const xmlChar *)"DRIV");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"organizer");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"CLUSTER");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.26");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"c6f88320-67ad-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"46680005");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.96");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"SNOMED CT");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Vital signs");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"low");
  v9 = self->_writerCDA;
  -[NSDateFormatter stringFromDate:](self->_cdaDateFormatter, "stringFromDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  xmlTextWriterWriteAttribute(v9, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v11, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"high");
  v12 = self->_writerCDA;
  -[NSDateFormatter stringFromDate:](self->_cdaDateFormatter, "stringFromDate:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v14, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDAResultsOrganizerStart
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"entry");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"typeCode", (const xmlChar *)"DRIV");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"organizer");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"BATTERY");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"7d5a02b0-67a4-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"xsi:type", (const xmlChar *)"CE");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"386053000");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Result");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.96");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"SNOMED CT");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDAOrganizerEnd
{
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDAEntryWithValue:(id)a3 type:(id)a4 sourceName:(id)a5 sourceVersion:(id)a6 device:(id)a7 unit:(id)a8 metadata:(id)a9 startDate:(id)a10 endDate:(id)a11
{
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _xmlTextWriter *writerCDA;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const char *v32;
  const char *v33;
  _xmlTextWriter *v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  _xmlTextWriter *v40;
  id v41;
  _xmlTextWriter *v42;
  void *v43;
  uint64_t v44;
  id v45;
  _xmlTextWriter *v46;
  id v47;
  _xmlTextWriter *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  _xmlTextWriter *v55;
  id v56;
  void *v57;
  _xmlTextWriter *v58;
  id v59;
  _xmlTextWriter *v60;
  id v61;
  _xmlTextWriter *v62;
  id v63;
  _xmlTextWriter *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  _xmlTextWriter *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  v17 = a4;
  v18 = a5;
  v19 = v17;
  v20 = v18;
  v77 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v75 = a10;
  v79 = a11;
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"observation");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"OBS");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.27");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"c6f88321-67ad-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  writerCDA = self->_writerCDA;
  v25 = objc_msgSend(v19, "code");
  v26 = v25;
  if (v25 > 61)
  {
    v30 = CFSTR("251853006");
    if (v25 != 87)
      v30 = 0;
    if (v25 == 62)
      v31 = CFSTR("8310-5");
    else
      v31 = v30;
    if ((unint64_t)(v25 - 71) >= 3)
      v27 = (__CFString *)v31;
    else
      v27 = CFSTR("106048009");
LABEL_12:
    v29 = v77;
    v28 = v78;
  }
  else
  {
    v27 = 0;
    v29 = v77;
    v28 = v78;
    switch(v26)
    {
      case 0:
        v27 = CFSTR("39156-5");
        break;
      case 1:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 2:
        v27 = CFSTR("8302-2");
        break;
      case 3:
        v27 = CFSTR("3141-9");
        break;
      case 5:
        v27 = CFSTR("8867-4");
        break;
      case 14:
        v27 = CFSTR("2710-2");
        break;
      case 15:
        v27 = CFSTR("365812005");
        break;
      case 16:
        v27 = CFSTR("8480-6");
        break;
      case 17:
        v27 = CFSTR("8462-4");
        break;
      case 18:
        v27 = CFSTR("274776000");
        break;
      case 19:
        v27 = CFSTR("248750004");
        break;
      default:
        if (v26 == 61)
          v27 = CFSTR("9279-1");
        else
          v27 = 0;
        goto LABEL_12;
    }
  }
  xmlTextWriterWriteAttribute(writerCDA, (const xmlChar *)"code", (const xmlChar *)-[__CFString UTF8String](v27, "UTF8String"));
  if (getCategoryOfType(v19))
  {
    if (getCategoryOfType(v19) != 1)
      goto LABEL_18;
    v32 = "SNOMED CT";
    v33 = "2.16.840.1.113883.6.96";
  }
  else
  {
    v32 = "LOINC";
    v33 = "2.16.840.1.113883.6.1";
  }
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)v33);
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)v32);
LABEL_18:
  v34 = self->_writerCDA;
  v35 = objc_msgSend(v19, "code");
  v36 = v35;
  if (v35 > 61)
  {
    v38 = CFSTR("Oral fluid input");
    if (v35 != 87)
      v38 = 0;
    if (v35 == 62)
      v39 = CFSTR("Body Temperature");
    else
      v39 = v38;
    if ((unint64_t)(v35 - 71) >= 3)
      v37 = (__CFString *)v39;
    else
      v37 = CFSTR("Respiratory finding");
  }
  else
  {
    v37 = 0;
    switch(v36)
    {
      case 0:
        v37 = CFSTR("Body mass index");
        break;
      case 1:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 2:
        v37 = CFSTR("Height");
        break;
      case 3:
        v37 = CFSTR("Body weight Measured");
        break;
      case 5:
        v37 = CFSTR("Heart rate");
        break;
      case 14:
        v37 = CFSTR("Oxygen saturation");
        break;
      case 15:
        v37 = CFSTR("Blood glucose level");
        break;
      case 16:
        v37 = CFSTR("Sysstolic blood pressure");
        break;
      case 17:
        v37 = CFSTR("Diastolic blood pressure");
        break;
      case 18:
        v37 = CFSTR("Finding of alcohol in blood");
        break;
      case 19:
        v37 = CFSTR("Peripheral blood flow");
        break;
      default:
        if (v36 == 61)
          v37 = CFSTR("Respiratory rate");
        else
          v37 = 0;
        break;
    }
  }
  xmlTextWriterWriteAttribute(v34, (const xmlChar *)"displayName", (const xmlChar *)-[__CFString UTF8String](v37, "UTF8String"));
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"sourceName");
  v40 = self->_writerCDA;
  v41 = objc_retainAutorelease(v20);
  xmlTextWriterWriteString(v40, (const xmlChar *)objc_msgSend(v41, "UTF8String"));
  xmlTextWriterEndElement(self->_writerCDA);
  if (objc_msgSend(v29, "length"))
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"sourceVersion");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
    xmlTextWriterEndElement(self->_writerCDA);
  }
  if (objc_msgSend(v21, "length"))
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"device");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    xmlTextWriterEndElement(self->_writerCDA);
  }
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
  objc_opt_class();
  v76 = v21;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = self->_writerCDA;
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%g"), v44);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteString(v42, (const xmlChar *)objc_msgSend(v45, "UTF8String"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
  }
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"type");
  v46 = self->_writerCDA;
  objc_msgSend(v19, "identifier");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteString(v46, (const xmlChar *)objc_msgSend(v47, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"unit");
  v48 = self->_writerCDA;
  v74 = objc_retainAutorelease(v22);
  xmlTextWriterWriteString(v48, (const xmlChar *)objc_msgSend(v74, "UTF8String"));
  xmlTextWriterEndElement(self->_writerCDA);
  if (v23)
  {
    v71 = v41;
    v72 = v23;
    v73 = v19;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v49 = v23;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v81 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if ((_HKMetadataKeyIsPrivate() & 1) == 0)
          {
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"metadataEntry");
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"key");
            v55 = self->_writerCDA;
            v56 = objc_retainAutorelease(v54);
            xmlTextWriterWriteString(v55, (const xmlChar *)objc_msgSend(v56, "UTF8String"));
            xmlTextWriterEndElement(self->_writerCDA);
            objc_msgSend(v49, "valueForKey:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
            v58 = self->_writerCDA;
            objc_msgSend(v57, "description");
            v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            xmlTextWriterWriteString(v58, (const xmlChar *)objc_msgSend(v59, "UTF8String"));

            xmlTextWriterEndElement(self->_writerCDA);
            xmlTextWriterEndElement(self->_writerCDA);

          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      }
      while (v51);
    }

    v29 = v77;
    v28 = v78;
    v23 = v72;
    v19 = v73;
    v41 = v71;
  }
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"low");
  v60 = self->_writerCDA;
  -[NSDateFormatter stringFromDate:](self->_cdaDateFormatter, "stringFromDate:", v75);
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v60, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v61, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"high");
  v62 = self->_writerCDA;
  -[NSDateFormatter stringFromDate:](self->_cdaDateFormatter, "stringFromDate:", v79);
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v62, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v63, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"xsi:type", (const xmlChar *)"PQ");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = self->_writerCDA;
    v65 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v65, "stringWithFormat:", CFSTR("%g"), v66);
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v64, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v67, "UTF8String"));

    v68 = v76;
  }
  else
  {
    objc_opt_class();
    v68 = v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
  }
  v69 = self->_writerCDA;
  v70 = objc_retainAutorelease(v74);
  xmlTextWriterWriteAttribute(v69, (const xmlChar *)"unit", (const xmlChar *)objc_msgSend(v70, "UTF8String"));
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"interpretationCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"N");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.83");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);

}

- (void)_writeXMLMedicalRecordWithType:(id)a3 identifier:(id)a4 sourceName:(id)a5 sourceURL:(id)a6 fhirVersion:(id)a7 receivedDate:(id)a8 jsonFilePath:(id)a9
{
  _xmlTextWriter *writer;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _xmlTextWriter *v24;
  id v25;
  const xmlChar *v26;
  _xmlTextWriter *v27;
  id v28;
  const xmlChar *v29;
  _xmlTextWriter *v30;
  id v31;
  const xmlChar *v32;
  _xmlTextWriter *v33;
  id v34;
  const xmlChar *v35;
  _xmlTextWriter *v36;
  id v37;
  const xmlChar *v38;
  _xmlTextWriter *v39;
  id v40;
  const xmlChar *v41;
  _xmlTextWriter *v42;
  id v43;
  const xmlChar *v44;

  writer = self->_writer;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"ClinicalRecord");
  v24 = self->_writer;
  v25 = objc_retainAutorelease(v23);
  v26 = (const xmlChar *)objc_msgSend(v25, "UTF8String");

  xmlTextWriterWriteAttribute(v24, (const xmlChar *)"type", v26);
  v27 = self->_writer;
  v28 = objc_retainAutorelease(v22);
  v29 = (const xmlChar *)objc_msgSend(v28, "UTF8String");

  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"identifier", v29);
  v30 = self->_writer;
  v31 = objc_retainAutorelease(v21);
  v32 = (const xmlChar *)objc_msgSend(v31, "UTF8String");

  xmlTextWriterWriteAttribute(v30, (const xmlChar *)"sourceName", v32);
  v33 = self->_writer;
  v34 = objc_retainAutorelease(v20);
  v35 = (const xmlChar *)objc_msgSend(v34, "UTF8String");

  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"sourceURL", v35);
  v36 = self->_writer;
  v37 = objc_retainAutorelease(v19);
  v38 = (const xmlChar *)objc_msgSend(v37, "UTF8String");

  xmlTextWriterWriteAttribute(v36, (const xmlChar *)"fhirVersion", v38);
  v39 = self->_writer;
  v40 = objc_retainAutorelease(v18);
  v41 = (const xmlChar *)objc_msgSend(v40, "UTF8String");

  xmlTextWriterWriteAttribute(v39, (const xmlChar *)"receivedDate", v41);
  v42 = self->_writer;
  v43 = objc_retainAutorelease(v17);
  v44 = (const xmlChar *)objc_msgSend(v43, "UTF8String");

  xmlTextWriterWriteAttribute(v42, (const xmlChar *)"resourceFilePath", v44);
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLPersonWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 bloodType:(int64_t)a5 skinType:(int64_t)a6 cardioFitnessMedicationsUse:(id)a7
{
  _xmlTextWriter *writer;
  id v13;
  id v14;
  _xmlTextWriter *v15;
  NSDateFormatter *xmlDateFormatter;
  void *v17;
  id v18;
  _xmlTextWriter *v19;
  const xmlChar *v20;
  void *v21;
  id v22;
  _xmlTextWriter *v23;
  const xmlChar *v24;
  __CFString *v25;
  _xmlTextWriter *v26;
  const xmlChar *v27;
  __CFString *v28;
  _xmlTextWriter *v29;
  const xmlChar *v30;
  __CFString *v31;
  _xmlTextWriter *v32;
  const xmlChar *v33;
  id v34;
  const xmlChar *v35;
  id v36;

  writer = self->_writer;
  v13 = a7;
  v14 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"ExportDate");
  v15 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v15, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v18, "UTF8String"));

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Me");
  v36 = (id)objc_opt_new();
  objc_msgSend(v36, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v19 = self->_writer;
  v20 = (const xmlChar *)objc_msgSend((id)*MEMORY[0x24BDD2A88], "UTF8String");
  objc_msgSend(v36, "stringFromDate:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_retainAutorelease(v21);
  xmlTextWriterWriteAttribute(v19, v20, (const xmlChar *)objc_msgSend(v22, "UTF8String"));

  v23 = self->_writer;
  v24 = (const xmlChar *)objc_msgSend((id)*MEMORY[0x24BDD2A78], "UTF8String");
  if ((unint64_t)a4 > 3)
    v25 = 0;
  else
    v25 = off_24D38D908[a4];
  xmlTextWriterWriteAttribute(v23, v24, (const xmlChar *)-[__CFString UTF8String](v25, "UTF8String"));
  v26 = self->_writer;
  v27 = (const xmlChar *)objc_msgSend((id)*MEMORY[0x24BDD2A80], "UTF8String");
  if ((unint64_t)a5 > 8)
    v28 = 0;
  else
    v28 = off_24D38D928[a5];
  xmlTextWriterWriteAttribute(v26, v27, (const xmlChar *)-[__CFString UTF8String](v28, "UTF8String"));
  v29 = self->_writer;
  v30 = (const xmlChar *)objc_msgSend((id)*MEMORY[0x24BDD2A90], "UTF8String");
  if ((unint64_t)a6 > 6)
    v31 = 0;
  else
    v31 = off_24D38D970[a6];
  xmlTextWriterWriteAttribute(v29, v30, (const xmlChar *)-[__CFString UTF8String](v31, "UTF8String"));
  v32 = self->_writer;
  v33 = (const xmlChar *)objc_msgSend((id)*MEMORY[0x24BDD42D0], "UTF8String");
  v34 = objc_retainAutorelease(v13);
  v35 = (const xmlChar *)objc_msgSend(v34, "UTF8String");

  xmlTextWriterWriteAttribute(v32, v33, v35);
  xmlTextWriterEndElement(self->_writer);

}

- (void)_writeCDAHeaderWithName:(id)a3 birthData:(id)a4 biologicalSex:(int64_t)a5
{
  _xmlTextWriter *writerCDA;
  id v9;
  _xmlTextWriter *v10;
  NSDateFormatter *cdaDateFormatter;
  void *v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  _xmlTextWriter *v16;
  __CFString *v17;
  __CFString *v18;
  _xmlTextWriter *v19;
  __CFString *v20;
  const xmlChar *v21;
  _xmlTextWriter *v22;
  __CFString *v23;
  const xmlChar *v24;
  void *v25;
  _xmlTextWriter *v26;
  void *v27;
  id v28;
  id v29;

  v29 = a3;
  writerCDA = self->_writerCDA;
  v9 = a4;
  xmlTextWriterStartElement(writerCDA, (const xmlChar *)"realmCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"US");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"typeId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.1.3");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"extension", (const xmlChar *)"POCD_HD000040");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.1.2");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"extension", (const xmlChar *)"Health Export CDA");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"1.1.1.1.1.1.1.1.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"34109-9");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Note");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Health Data Export");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  v10 = self->_writerCDA;
  cdaDateFormatter = self->_cdaDateFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](cdaDateFormatter, "stringFromDate:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(v10, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v13, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"confidentialityCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"N");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.25");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"recordTarget");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"patientRole");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.4.6");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"nullFlavor", (const xmlChar *)"NA");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"patient");
  if (v29)
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"name");
    xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"use", (const xmlChar *)"CL");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
    xmlTextWriterEndElement(self->_writerCDA);
  }
  if (a5 && a5 != 3)
  {
    if (a5 == 1)
      v14 = CFSTR("F");
    else
      v14 = CFSTR("M");
    v15 = CFSTR("Male");
    if (a5 == 1)
      v15 = CFSTR("Female");
    v16 = self->_writerCDA;
    v17 = v15;
    v18 = v14;
    xmlTextWriterStartElement(v16, (const xmlChar *)"administrativeGenderCode");
    v19 = self->_writerCDA;
    v20 = objc_retainAutorelease(v18);
    v21 = (const xmlChar *)-[__CFString UTF8String](v20, "UTF8String");

    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"code", v21);
    xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.1");
    v22 = self->_writerCDA;
    v23 = objc_retainAutorelease(v17);
    v24 = (const xmlChar *)-[__CFString UTF8String](v23, "UTF8String");

    xmlTextWriterWriteAttribute(v22, (const xmlChar *)"displayName", v24);
    xmlTextWriterEndElement(self->_writerCDA);
  }
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDateFormat:", CFSTR("yyyyMMdd"));
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"birthTime");
  v26 = self->_writerCDA;
  objc_msgSend(v25, "stringFromDate:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_retainAutorelease(v27);
  xmlTextWriterWriteAttribute(v26, (const xmlChar *)"value", (const xmlChar *)objc_msgSend(v28, "UTF8String"));

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);

}

- (void)_writeCDAVitalHeader
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"section");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.2.4.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"8716-3");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"VITAL SIGNS");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Vital Signs");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDAResultsHeader
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"section");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.2.3.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"30954-2");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"RESULTS");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Results");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDASectionFooter
{
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeVisionRx:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "prescriptionType");
  objc_msgSend(v4, "dateIssued");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeVisionRxType:dateIssued:expirationDate:](self, "_writeVisionRxType:dateIssued:expirationDate:", v5, v6, v7);

  objc_msgSend(v4, "device");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDExportManager _writeVisionRxDevice:metadata:](self, "_writeVisionRxDevice:metadata:", v9, v8);
}

- (void)_writeGlassesRx:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  v5 = objc_msgSend(v4, "prescriptionType");
  objc_msgSend(v4, "dateIssued");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeVisionRxType:dateIssued:expirationDate:](self, "_writeVisionRxType:dateIssued:expirationDate:", v5, v6, v7);

  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"RightEye");
  objc_msgSend(v4, "rightEye");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sphere");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "cylinder");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "axis");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addPower");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vertexDistance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "prism");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "amount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "prism");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "angle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "farPupillaryDistance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nearPupillaryDistance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeGlassesRxSphere:cylinder:axis:add:vertex:prismAmount:prismAngle:farPD:nearPD:](self, "_writeGlassesRxSphere:cylinder:axis:add:vertex:prismAmount:prismAngle:farPD:nearPD:", v47, v45, v43, v8, v9, v10, v12, v14, v16);

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"LeftEye");
  objc_msgSend(v4, "leftEye");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sphere");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cylinder");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "axis");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addPower");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "vertexDistance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "prism");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "amount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "prism");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "angle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "farPupillaryDistance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "nearPupillaryDistance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeGlassesRxSphere:cylinder:axis:add:vertex:prismAmount:prismAngle:farPD:nearPD:](self, "_writeGlassesRxSphere:cylinder:axis:add:vertex:prismAmount:prismAngle:farPD:nearPD:", v48, v46, v44, v17, v18, v19, v21, v23, v25);

  xmlTextWriterEndElement(self->_writer);
  objc_msgSend(v4, "device");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDExportManager _writeVisionRxDevice:metadata:](self, "_writeVisionRxDevice:metadata:", v49, v26);
}

- (void)_writeContactsRx:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _xmlTextWriter *writer;
  id v9;
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
  id v33;
  id v34;
  id v35;

  v4 = a3;
  v5 = objc_msgSend(v4, "prescriptionType");
  objc_msgSend(v4, "dateIssued");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeVisionRxType:dateIssued:expirationDate:](self, "_writeVisionRxType:dateIssued:expirationDate:", v5, v6, v7);

  writer = self->_writer;
  objc_msgSend(v4, "brand");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"brand", (const xmlChar *)objc_msgSend(v9, "UTF8String"));

  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"RightEye");
  objc_msgSend(v4, "rightEye");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sphere");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "cylinder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "axis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addPower");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "baseCurve");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEye");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "diameter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeContactsRxSphere:cylinder:axis:add:baseCurve:diameter:](self, "_writeContactsRxSphere:cylinder:axis:add:baseCurve:diameter:", v10, v11, v12, v13, v15, v17);

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"LeftEye");
  objc_msgSend(v4, "leftEye");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sphere");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cylinder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "axis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addPower");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "baseCurve");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEye");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "diameter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportManager _writeContactsRxSphere:cylinder:axis:add:baseCurve:diameter:](self, "_writeContactsRxSphere:cylinder:axis:add:baseCurve:diameter:", v18, v19, v20, v21, v23, v25);

  xmlTextWriterEndElement(self->_writer);
  objc_msgSend(v4, "device");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDExportManager _writeVisionRxDevice:metadata:](self, "_writeVisionRxDevice:metadata:", v35, v26);
}

- (void)_writeVisionRxType:(unint64_t)a3 dateIssued:(id)a4 expirationDate:(id)a5
{
  __CFString *v8;
  _xmlTextWriter *writer;
  __CFString *v10;
  id v11;
  _xmlTextWriter *v12;
  void *v13;
  id v14;
  void *v15;
  _xmlTextWriter *v16;
  id v17;
  id v18;

  v18 = a5;
  if (a3 == 1)
    v8 = CFSTR("glasses");
  else
    v8 = CFSTR("contacts");
  writer = self->_writer;
  v10 = objc_retainAutorelease(v8);
  v11 = a4;
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)-[__CFString UTF8String](v10, "UTF8String"));
  v12 = self->_writer;
  -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"dateIssued", (const xmlChar *)objc_msgSend(v14, "UTF8String"));

  v15 = v18;
  if (v18)
  {
    v16 = self->_writer;
    -[NSDateFormatter stringFromDate:](self->_xmlDateFormatter, "stringFromDate:", v18);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v16, (const xmlChar *)"expirationDate", (const xmlChar *)objc_msgSend(v17, "UTF8String"));

    v15 = v18;
  }

}

- (void)_writeVisionRxDevice:(id)a3 metadata:(id)a4
{
  _xmlTextWriter *writer;
  id v7;
  id v8;

  v8 = a4;
  if (a3)
  {
    writer = self->_writer;
    objc_msgSend(a3, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"device", (const xmlChar *)objc_msgSend(v7, "UTF8String"));

  }
  -[WDExportManager _writeXMLMetadataEntries:](self, "_writeXMLMetadataEntries:", v8);

}

- (void)_writeGlassesRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 vertex:(id)a7 prismAmount:(id)a8 prismAngle:(id)a9 farPD:(id)a10 nearPD:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  _xmlTextWriter *writer;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _xmlTextWriter *v26;
  void *v27;
  id v28;
  _xmlTextWriter *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _xmlTextWriter *v34;
  void *v35;
  id v36;
  _xmlTextWriter *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _xmlTextWriter *v42;
  void *v43;
  id v44;
  _xmlTextWriter *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  _xmlTextWriter *v50;
  void *v51;
  id v52;
  _xmlTextWriter *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  _xmlTextWriter *v58;
  void *v59;
  id v60;
  id v61;

  v61 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  -[WDExportManager _writeVisionRxSphere:cylinder:axis:add:](self, "_writeVisionRxSphere:cylinder:axis:add:", a3, a4, a5, a6);
  if (v61)
  {
    writer = self->_writer;
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v61, "_unit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "doubleValueForUnit:", v23);
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%g"), v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"vertex", (const xmlChar *)objc_msgSend(v25, "UTF8String"));

    v26 = self->_writer;
    objc_msgSend(v61, "_unit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "description");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v26, (const xmlChar *)"vertexUnit", (const xmlChar *)objc_msgSend(v28, "UTF8String"));

  }
  if (v17)
  {
    v29 = self->_writer;
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "_unit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValueForUnit:", v31);
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%g"), v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"prismAmount", (const xmlChar *)objc_msgSend(v33, "UTF8String"));

    v34 = self->_writer;
    objc_msgSend(v17, "_unit");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "description");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v34, (const xmlChar *)"prismAmountUnit", (const xmlChar *)objc_msgSend(v36, "UTF8String"));

  }
  if (v18)
  {
    v37 = self->_writer;
    v38 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "_unit");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValueForUnit:", v39);
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%g"), v40);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v37, (const xmlChar *)"prismAngle", (const xmlChar *)objc_msgSend(v41, "UTF8String"));

    v42 = self->_writer;
    objc_msgSend(v18, "_unit");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "description");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"prismAngleUnit", (const xmlChar *)objc_msgSend(v44, "UTF8String"));

  }
  if (v19)
  {
    v45 = self->_writer;
    v46 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v19, "_unit");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v47);
    objc_msgSend(v46, "stringWithFormat:", CFSTR("%g"), v48);
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v45, (const xmlChar *)"farPD", (const xmlChar *)objc_msgSend(v49, "UTF8String"));

    v50 = self->_writer;
    objc_msgSend(v19, "_unit");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "description");
    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v50, (const xmlChar *)"farPDUnit", (const xmlChar *)objc_msgSend(v52, "UTF8String"));

  }
  if (v20)
  {
    v53 = self->_writer;
    v54 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v20, "_unit");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValueForUnit:", v55);
    objc_msgSend(v54, "stringWithFormat:", CFSTR("%g"), v56);
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v53, (const xmlChar *)"nearPD", (const xmlChar *)objc_msgSend(v57, "UTF8String"));

    v58 = self->_writer;
    objc_msgSend(v20, "_unit");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "description");
    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v58, (const xmlChar *)"nearPDUnit", (const xmlChar *)objc_msgSend(v60, "UTF8String"));

  }
}

- (void)_writeContactsRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 baseCurve:(id)a7 diameter:(id)a8
{
  id v14;
  _xmlTextWriter *writer;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _xmlTextWriter *v20;
  void *v21;
  id v22;
  _xmlTextWriter *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _xmlTextWriter *v28;
  void *v29;
  id v30;
  id v31;

  v31 = a7;
  v14 = a8;
  -[WDExportManager _writeVisionRxSphere:cylinder:axis:add:](self, "_writeVisionRxSphere:cylinder:axis:add:", a3, a4, a5, a6);
  if (v31)
  {
    writer = self->_writer;
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v31, "_unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValueForUnit:", v17);
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%g"), v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"baseCurve", (const xmlChar *)objc_msgSend(v19, "UTF8String"));

    v20 = self->_writer;
    objc_msgSend(v31, "_unit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v20, (const xmlChar *)"baseCurveUnit", (const xmlChar *)objc_msgSend(v22, "UTF8String"));

  }
  if (v14)
  {
    v23 = self->_writer;
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "_unit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v25);
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%g"), v26);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v23, (const xmlChar *)"diameter", (const xmlChar *)objc_msgSend(v27, "UTF8String"));

    v28 = self->_writer;
    objc_msgSend(v14, "_unit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "description");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v28, (const xmlChar *)"diameterUnit", (const xmlChar *)objc_msgSend(v30, "UTF8String"));

  }
}

- (void)_writeVisionRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6
{
  id v10;
  id v11;
  id v12;
  _xmlTextWriter *writer;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _xmlTextWriter *v18;
  void *v19;
  id v20;
  _xmlTextWriter *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _xmlTextWriter *v26;
  void *v27;
  id v28;
  _xmlTextWriter *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _xmlTextWriter *v34;
  void *v35;
  id v36;
  _xmlTextWriter *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _xmlTextWriter *v42;
  void *v43;
  id v44;
  id v45;

  v45 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v45)
  {
    writer = self->_writer;
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v45, "_unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValueForUnit:", v15);
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%g"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"sphere", (const xmlChar *)objc_msgSend(v17, "UTF8String"));

    v18 = self->_writer;
    objc_msgSend(v45, "_unit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"sphereUnit", (const xmlChar *)objc_msgSend(v20, "UTF8String"));

  }
  if (v10)
  {
    v21 = self->_writer;
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "_unit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v23);
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%g"), v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v21, (const xmlChar *)"cylinder", (const xmlChar *)objc_msgSend(v25, "UTF8String"));

    v26 = self->_writer;
    objc_msgSend(v10, "_unit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "description");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v26, (const xmlChar *)"cylinderUnit", (const xmlChar *)objc_msgSend(v28, "UTF8String"));

  }
  if (v11)
  {
    v29 = self->_writer;
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "_unit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v31);
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%g"), v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"axis", (const xmlChar *)objc_msgSend(v33, "UTF8String"));

    v34 = self->_writer;
    objc_msgSend(v11, "_unit");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "description");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v34, (const xmlChar *)"axisUnit", (const xmlChar *)objc_msgSend(v36, "UTF8String"));

  }
  if (v12)
  {
    v37 = self->_writer;
    v38 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "_unit");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v39);
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%g"), v40);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v37, (const xmlChar *)"add", (const xmlChar *)objc_msgSend(v41, "UTF8String"));

    v42 = self->_writer;
    objc_msgSend(v12, "_unit");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "description");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"addUnit", (const xmlChar *)objc_msgSend(v44, "UTF8String"));

  }
}

- (void)_writeHealthRecord:(id)a3 documentDirectory:(id)a4 fileNamesInUse:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v18 = a4;
  v7 = a5;
  objc_msgSend(v19, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDBCE48]);
  v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v10, "components:fromDate:", 30, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cda_%ld%02ld%02ld.xml"), objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v12))
  {
    v13 = 1;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cda_%ld%02ld%02ld_%02ld.xml"), objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      ++v13;
      v12 = v14;
    }
    while ((objc_msgSend(v7, "containsObject:", v14) & 1) != 0);
  }
  else
  {
    v14 = v12;
  }
  objc_msgSend(v7, "addObject:", v14);
  objc_msgSend(v18, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "document");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "documentData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "writeToFile:atomically:", v15, 1);
}

- (void)_exportHealthRecords
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to create document directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __39__WDExportManager__exportHealthRecords__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __39__WDExportManager__exportHealthRecords__block_invoke_cold_1();
    v17 = *(void **)(a1 + 32);
    v16 = a1 + 32;
    objc_msgSend(v17, "setExportFailed:", 1);
    goto LABEL_14;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "_writeHealthRecord:documentDirectory:fileNamesInUse:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  if (a4)
  {
    v16 = a1 + 32;
LABEL_14:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)v16 + 40));
  }

}

- (id)_electrocardiogramHeaderWithName:(id)a3 dateOfBirth:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  WDBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_NAME_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v10);

  if (v5)
  {
    objc_msgSend(v7, "appendString:", CFSTR(","));
    objc_msgSend(v7, "appendString:", v5);
  }
  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  WDBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_DOB_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v13);

  if (v6)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v14, "setDateStyle:", 2);
    objc_msgSend(v7, "appendString:", CFSTR(","));
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "stringFromDate:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("\"%@\"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v17);

  }
  objc_msgSend(v7, "appendString:", CFSTR("\n"));

  return v7;
}

- (BOOL)_writeElectrocardiogramsToDisk:(id)a3 header:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSDateFormatter *xmlDateFormatter;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  BOOL v37;
  id v39;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  WDExportManager *v47;
  void *v48;
  id v49;
  void *v50;
  void *context;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v49 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self;
  -[NSString stringByAppendingPathComponent:](self->_exportPath, "stringByAppendingPathComponent:", CFSTR("electrocardiograms"));
  v11 = objc_claimAutoreleasedReturnValue();
  v59 = *MEMORY[0x24BDD0CF0];
  v60[0] = *MEMORY[0x24BDD0CD0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v48 = (void *)v11;
  LOBYTE(v11) = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, v12, &v57);
  v13 = v57;

  if ((v11 & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v15 = objc_alloc(MEMORY[0x24BDBCE48]);
    v46 = (void *)objc_msgSend(v15, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v8;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v45)
    {
      v39 = v13;
      v40 = v10;
      v41 = v8;
      v43 = *(_QWORD *)v54;
      v44 = v9;
      while (2)
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          context = (void *)MEMORY[0x2199E6CD0]();
          objc_msgSend(v17, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "components:fromDate:", 28, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v19;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ecg_%ld-%02ld-%02ld"), objc_msgSend(v19, "year"), objc_msgSend(v19, "month"), objc_msgSend(v19, "day"));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (objc_msgSend(v14, "containsObject:", v20))
          {
            v22 = 1;
            v23 = v20;
            do
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld"), v20, v22);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              ++v22;
              v23 = v21;
            }
            while ((objc_msgSend(v14, "containsObject:", v21) & 1) != 0);
          }
          objc_msgSend(v14, "addObject:", v21);
          v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);
          objc_msgSend(v24, "appendString:", v49);
          WDBundle();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_RECORDING_DATE_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          HKConditionallyRedactedHeartRhythmString();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v27);

          objc_msgSend(v24, "appendString:", CFSTR(","));
          xmlDateFormatter = v47->_xmlDateFormatter;
          objc_msgSend(v17, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](xmlDateFormatter, "stringFromDate:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v30);

          objc_msgSend(v24, "appendString:", CFSTR("\n"));
          v9 = v44;
          if (v44)
          {
            objc_msgSend(v17, "wd_commaSeparatedHeaderWithActiveAlgorithmVersion:", objc_msgSend(v44, "integerValue"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "appendString:", v31);

            objc_msgSend(v24, "appendString:", CFSTR("\n"));
          }
          objc_msgSend(v17, "wd_commaSeparatedData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v32);

          objc_msgSend(v48, "stringByAppendingPathComponent:", v21);
          v33 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v33, "stringByAppendingPathExtension:", CFSTR("csv"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = 0;
          LOBYTE(v33) = objc_msgSend(v24, "writeToFile:atomically:encoding:error:", v34, 1, 4, &v52);
          v35 = v52;
          v36 = v35;
          if ((v33 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
              -[WDExportManager _writeElectrocardiogramsToDisk:header:version:].cold.1();

            objc_autoreleasePoolPop(context);
            v37 = 0;
            goto LABEL_22;
          }

          objc_autoreleasePoolPop(context);
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v45)
          continue;
        break;
      }
      v37 = 1;
LABEL_22:
      v10 = v40;
      v8 = v41;
      v13 = v39;
    }
    else
    {
      v37 = 1;
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[WDExportManager _writeElectrocardiogramsToDisk:header:version:].cold.2();
    v37 = 0;
  }

  return v37;
}

- (void)_exportElectrocardiogramsWithName:(id)a3 dateOfBirth:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD3B70];
  -[WDProfile healthStore](self->_profile, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "versionWithHealthStore:error:", v9, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[WDExportManager _exportElectrocardiogramsWithName:dateOfBirth:].cold.1();
  }
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDD3F00]);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke;
  v19[3] = &unk_24D38D740;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v22 = v10;
  v14 = v10;
  v15 = v7;
  v16 = v6;
  v17 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v12, 0, 0, 0, v19);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeQuery:", v17);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sem, 0xFFFFFFFFFFFFFFFFLL);
}

void __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_electrocardiogramHeaderWithName:dateOfBirth:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", objc_msgSend(*(id *)(a1 + 32), "_writeElectrocardiogramsToDisk:header:version:", v6, v8, *(_QWORD *)(a1 + 56)) ^ 1);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", 1);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));

}

- (BOOL)_addSourceDirectory:(id)a3 asPath:(id)a4 archive:(id)a5 fileManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v26;
  void *v27;
  id v28;
  id obj;
  id v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v31 = a5;
  v11 = a6;
  v38 = 0;
  objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, MEMORY[0x24BDBD1A8], 4, &v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v38;
  if (v12)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v14)
    {
      v15 = v14;
      v26 = v13;
      v27 = v12;
      v28 = v9;
      v32 = *(_QWORD *)v35;
      v16 = obj;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(v16);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x2199E6CD0]();
          objc_msgSend(v18, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pathComponents");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "URLByAppendingPathComponent:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          if (objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v20, &v33))
          {
            if (v33)
            {
              if (!-[WDExportManager _addSourceDirectory:asPath:archive:fileManager:](self, "_addSourceDirectory:asPath:archive:fileManager:", v18, v23, v31, v11))goto LABEL_18;
            }
            else
            {
              objc_msgSend(v31, "addFileToArchive:pathInArchive:", v18, v23);
              v16 = obj;
              if (!objc_msgSend(v31, "archiveIsValid"))
              {
LABEL_18:

                objc_autoreleasePoolPop(v19);
                v24 = 0;
                goto LABEL_19;
              }
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v15)
          continue;
        break;
      }
      v24 = 1;
LABEL_19:
      v12 = v27;
      v9 = v28;
      v13 = v26;
    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[WDExportManager _addSourceDirectory:asPath:archive:fileManager:].cold.1();
    v24 = 0;
  }

  return v24;
}

- (void)_archiveExportDirectory:(id)a3 toFile:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = (objc_class *)MEMORY[0x24BDD4190];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithURL:archiveType:", v10, 0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pathComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WDExportManager _addSourceDirectory:asPath:archive:fileManager:](self, "_addSourceDirectory:asPath:archive:fileManager:", v13, v16, v11, v12))
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[WDExportManager _archiveExportDirectory:toFile:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    -[WDExportManager setExportFailed:](self, "setExportFailed:", 1);
  }
  objc_msgSend(v11, "closeArchive");

}

- (void)_completeAndCloseStreamingXML
{
  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndDocument(self->_writer);
  xmlFreeTextWriter(self->_writer);
  xmlTextWriterEndDocument(self->_writerCDA);
  xmlFreeTextWriter(self->_writerCDA);
}

- (void)_getAllOrdinaryDataTypesOfClass:(Class)a3 withArray:(id)a4
{
  uint64_t i;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  v8 = a4;
  for (i = 0; i != 317; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "supportsExport"))
    {
      v6 = objc_msgSend(v5, "code");
      v7 = (unint64_t)(v6 - 100) > 0x2C || ((1 << (v6 - 100)) & 0x108000000001) == 0;
      if (v7 && v6 != 79)
        objc_msgSend(v8, "addObject:", v5);
    }

  }
}

- (void)_getAllOrdinaryDataTypesOfCategory:(int64_t)a3 withArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[WDExportManager _getAllOrdinaryDataTypesOfClass:withArray:](self, "_getAllOrdinaryDataTypesOfClass:withArray:", objc_opt_class(), v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (getCategoryOfType(v13) == a3)
          objc_msgSend(v6, "addObject:", v13, (_QWORD)v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)_preferredUnitForObjectType:(id)a3
{
  WDProfile *profile;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  profile = self->_profile;
  v5 = a3;
  -[WDProfile displayTypeController](profile, "displayTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDProfile unitController](self->_profile, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unitForDisplayType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_formatBPMForBeatToBeatReading:(id)a3
{
  WDProfile *profile;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  profile = self->_profile;
  v5 = a3;
  -[WDProfile displayTypeController](profile, "displayTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeWithIdentifier:", &unk_24D3A5D98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "bpm");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfile unitController](self->_profile, "unitController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_formatTimeForBeatToBeatReading:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a3, "time");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKApplicationProviding)applicationProvider
{
  return (HKApplicationProviding *)objc_loadWeakRetained((id *)&self->_applicationProvider);
}

- (void)setApplicationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_applicationProvider, a3);
}

- (BOOL)exportInProgress
{
  return self->_exportInProgress;
}

- (void)setExportInProgress:(BOOL)a3
{
  self->_exportInProgress = a3;
}

- (BOOL)exportFailed
{
  return self->_exportFailed;
}

- (void)setExportFailed:(BOOL)a3
{
  self->_exportFailed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationProvider);
  objc_storeStrong((id *)&self->_dateIntervalsBySampleType, 0);
  objc_storeStrong((id *)&self->_cdaDateFormatter, 0);
  objc_storeStrong((id *)&self->_xmlDateFormatter, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_CDAFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_exportPath, 0);
  objc_storeStrong((id *)&self->_documentsPath, 0);
  objc_storeStrong((id *)&self->_completedRecords, 0);
  objc_storeStrong((id *)&self->_vitalsTypes, 0);
  objc_storeStrong((id *)&self->_resultsTypes, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_outputSerialQueue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error getting cardio fitness medications use: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error getting fitzpatrick skin type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error getting blood type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error getting biological sex: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error getting birth date: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_6(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 96);
  v5 = 138543618;
  v6 = v4;
  v7 = 2114;
  v8 = v3;
  OUTLINED_FUNCTION_2_1(&dword_215814000, a2, a3, "File(s) not created: %{public}@; %{public}@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

void __38__WDExportManager__queryForDateRanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to retrieve date ranges during export: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_215814000, v0, (uint64_t)v0, "Query for '%@' failed during export attempt: %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __39__WDExportManager__writeMedicalRecords__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_215814000, v0, (uint64_t)v0, "Medical type query failed for type %{public}@ (%{public}@)", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeDataForWorkoutRoutes:semaphore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error creating workout-route export directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeDataForMedicalRecords:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215814000, a1, a3, "Export failed while attempting to export medical records; aborting.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_6();
}

- (void)_writeDataForMedicalRecords:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to create directory for medical records (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to write JSON file for medical record (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a1, a3, "Did not export all expected properties for medical record (%{public}@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to export properties for medical record (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __39__WDExportManager__exportHealthRecords__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Query for health record documents failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeElectrocardiogramsToDisk:header:version:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to write electrocardiogram content: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeElectrocardiogramsToDisk:header:version:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to create electrocardiograms export directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_exportElectrocardiogramsWithName:dateOfBirth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to lookup active electrocardiogram version: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Query for electrocardiogram samples failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addSourceDirectory:asPath:archive:fileManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Unable to list archive directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_archiveExportDirectory:(uint64_t)a3 toFile:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215814000, a1, a3, "Failed to generate archive for export data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
