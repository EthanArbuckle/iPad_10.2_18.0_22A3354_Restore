@implementation MFScannedDocumentConverter

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MFScannedDocumentConverter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1)
    dispatch_once(&log_onceToken_11, block);
  return (OS_os_log *)(id)log_log_11;
}

void __33__MFScannedDocumentConverter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.messageui", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;

}

- (MFScannedDocumentConverter)init
{
  MFScannedDocumentConverter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFScannedDocumentConverter;
  v2 = -[MFScannedDocumentConverter init](&v7, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.messageui.scannedDocumentConverter", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)pdfDocumentFromScannedDocument:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke;
  block[3] = &unk_1E5A65BD8;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  dispatch_async(queue, block);
  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "map:", &__block_literal_global_32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke(id *a1)
{
  unint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "_pdfConverterFromScannedDocument:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "pageCount");
  if (v2 >= objc_msgSend(a1[5], "pageCount"))
  {
    objc_msgSend(a1[6], "finishWithResult:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFScannedDocumentErrorDomain"), 10, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "finishWithError:", v3);

  }
}

id __61__MFScannedDocumentConverter_pdfDocumentFromScannedDocument___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dataRepresentation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pdfConverterFromScannedDocument:(id)a3
{
  id v3;
  id v4;
  unint64_t i;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CD0DB8]);
  for (i = 0; i < objc_msgSend(v3, "pageCount"); ++i)
  {
    objc_msgSend(v3, "imageOfPageAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DC8]), "initWithImage:", v6);
      objc_msgSend(v4, "insertPage:atIndex:", v7, objc_msgSend(v4, "pageCount"));

    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
