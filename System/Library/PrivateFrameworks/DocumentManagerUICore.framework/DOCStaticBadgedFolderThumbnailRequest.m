@implementation DOCStaticBadgedFolderThumbnailRequest

- (DOCStaticBadgedFolderThumbnailRequest)initWithFolderType:(unint64_t)a3 descriptor:(id)a4
{
  id v7;
  DOCStaticBadgedFolderThumbnailRequest *v8;
  DOCStaticBadgedFolderThumbnailRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DOCStaticBadgedFolderThumbnailRequest;
  v8 = -[DOCStaticBadgedFolderThumbnailRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_folderType = a3;
    objc_storeStrong((id *)&v8->_descriptor, a4);
  }

  return v9;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  DOCThumbnailDescriptor *descriptor;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  id v9;

  descriptor = self->_descriptor;
  v6 = (void (**)(id, void *, _QWORD))a3;
  +[DOCThumbnailFolderIcon folderIconForDescriptor:](DOCThumbnailFolderIcon, "folderIconForDescriptor:", descriptor);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 245, CFSTR("nil folder icon"));

  }
  objc_msgSend(v9, "badgedFolderIconForFolderType:style:", self->_folderType, -[DOCThumbnailDescriptor style](self->_descriptor, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
