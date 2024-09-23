@implementation ICBrickGalleryAttachmentView

- (void)openAttachment
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "No sub attachments downloaded for %@", (uint8_t *)&v4, 0xCu);

}

- (void)didChangeAttachmentTitle
{
  void *v3;

  -[ICBrickGalleryAttachmentView galleryEditorController](self, "galleryEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentTitleDidChange");

  -[ICBrickTextAttachmentView requestAttachmentContentUpdate](self, "requestAttachmentContentUpdate");
}

- (void)didChangeMergeableData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICBrickGalleryAttachmentView_didChangeMergeableData__block_invoke;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __54__ICBrickGalleryAttachmentView_didChangeMergeableData__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "requestAttachmentContentUpdate");
  objc_msgSend(*(id *)(a1 + 32), "galleryEditorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "updateDocumentViewControllerFromModel");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setGalleryEditorController:", 0);
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
  -[ICBrickGalleryAttachmentView setGalleryEditorController:](self, "setGalleryEditorController:", 0);
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
  -[ICAttachmentView delete:](self, "delete:", self);
}

- (ICGalleryAttachmentEditorController)galleryEditorController
{
  return self->_galleryEditorController;
}

- (void)setGalleryEditorController:(id)a3
{
  objc_storeStrong((id *)&self->_galleryEditorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryEditorController, 0);
}

@end
