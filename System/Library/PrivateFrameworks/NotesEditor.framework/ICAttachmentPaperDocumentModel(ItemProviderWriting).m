@implementation ICAttachmentPaperDocumentModel(ItemProviderWriting)

- (uint64_t)itemProviderUTI
{
  return objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CEC570];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
  v9[3] = &unk_1EA7DD350;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v4, "registerFileRepresentationForContentType:visibility:openInPlace:loadHandler:", v7, 0, 0, v9);

}

@end
