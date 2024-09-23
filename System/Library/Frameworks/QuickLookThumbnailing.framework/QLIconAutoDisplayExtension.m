@implementation QLIconAutoDisplayExtension

void __QLIconAutoDisplayExtension_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v14 = (void *)MEMORY[0x1E0C99E20];
  v13 = *MEMORY[0x1E0CEC590];
  v12 = *MEMORY[0x1E0CEC5A8];
  v0 = *MEMORY[0x1E0CEC5C0];
  v1 = *MEMORY[0x1E0CEC5C8];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("org.oasis-open.opendocument.text"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.microsoft.word.doc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("org.openxmlformats.wordprocessingml.document"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.microsoft.excel.xls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("org.openxmlformats.spreadsheetml.sheet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEC570];
  v7 = *MEMORY[0x1E0CEC518];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.xhtml"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.webarchive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObjects:", v13, v12, v0, v1, v15, v2, v3, v4, v5, v6, v7, v8, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)QLIconAutoDisplayExtension_autoDisplayExtensionUTIs;
  QLIconAutoDisplayExtension_autoDisplayExtensionUTIs = v10;

}

@end
