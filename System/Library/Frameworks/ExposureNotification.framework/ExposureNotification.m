uint64_t ENCloneFileToTemporaryDirectory(int a1, uint64_t a2, _QWORD *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void (**v15)(_QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  int v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  int v32;

  v6 = objc_alloc(MEMORY[0x24BDBCF48]);
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initFileURLWithPath:isDirectory:", v7, 1);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, a3);

  if (!v10)
    goto LABEL_30;
  v11 = objc_retainAutorelease(v8);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if ((v12 & 0x80000000) == 0 || *__error() && !*__error())
  {
    v13 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __ENCloneFileToTemporaryDirectory_block_invoke;
    v31[3] = &__block_descriptor_36_e5_v8__0l;
    v32 = v12;
    v14 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v31);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = -1;
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __ENCloneFileToTemporaryDirectory_block_invoke_2;
    v26[3] = &unk_24C38ACD0;
    v26[4] = &v27;
    v15 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v26);
    if (a2)
    {
      v16 = sandbox_extension_consume();
      v28[3] = v16;
      if (v16 == -1 && (!*__error() || *__error()))
      {
        if (a3)
        {
          ENErrorF(2);
          v23 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        goto LABEL_26;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    objc_msgSend(v11, "URLByAppendingPathComponent:", v19);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
    if (fclonefileat(a1, v12, v20, 0) && (!*__error() || *__error()))
    {
      if (a3)
        goto LABEL_23;
    }
    else
    {
      v23 = open(v22, 0);
      if ((v23 & 0x80000000) == 0)
      {
        unlink(v22);
LABEL_25:

LABEL_26:
        v15[2](v15);

        _Block_object_dispose(&v27, 8);
        v14[2](v14);

        goto LABEL_27;
      }
      if (*__error())
      {
        v24 = *__error();
        unlink(v22);
        if (!v24)
          goto LABEL_25;
      }
      else
      {
        unlink(v22);
      }
      if (a3)
      {
LABEL_23:
        ENErrorF(2);
        v23 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    v23 = 0;
    goto LABEL_25;
  }
  if (!a3)
  {
LABEL_30:
    v23 = 0;
    goto LABEL_27;
  }
  ENErrorF(2);
  v23 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v23;
}

void sub_20AC4B8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  _Unwind_Resume(a1);
}

id ENErrorF(uint64_t a1)
{
  const char *v2;
  __CFString *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const char *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 - 1) > 0xF)
    v2 = "?";
  else
    v2 = off_24C38AD30[a1 - 1];
  NSPrintV();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  NSPrintF();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD1540]);
  v11[0] = CFSTR("cuErrorDesc");
  v11[1] = CFSTR("cuErrorMsg");
  if (v3)
    v6 = v3;
  else
    v6 = &stru_24C38BCC8;
  v12[0] = v4;
  v12[1] = v6;
  v11[2] = *MEMORY[0x24BDD0BA0];
  v12[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3, v10, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), a1, v7);

  return v8;
}

uint64_t ENCompareDiagnosisReportTypes(int a1, int a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  uint64_t v5;

  if ((a1 - 1) > 4)
    v2 = 0;
  else
    v2 = dword_20AC7C2BC[a1 - 1];
  if ((a2 - 1) > 4)
    v3 = 0;
  else
    v3 = dword_20AC7C2BC[a2 - 1];
  v4 = v2 > v3;
  if (v2 >= v3)
    v5 = 0;
  else
    v5 = -1;
  if (v4)
    return 1;
  else
    return v5;
}

