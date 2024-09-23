@implementation HDAnalyticsWriter

- (HDAnalyticsWriter)initWithURL:(id)a3
{
  id v4;
  HDAnalyticsWriter *v5;
  void *v6;
  uint64_t v7;
  NSString *analyticsDirectory;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDAnalyticsWriter;
  v5 = -[HDAnalyticsWriter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    analyticsDirectory = v5->_analyticsDirectory;
    v5->_analyticsDirectory = (NSString *)v7;

  }
  return v5;
}

- (HDAnalyticsWriter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (BOOL)submitJSONAnalyticsData:(id)a3 bugType:(id)a4 error:(id *)a5
{
  return -[HDAnalyticsWriter _submitJSONAnalyticsData:bugType:customDirectory:configuration:error:]((uint64_t)self, a3, a4, 0, 0, a5);
}

- (uint64_t)_submitJSONAnalyticsData:(void *)a3 bugType:(void *)a4 customDirectory:(void *)a5 configuration:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  unsigned __int8 v40;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a1)
  {
    if (v13
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v13, 0),
          v15,
          (v16 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Client should ensure submission directory is created before using analytics writer"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v29);
        else
          _HKLogDroppedError();
      }

    }
    else if (-[HDAnalyticsWriter _createAndCleanAnalyticsDirectoryWithError:](a1, a6))
    {
      -[HDAnalyticsWriter _serializeAnalyticsData:errorOut:](a1, v11, (uint64_t)a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (v14)
          goto LABEL_10;
        if (*(_QWORD *)(a1 + 8) || (-[HDAnalyticsWriter _loadCertificateWithError:](a1, (uint64_t)a6) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C58]), "initWithChannel:payloadType:certificate:", CFSTR("DataAnalytics"), CFSTR("JSON"), *(_QWORD *)(a1 + 8));
          objc_msgSend(v14, "setStartDate:", v18);
          objc_msgSend(v14, "setEndDate:", v18);
          objc_msgSend(v14, "setPayloadIdentifier:", CFSTR("FOO-Payload"));

LABEL_10:
          -[HDAnalyticsWriter _encryptAnalyticsData:withConfig:error:](a1, v17, v14, (uint64_t)a6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            v40 = 0;
LABEL_36:

            goto LABEL_37;
          }
          objc_msgSend(v19, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v20;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v20);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 0x24BDBC000uLL;
          v37 = (void *)v22;
          if (v13)
          {
            v24 = (void *)v22;
            v25 = (void *)MEMORY[0x24BDBCF48];
            v35 = v21;
            objc_msgSend(v13, "stringByAppendingPathComponent:", v21);
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "fileURLWithPath:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v39 = 0;
            LOBYTE(v26) = objc_msgSend(v24, "writeToURL:options:error:", v27, 805306369, &v39);
            v28 = v39;
            if ((v26 & 1) != 0)
            {
              v21 = v35;
              v20 = v36;
LABEL_14:

              v23 = 0x24BDBC000;
LABEL_24:
              objc_msgSend(*(id *)(v23 + 3912), "fileURLWithPath:", *(_QWORD *)(a1 + 16));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "URLByAppendingPathComponent:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v40 = objc_msgSend(v17, "writeToURL:options:error:", v27, 805306369, a6);
LABEL_35:

              goto LABEL_36;
            }
            v34 = v28;
            objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:underlyingError:", 100, CFSTR("Unable to write serialized unencrypted analytics data."), v28);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v35;
            v20 = v36;
            if (v31)
            {
              if (a6)
                *a6 = objc_retainAutorelease(v31);
              else
                _HKLogDroppedError();
            }

            v40 = 0;
            v32 = v34;
          }
          else
          {
            if (!v12 || (HDIsUnitTesting() & 1) != 0)
              goto LABEL_24;
            objc_msgSend(v21, "stringByAppendingString:", CFSTR("X-"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v20;
            if ((HKSubmitAnalyticsFile() & 1) != 0)
            {
              v28 = v38;
              goto LABEL_14;
            }
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a6, 100, CFSTR("Analytics submission failed for an unknown reason."));
            v40 = 0;
            v32 = v38;
          }

          goto LABEL_35;
        }
        v14 = 0;
      }
      v40 = 0;
LABEL_37:

      goto LABEL_38;
    }
  }
  v40 = 0;
LABEL_38:

  return v40;
}

- (BOOL)submitJSONAnalyticsData:(id)a3 toDirectory:(id)a4 withConfiguration:(id)a5 error:(id *)a6
{
  return -[HDAnalyticsWriter _submitJSONAnalyticsData:bugType:customDirectory:configuration:error:]((uint64_t)self, a3, 0, a4, a5, a6);
}

