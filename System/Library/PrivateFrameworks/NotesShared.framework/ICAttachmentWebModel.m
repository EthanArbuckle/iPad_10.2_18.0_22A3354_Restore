@implementation ICAttachmentWebModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_WEB_LINKS_%lu"), CFSTR("NOTE_LIST_WEB_LINKS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "ic_isMapURL") & 1) != 0 || (objc_msgSend(v7, "ic_isiTunesURL") & 1) != 0)
      LOBYTE(v8) = 0;
    else
      v8 = objc_msgSend(v7, "ic_isAppStoreURL") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)searchableTextContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentWebModel;
  -[ICAttachmentModel searchableTextContent](&v11, sel_searchableTextContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quotedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v8);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *a3 = CFSTR("a");
  v8 = objc_retainAutorelease(v7);
  *a4 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("href=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (id)pendingFetchCompletionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingFetchCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingFetchCompletionHandler, 0);
}

@end
