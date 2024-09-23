@implementation ELSDocumentHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_0);
  return (id)sharedHelper_singleton;
}

void __33__ELSDocumentHelper_sharedHelper__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ELSDocumentHelper initSingleton]([ELSDocumentHelper alloc], "initSingleton");
  v1 = (void *)sharedHelper_singleton;
  sharedHelper_singleton = (uint64_t)v0;

}

- (id)initSingleton
{
  ELSDocumentHelper *v2;
  uint64_t v3;
  NSMutableData *pdfData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ELSDocumentHelper;
  v2 = -[ELSDocumentHelper init](&v6, sel_init);
  if (v2)
  {
    +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement](ELSEntitlementUtilities, "assertCurrentProcessHasEntitlement");
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    pdfData = v2->_pdfData;
    v2->_pdfData = (NSMutableData *)v3;

  }
  return v2;
}

- (id)saveData:(id)a3 toFilePath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1580];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "createFileAtPath:contents:attributes:", v9, v7, 0);

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = (void *)objc_msgSend(CFSTR("com.apple.EnhancedLoggingState"), "copy");
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    ELSLogHandleForCategory(11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ELSDocumentHelper saveData:toFilePath:].cold.1(v5, v14);

  }
  return v11;
}

- (NSArray)contentsText
{
  return self->_contentsText;
}

- (void)setContentsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)imageSignature
{
  return self->_imageSignature;
}

- (void)setImageSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableData)pdfData
{
  return self->_pdfData;
}

- (void)setPdfData:(id)a3
{
  objc_storeStrong((id *)&self->_pdfData, a3);
}

- (NSURL)tempURL
{
  return self->_tempURL;
}

- (void)setTempURL:(id)a3
{
  objc_storeStrong((id *)&self->_tempURL, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_tempURL, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_imageSignature, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contentsText, 0);
}

- (void)saveData:(void *)a1 toFilePath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2141BF000, a2, OS_LOG_TYPE_ERROR, "Cannot write the data to file at path: %@", (uint8_t *)&v4, 0xCu);

}

@end
