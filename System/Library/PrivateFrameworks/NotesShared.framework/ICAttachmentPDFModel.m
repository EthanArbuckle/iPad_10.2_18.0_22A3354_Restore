@implementation ICAttachmentPDFModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_PDFS_%lu"), CFSTR("NOTE_LIST_PDFS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasPreviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFURL *v9;
  CGPDFDocument *v10;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaURL");
    v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v10 = CGPDFDocumentCreateWithURL(v9);

    if (v10)
    {
      v6 = !CGPDFDocumentIsEncrypted(v10);
      CGPDFDocumentRelease(v10);
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)showThumbnailInNoteList
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ICAttachmentModel hasThumbnailImage](self, "hasThumbnailImage"))
    return 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)canMarkup
{
  return 1;
}

+ (id)contentTextFromPDFAtURL:(id)a3
{
  id v3;
  void *v4;
  CGPDFDocument *v5;
  CGPDFDictionary *Info;
  CGPDFDictionary *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  size_t Count;
  size_t v15;
  size_t i;
  __CFString *v17;
  __CFString *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGPDFArrayRef array;
  CGPDFStringRef value;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v3;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithURL:", v3);
  v5 = (CGPDFDocument *)objc_msgSend(v35, "documentRef");
  if (v5)
  {
    Info = CGPDFDocumentGetInfo(v5);
    if (Info)
    {
      v7 = Info;
      array = 0;
      value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        v8 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v8);

      }
      if (CGPDFDictionaryGetString(v7, "Author", &value))
      {
        v9 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v9);

      }
      if (CGPDFDictionaryGetString(v7, "Subject", &value))
      {
        v10 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v10);

      }
      if (CGPDFDictionaryGetString(v7, "Creator", &value))
      {
        v11 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v11);

      }
      if (CGPDFDictionaryGetString(v7, "Producer", &value))
      {
        v12 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v12);

      }
      if (CGPDFDictionaryGetString(v7, "CreationDate", &value))
      {
        v13 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v13);

      }
      if (CGPDFDictionaryGetArray(v7, "AAPL:Keywords", &array))
      {
        Count = CGPDFArrayGetCount(array);
        if (Count)
        {
          v15 = Count;
          for (i = 0; i != v15; ++i)
          {
            if (CGPDFArrayGetString(array, i, &value))
            {
              v17 = (__CFString *)CGPDFStringCopyTextString(value);
              objc_msgSend(v4, "addObject:", v17);

            }
          }
        }
      }
      else if (CGPDFDictionaryGetString(v7, "Keywords", &value))
      {
        v18 = (__CFString *)CGPDFStringCopyTextString(value);
        objc_msgSend(v4, "addObject:", v18);

      }
    }
    v19 = objc_msgSend(v35, "pageCount");
    v20 = 0;
    if (v19 >= 0x64)
      v21 = 100;
    else
      v21 = v19;
    do
    {
      v22 = (void *)MEMORY[0x1C3B7AC74]();
      objc_msgSend(v35, "pageAtIndex:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "pageRef"))
      {
        v24 = (void *)CGPDFPageCopyString();
        objc_msgSend(v4, "ic_addNonNilObject:", v24);

      }
      objc_msgSend(v23, "annotations");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "contents");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "ic_addNonNilObject:", v30);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v27);
      }

      objc_autoreleasePoolPop(v22);
    }
    while (v20++ != v21);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
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
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentPDFModel;
  -[ICAttachmentModel searchableTextContent](&v14, sel_searchableTextContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "media");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPDFModel contentTextFromPDFAtURL:](ICAttachmentPDFModel, "contentTextFromPDFAtURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v3, "addObject:", v11);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v5, "length"))
  {
    +[ICNote defaultTitleForEmptyNote](ICNote, "defaultTitleForEmptyNote");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(v5, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CEC570]))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }

  }
  return v5;
}

@end
