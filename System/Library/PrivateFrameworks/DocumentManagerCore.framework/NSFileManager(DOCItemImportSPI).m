@implementation NSFileManager(DOCItemImportSPI)

- (id)_doc_importItemAtURL:()DOCItemImportSPI toDestination:error:
{
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCDownloadImportManager.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("srcURL"));

  }
  if ((unint64_t)(a4 - 1) > 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCDownloadImportManager.m"), 207, CFSTR("Unexpected _DOCFileDestination %ld"), a4);
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "_moveItemAtURL:toNamedLocation:error:", v9, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (uint64_t)_doc_destinationLocationExists:()DOCItemImportSPI
{
  void *v4;
  uint64_t v5;

  if ((unint64_t)(a3 - 1) > 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCDownloadImportManager.m"), 222, CFSTR("Unexpected _DOCFileDestination %ld"), a3);
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v4, "_doc_destinationLocationExists:", a3);
  }

  return v5;
}

@end
