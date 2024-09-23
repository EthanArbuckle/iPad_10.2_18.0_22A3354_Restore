@implementation ASTConnectionTestResultBinary

- (ASTConnectionTestResultBinary)initWithSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ASTConnectionTestResultBinary *v18;
  ASTConnectionTestResultBinary *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  objc_super v46;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v46.receiver = self;
  v46.super_class = (Class)ASTConnectionTestResultBinary;
  v18 = -[ASTMaterializedConnection init](&v46, sel_init);
  v19 = v18;
  if (v18)
  {
    v42 = v17;
    v43 = v16;
    objc_storeStrong((id *)&v18->_testId, a6);
    objc_storeStrong((id *)&v19->_sealableFile, a3);
    objc_storeStrong((id *)&v19->_dataId, a7);
    v40 = v13;
    objc_msgSend(v13, "fileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v20, &v45);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v45;
    +[ASTEncodingUtilities MD5ForFileHandle:](ASTEncodingUtilities, "MD5ForFileHandle:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "closeFile");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributesOfItemAtPath:error:", v24, 0);
    v25 = v15;
    v26 = v14;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "fileSize");

    -[ASTMaterializedConnection request](v19, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v26;
    v30 = v26;
    v15 = v25;
    v31 = (void *)v22;
    objc_msgSend(v29, "setValue:forHTTPHeaderField:", v30, CFSTR("AST-file-sequence"));

    -[ASTMaterializedConnection request](v19, "request");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forHTTPHeaderField:", v15, CFSTR("AST-total-files"));

    -[ASTMaterializedConnection request](v19, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setValue:forHTTPHeaderField:", v22, CFSTR("AST-file-MD5"));

    -[ASTMaterializedConnection request](v19, "request");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setValue:forHTTPHeaderField:", v35, CFSTR("AST-file-size"));

    if (!+[ASTConnectionUtilities useChunkedTransferEncoding](ASTConnectionUtilities, "useChunkedTransferEncoding"))
    {
      -[ASTMaterializedConnection request](v19, "request");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setValue:forHTTPHeaderField:", v37, CFSTR("Content-Length"));

    }
    v13 = v40;
    objc_msgSend(v40, "base64Signature");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTMaterializedConnection setSignature:](v19, "setSignature:", v38);

    v16 = v43;
    v14 = v44;
    v17 = v42;
  }

  return v19;
}

- (NSURL)fileSteamLocationURL
{
  void *v2;
  void *v3;

  -[ASTConnectionTestResultBinary sealableFile](self, "sealableFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)endpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASTConnectionTestResultBinary testId](self, "testId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTConnectionTestResultBinary dataId](self, "dataId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("results/%@/data/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentType
{
  return CFSTR("application/octet-stream");
}

- (NSNumber)testId
{
  return self->_testId;
}

- (ASTSealableFile)sealableFile
{
  return self->_sealableFile;
}

- (void)setSealableFile:(id)a3
{
  objc_storeStrong((id *)&self->_sealableFile, a3);
}

- (NSString)dataId
{
  return self->_dataId;
}

- (void)setDataId:(id)a3
{
  objc_storeStrong((id *)&self->_dataId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataId, 0);
  objc_storeStrong((id *)&self->_sealableFile, 0);
  objc_storeStrong((id *)&self->_fileSteamLocationURL, 0);
  objc_storeStrong((id *)&self->_testId, 0);
}

@end
