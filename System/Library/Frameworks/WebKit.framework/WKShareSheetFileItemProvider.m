@implementation WKShareSheetFileItemProvider

- (WKShareSheetFileItemProvider)initWithURL:(id)a3
{
  WKShareSheetFileItemProvider *v4;
  void *m_ptr;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKShareSheetFileItemProvider;
  v4 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_, objc_msgSend(MEMORY[0x1E0C99D50], "data"));
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_url.m_ptr;
    v4->_url.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    v6 = (void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCE060])()), "init");
    objc_msgSend(v6, "setShouldFetchSubresources:", 0);
    v7 = (void *)objc_msgSend(v6, "_startFetchingMetadataForURL:completionHandler:", a3, &__block_literal_global_41);
    v8 = v7;
    if (v7)
      CFRetain(v7);
    v9 = v4->_headerMetadata.m_ptr;
    v4->_headerMetadata.m_ptr = v8;
    if (v9)
      CFRelease(v9);
    if (v6)
      CFRelease(v6);
  }
  return v4;
}

- (id)item
{
  return self->_url.m_ptr;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  void *m_ptr;
  id result;
  uint64_t v6;
  void *v7;
  void *v8;

  m_ptr = self->_url.m_ptr;
  v8 = 0;
  objc_msgSend(m_ptr, "getPromisedItemResourceValue:forKey:error:", &v8, *MEMORY[0x1E0C99AD0], 0);
  result = v8;
  if (!v8)
  {
    v6 = objc_msgSend(m_ptr, "pathExtension");
    if (!v6 || (v7 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6)) == 0)
      v7 = (void *)*MEMORY[0x1E0CEC4A0];
    return (id)objc_msgSend(v7, "identifier");
  }
  return result;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return self->_headerMetadata.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_headerMetadata.m_ptr;
  self->_headerMetadata.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  return self;
}

@end
