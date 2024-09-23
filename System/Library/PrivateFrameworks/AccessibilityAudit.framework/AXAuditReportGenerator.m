@implementation AXAuditReportGenerator

- (AXAuditReportGenerator)init
{
  AXAuditReportGenerator *v2;
  uint64_t v3;
  NSMutableArray *issues;
  uint64_t v5;
  NSMutableDictionary *auditScreenToIssuesMapping;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditReportGenerator;
  v2 = -[AXAuditReportGenerator init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    issues = v2->__issues;
    v2->__issues = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    auditScreenToIssuesMapping = v2->__auditScreenToIssuesMapping;
    v2->__auditScreenToIssuesMapping = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)appendIssues:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[AXAuditReportGenerator _issues](self, "_issues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
  -[AXAuditReportGenerator _generateMapOfScreensToIssues:](self, "_generateMapOfScreensToIssues:", v5);

}

- (void)_generateMapOfScreensToIssues:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__AXAuditReportGenerator__generateMapOfScreensToIssues___block_invoke;
  v3[3] = &unk_25071B1E8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __56__AXAuditReportGenerator__generateMapOfScreensToIssues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "timeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_auditScreenToIssuesMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "_auditScreenToIssuesMapping");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v3);

    }
    objc_msgSend(v5, "addObject:", v7);

  }
}

- (id)_fileExtensionForReportType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("txt");
  else
    return off_25071B280[a3];
}

- (id)_fullOutputPathForReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5
{
  id v8;
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

  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    -[AXAuditReportGenerator _defaultSavePath](self, "_defaultSavePath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v9, "length"))
  {
    -[AXAuditReportGenerator _issues](self, "_issues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "timeStamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTimeZone:", v17);

      objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm:ss"));
      objc_msgSend(v14, "stringFromDate:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AuditReport_%@"), v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXAuditReportGenerator _fileExtensionForReportType:](self, "_fileExtensionForReportType:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathExtension:", v19);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)generateXCTestReportType:(int64_t)a3 forAuditResult:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  int64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a4;
  v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v18 = 0;
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clear");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__AXAuditReportGenerator_generateXCTestReportType_forAuditResult_completion___block_invoke;
  v12[3] = &unk_25071B210;
  v16 = a3;
  v14 = v19;
  v12[4] = self;
  v11 = v9;
  v13 = v11;
  v15 = v17;
  -[AXAuditReportGenerator _processScreenshotsForAXAuditResult:completion:](self, "_processScreenshotsForAXAuditResult:completion:", v8, v12);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

uint64_t __77__AXAuditReportGenerator_generateXCTestReportType_forAuditResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_jsonString");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_generateHTMLSourceFromTemplates");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_processScreenshotsForAXAuditResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  uint64_t v22;
  int v23;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "auditIssues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v6, "auditIssues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[AXAuditReportGenerator set_issues:](self, "set_issues:", v11);

    +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "auditIssues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(v6, "auditIssues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "screenshotInfoDictionaryForAuditIssue:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeStamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __73__AXAuditReportGenerator__processScreenshotsForAXAuditResult_completion___block_invoke;
        v20[3] = &unk_25071B238;
        v23 = i;
        v22 = v14;
        v21 = v7;
        objc_msgSend(v12, "addScreenshotWithInfo:timestamp:completion:", v18, v19, v20);

      }
    }

  }
  else
  {
    v7[2](v7);
  }

}

