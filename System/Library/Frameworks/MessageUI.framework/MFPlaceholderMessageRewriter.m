@implementation MFPlaceholderMessageRewriter

- (MFPlaceholderMessageRewriter)init
{
  return -[MFPlaceholderMessageRewriter initWithOriginalMessageContent:resolver:](self, "initWithOriginalMessageContent:resolver:", 0, 0);
}

- (MFPlaceholderMessageRewriter)initWithOriginalMessageContent:(id)a3 resolver:(id)a4
{
  id v7;
  id v8;
  MFPlaceholderMessageRewriter *v9;
  NSMutableArray *v10;
  NSMutableArray *placeholders;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFPlaceholderMessageRewriter;
  v9 = -[MFPlaceholderMessageRewriter init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    placeholders = v9->_placeholders;
    v9->_placeholders = v10;

    objc_storeStrong((id *)&v9->_originalMessageContent, a3);
    objc_storeWeak((id *)&v9->_placeholderResolver, v8);
  }

  return v9;
}

+ (id)_deriveOutgoingMessageContentFromLibraryMessageContent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  objc_msgSend(v39, "libraryMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v39, "libraryMessage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "messageBody");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "preferredBodyPart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v37 = v4;
    if (!v4)
    {
      v40 = 0;
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend(v4, "contentToOffset:resultOffset:asHTML:", 1, 0, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("multipart")) & 1) != 0)
    {
      objc_msgSend(v37, "subtype");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("related"));

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v10 = v35;
        v11 = 0;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v46 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v15;
                objc_msgSend(v16, "htmlData");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  objc_msgSend(v16, "preferredEncoding");
                  v18 = MFCreateStringWithData();

                  v11 = (void *)v18;
                }
                objc_msgSend(v16, "attachmentsInDocument");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObjectsFromArray:", v19);

              }
              else
              {
                objc_msgSend(v9, "addObject:", v15);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v12);
        }

        v20 = objc_alloc_init(MEMORY[0x1E0D4D5D0]);
        objc_msgSend(v20, "setHtmlBody:", v11);
        objc_msgSend(v20, "setMixedContent:", v9);
        v40 = v20;

        goto LABEL_22;
      }
    }
    else
    {

    }
    v40 = objc_alloc_init(MEMORY[0x1E0D4D5D8]);
    objc_msgSend(v40, "setMixedContent:", v35);
LABEL_22:
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = v35;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v42;
LABEL_24:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v22)
            goto LABEL_24;
          goto LABEL_30;
        }
      }
      v26 = v25;

      if (v26)
        goto LABEL_45;
    }
    else
    {
LABEL_30:

    }
    objc_msgSend(v38, "topLevelPart");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j < objc_msgSend(v27, "numberOfAlternatives"); ++j)
    {
      objc_msgSend(v27, "alternativeAtIndex:", j);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "type");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqualToString:", CFSTR("text")) & 1) != 0)
      {
        objc_msgSend(v29, "subtype");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqualToString:", CFSTR("plain")))
        {

LABEL_41:
          if (v29)
          {
            _plaintextDocumentForMimePart(v29);
            v26 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_44;
          }
          break;
        }
        objc_msgSend(v29, "subtype");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("enriched"));

        if ((v33 & 1) != 0)
          goto LABEL_41;
      }
      else
      {

      }
    }
    v26 = 0;
LABEL_44:

LABEL_45:
    objc_msgSend(v40, "setPlaintextAlternative:", v26);

    goto LABEL_46;
  }
  v40 = 0;
LABEL_47:

  return v40;
}