SecKeyRef ENCopyPublicKeyFromBase64String(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFData *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  SecKeyRef v11;
  CFErrorRef v12;
  BOOL v13;
  uint64_t v15;
  CFErrorRef v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      v15 = 2;
LABEL_14:
      ENErrorF(v15);
      v11 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x41)
  {
    if (a2)
    {
      v15 = 15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 1);
  objc_msgSend(v5, "subdataWithRange:", objc_msgSend(v5, "length") - 65, 65);
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = *MEMORY[0x24BDE9058];
  v8 = *MEMORY[0x24BDE9028];
  v17[0] = *MEMORY[0x24BDE9050];
  v17[1] = v8;
  v9 = *MEMORY[0x24BDE9038];
  v18[0] = v7;
  v18[1] = v9;
  v17[2] = *MEMORY[0x24BDE9048];
  v18[2] = &unk_24C396CC8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = SecKeyCreateWithData(v6, v10, &v16);
  v12 = v16;
  if (v11)
    v13 = 1;
  else
    v13 = a2 == 0;
  if (!v13)
  {
    ENNestedErrorF(v16, 15);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v11;
}

id ENNestedErrorF(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if ((unint64_t)(a2 - 1) > 0xF)
    v4 = "?";
  else
    v4 = off_24C38AD30[a2 - 1];
  NSPrintV();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  NSPrintF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD1540]);
  v16[0] = CFSTR("cuErrorDesc");
  v16[1] = CFSTR("cuErrorMsg");
  v8 = &stru_24C38BCC8;
  if (v5)
    v8 = v5;
  v17[0] = v6;
  v17[1] = v8;
  v9 = *MEMORY[0x24BDD0BA0];
  v17[2] = v6;
  v10 = *MEMORY[0x24BDD1398];
  v16[2] = v9;
  v16[3] = v10;
  v11 = v3;
  if (!v3)
  {
    NSErrorF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4, v15, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), a2, v12);

  if (!v3)
  return v13;
}

id ENDataVaultPath()
{
  void *v0;
  void *v1;

  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/ExposureNotification"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ENDataVaultURL()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDBCF48];
  ENDataVaultPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t ENDaemonBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ExposureNotificationDaemon"));
}

id ENDefaultExpirationDate(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "dateByAddingTimeInterval:", 1209600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const char *ENErrorMetricTypeToString(int a1)
{
  const char *result;
  const char *v2;
  const char *v3;

  if (a1 > 3999)
  {
    switch(a1)
    {
      case 5000:
        result = "APIErrorUnsupported";
        break;
      case 5001:
        result = "APIErrorInsufficientStorage";
        break;
      case 5002:
        result = "APIErrorAPIMisuse";
        break;
      case 5003:
        result = "APIErrorInternal";
        break;
      case 5004:
        result = "APIErrorInsufficientMemory";
        break;
      case 5005:
        result = "APIErrorBadFormat";
        break;
      case 5006:
        result = "APIErrorDataInaccessible";
        break;
      default:
        switch(a1)
        {
          case 6000:
            result = "ConfigurationManagerUnknownNetworkError";
            break;
          case 6001:
            result = "ConfigurationManagerSigValidationFailure";
            break;
          case 6002:
            result = "ConfigurationManagerBadResponseFormat";
            break;
          case 6003:
            result = "ConfigurationManagerStoreFailure";
            break;
          case 6004:
            result = "ConfigurationManagerInvalidResponse";
            break;
          default:
            switch(a1)
            {
              case 4000:
                result = "ExposureDatabaseCorruption";
                break;
              case 4001:
                result = "ExposureDatabaseUnknownError";
                break;
              case 4002:
                result = "ExposureDatabaseDiskFull";
                break;
              case 4003:
                result = "ExposureDatabaseMigrationFailure";
                break;
              default:
LABEL_45:
                if ((a1 - 10000) >= 0x3E8)
                  v2 = "?";
                else
                  v2 = "ConfigurationManagerHTTPErrorStatus";
                if ((a1 - 9000) >= 0x3E8)
                  v3 = v2;
                else
                  v3 = "DownloadManagerKeyFileHTTPErrorStatus";
                if ((a1 - 8000) >= 0x3E8)
                  result = v3;
                else
                  result = "DownloadManagerIndexFileHTTPErrorStatus";
                break;
            }
            break;
        }
        break;
    }
  }
  else if (a1 <= 1999)
  {
    switch(a1)
    {
      case 1000:
        result = "AdvertisementDatabaseCorruption";
        break;
      case 1001:
        result = "AdvertisementDatabaseUnknownError";
        break;
      case 1002:
        result = "AdvertisementDatabaseDiskFull";
        break;
      case 1003:
        result = "AdvertisementDatabaseFailedToOpenAllStores";
        break;
      case 1004:
        result = "AdvertisementDatabaseUnauthorized";
        break;
      case 1005:
        result = "AdvertisementDatabaseTempStoreLimit";
        break;
      case 1006:
        result = "AdvertisementDatabaseAEMDecryptionFailure";
        break;
      default:
        if (a1)
          goto LABEL_45;
        result = "Unknown";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 2000:
        result = "DownloadManagerIndexFileNoResponse";
        break;
      case 2001:
        result = "DownloadManagerIndexFileBadFormat";
        break;
      case 2002:
        result = "DownloadManagerKeyFileNoResponse";
        break;
      case 2003:
        result = "DownloadManagerKeyFileBadFormat";
        break;
      case 2004:
        result = "DownloadManagerStateFileCorrupt";
        break;
      default:
        switch(a1)
        {
          case 3000:
            result = "ExposureDetectionManagerBadArchive";
            break;
          case 3001:
            result = "ExposureDetectionManagerUnableToOpenSigFile";
            break;
          case 3002:
            result = "ExposureDetectionManagerUnableToOpenKeyFile";
            break;
          case 3003:
            result = "ExposureDetectionManagerSigValidationFailure";
            break;
          case 3004:
            result = "ExposureDetectionManagerKeyFileProcessingFailure";
            break;
          default:
            goto LABEL_45;
        }
        break;
    }
  }
  return result;
}

id ENFrameworkBundle()
{
  if (ENFrameworkBundle_sOnce != -1)
    dispatch_once(&ENFrameworkBundle_sOnce, &__block_literal_global);
  return (id)ENFrameworkBundle_sBundle;
}

id ENLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v1 = a1;
  ENFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v12 = v1;
    goto LABEL_11;
  }
  objc_msgSend(v2, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
    goto LABEL_9;
  if (!v5)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_9;
  objc_msgSend(v3, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), CFSTR("."), v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

LABEL_9:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v1, &stru_24C38BCC8, CFSTR("Localizable"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v9);
  objc_msgSend(v11, "objectForKeyedSubscript:", v1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
LABEL_10:

LABEL_11:
  return v12;
}

BOOL ENValidateRegionCodeISO(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v1 = a1;
  if (!v1)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v2 = (void *)MEMORY[0x20BD2F320]();
  v3 = v1;
  if (objc_msgSend(v3, "containsString:", CFSTR("-")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") != 2)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/Carrier Bundles/iPhone/Default.bundle/ISO2MCC.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

LABEL_6:
  objc_autoreleasePoolPop(v2);
LABEL_7:

  return v9;
}

void ENWriteTemporaryExposureKeysCSV(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  FPrintF();
  FPrintF();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "keyData", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "rollingStartNumber");
        v10 = objc_msgSend(v7, "transmissionRiskLevel");
        v15 = objc_msgSend(v7, "rollingPeriod");
        FPrintF();

        if (objc_msgSend(v7, "daysSinceOnsetOfSymptoms", v8, v9, v10, v15) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v7, "daysSinceOnsetOfSymptoms");
          FPrintF();
        }
        v13 = objc_msgSend(v7, "diagnosisReportType", v12);
        FPrintF();
        v14 = objc_msgSend(v7, "vaccinated", v13);
        FPrintF();
        v11 = objc_msgSend(v7, "variantOfConcernType", v14);
        FPrintF();
        FPrintF();
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v11);
    }
    while (v4);
  }

  objc_msgSend(obj, "count");
  FPrintF();

}

