@implementation HKCDAPDFGenerator

- (HKCDAPDFGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKCDAPDFGenerator;
  return -[HKCDAPDFGenerator init](&v3, sel_init);
}

- (void)generatePDFForCDAXML:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __60__HKCDAPDFGenerator_generatePDFForCDAXML_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[HKCDAPDFGenerator PDFTranslator](HKCDAPDFGenerator, "PDFTranslator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertToHTMLFromXML:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_pdfForHTML:completionHandler:", v2, *(_QWORD *)(a1 + 48));

}

- (void)_pdfForHTML:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  HKCDAPDFGenerator *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke;
  block[3] = &unk_1E9C3FBE0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke(uint64_t a1)
{
  HKCDAPDFPrintPageRenderer *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;
  char __dst[1024];
  _QWORD v18[4];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = -[HKCDAPDFPrintPageRenderer initWithPaperRect:horizontalMargin:verticalMargin:]([HKCDAPDFPrintPageRenderer alloc], "initWithPaperRect:horizontalMargin:verticalMargin:", 0.0, 0.0, 612.0, 792.0, 36.0, 72.0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80C10]), "initWithMarkupText:", *(_QWORD *)(a1 + 32));
  -[UIPrintPageRenderer addPrintFormatter:startingAtPageAtIndex:](v2, "addPrintFormatter:startingAtPageAtIndex:", v3, 0);
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v18[1] = CFSTR("cda_report_XXXXXX.pdf");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy(__dst, (const char *)objc_msgSend(v6, "UTF8String"), 0x400uLL);
  __dst[1023] = 0;
  v7 = mkstemps(__dst, 4);
  if ((v7 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Failed to create temporary file for generating PDF: %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_finishGenerationWithURL:tempFileDescriptor:completionHandler:error:", 0, v7, *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __dst);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrintPageRenderer:", v2);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9C434D0;
    v13[4] = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v14 = v11;
    v16 = v7;
    v15 = *(id *)(a1 + 48);
    if ((objc_msgSend(v10, "savePDFToURL:completionHandler:", v11, v13) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Failed to generate PDF for Health Report"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_finishGenerationWithURL:tempFileDescriptor:completionHandler:error:", 0, v7, *(_QWORD *)(a1 + 48), v12);

    }
  }

}

uint64_t __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  if (a3)
  {
    v6 = *(unsigned int *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = 0;
  }
  else
  {
    v9 = a4;
    v6 = *(unsigned int *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 48);
    v7 = 0;
  }
  return objc_msgSend(v5, "_finishGenerationWithURL:tempFileDescriptor:completionHandler:error:", v7, v6, v8, v9);
}

- (void)_finishGenerationWithURL:(id)a3 tempFileDescriptor:(int)a4 completionHandler:(id)a5 error:(id)a6
{
  void (**v9)(id, BOOL);
  id v10;
  id v11;

  v11 = a3;
  v9 = (void (**)(id, BOOL))a5;
  v10 = a6;
  v9[2](v9, v11 != 0);
  if ((a4 & 0x80000000) == 0)
    close(a4);

}

+ (id)PDFTranslator
{
  if (PDFTranslator_oncePredicate != -1)
    dispatch_once(&PDFTranslator_oncePredicate, &__block_literal_global_52);
  return (id)PDFTranslator_translator;
}

void __34__HKCDAPDFGenerator_PDFTranslator__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  HKHealthUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("CDAPDFINTL"), CFSTR("xsl"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentsAtPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7070]), "initWithXSL:localizationTableName:localizationOverride:", v2, CFSTR("CDA"), 0);
  v4 = (void *)PDFTranslator_translator;
  PDFTranslator_translator = v3;

}

@end
