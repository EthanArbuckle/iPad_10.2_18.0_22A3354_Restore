@implementation LSDocumentProxy(MobileSafariFrameworkExtras)

+ (id)sf_documentProxyForName:()MobileSafariFrameworkExtras type:MIMEType:sourceURL:
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v9 = (void *)MEMORY[0x1E0CA58C8];
  v10 = (void *)MEMORY[0x1E0D47230];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isURLManaged:", v11);

  objc_msgSend(v9, "documentProxyForName:type:MIMEType:sourceIsManaged:", v14, v13, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
