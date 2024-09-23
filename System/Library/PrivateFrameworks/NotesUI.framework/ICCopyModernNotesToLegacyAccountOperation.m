@implementation ICCopyModernNotesToLegacyAccountOperation

- (ICCopyModernNotesToLegacyAccountOperation)init
{
  -[ICCopyModernNotesToLegacyAccountOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICCopyModernNotesToLegacyAccountOperation)initWithNotes:(id)a3 toFolder:(id)a4 legacyContext:(id)a5 didCopyBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICCopyModernNotesToLegacyAccountOperation *v15;
  ICCopyModernNotesToLegacyAccountOperation *v16;
  void *v17;
  id didCopyBlock;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICCopyModernNotesToLegacyAccountOperation;
  v15 = -[ICCopyModernNotesToLegacyAccountOperation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sourceNotes, a3);
    objc_storeStrong((id *)&v16->_destinationFolder, a4);
    objc_storeStrong((id *)&v16->_legacyContext, a5);
    v17 = _Block_copy(v14);
    didCopyBlock = v16->_didCopyBlock;
    v16->_didCopyBlock = v17;

  }
  return v16;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ICCopyModernNotesToLegacyAccountOperation *v13;
  id v14;
  void *v15;

  -[ICCopyModernNotesToLegacyAccountOperation sourceNotes](self, "sourceNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "mutableCopy");

  -[ICCopyModernNotesToLegacyAccountOperation destinationFolder](self, "destinationFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ICCopyModernNotesToLegacyAccountOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      if (!objc_msgSend(v8, "count", v8, v9, v10, v11, v12, v13))
        break;
      objc_msgSend(v8, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeLastObject");
      v9 = v5;
      v10 = 3221225472;
      v11 = __49__ICCopyModernNotesToLegacyAccountOperation_main__block_invoke;
      v12 = &unk_1E5C1D7C0;
      v13 = self;
      v14 = v4;
      v15 = v6;
      v7 = v6;
      performBlockOnMainThreadAndWait();

    }
    while (!-[ICCopyModernNotesToLegacyAccountOperation isCancelled](self, "isCancelled"));
  }

}

void __49__ICCopyModernNotesToLegacyAccountOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "ensureLegacyFolderIsValid:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = objc_msgSend(*(id *)(a1 + 48), "markedForDeletion");

      if ((v4 & 1) == 0)
      {
        if (v8)
        {
          v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyNote:toFolder:", *(_QWORD *)(a1 + 48), v8);
          if (v5)
          {
            objc_msgSend(*(id *)(a1 + 32), "didCopyBlock");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            if (v6)
            {
              objc_msgSend(*(id *)(a1 + 32), "didCopyBlock");
              v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, *(_QWORD *)(a1 + 48), v5);

            }
          }

        }
      }
    }
  }

}

- (id)ensureLegacyFolderIsValid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ICCopyModernNotesToLegacyAccountOperation legacyContext](self, "legacyContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectWithID:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 136315138;
        v14 = "-[ICCopyModernNotesToLegacyAccountOperation ensureLegacyFolderIsValid:]";
        _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_INFO, "%s: Couldn't get a valid legacy folder", (uint8_t *)&v13, 0xCu);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (id)dataForAttachment:(id)a3 outFilename:(id *)a4 outMimeType:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;

  v7 = a3;
  if (objc_msgSend(v7, "isUnsupported") && (objc_msgSend(v7, "hasFallbackImage") & 1) != 0
    || objc_msgSend(v7, "attachmentType") == 10)
  {
    objc_msgSend(v7, "fallbackImageData");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fallbackImageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "media");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "media");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "data");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeUTI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "attachmentType") == 13)
  {
    objc_msgSend(MEMORY[0x1E0D639E8], "currentInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63A40], "generateImageForAttachment:fullResolution:appearanceInfo:", v7, 1, v19);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v10 = 0;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    v14 = 0;
  }
  v8 = 0;
LABEL_8:
  if (!(v8 | v14))
  {
    objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:", 1024.0, 768.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orientedImage");
    v14 = objc_claimAutoreleasedReturnValue();

  }
  if (v14)
  {
    objc_msgSend((id)v14, "ic_PNGData");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
    v8 = v16;
  }
  if (!v10 && v11)
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "filenameFromUTI:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

  return (id)v8;
}