- (id)rewrittenMessageContent
{
  MFOutgoingMessageContent *rewrittenMessageContent;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  MFOutgoingMessageContent *v36;
  void *v38;
  MFOutgoingMessageContent *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  MFPlaceholderMessageRewriter *v44;
  id obj;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  rewrittenMessageContent = self->_rewrittenMessageContent;
  if (!rewrittenMessageContent)
  {
    v44 = self;
    v39 = self->_originalMessageContent;
    -[MFOutgoingMessageContent libraryContent](v39, "libraryContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)objc_opt_class();
      -[MFOutgoingMessageContent libraryContent](v39, "libraryContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_deriveOutgoingMessageContentFromLibraryMessageContent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v39;
    }
    v40 = v7;
    v46 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v7, "richtextContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mixedContent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v38;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v9)
    {
      v48 = *(_QWORD *)v50;
      v43 = *MEMORY[0x1E0D45F28];
      v42 = *MEMORY[0x1E0D4D470];
      v41 = *MEMORY[0x1E0D4D478];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v50 != v48)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(v47, "addObject:", v11);
                  goto LABEL_50;
                }
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v11, "mimePart");
                v19 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "partURL");
                v18 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "bodyParameterForKey:", v43);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "approximateRawSize");
                v22 = 0;
                if (v42 < v21 && v41 > v21)
                {
                  v23 = (void *)objc_msgSend(v19, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", -1, 0, 1);
                  objc_msgSend(MEMORY[0x1E0D4D528], "placeholderFromSerializedRepresentation:", v23);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                }
LABEL_32:

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v19 = v11;
                  objc_msgSend(v19, "placeholder");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "url");
                  v18 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "contentID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_32;
                }
                v18 = 0;
                v20 = 0;
                v22 = 0;
              }
              -[MFPlaceholderMessageRewriter placeholderResolver](v44, "placeholderResolver", v38);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v22)
              {
                -[NSMutableArray addObject:](v44->_placeholders, "addObject:", v22);
                objc_msgSend(v25, "contentForPlaceholder:", v22);
                v26 = objc_claimAutoreleasedReturnValue();
                goto LABEL_38;
              }
              objc_msgSend(v24, "contentForURL:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {

                goto LABEL_42;
              }
              objc_msgSend(v25, "contentForContentID:", v20);
              v26 = objc_claimAutoreleasedReturnValue();
LABEL_38:
              v27 = (void *)v26;

              if (v27)
              {
LABEL_42:
                objc_msgSend(v46, "multipartContent");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  if ((isKindOfClass & 1) != 0)
                  {
                    objc_msgSend(v46, "multipartContent");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "htmlBody");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "stringByAppendingString:", v27);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "multipartContent");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setHtmlBody:", v32);

                  }
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0D1E700], "mf_utf8HTMLStringWithString:", v27);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "addObject:", v34);

                }
                else
                {
                  objc_msgSend(v47, "addObject:", v27);
                }
              }

              goto LABEL_49;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "mimeBody");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isHTML");

            if (v14)
            {
              objc_msgSend(v12, "htmlData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = (void *)MEMORY[0x1E0D1E700];
                objc_msgSend(v12, "preferredEncoding");
                v17 = (void *)MFCreateStringWithData();
                objc_msgSend(v16, "mf_utf8HTMLStringWithString:", v17);
                v18 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_26;
              }
              v18 = 0;
            }
            else
            {
              objc_msgSend(v12, "mimePart");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "preferredEncoding");
              _plaintextDocumentForMimePart(v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v17);
              v18 = 0;
LABEL_26:

            }
LABEL_28:
            if (v18)
            {
              objc_msgSend(v46, "setTextPartsAreHTML:", 1);
              objc_msgSend(v47, "addObject:", v18);
            }
            goto LABEL_49;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v11;
            goto LABEL_28;
          }
          v18 = 0;
LABEL_49:

LABEL_50:
          ++v10;
        }
        while (v9 != v10);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        v9 = v35;
      }
      while (v35);
    }

    objc_msgSend(v46, "setMixedContent:", v47);
    objc_msgSend(v46, "setPlaceholders:", v44->_placeholders);
    v36 = v44->_rewrittenMessageContent;
    v44->_rewrittenMessageContent = (MFOutgoingMessageContent *)v46;

    rewrittenMessageContent = v44->_rewrittenMessageContent;
  }
  return rewrittenMessageContent;
}

- (id)accountProxyGenerator
{
  return 0;
}

- (id)composeWebView
{
  return 0;
}

- (id)toRecipients
{
  void *v2;
  void *v3;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyAddressListForTo");

  return v3;
}

- (id)ccRecipients
{
  void *v2;
  void *v3;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyAddressListForCc");

  return v3;
}

- (id)bccRecipients
{
  void *v2;
  void *v3;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyAddressListForBcc");

  return v3;
}

- (id)subject
{
  void *v2;
  void *v3;
  void *v4;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headersForKey:", *MEMORY[0x1E0D1E5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)savedHeaders
{
  void *v2;
  void *v3;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)sendingEmailAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[MFOutgoingMessageContent headers](self->_originalMessageContent, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyAddressListForSender");
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sendingAccountProxy
{
  return 0;
}

- (id)attachments
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)shouldCreateRichTextRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
}

- (MFOutgoingMessageContent)originalMessageContent
{
  return self->_originalMessageContent;
}

- (MFMessageRewriterPlaceholderResolver)placeholderResolver
{
  return (MFMessageRewriterPlaceholderResolver *)objc_loadWeakRetained((id *)&self->_placeholderResolver);
}

- (void)setPlaceholderResolver:(id)a3
{
  objc_storeWeak((id *)&self->_placeholderResolver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeholderResolver);
  objc_storeStrong((id *)&self->_rewrittenMessageContent, 0);
  objc_storeStrong((id *)&self->_originalMessageContent, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
}

@end
