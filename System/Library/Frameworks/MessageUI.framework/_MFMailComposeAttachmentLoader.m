@implementation _MFMailComposeAttachmentLoader

- (_MFMailComposeAttachmentLoader)initWithMessage:(id)a3 content:(id)a4 isDraft:(BOOL)a5 didLoadBestAlternative:(BOOL)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  _MFMailComposeAttachmentLoader *v16;
  _MFMailComposeAttachmentLoader *v17;
  uint64_t v18;
  id completionBlock;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_MFMailComposeAttachmentLoader;
  v16 = -[_MFMailComposeAttachmentLoader init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_message, a3);
    objc_storeStrong(&v17->_content, a4);
    v17->_isDraft = a5;
    v17->_didLoadBestAlternative = a6;
    v18 = objc_msgSend(v15, "copy");
    completionBlock = v17->_completionBlock;
    v17->_completionBlock = (id)v18;

  }
  return v17;
}

- (void)loadAttachments
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id obj;
  void *v29;
  _QWORD block[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D4F8], "currentMonitor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_content;
  if (v27 && (self->_didLoadBestAlternative || !self->_isDraft)
    || (-[MFMailMessage messageBody](self->_message, "messageBody"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "htmlContent"),
        v3 = objc_claimAutoreleasedReturnValue(),
        v27,
        v2,
        (v27 = (id)v3) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v27;
    }
    else
    {
      v42[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    v6 = objc_msgSend(v4, "count");
    if (v6 == 1)
    {
      objc_msgSend(v5, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachmentsInDocument");
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v10;
      }
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v37;
      v14 = (float)v6;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(MEMORY[0x1E0D4D520], "allManagers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v33 != v19)
                    objc_enumerationMutation(v17);
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "attachmentForTextAttachment:error:", v16, 0);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = v21;
                  if (v21)
                  {
                    v23 = (id)objc_msgSend(v21, "fetchDataSynchronously:", 0);
                    v24 = (id)objc_msgSend(v16, "fileWrapperForcingDownload:", 1);
                  }

                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v18);
            }

          }
          objc_msgSend(v29, "setPercentDone:", (float)((float)(unint64_t)++v12 / v14));
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v11);
    }

  }
  else
  {
    v27 = 0;
    objc_msgSend(v29, "setPercentDone:", 1.0);
    obj = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___MFMailComposeAttachmentLoader_loadAttachments__block_invoke;
  block[3] = &unk_1E5A65430;
  block[4] = self;
  v31 = v27;
  v25 = v27;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