id ENXPCDecodeSecureObject(void *a1, const char *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  const void *data;
  const void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  size_t length;

  v7 = a1;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v7, a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      if (MEMORY[0x20BD2F7B8](v8) != MEMORY[0x24BDACF90])
      {
        if (a4)
        {
          v17 = 2;
LABEL_22:
          ENErrorF(v17);
          v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        goto LABEL_23;
      }
      length = 0;
      data = xpc_dictionary_get_data(v7, a2, &length);
      if (data)
      {
        if (length)
        {
          v11 = data;
          v12 = objc_alloc(MEMORY[0x24BDBCE50]);
          v13 = (void *)objc_msgSend(v12, "initWithBytesNoCopy:length:freeWhenDone:", v11, length, 0);
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, v13, a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
LABEL_9:

LABEL_10:
              goto LABEL_11;
            }
            if (a4)
            {
              ENErrorF(15);
              v15 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_9;
            }
          }
          v15 = 0;
          goto LABEL_9;
        }
        if (a4)
          goto LABEL_21;
LABEL_23:
        v15 = 0;
        goto LABEL_10;
      }
      if (!a4)
        goto LABEL_23;
    }
    else if (!a4)
    {
      goto LABEL_23;
    }
LABEL_21:
    v17 = 15;
    goto LABEL_22;
  }
  if (a4)
  {
    ENErrorF(2);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_11:

  return v15;
}

