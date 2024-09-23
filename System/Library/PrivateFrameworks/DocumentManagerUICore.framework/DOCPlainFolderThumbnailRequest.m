@implementation DOCPlainFolderThumbnailRequest

- (DOCPlainFolderThumbnailRequest)initWithDescriptor:(id)a3
{
  id v6;
  DOCPlainFolderThumbnailRequest *v7;
  DOCPlainFolderThumbnailRequest *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  v11.receiver = self;
  v11.super_class = (Class)DOCPlainFolderThumbnailRequest;
  v7 = -[DOCPlainFolderThumbnailRequest init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_descriptor, a3);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  DOCThumbnailDescriptor *descriptor;
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;

  descriptor = self->_descriptor;
  v5 = (void (**)(id, void *, _QWORD))a3;
  +[DOCThumbnailFolderIcon folderIconForDescriptor:](DOCThumbnailFolderIcon, "folderIconForDescriptor:", descriptor);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plainFolderImageWithStyle:", -[DOCThumbnailDescriptor style](self->_descriptor, "style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

@end