uint64_t __73__AXAuditReportGenerator__processScreenshotsForAXAuditResult_completion___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 40) - 1 == *(_DWORD *)(result + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)generateReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5 error:(id *)a6
{
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  -[AXAuditReportGenerator _fullOutputPathForReportType:outputPath:outputFilename:](self, "_fullOutputPathForReportType:outputPath:outputFilename:", a3, a4, a5);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    -[AXAuditReportGenerator _jsonString](self, "_jsonString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      goto LABEL_6;
    -[AXAuditReportGenerator _generateHTMLSourceFromTemplates](self, "_generateHTMLSourceFromTemplates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "writeToFile:atomically:encoding:error:", v9, 1, 4, a6);

LABEL_6:
  if (v9)
    v12 = v9;
  else
    v12 = &stru_25071BA38;
  v13 = v12;

  return v13;
}

- (id)_locStringForKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__AXAuditReportGenerator__locStringForKey___block_invoke;
  block[3] = &unk_25071ABD8;
  block[4] = self;
  v3 = _locStringForKey__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_locStringForKey__onceToken, block);
  objc_msgSend((id)_locStringForKey__myBundle, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __43__AXAuditReportGenerator__locStringForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_locStringForKey__myBundle;
  _locStringForKey__myBundle = v0;

}

- (id)reportHeaderForIssues:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = [v4 alloc];
  -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("axAuditReport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("timeStamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditReportGenerator deviceName](self, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("numOfIssuesFound"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "count");

  v15 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@\n%@: %@\n%@: %@\n%@: %ld\n\n"), v7, v8, v10, v11, v12, v13, v14);
  return v15;
}

- (id)textDescriptionForIssues:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = &stru_25071BA38;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_opt_new();
    v7 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[AXAuditReportGenerator reportHeaderForIssues:](self, "reportHeaderForIssues:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v7, "appendString:", v8);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v4;
    obj = v4;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v26;
      v24 = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "issueClassification");
          objc_msgSend(v6, "shortTitleForAuditIssue:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "longDescriptionForAuditIssue:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc(MEMORY[0x24BDD17C8]);
          -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("issue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXAuditReportGenerator _locStringForKey:](self, "_locStringForKey:", CFSTR("errorCode"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("\n%@ %ld: %@\n%@: %ld\n%@\n"), v15, v24 + i, v12, v16, v11, v13);

          -[__CFString appendString:](v7, "appendString:", v17);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v24 += i;
      }
      while (v23);
    }

    v18 = &stru_25071BA38;
    if (v7)
      v18 = v7;
    v5 = v18;

    v4 = v20;
  }

  return v5;
}

