@implementation ASTTestResult

- (ASTTestResult)init
{
  void *v3;
  ASTTestResult *v4;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASTTestResult initWithTestId:parameters:](self, "initWithTestId:parameters:", v3, MEMORY[0x24BDBD1B8]);

  return v4;
}

- (ASTTestResult)initWithTestId:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  ASTTestResult *v9;
  ASTTestResult *v10;
  uint64_t v11;
  NSDictionary *predicates;
  NSNumber *statusCode;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASTTestResult;
  v9 = -[ASTTestResult init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testId, a3);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("predicates"));
    v11 = objc_claimAutoreleasedReturnValue();
    predicates = v10->_predicates;
    v10->_predicates = (NSDictionary *)v11;

    v10->_testDuration = 0.0;
    statusCode = v10->_statusCode;
    v10->_statusCode = (NSNumber *)&unk_24F976070;

  }
  return v10;
}

+ (id)resultWithTestId:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTestId:parameters:", v7, v6);

  return v8;
}

- (id)generatePayload
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[7];
  _QWORD v41[9];

  v41[7] = *MEMORY[0x24BDAC8D0];
  -[ASTTestResult testId](self, "testId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[ASTTestResult testId](self, "testId");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = objc_claimAutoreleasedReturnValue();

  -[ASTTestResult statusCode](self, "statusCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[ASTTestResult statusCode](self, "statusCode");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = objc_claimAutoreleasedReturnValue();

  v40[0] = CFSTR("_id");
  v38 = CFSTR("sd");
  v36 = CFSTR("$date");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:", v8 * 1000.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v28;
  v40[1] = CFSTR("d");
  -[ASTTestResult predicates](self, "predicates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ASTTestResult predicates](self, "predicates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1B8];
  }
  v41[1] = v10;
  v41[2] = v4;
  v33 = (void *)v4;
  v40[2] = CFSTR("k");
  v40[3] = CFSTR("e");
  v11 = (void *)MEMORY[0x24BDD16E0];
  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "environmentType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v13;
  v40[4] = CFSTR("t");
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[ASTTestResult testDuration](self, "testDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v15;
  v41[5] = v6;
  v32 = (void *)v6;
  v40[5] = CFSTR("s");
  v40[6] = CFSTR("data");
  -[ASTTestResult data](self, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ASTTestResult data](self, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDBD1B8];
  }
  v41[6] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v16)
  if (v9)

  -[ASTTestResult uploadFiles](self, "uploadFiles");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[ASTTestResult uploadFiles](self, "uploadFiles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEmpty");

    if ((v23 & 1) == 0)
    {
      -[ASTTestResult uploadFiles](self, "uploadFiles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "generatePayload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v25, CFSTR("f"));

    }
  }
  v34[0] = CFSTR("results");
  v34[1] = CFSTR("test");
  v35[0] = v19;
  v35[1] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ASTTestResult files](self, "files", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((v11 & 1) != 0)
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sealWithFileSigner:error:", v6, a4);
        else
          v11 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  -[ASTSealablePayload setSealed:](self, "setSealed:", 1);
  return v11;
}

- (void)sealWithPayload:(id)a3 signature:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[ASTSealablePayload setPayload:](self, "setPayload:", a3);
  -[ASTSealablePayload setSignature:](self, "setSignature:", v6);

  -[ASTSealablePayload signature](self, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASTSealablePayload signature](self, "signature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTSealablePayload setBase64Signature:](self, "setBase64Signature:", v9);

  }
  -[ASTSealablePayload setSealed:](self, "setSealed:", 1);
}

- (void)sealWithSealableFiles:(id)a3
{
  -[ASTTestResult setFiles:](self, "setFiles:", a3);
  -[ASTTestResult sealWithFileSigner:error:](self, "sealWithFileSigner:error:", 0, 0);
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (NSArray)files
{
  return self->_files;
}

- (void)setUploadFiles:(id)a3
{
  objc_storeStrong((id *)&self->_uploadFiles, a3);
}

- (ASTUploadFilesResult)uploadFiles
{
  return self->_uploadFiles;
}

- (void)setTestDuration:(double)a3
{
  self->_testDuration = a3;
}

- (double)testDuration
{
  return self->_testDuration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTTestResult)initWithCoder:(id)a3
{
  id v4;
  ASTTestResult *v5;
  uint64_t v6;
  NSNumber *testId;
  uint64_t v8;
  NSNumber *statusCode;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *data;
  uint64_t v15;
  NSArray *files;
  uint64_t v17;
  ASTUploadFilesResult *uploadFiles;
  double v19;
  uint64_t v20;
  NSNumber *allowCellularSizeThreshold;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASTTestResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testId"));
    v6 = objc_claimAutoreleasedReturnValue();
    testId = v5->_testId;
    v5->_testId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("data"));
    v13 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("files"));
    v15 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadFiles"));
    v17 = objc_claimAutoreleasedReturnValue();
    uploadFiles = v5->_uploadFiles;
    v5->_uploadFiles = (ASTUploadFilesResult *)v17;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("testDuration"));
    v5->_testDuration = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowCellularSizeThreshold"));
    v20 = objc_claimAutoreleasedReturnValue();
    allowCellularSizeThreshold = v5->_allowCellularSizeThreshold;
    v5->_allowCellularSizeThreshold = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ASTTestResult testId](self, "testId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("testId"));

  -[ASTTestResult statusCode](self, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("statusCode"));

  -[ASTTestResult data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("data"));

  -[ASTTestResult files](self, "files");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("files"));

  -[ASTTestResult uploadFiles](self, "uploadFiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("uploadFiles"));

  -[ASTTestResult testDuration](self, "testDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("testDuration"));
  -[ASTTestResult allowCellularSizeThreshold](self, "allowCellularSizeThreshold");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("allowCellularSizeThreshold"));

}

- (void)setUploadStatusFromSource:(id)a3 withArray:(id)a4
{
  ASTUploadFilesResult *v5;
  ASTUploadFilesResult *uploadFiles;
  NSObject *v7;

  if (a4)
  {
    +[ASTUploadFilesResult resultFromSource:andUploadDictionaries:](ASTUploadFilesResult, "resultFromSource:andUploadDictionaries:", a3);
    v5 = (ASTUploadFilesResult *)objc_claimAutoreleasedReturnValue();
    uploadFiles = self->_uploadFiles;
    self->_uploadFiles = v5;

  }
  else
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ASTTestResult setUploadStatusFromSource:withArray:].cold.1(v7);

  }
}

- (NSNumber)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_allowCellularSizeThreshold, a3);
}

- (NSNumber)testId
{
  return self->_testId;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_testId, 0);
  objc_storeStrong((id *)&self->_allowCellularSizeThreshold, 0);
  objc_storeStrong((id *)&self->_uploadFiles, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
}

- (void)setUploadStatusFromSource:(os_log_t)log withArray:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D91B000, log, OS_LOG_TYPE_ERROR, "Invalid format for upload files array.", v1, 2u);
}

@end
