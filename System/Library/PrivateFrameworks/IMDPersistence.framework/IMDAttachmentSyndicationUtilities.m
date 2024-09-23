@implementation IMDAttachmentSyndicationUtilities

+ (id)_syndicationIdentifierForAttachmentGUID:(id)a3 messageGUID:(id)a4 attributedBody:(id)a5 verbose:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v18;
  id v19;
  uint64_t v20;

  v6 = a6;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!IMFileTransferGUIDIsTemporary())
  {
    if (v6 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Using existing attachment GUID for syndication identifier. attachmentGUID: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    v16 = v9;
    goto LABEL_18;
  }
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Deriving attachment index because attachment GUID in item dictionary is in legacy format. attachmentGUID: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  if (objc_msgSend(MEMORY[0x1E0D39918], "messagePartIndexForAttachmentMessagePartWithTransferGUID:inBody:", v9, v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v14 = v16;
    goto LABEL_19;
  }
  IMLogHandleForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1ABC5EC6C((uint64_t)v9, v13);

  v14 = 0;
LABEL_19:

  return v14;
}

+ (BOOL)_attachmentGUIDIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCMM:(BOOL)a8 verbose:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  NSObject *v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  unsigned __int8 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v9 = a8;
  v60 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v54 = 1;
  if (v9)
  {
    objc_msgSend(a1, "_attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyndicationRanges:isSyndicatable:verbose:", v15, v16, v19, &v54, a9);
    v20 = v54;
  }
  else
  {
    v38 = v17;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_1ABBE4EF0;
    v52 = sub_1ABBE4F00;
    v53 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = sub_1ABBE4F08;
    v43[3] = &unk_1E5AB8D60;
    v37 = v15;
    v44 = v37;
    v47 = a9;
    v36 = v16;
    v45 = v36;
    v46 = &v48;
    objc_msgSend(v18, "__im_visitMessageParts:", v43);
    v21 = objc_msgSend((id)v49[5], "messagePartRange");
    v23 = v22;
    if (v21 | v22)
    {
      v35 = v15;
      objc_msgSend(MEMORY[0x1E0D39948], "rangesFromSerializedString:", v19);
      v34 = v18;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (objc_msgSend(v28, "messagePartRange") == v21 && v29 == v23)
            {
              v18 = v34;
              v15 = v35;
              v17 = v38;
              if ((objc_msgSend(v28, "syndicationType") & 4) != 0)
              {
                v54 = 0;
                if (a9)
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v56 = v37;
                      _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was explcitly hidden", buf, 0xCu);
                    }

                  }
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v56 = v37;
                      v57 = 2112;
                      v58 = v36;
                      _os_log_impl(&dword_1ABB60000, v32, OS_LOG_TYPE_INFO, "Setting isSyndicatableMedia to be NO because the attachment is flagged as IMMessagePartSyndicationTypeHidden. attachmentGUID: %@ (syndicationIdentifier: %@)", buf, 0x16u);
                    }

                  }
                }
              }

              v20 = v54;
              goto LABEL_30;
            }
          }
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
          if (v25)
            continue;
          break;
        }
      }

      v18 = v34;
      v15 = v35;
      v17 = v38;
    }
    else
    {
      IMLogHandleForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1ABC5ECE0((uint64_t)v37, (uint64_t)v36, v24);
    }
    v20 = 1;
LABEL_30:

    _Block_object_dispose(&v48, 8);
  }

  return v20 != 0;
}

+ (void)_attachmentGUIDForCMMIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 encodedSyndicationRanges:(id)a5 isSyndicatable:(BOOL *)a6 verbose:(BOOL)a7
{
  _BOOL4 v7;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  char v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v7 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0D39948], "rangesFromSerializedString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject assetDescriptor](v15, "assetDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v11;
    if (v16
      && (objc_msgSend(v16, "assetSyndications"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (objc_msgSend(v17, "assetSyndications"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "count"),
          v20,
          v19,
          v21))
    {
      v32 = IMCMMAssetIndexFromIMFileTransferGUID();
      objc_msgSend(v17, "assetSyndications");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      objc_msgSend(v22, "objectForKey:", &unk_1E5ADC078);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23 && -[NSObject count](v23, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKey:](v23, "objectForKey:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v24;
        v27 = v25;

        v28 = -[NSObject intValue](v27, "intValue");
        if (v27)
        {
          if (a6)
          {
            *a6 = (v28 & 4) == 0;
            if (v7)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  v30 = *a6;
                  *(_DWORD *)buf = 138412802;
                  v35 = (const char *)v18;
                  v36 = 2112;
                  v37 = (uint64_t)v33;
                  v38 = 1024;
                  LODWORD(v39) = v30;
                  _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "attachmentGUID %@, syndicationIdentifier %@, isSyndicatable: %d", buf, 0x1Cu);
                }

              }
            }
          }
        }
        else
        {
          IMLogHandleForCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedS"
                  "yndicationRanges:isSyndicatable:verbose:]";
            v36 = 2048;
            v37 = v32;
            v38 = 2112;
            v39 = v23;
            v40 = 2112;
            v41 = v18;
            v42 = 2112;
            v43 = v33;
            _os_log_error_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_ERROR, "%s no syndication found for asset index %li from CMM asset info %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x34u);
          }

        }
      }
      else
      {
        IMLogHandleForCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyn"
                "dicationRanges:isSyndicatable:verbose:]";
          v36 = 2112;
          v37 = (uint64_t)v23;
          v38 = 2112;
          v39 = v18;
          v40 = 2112;
          v41 = v33;
          _os_log_error_impl(&dword_1ABB60000, v27, OS_LOG_TYPE_ERROR, "%s no asset info from CMM asset info %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
        }
      }

    }
    else
    {
      IMLogHandleForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyndi"
              "cationRanges:isSyndicatable:verbose:]";
        v36 = 2112;
        v37 = (uint64_t)v15;
        v38 = 2112;
        v39 = v18;
        v40 = 2112;
        v41 = v33;
        _os_log_error_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_ERROR, "%s no asset syndications from range %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
      }
    }

  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyndica"
            "tionRanges:isSyndicatable:verbose:]";
      v36 = 2112;
      v37 = (uint64_t)v12;
      v38 = 2112;
      v39 = v11;
      v40 = 2112;
      v41 = v33;
      _os_log_error_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_ERROR, "%s no ranges deserialized from encodedSyndicationRanges %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
    }
  }

}

+ (unint64_t)_attachmentSyndicationTypeForAttachmentGUID:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCommSafetySensitive:(BOOL)a8 verbose:(BOOL)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  int IsFileAttachment;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v9 = a8;
  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v16)
  {
LABEL_13:
    v19 = 2;
    goto LABEL_14;
  }
  if ((IMUTITypeIsSupportedByPhotos() & 1) != 0)
  {
    v19 = 1;
    goto LABEL_14;
  }
  IsFileAttachment = IMUTITypeIsFileAttachment();
  if (IsFileAttachment)
    v19 = 0;
  else
    v19 = 2;
  if ((IsFileAttachment & 1) == 0 && a9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = 138412546;
        v27 = (unint64_t)v14;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was an unsupported UTI %@", (uint8_t *)&v26, 0x16u);
      }

    }
    goto LABEL_13;
  }
LABEL_14:
  if (a9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v26 = 134218498;
        v27 = v19;
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "syndicationType == %lu for attachmentGUID %@ based on UTI type %@", (uint8_t *)&v26, 0x20u);
      }

    }
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v26 = 138412290;
          v27 = (unint64_t)v14;
          _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was comm safety sensitive", (uint8_t *)&v26, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = 138412290;
          v27 = (unint64_t)v14;
          _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "Setting syndicationType to be Other because the attachment is flagged as CommSafety sensitive. attachmentGUID: %@", (uint8_t *)&v26, 0xCu);
        }

      }
      v19 = 2;
    }
  }
  else if (v9)
  {
    v19 = 2;
  }

  return v19;
}

+ (unint64_t)syndicationTypeForAttachmentRecord:(id)a3 verbose:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  const __CFArray **v20;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "messageRecord");
  v20 = (const __CFArray **)objc_claimAutoreleasedReturnValue();
  v7 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v20, 0, 0, 0);
  objc_msgSend(v7, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D39948];
  objc_msgSend(v7, "syndicationRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serializedStringFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v12, v13, v8, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "utiString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isCommSafetySensitive");

  LOBYTE(v19) = v4;
  v17 = objc_msgSend(a1, "_attachmentSyndicationTypeForAttachmentGUID:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCommSafetySensitive:verbose:", v12, v14, v15, v8, v11, v16, v19);

  return v17;
}

+ (BOOL)attachmentRecordIsSyndicatable:(id)a3 verbose:(BOOL)a4
{
  uint64_t v4;
  id v6;
  const __CFArray **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "messageRecord");
  v7 = (const __CFArray **)objc_claimAutoreleasedReturnValue();
  v8 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v7, 0, 0, 0);
  objc_msgSend(v8, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D39948];
  objc_msgSend(v8, "syndicationRanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serializedStringFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "guid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v13, v14, v9, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "utiString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = v4;
  LOBYTE(v4) = objc_msgSend(a1, "_attachmentGUIDIsSyndicatable:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCMM:verbose:", v13, v15, v16, v9, v12, 0, v18);

  return v4;
}

@end