- (id)imageDataForIssue:(id)a3 thumbnailOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  int v12;
  double v13;
  int v14;
  CGFloat v16;
  CGFloat v17;
  CGContext *CurrentContext;
  CGImage *v19;
  UIImage *v20;
  void *v21;
  CGSize v23;
  CGRect v24;

  v4 = a4;
  v5 = a3;
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshotScaleFactorForTimestamp:", v7);
  v9 = v8;

  if (v4)
    objc_msgSend(v6, "thumbnailImageOfIssue:", v5);
  else
    objc_msgSend(v6, "screenshotForIssue:elementRect:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "size");
  v12 = (int)(v11 / v9);
  v14 = (int)(v13 / v9);
  if (v12 < 1 || v14 < 1)
  {
    v21 = 0;
  }
  else
  {
    v16 = (double)v14;
    v17 = (double)v12;
    v23.width = (double)v12;
    v23.height = (double)v14;
    UIGraphicsBeginImageContext(v23);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v16);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v19 = (CGImage *)objc_msgSend(objc_retainAutorelease(v10), "CGImage");
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v17;
    v24.size.height = v16;
    CGContextDrawImage(CurrentContext, v24, v19);
    UIGraphicsGetImageFromCurrentImageContext();
    v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    UIImageJPEGRepresentation(v20, 0.75);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)_htmlTemplatePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("AuditReport"), CFSTR("html"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_htmlTemplate
{
  void *v2;
  void *v3;

  -[AXAuditReportGenerator _htmlTemplatePath](self, "_htmlTemplatePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v2, 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_generateHTMLSourceFromTemplates
{
  void *v3;
  void *v4;
  void *v5;

  -[AXAuditReportGenerator _htmlTemplate](self, "_htmlTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AXAuditReportGenerator _jsonString](self, "_jsonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("[[JSON_OBJ_REPLACE]]"), v5, 2, 0, objc_msgSend(v4, "length"));

  return v4;
}

- (id)_jsonDictionaryForIssue:(id)a3 screenName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(v5, "issueClassification");
  objc_msgSend(v8, "longDescriptionForAuditIssue:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "longDescExtraInfoForAuditIssue:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortTitleForAuditIssue:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenGroupId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isDuplicate");
  objc_msgSend(v8, "humanReadableDescriptionForAuditIssueTestType:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("_axKeyErrorCode"));

  objc_msgSend(v8, "suggestionDescriptionForAuditIssue:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("_axKeyShortDesc"));
  v30 = v11;
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("_axKeyLongDesc"));
  if (objc_msgSend(v35, "length"))
    objc_msgSend(v7, "setObject:forKey:", v35, CFSTR("_axKeyLongDescExtraInfo"));
  objc_msgSend(v5, "elementText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(v5, "elementText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("_axKeyElementText"));

  }
  if (v34)
  {
    objc_msgSend(v7, "setObject:forKey:", v34, CFSTR("_axKeyScreenGroupName"));
    v18 = v33;
    if (!v6)
      goto LABEL_15;
    v19 = CFSTR("_axKeyScreenName");
  }
  else
  {
    v18 = v33;
    if (!v6)
      goto LABEL_15;
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("_axKeyScreenName"));
    v19 = CFSTR("_axKeyScreenGroupName");
  }
  objc_msgSend(v7, "setObject:forKey:", v6, v19);
LABEL_15:
  v31 = v10;
  if (v18)
    objc_msgSend(v7, "setObject:forKey:", v18, CFSTR("_axKeyIssueTestType"));
  v32 = v6;
  if (v14)
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("_axKeyIssueSuggestion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("_axKeyIssueIsDuplicate"));

  -[AXAuditReportGenerator _jsonDictionaryForAuditIssueImage:thumbnailOnly:](self, "_jsonDictionaryForAuditIssueImage:thumbnailOnly:", v5, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v7, "setObject:forKey:", v27, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v23);
  }

  return v7;
}

- (id)_anyAuditIssueFromResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v8, "caseResults", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "auditIssues");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)_jsonDictionaryForAuditIssueImage:(id)a3 thumbnailOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGContext *CurrentContext;
  CGImage *v30;
  UIImage *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  void *v41;
  double v42;
  __int128 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  UIImage *v56;
  void *v57;
  uint64_t v58;
  _BYTE v59[32];
  CGSize v60;
  CGRect v61;

  v4 = a4;
  v5 = a3;
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "timeStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshotScaleFactorForTimestamp:", v8);
  v58 = v9;

  objc_msgSend(v5, "timeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshotRotationForTimestamp:", v10);
  v12 = v11;

  objc_msgSend(v5, "timeStamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshotDisplayBoundsForTimestamp:", v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = (void *)MEMORY[0x23B7DEEF8]();
  if (v4)
    objc_msgSend(v6, "thumbnailImageOfIssue:", v5);
  else
    objc_msgSend(v6, "screenshotForIssue:elementRect:", v5, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "size");
    v26 = (double)(int)(v25 / *(double *)&v58);
    v28 = (double)(int)(v27 / *(double *)&v58);
    v60.width = v26;
    v60.height = v28;
    UIGraphicsBeginImageContext(v60);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v28);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v30 = (CGImage *)objc_msgSend(objc_retainAutorelease(v24), "CGImage");
    v61.origin.x = 0.0;
    v61.origin.y = 0.0;
    v61.size.width = v26;
    v61.size.height = v28;
    CGContextDrawImage(CurrentContext, v61, v30);
    UIGraphicsGetImageFromCurrentImageContext();
    v31 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    UIImageJPEGRepresentation(v31, 0.75);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      v55 = v32;
      v56 = v31;
      v57 = v22;
      objc_msgSend(CFSTR("data:image/jpeg;base64,"), "stringByAppendingString:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("_axKeyImageFull");
      if (v4)
        v35 = CFSTR("_axKeyImageThumbnail");
      v36 = v35;
      v37 = (void *)objc_opt_new();
      objc_msgSend(v37, "setObject:forKey:", v34, CFSTR("_axKeyImageData"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKey:", v38, CFSTR("_axKeyImageWidth"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKey:", v39, CFSTR("_axKeyImageHeight"));

      objc_msgSend(v7, "setObject:forKey:", v37, v36);
      if (v4)
      {
        v40 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
        *(_OWORD *)v59 = *MEMORY[0x24BDBF090];
        *(_OWORD *)&v59[16] = v40;
        objc_msgSend(v6, "screenshotForIssue:elementRect:", v5, v59);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v59 = *(double *)v59 / *(double *)&v58;
        *(float64x2_t *)&v59[8] = vdivq_f64(*(float64x2_t *)&v59[8], (float64x2_t)vdupq_lane_s64(v58, 0));
        *(double *)&v59[24] = *(double *)&v59[24] / *(double *)&v58;
        objc_msgSend(v41, "size");
        v43 = *(_OWORD *)v59;
        *(double *)&v59[8] = v42 / *(double *)&v58 - *(double *)&v59[24] - *(double *)&v59[8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v44, CFSTR("_axKeyElementRectInScreenshotX"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v59[8]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v45, CFSTR("_axKeyElementRectInScreenshotY"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v59[16]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v46, CFSTR("_axKeyElementRectInScreenshotWidth"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v59[24]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v47, CFSTR("_axKeyElementRectInScreenshotHeight"));

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v48, CFSTR("_axKeyDisplayBoundsXPx"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v49, CFSTR("_axKeyDisplayBoundsYPx"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v50, CFSTR("_axKeyDisplayBoundsWidthPx"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v51, CFSTR("_axKeyDisplayBoundsHeightPx"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v58);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v52, CFSTR("_axKeyScreenshotScale"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v53, CFSTR("_axKeyScreenshotRotation"));

      }
      v31 = v56;
      v22 = v57;
      v32 = v55;
    }

  }
  objc_autoreleasePoolPop(v22);

  return v7;
}

- (id)_jsonArrayForIssues:(id)a3 screenName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[AXAuditReportGenerator _jsonDictionaryForIssue:screenName:](self, "_jsonDictionaryForIssue:screenName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_jsonDictionaryForScreen:(id)a3 issuesOnScreen:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[AXAuditReportGenerator _jsonArrayForIssues:screenName:](self, "_jsonArrayForIssues:screenName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("_axKeyScreenName"));
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("_axKeyAllIssues"));
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("_axKeyScreenGroupName"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = v6;
    v20 = v10;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("_axKeyScreenGroupName"));
    objc_msgSend(v7, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditReportGenerator _jsonDictionaryForAuditIssueImage:thumbnailOnly:](self, "_jsonDictionaryForAuditIssueImage:thumbnailOnly:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v8, "setObject:forKey:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

  }
  return v8;
}

- (id)_jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_axKeyAllScreens"));

  -[AXAuditReportGenerator _auditScreenToIssuesMapping](self, "_auditScreenToIssuesMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __41__AXAuditReportGenerator__jsonDictionary__block_invoke;
    v14[3] = &unk_25071B260;
    v14[4] = self;
    v7 = v3;
    v15 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    v8 = v7;

  }
  else
  {
    -[AXAuditReportGenerator _issues](self, "_issues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditReportGenerator _jsonDictionaryForScreen:issuesOnScreen:](self, "_jsonDictionaryForScreen:issuesOnScreen:", CFSTR("Screen1"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_axKeyAllScreens"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);
    v12 = v3;

  }
  return v3;
}

void __41__AXAuditReportGenerator__jsonDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu"), a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_auditScreenToIssuesMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_jsonDictionaryForScreen:issuesOnScreen:", v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("_axKeyAllScreens"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

}

- (id)_jsonData
{
  void *v2;
  void *v3;

  -[AXAuditReportGenerator _jsonDictionary](self, "_jsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_jsonString
{
  void *v2;
  void *v3;

  -[AXAuditReportGenerator _jsonData](self, "_jsonData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);

  return v3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)_issues
{
  return self->__issues;
}

- (void)set_issues:(id)a3
{
  objc_storeStrong((id *)&self->__issues, a3);
}

- (NSMutableDictionary)_auditScreenToIssuesMapping
{
  return self->__auditScreenToIssuesMapping;
}

- (void)set_auditScreenToIssuesMapping:(id)a3
{
  objc_storeStrong((id *)&self->__auditScreenToIssuesMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__auditScreenToIssuesMapping, 0);
  objc_storeStrong((id *)&self->__issues, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