- (id)URLForAnalyticsFileWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("X-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_analyticsDirectory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)analyticsFilePathsWithError:(id *)a3
{
  id v5;
  NSString *analyticsDirectory;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[5];
  id v14;

  if (!-[HDAnalyticsWriter _cleanAnalyticsDirectory:error:]((uint64_t)self, self->_analyticsDirectory))
    return 0;
  v5 = objc_alloc_init(MEMORY[0x24BDD1580]);
  analyticsDirectory = self->_analyticsDirectory;
  v14 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", analyticsDirectory, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
    goto LABEL_3;
  if (objc_msgSend(v8, "code") != 260)
  {
    v12 = v9;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "code") != 260)
  {
LABEL_3:
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__HDAnalyticsWriter_analyticsFilePathsWithError___block_invoke;
    v13[3] = &unk_24CB18868;
    v13[4] = self;
    objc_msgSend(v7, "hk_map:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
LABEL_13:

  return v10;
}

- (BOOL)_cleanAnalyticsDirectory:(uint64_t)a1 error:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  _BOOL4 v19;
  char v20;
  id v21;
  NSObject *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v24 = a1;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeratorAtPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      v9 = *MEMORY[0x24BDD0C58];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
          objc_msgSend(v5, "fileAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v3;
          objc_msgSend(v3, "stringByAppendingPathComponent:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSinceDate:", v13);
          v17 = v16;
          _HKInitializeLogging();
          v18 = *MEMORY[0x24BDD2FF8];
          v19 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG);
          if (v17 >= 1209600.0)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543362;
              v33 = v15;
              _os_log_debug_impl(&dword_210F9A000, v18, OS_LOG_TYPE_DEBUG, "Removing analytics file '%{public}@'", buf, 0xCu);
            }
            v27 = 0;
            v20 = objc_msgSend(v25, "removeItemAtPath:error:", v15, &v27);
            v21 = v27;
            if ((v20 & 1) == 0)
            {
              _HKInitializeLogging();
              v22 = *MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v33 = v15;
                v34 = 2114;
                v35 = v21;
                _os_log_error_impl(&dword_210F9A000, v22, OS_LOG_TYPE_ERROR, "Error removing analytics file at '%{public}@': %{public}@", buf, 0x16u);
              }
            }

          }
          else if (v19)
          {
            *(_DWORD *)buf = 138543618;
            v33 = v15;
            v34 = 2114;
            v35 = v13;
            _os_log_debug_impl(&dword_210F9A000, v18, OS_LOG_TYPE_DEBUG, "Do not remove analytics file '%{public}@' with modification date %{public}@", buf, 0x16u);
          }

          ++v10;
          v3 = v14;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v7);
    }

  }
  return v24 != 0;
}

id __49__HDAnalyticsWriter_analyticsFilePathsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("HealthWrap"));

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stringByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_createAndCleanAnalyticsDirectoryWithError:(uint64_t)a1
{
  return a1
      && -[HDAnalyticsWriter _createAnalyticsDirectory:error:](a1, *(void **)(a1 + 16), a2)
      && -[HDAnalyticsWriter _cleanAnalyticsDirectory:error:](a1, *(void **)(a1 + 16));
}

- (id)_serializeAnalyticsData:(uint64_t)a3 errorOut:
{
  id v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v4 = a2;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CB24840, CFSTR("schemaVersion"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("data"));

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)_loadCertificateWithError:(uint64_t)a1
{
  const __CFData *v4;
  SecCertificateRef v5;
  uint64_t v6;
  const __CFString *v7;

  if (!a1)
    return 0;
  HKHealthWrapDERDataFromString();
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v7 = CFSTR("Failed to decode base64 certificate data.");
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a2, 100, v7);
    v6 = 0;
    goto LABEL_8;
  }
  v5 = SecCertificateCreateWithData(0, v4);
  *(_QWORD *)(a1 + 8) = v5;
  if (!v5)
  {
    v7 = CFSTR("Failed to create certificate.");
    goto LABEL_7;
  }
  v6 = 1;
LABEL_8:

  return v6;
}

- (id)_encryptAnalyticsData:(void *)a3 withConfig:(uint64_t)a4 error:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  if (a1)
  {
    v8 = (void *)MEMORY[0x24BDD3C50];
    v9 = a3;
    v10 = (void *)objc_msgSend(v8, "newOutputFileURL");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C50]), "initWithConfiguration:", v9);

    if (objc_msgSend(v11, "startWithOutputFileURL:error:", v10, a4)
      && objc_msgSend(v11, "appendData:error:", v7, a4))
    {
      objc_msgSend(v11, "finalizeWithError:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __90__HDAnalyticsWriter__submitJSONAnalyticsData_bugType_customDirectory_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE50];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v5);

}

- (uint64_t)_createAnalyticsDirectory:(_QWORD *)a3 error:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v12;

  v5 = a2;
  if (a1)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
    if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, 0) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v12 = 0;
      v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v12);
      v8 = v12;
      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating analytics directory %@"), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:underlyingError:", 100, v9, v8);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v10);
          else
            _HKLogDroppedError();
        }

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsDirectory, 0);
}

@end