- (id)htmlAttributesForAttachment:(id)a3 legacyContentID:(id)a4 tagName:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a5)
      *a5 = CFSTR("a");
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D63BB8], "htmlObjectAttributesForAttachmentWithContentID:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR(" href=\"%@\"><object%@"), v9, v11);
    }
    else
    {
      objc_msgSend(v7, "title");
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v13;
      if (v13)
        v14 = (void *)v13;
      else
        v14 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR(" href=\"%@\"><i>%@</i"), v9, v14);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a5)
      *a5 = CFSTR("object");
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D63BB8], "htmlObjectAttributesForAttachmentWithContentID:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)copyNote:(id)a3 toFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *, uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;
  ICCopyModernNotesToLegacyAccountOperation *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D63B80];
  -[ICCopyModernNotesToLegacyAccountOperation legacyContext](self, "legacyContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "newNoteBasedOnModernNote:inFolder:context:", v6, v7, v9);

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke;
  v22 = &unk_1E5C21260;
  v23 = v7;
  v24 = v6;
  v25 = self;
  v11 = v10;
  v26 = v11;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v12, "htmlStringWithAttachmentConversionHandler:", &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHtmlString:", v14, v19, v20, v21, v22);

  objc_msgSend(v13, "addNotesObject:", v11);
  objc_msgSend(v11, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processPendingChanges");

  v16 = v26;
  v17 = v11;

  return v17;
}

id __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  os_log_t v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsAttachments");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "attachmentWithIdentifier:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "attachmentType") == 11)
      {
        objc_opt_class();
        objc_msgSend(v10, "attachmentModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "blockingGeneratePDFURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v32);
          objc_msgSend((id)*MEMORY[0x1E0CEC570], "preferredMIMEType");
          v33 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "attachment");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "attachment");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
            objc_msgSend(v15, "title");
          else
            objc_msgSend(v15, "defaultTitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "stringByAppendingPathExtension:", CFSTR("pdf"));
          v19 = (id)objc_claimAutoreleasedReturnValue();

          v20 = (id)v33;
          v18 = (void *)v34;
        }
        else
        {
          v18 = 0;
          v19 = 0;
          v20 = 0;
        }

      }
      else if (objc_msgSend(v10, "attachmentType") == 12)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
      }
      else
      {
        v21 = *(void **)(a1 + 48);
        v36 = 0;
        v37 = 0;
        objc_msgSend(v21, "dataForAttachment:outFilename:outMimeType:", v10, &v37, &v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v37;
        v20 = v36;
      }
      if (objc_msgSend(v10, "attachmentType") == 12)
      {
        v23 = v20;
        objc_msgSend(v10, "attachmentModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "canConvertToHTMLForSharing");

        if (!v25)
        {
          v17 = 0;
          v20 = v23;
LABEL_28:

          goto LABEL_29;
        }
        objc_msgSend(v10, "attachmentModel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attributesForSharingHTMLWithTagName:textContent:", a3, a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v23;
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(*(id *)(a1 + 56), "createAttachmentWithName:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMimeType:", v20);
      if (v18)
      {
        v35 = 0;
        v27 = objc_msgSend(v26, "persistAttachmentData:error:", v18, &v35);
        v28 = v35;
        if ((v27 & 1) != 0)
        {
          v29 = *(void **)(a1 + 48);
          objc_msgSend(v26, "contentID");
          v30 = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "htmlAttributesForAttachment:legacyContentID:tagName:", v10, v30, a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        v28 = 0;
      }
      v30 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke_cold_1(v26, (uint64_t)v28, v30);

      v17 = 0;
      goto LABEL_26;
    }
  }
  v17 = 0;
LABEL_29:

  return v17;
}

- (NSArray)sourceNotes
{
  return self->_sourceNotes;
}

- (void)setSourceNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (ICLegacyFolder)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationFolder:(id)a3
{
  objc_storeStrong((id *)&self->_destinationFolder, a3);
}

- (ICLegacyContext)legacyContext
{
  return self->_legacyContext;
}

- (void)setLegacyContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyContext, a3);
}

- (id)didCopyBlock
{
  return self->_didCopyBlock;
}

- (void)setDidCopyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didCopyBlock, 0);
  objc_storeStrong((id *)&self->_legacyContext, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_sourceNotes, 0);
}

void __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Couldn't persist attachment for id: %@, error: %@", (uint8_t *)&v6, 0x16u);

}

@end