id ENXPCDecodeSecureObjectIfPresent(void *a1, const char *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a1;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      ENXPCDecodeSecureObject(v7, a2, a3, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else if (a4)
  {
    ENErrorF(2);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL ENXPCEncodeSecureObject(void *a1, const char *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v7 = a1;
  v8 = a3;
  if (MEMORY[0x20BD2F7B8](v7) != MEMORY[0x24BDACFA0])
  {
    if (a4)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (!v8)
  {
    if (a4)
    {
LABEL_10:
      ENErrorF(2);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9 != 0;
  if (v9)
  {
    v12 = objc_retainAutorelease(v9);
    xpc_dictionary_set_data(v7, a2, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  }

LABEL_6:
  return v11;
}

uint64_t ENXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (ENXPCGetNextClientID_sOnce != -1)
    dispatch_once(&ENXPCGetNextClientID_sOnce, &__block_literal_global_117);
  do
  {
    v0 = __ldaxr((unsigned int *)&ENXPCGetNextClientID_sNext);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&ENXPCGetNextClientID_sNext));
  return result;
}

_BYTE *ENAEMCrypt()
{
  _BYTE *result;
  _BYTE *v1;
  unsigned __int8 *v2;

  ccaes_ctr_crypt_mode();
  result = (_BYTE *)ccctr_one_shot();
  if ((_DWORD)result)
  {
    v1 = (_BYTE *)FatalErrorF();
    return ENRPIMetadataDeserialize(v1, v2);
  }
  return result;
}

_BYTE *ENRPIMetadataDeserialize(_BYTE *result, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;
  char v4;
  int v5;
  BOOL v6;
  char v7;

  v2 = *a2;
  v3 = a2[1];
  if (v3 >= 4)
    v4 = 1;
  else
    v4 = 2;
  v5 = (v2 >> 4) & 3;
  if (v5)
    v6 = v2 > 0x3F;
  else
    v6 = 0;
  *result = *a2 >> 6;
  result[1] = v5;
  if (v6)
    v7 = (v2 >> 2) & 3;
  else
    v7 = v4;
  result[2] = v3;
  result[3] = v7;
  return result;
}

_BYTE *ENRPIMetadataSerialize(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)a2 = (*result << 6) | (16 * (result[1] & 3)) | (4 * (result[3] & 3));
  *(_BYTE *)(a2 + 1) = result[2];
  *(_WORD *)(a2 + 2) = 0;
  return result;
}

uint64_t ENAEMKDerive()
{
  uint64_t result;
  uint64_t v1;

  ccsha256_di();
  result = cchkdf();
  if ((_DWORD)result)
  {
    v1 = FatalErrorF();
    return ENRPIDerive(v1);
  }
  return result;
}

uint64_t ENRPIDerive()
{
  uint64_t result;

  ccaes_ecb_encrypt_mode();
  result = ccecb_one_shot();
  if ((_DWORD)result)
    FatalErrorF();
  return result;
}

uint64_t ENRPIDeriveBatch(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD *v7;
  size_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v7 = &v12[-2 * v6];
  bzero(v7, v8);
  if (a4)
  {
    v9 = a4;
    v10 = v7;
    do
    {
      *((_WORD *)v10 + 2) = 18768;
      *(_DWORD *)v10 = 1378700869;
      *(_DWORD *)((char *)v10 + 6) = 0;
      *((_WORD *)v10 + 5) = 0;
      *((_DWORD *)v10 + 3) = a3;
      v10 += 2;
      ++a3;
      --v9;
    }
    while (v9);
  }
  ccaes_ecb_encrypt_mode();
  result = ccecb_one_shot();
  if ((_DWORD)result)
    FatalErrorF();
  return result;
}

uint64_t ENRPIKDerive()
{
  uint64_t result;
  uint64_t v1;

  ccsha256_di();
  result = cchkdf();
  if ((_DWORD)result)
  {
    v1 = FatalErrorF();
    return ENTEKGenerate(v1);
  }
  return result;
}

ENExposureDetectionHistoryCheck *ENTEKGenerate(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  ENExposureDetectionHistoryCheck *result;
  ENExposureDetectionHistoryCheck *v5;
  SEL v6;

  v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))ccrng();
  v3 = ccrng();
  result = (ENExposureDetectionHistoryCheck *)v2(v3, 16, a1);
  if ((_DWORD)result)
  {
    v5 = (ENExposureDetectionHistoryCheck *)FatalErrorF();
    return -[ENExposureDetectionHistoryCheck init](v5, v6);
  }
  return result;
}

void sub_20AC5153C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20AC523C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC53CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC54F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void LogInvalidValueForKey(void *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (gLogCategory__ENRegionServerConfiguration <= 10
      && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENRegionServerConfiguration <= 10
         && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

BOOL UInt64NumIsInRange(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  objc_opt_class();
  v2 = (objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v1, "unsignedLongLongValue") < 0x10000;

  return v2;
}

void sub_20AC5CA3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20AC5DD70(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_20AC5DF2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_20AC5E364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20AC5F294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC5F820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  (*(void (**)(void))(a9 + 16))();
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20AC5FC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC5FFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC61288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_20AC623F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20AC648C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC64E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20AC66280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC6790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC68178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  (*(void (**)(uint64_t))(v14 + 16))(v14);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  (*(void (**)(void))(a13 + 16))();
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20AC68C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC69148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC6F414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AC724D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_20AC7281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class ENUICreateRemotePresentationController()
{
  Class v0;
  objc_class *v1;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HealthExposureNotificationUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C38BA68;
    v5 = 0;
    HealthExposureNotificationUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthExposureNotificationUILibraryCore_frameworkLibrary)
    ENUICreateRemotePresentationController_cold_1(&v3);
  v0 = NSClassFromString(CFSTR("ENUIPresentationController"));
  if (v0)
  {
    v1 = v0;
    if (-[objc_class conformsToProtocol:](v0, "conformsToProtocol:", &unk_254620D60))
      v0 = (Class)objc_alloc_init(v1);
    else
      v0 = 0;
  }
  return v0;
}

void sub_20AC7427C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_20AC74740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_20AC74B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ENUIHostViewControllerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254620DC0);
}

id ENUIRemoteViewControllerInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254620E20);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_setPresentationRequest_, 0, 0);

  return v0;
}

