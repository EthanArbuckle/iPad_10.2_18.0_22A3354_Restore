@implementation QLWebItemTransformer

+ (id)allowedOutputClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  QLGeneratedPreviewParts *v8;
  QLGeneratedPreviewParts *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentType");
  v8 = (QLGeneratedPreviewParts *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [QLGeneratedPreviewParts alloc];
    v10 = objc_msgSend(v7, "stringEncoding");
    v11 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v7, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredMIMEType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[QLGeneratedPreviewParts initWithData:encoding:mimeType:attachments:](v9, "initWithData:encoding:mimeType:attachments:", v6, v10, v14, v15);

  }
  return v8;
}

@end
