@implementation WFAppendUtilities

+ (id)fileByAppendingText:(id)a3 toFile:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a5;
  v7 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 4) != 0)
  {
    v11 = (void *)MEMORY[0x24BE19628];
    objc_msgSend(v7, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createTemporaryFileWithFilename:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v5 & 4) != 0)
  {
    objc_msgSend(v14, "writeData:", v8);
    if ((v5 & 8) != 0)
      objc_msgSend(v15, "writeData:", v9);
    objc_msgSend(v7, "mappedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:", v17);

    objc_msgSend(v15, "closeFile");
    v18 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v7, "wfType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filename");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileWithURL:options:ofType:proposedFilename:", v10, 1, v19, v20);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "seekToEndOfFile");
    if ((v5 & 8) != 0)
      objc_msgSend(v15, "writeData:", v9);
    objc_msgSend(v15, "writeData:", v8);
    objc_msgSend(v15, "closeFile");
    v16 = v7;
  }

  return v16;
}

@end