void sub_20AC770F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void _responseCallback(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  pthread_mutex_lock(&gENUserAlertMutex);
  v4 = (void *)gENUserAlertMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(&gENUserAlertMutex);
  objc_msgSend(v6, "_responseCallback:responseFlags:", a1, a2);

}

void ENUICreateRemotePresentationController_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthExposureNotificationUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ENRemotePresentationController.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
  CFArrayGetTypeID();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x24BE28F90]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x24BE29098]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x24BE29190]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x24BE29198]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x24BE291B0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x24BE29200]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x24BE29210]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x24BE29218]();
}

uint64_t CUXPCDecodeNSArrayOfInteger()
{
  return MEMORY[0x24BE29228]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x24BE29238]();
}

uint64_t CUXPCDecodeNSDataOfLength()
{
  return MEMORY[0x24BE29240]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x24BE29250]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x24BE29258]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x24BE29260]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x24BE29270]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x24BE29278]();
}

uint64_t CUXPCEncodeNSArrayOfNSNumber()
{
  return MEMORY[0x24BE29280]();
}

uint64_t CUXPCGetNextClientID()
{
  return MEMORY[0x24BE292A8]();
}

uint64_t FPrintF()
{
  return MEMORY[0x24BE29370]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x24BE295F8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x24BE29650]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x24BE29658]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return MEMORY[0x24BE29678]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x24BE29680]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

uint64_t NSPrintV()
{
  return MEMORY[0x24BE296D8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x24BEB3798]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x24BEB37E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x24BEDA318]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x24BEDA360]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_free()
{
  return MEMORY[0x24BEDA438]();
}

uint64_t archive_read_data()
{
  return MEMORY[0x24BEDA458]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_FILE()
{
  return MEMORY[0x24BEDA4E8]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x24BEDA550]();
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x24BDAD268](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x24BDAD368]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x24BDAD370]();
}

uint64_t ccctr_one_shot()
{
  return MEMORY[0x24BDAD3D0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x24BDAD620]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x24BDAE2D8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fgetpos(FILE *a1, fpos_t *a2)
{
  return MEMORY[0x24BDAE378](a1, a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

int fsetpos(FILE *a1, const fpos_t *a2)
{
  return MEMORY[0x24BDAE4F0](a1, a2);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x24BDB0828]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

uint64_t xpc_dictionary_set_cf_object()
{
  return MEMORY[0x24BE29C30]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x24BDB0A40](*(_QWORD *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

