@implementation WFSplitPDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__WFSplitPDFAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B26A0;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, getPDFDocumentClass());

}

void __47__WFSplitPDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  const __CFString *v22;
  id v24;

  v24 = a2;
  v21 = a3;
  v20 = a4;
  if (objc_msgSend(v24, "pageCount"))
  {
    v6 = 0;
    v7 = CFSTR("PDF");
    if (v21)
      v7 = v21;
    v22 = v7;
    v8 = *MEMORY[0x24BDF84E0];
    do
    {
      objc_msgSend(v24, "pageAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init((Class)getPDFDocumentClass());
      objc_msgSend(v10, "insertPage:atIndex:", v9, 0);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%li"), v22, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BE194F8];
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "proposedFilenameForFile:ofType:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE19628], "createTemporaryFileWithFilename:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeToURL:", v15);
      v16 = (void *)MEMORY[0x24BE194F8];
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fileWithURL:options:ofType:", v15, 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "output");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addFile:", v18);

      ++v6;
    }
    while (v6 < objc_msgSend(v24, "pageCount"));
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v20);

}

@end
