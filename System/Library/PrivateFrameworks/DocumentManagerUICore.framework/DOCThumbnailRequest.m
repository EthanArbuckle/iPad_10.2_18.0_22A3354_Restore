@implementation DOCThumbnailRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbnailGenerationRequiresDownloadHandler, 0);
}

+ (id)iconRequestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  DOCPlainFolderThumbnailRequest *v14;
  DOCPlainFolderThumbnailRequest *v15;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v11)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

  if (!v10)
    goto LABEL_9;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailGenerator"));

LABEL_4:
  objc_msgSend(v9, "contentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToType:", *MEMORY[0x24BDF83C0]);

  if (v13)
    v14 = -[DOCPlainFolderThumbnailRequest initWithDescriptor:]([DOCPlainFolderThumbnailRequest alloc], "initWithDescriptor:", v10);
  else
    v14 = -[DOCIconThumbnailRequest initWithNode:descriptor:thumbnailGenerator:]([DOCIconThumbnailRequest alloc], "initWithNode:descriptor:thumbnailGenerator:", v9, v10, v11);
  v15 = v14;

  return v15;
}

- (void)setThumbnailGenerationRequiresDownloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (id)requestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  DOCVolumeThumbnailRequest *v13;
  unint64_t v14;
  unint64_t v15;
  DOCStaticBadgedFolderThumbnailRequest *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

  }
  if ((objc_msgSend(v9, "isActionable") & 1) != 0)
  {
    if (v10)
      goto LABEL_5;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v11)
      goto LABEL_6;
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailGenerator"));

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 59, CFSTR("Attempting to generate a thumbnail request for a non-actionable node"));

  if (!v10)
    goto LABEL_19;
LABEL_5:
  if (!v11)
    goto LABEL_20;
LABEL_6:
  if (objc_msgSend(v9, "isRootItem")
    && (objc_msgSend(v9, "providerID"),
        a1 = (id)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(a1, "isEqualToString:", *MEMORY[0x24BE2DE08]),
        a1,
        v12))
  {
    v13 = -[DOCVolumeThumbnailRequest initWithDescriptor:]([DOCVolumeThumbnailRequest alloc], "initWithDescriptor:", v10);
  }
  else
  {
    v14 = objc_msgSend(v9, "doc_folderIconType");
    v15 = v14;
    if (v14 - 2 >= 4)
    {
      if (v14 < 2)
      {
        v13 = -[DOCRegularNodeThumbnailRequest initWithNode:descriptor:thumbnailGenerator:]([DOCRegularNodeThumbnailRequest alloc], "initWithNode:descriptor:thumbnailGenerator:", v9, v10, v11);
        goto LABEL_14;
      }
      if (v14 != 6)
        goto LABEL_15;
      v16 = [DOCStaticBadgedFolderThumbnailRequest alloc];
      v17 = 6;
    }
    else
    {
      v16 = [DOCStaticBadgedFolderThumbnailRequest alloc];
      v17 = v15;
    }
    v13 = -[DOCStaticBadgedFolderThumbnailRequest initWithFolderType:descriptor:](v16, "initWithFolderType:descriptor:", v17, v10);
  }
LABEL_14:
  a1 = v13;
LABEL_15:

  return a1;
}

+ (id)iconRequestForURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  DOCPlainFolderThumbnailRequest *v15;
  DOCPlainFolderThumbnailRequest *v16;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v11)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailRequest.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailGenerator"));

LABEL_4:
  v21 = 0;
  v12 = objc_msgSend(v9, "getPromisedItemResourceValue:forKey:error:", &v21, *MEMORY[0x24BDBCBE8], 0);
  v13 = v21;
  v14 = v13;
  v15 = 0;
  if (v12)
  {
    if (objc_msgSend(v13, "conformsToType:", *MEMORY[0x24BDF83C0]))
      v16 = -[DOCPlainFolderThumbnailRequest initWithDescriptor:]([DOCPlainFolderThumbnailRequest alloc], "initWithDescriptor:", v10);
    else
      v16 = -[DOCIconThumbnailRequest initWithURL:descriptor:thumbnailGenerator:]([DOCIconThumbnailRequest alloc], "initWithURL:descriptor:thumbnailGenerator:", v9, v10, v11);
    v15 = v16;
  }

  return v15;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 123, CFSTR("Subclasses should override %@"), v5);

}

- (id)thumbnailGenerationRequiresDownloadHandler
{
  return self->_thumbnailGenerationRequiresDownloadHandler;
}

@end
