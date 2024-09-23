@implementation MFComposeTypeFactory

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFComposeTypeFactory_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (id)signpostLog_log;
}

void __35__MFComposeTypeFactory_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (void)_prependQuotedMarkup:(id)a3 shouldIndent:(BOOL)a4 toBodyField:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("<BR>"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prependMarkupString:quote:", v7, v5);

}

+ (id)_markupStringForExcludedInlineAttachmentWithFilename:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_stringByEscapingForXML");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<DIV>%@</DIV>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_markupForInlineAttachment:(id)a3 willBeIncluded:(BOOL)a4 prependBlankLine:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v8)
  {
    v12 = objc_msgSend(a1, "imageScaleFromUserDefaults");
    objc_msgSend(v11, "composeWebView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markupStringForCompositionWithPrependedBlankLine:imageScale:useAttachmentElement:", v7, v12, objc_msgSend(v13, "allowsAttachmentElements"));
  }
  else
  {
    objc_msgSend(v10, "fileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_markupStringForExcludedInlineAttachmentWithFilename:", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 signpostID:(unint64_t)a8
{
  objc_msgSend(a1, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:", a3, a4, a5, a6, a7, 0, a8);
}

+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 storeOriginalAttachments:(BOOL)a8 signpostID:(unint64_t)a9
{
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  _BOOL4 v69;
  _BOOL4 v70;
  id obj;
  _BOOL4 v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t i;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  _BOOL4 v83;
  id v84;
  id v85;
  id v86;
  id v87;
  int v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  uint8_t v115[4];
  uint64_t v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v83 = a8;
  v69 = a6;
  v70 = a4;
  v73 = a5;
  v119 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v85 = a7;
  MFMessageComposeLoadingSignpostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a9, "LOAD COMPOSE WEB CONTENT", "Start loading web content enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v85, "composeWebView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = (void *)objc_opt_new();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v68;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
  if (v76)
  {
    v79 = 0;
    v88 = v70 || v83;
    v75 = *(_QWORD *)v106;
    while (1)
    {
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v106 != v75)
          objc_enumerationMutation(obj);
        v80 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v80, "htmlData");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v80, "preferredCharacterSet");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            MFEncodingForCharset();
            v79 = (void *)MFCreateStringWithData();

          }
          else
          {
            v79 = 0;
          }
          objc_msgSend(v80, "attachmentsInDocument");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)v12;
          v25 = objc_msgSend(v24, "count") == 0;

          if (!v25)
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            objc_msgSend(v80, "attachmentsInDocument");
            v86 = (id)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
            if (!v26)
              goto LABEL_36;
            v90 = *(_QWORD *)v102;
            while (1)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v102 != v90)
                  objc_enumerationMutation(v86);
                v28 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
                objc_msgSend(v28, "fileWrapperForcingDownload:", 0);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "preferredFilename");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "mimePart");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "contentID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  objc_msgSend(v89, "setObject:forKeyedSubscript:", v30, v32);
                  if (!v88)
                    goto LABEL_34;
                  objc_msgSend(v29, "contentID");
                  v33 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "mimeType");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "composeWebView");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "compositionContextID");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v29, "regularFileContents");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v83)
                  {
                    objc_msgSend(v82, "addObject:", v29);
                  }
                  else
                  {
                    +[MFAttachmentMarkup attachmentMarkupWithProperties:contentID:mimeType:filename:contextID:](MFAttachmentMarkup, "attachmentMarkupWithProperties:contentID:mimeType:filename:contextID:", v37, v33, v34, v30, v36);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "addObject:", v39);

                  }
                }
                else
                {
                  MFComposeLog();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v30);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    +[MFComposeTypeFactory _setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:].cold.1(v38, v115, &v116, v33);
                  }
                }

LABEL_34:
              }
              v26 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
              if (!v26)
              {
LABEL_36:

                break;
              }
            }
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v80;
            objc_msgSend(v14, "fileWrapperForcingDownload:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "contentID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "preferredFilename");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "mimeType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "composeWebView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "compositionContextID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "regularFileContents");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v88)
            {
              if (v83)
              {
                objc_msgSend(v82, "addObject:", v15);
                v22 = a1;
                goto LABEL_42;
              }
              objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "attachmentForData:mimeType:fileName:contentID:context:", v21, v18, v17, v16, v20);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(a1, "_markupForInlineAttachment:willBeIncluded:prependBlankLine:delegate:", v41, v70, v69, v85);
              v79 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v22 = (void *)objc_opt_class();
LABEL_42:
              objc_msgSend(v22, "_markupStringForExcludedInlineAttachmentWithFilename:", v17);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_45;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_markupForInlineAttachment:willBeIncluded:prependBlankLine:delegate:", v80, v70, v69, v85);
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_47;
            v23 = v80;
          }
          v79 = v23;
        }
LABEL_45:
        if (v79)
        {
          v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<div>%@</div>"), CFSTR("<BR class=\"webkit-block-placeholder\">"));
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __129__MFComposeTypeFactory__setContent_includeAttachments_shouldQuote_prependBlankLine_delegate_storeOriginalAttachments_signpostID___block_invoke;
          v100[3] = &__block_descriptor_40_e5_v8__0l;
          v100[4] = a9;
          objc_msgSend(v77, "appendOrReplace:withMarkupString:quote:completion:", v42, v79, v73, v100);
          goto LABEL_53;
        }
LABEL_47:
        MFMessageComposeLoadingSignpostLog();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (a9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AB96A000, v44, OS_SIGNPOST_INTERVAL_END, a9, "LOAD COMPOSE WEB CONTENT", "Unable to create markup string enableTelemetry=YES ", buf, 2u);
        }

        EMLogCompose();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v45 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v112 = v80;
          v113 = 2114;
          v114 = v45;
          v46 = v45;
          _os_log_impl(&dword_1AB96A000, v42, OS_LOG_TYPE_DEFAULT, "No markup string found for content item: %{public}@ - %{public}@", buf, 0x16u);

        }
        v79 = 0;
LABEL_53:

      }
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
      if (!v76)
        goto LABEL_57;
    }
  }
  v79 = 0;
LABEL_57:

  v87 = (id)objc_opt_new();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v84 = v81;
  v47 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v47)
  {
    v91 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v47; ++k)
      {
        if (*(_QWORD *)v97 != v91)
          objc_enumerationMutation(v84);
        v49 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "attachmentData");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "mimeType");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "filename");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "contentID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "contextID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "attachmentForData:mimeType:fileName:contentID:context:", v51, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "className");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v57, "isEqualToString:", 0x1E5A6A6E8) & 1) != 0
          || objc_msgSend(v57, "isEqualToString:", 0x1E5A6A728))
        {
          objc_msgSend(v87, "addObject:", v49);
        }
        else
        {
          objc_msgSend(v49, "contentID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "removeObjectForKey:", v58);

        }
      }
      v47 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    }
    while (v47);
  }

  objc_msgSend(v77, "setOriginalAttachmentInfo:", v82);
  objc_msgSend(v77, "setReplacementFilenamesByContentID:", v89);
  objc_msgSend(v77, "replaceImagesIfNecessary");
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v59 = v87;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v93 != v61)
          objc_enumerationMutation(v59);
        v63 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * m);
        objc_msgSend(v63, "attachmentData");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "filename");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "mimeType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "contentID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "replaceFilenamePlaceholderWithAttachment:fileName:mimeType:contentID:", v64, v65, v66, v67);

      }
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
    }
    while (v60);
  }

}

void __129__MFComposeTypeFactory__setContent_includeAttachments_shouldQuote_prependBlankLine_delegate_storeOriginalAttachments_signpostID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  MFMessageComposeLoadingSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LOAD COMPOSE WEB CONTENT", "Finished loading web content enableTelemetry=YES ", v5, 2u);
  }

}

+ (void)_quoteFromModel:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  unsigned int v44;
  _BOOL4 v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "legacyMessage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "composeType");
  v8 = objc_msgSend(v5, "composeType") == 4 || objc_msgSend(v5, "composeType") == 5;
  objc_msgSend(v6, "savedHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D1E570];
  objc_msgSend(v9, "headersForKey:", *MEMORY[0x1E0D1E570]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v45 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4D600], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendingEmailAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "signatureMarkupForSendingEmailAddress:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v14, "length") == 0;

  }
  objc_msgSend(v5, "originalContent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "messageBodyIfAvailable");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v48, "isEncrypted");
  if (!v51)
  {
    objc_msgSend(v48, "htmlContent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  MFComposeLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v50, "ef_publicDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v16;
    _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_DEFAULT, "Quoting content from message: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "composeWebView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v17 = objc_msgSend(v5, "includeAttachments");
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("DisableQuoteIncrease"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v8)
      v21 = objc_msgSend(v5, "includeAttachmentsWhenAdding");
    else
      v21 = 0;
    v22 = v20 ^ 1u;
    objc_msgSend(a1, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:", v51, v17, v22, 0, v6, v21, objc_msgSend(v5, "signpostID"));
    objc_msgSend(v49, "addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:shouldQuote:", 0, v22);
    if (v7 == 6)
    {
      objc_msgSend(v50, "headersIfAvailable");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "markupString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_prependQuotedMarkup:shouldIndent:toBodyField:", v24, v20 ^ 1u, v49);

      objc_msgSend(MEMORY[0x1E0D4D588], "forwardedMessagePrefixWithSpacer:", v45);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "prependPreamble:quote:", v25, 0);

    }
    else
    {
      objc_msgSend(v50, "senders");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ef_map:", &__block_literal_global_13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "count"))
      {
        if (objc_msgSend(v23, "count") == 1)
        {
          objc_msgSend(v50, "headers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "headersForKey:", v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", v29, 0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC40]);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v43 = v30;
              v31 = objc_alloc(MEMORY[0x1E0D1E6C0]);
              objc_msgSend(v23, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v31, "initWithString:", v32);

              objc_msgSend(v33, "displayName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v43);

              v36 = v35;
              if (v34)
                objc_msgSend(v35, "setDisplayName:", v34);
              objc_msgSend(v35, "stringValue");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v37;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
              v38 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v38;
              v30 = v43;
            }

          }
        }
        objc_msgSend(v50, "dateSent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "mf_replyPrefixForSender:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "prependPreamble:quote:", v41, v22);

        if (v45)
          objc_msgSend(v49, "prependString:", CFSTR("\n"));
      }
    }

  }
  if (!v11 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "addSignature:", 1);
  objc_msgSend(v5, "messageBody");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
    objc_msgSend(v49, "prependMarkupString:quote:", v42, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "contentDidChange");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setOriginalMessageWasEncrypted:", v44);

}

id __49__MFComposeTypeFactory__quoteFromModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)headersFromDelegate:(id)a3
{
  objc_msgSend(a1, "headersFromDelegate:originatingBundleID:sourceAccountManagement:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)headersFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  BOOL v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  id obj;
  void *v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v5 = *(_QWORD *)&a5;
  v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v72 = a4;
  v73 = v7;
  v8 = objc_alloc_init(MEMORY[0x1E0D46110]);
  objc_msgSend(v7, "savedHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v9, "allHeaderKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v79 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v10, "firstHeaderForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v8, "setHeader:forKey:", v16, v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(v73, "subject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_msgSend(v73, "subject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeader:forKey:", v19, *MEMORY[0x1E0D1E5F8]);

  }
  objc_msgSend(v73, "toRecipients");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") == 0;

  if (!v21)
  {
    objc_msgSend(v73, "toRecipients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddressListForTo:", v22);

  }
  objc_msgSend(v73, "ccRecipients");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") == 0;

  if (!v24)
  {
    objc_msgSend(v73, "ccRecipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddressListForCc:", v25);

  }
  objc_msgSend(v73, "bccRecipients");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count") == 0;

  if (!v27)
  {
    objc_msgSend(v73, "bccRecipients");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddressListForBcc:", v28);

  }
  objc_msgSend(v73, "accountProxyGenerator");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sendingEmailAddress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(v71, "defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:", v72, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "firstEmailAddress");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fullUserName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1E6C0], "componentsWithString:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDisplayName:", v33);
      objc_msgSend(v34, "stringValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }

  }
  v35 = v29;
  objc_msgSend(v35, "emailAddressValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "displayName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = v37;
  }
  else
  {
    objc_msgSend(v35, "stringValue");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v39;

  v41 = objc_msgSend(v40, "length");
  v42 = v41 == objc_msgSend(v35, "length");

  if (v42)
  {
    objc_msgSend(v71, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v35, 0, v72, v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v69 = v43;
    if (!v43)
    {
LABEL_50:

      goto LABEL_51;
    }
    objc_msgSend(v43, "fullUserName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "fromEmailAddresses");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "count"))
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      obj = v67;
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v75;
        while (2)
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v75 != v46)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
            objc_msgSend(v48, "emailAddressValue");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "emailAddressValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v49, "compare:", v50) == 0;

            if (v51)
            {
              v52 = v48;

              v35 = v52;
              goto LABEL_41;
            }
          }
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (v45)
            continue;
          break;
        }
      }
LABEL_41:

    }
    v35 = v35;
    objc_msgSend(v35, "emailAddressValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "displayName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54)
    {
      v56 = v54;
    }
    else
    {
      objc_msgSend(v35, "stringValue");
      v56 = (id)objc_claimAutoreleasedReturnValue();
    }
    v57 = v56;

    v58 = objc_msgSend(v57, "length");
    if (v58 == objc_msgSend(v35, "length"))
    {
      v59 = objc_msgSend(v68, "length") == 0;

      if (v59)
      {
LABEL_49:

        goto LABEL_50;
      }
      v60 = (void *)MEMORY[0x1E0D1E6C0];
      objc_msgSend(v35, "emailAddressValue");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsWithEmailAddress:", v61);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "setDisplayName:", v68);
      objc_msgSend(v57, "stringValue");
      v62 = objc_claimAutoreleasedReturnValue();

      v35 = (id)v62;
    }

    goto LABEL_49;
  }
LABEL_51:
  if (objc_msgSend(v35, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v35);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddressListForSender:", v63);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "ec_descriptionForMimeHeaders");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeader:forKey:", v65, *MEMORY[0x1E0D1E560]);

  return v8;
}

+ (void)_sanitizeRecipientsForComposeType:(unint64_t)a3 sendingAddress:(id)a4 delegate:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t m;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t n;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t ii;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  char v76;
  void *v77;
  char v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v70 = a4;
  v71 = a5;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v71, "toRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v71, "ccRecipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v71, "bccRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v71, "toRecipients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v16)
  {
    v76 = 0;
    v17 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v97 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
        if ((objc_msgSend(v77, "containsObject:", v19) & 1) != 0)
          v76 = 1;
        else
          objc_msgSend(v77, "addObject:", v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v16);
  }
  else
  {
    v76 = 0;
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(v71, "ccRecipients");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  if (v21)
  {
    v78 = 0;
    v22 = *(_QWORD *)v93;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v93 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
        if ((objc_msgSend(v11, "containsObject:", v24) & 1) != 0)
          v78 = 1;
        else
          objc_msgSend(v11, "addObject:", v24);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    }
    while (v21);
  }
  else
  {
    v78 = 0;
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v71, "bccRecipients");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v26)
  {
    v79 = 0;
    v27 = *(_QWORD *)v89;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v89 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * k);
        if ((objc_msgSend(v14, "containsObject:", v29) & 1) != 0)
          v79 = 1;
        else
          objc_msgSend(v14, "addObject:", v29);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v26);
  }
  else
  {
    v79 = 0;
  }

  if (a3 == 5)
  {
    v30 = v70;
    objc_msgSend(v30, "emailAddressValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "simpleAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v72 = v32;
    }
    else
    {
      objc_msgSend(v30, "stringValue");
      v72 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v71, "savedHeaders");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "headersForKey:", *MEMORY[0x1E0D1E570]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v11, "count");
    if (v36)
    {
      for (m = v36 - 1; m != -1; --m)
      {
        if (v35)
        {
          objc_msgSend(v11, "objectAtIndex:", m);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "emailAddressValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "displayName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
            goto LABEL_47;
        }
        else
        {
          objc_msgSend(v11, "objectAtIndex:", m);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "emailAddressValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "simpleAddress");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
LABEL_47:
            v41 = v40;
            v40 = v41;
            goto LABEL_48;
          }
        }
        objc_msgSend(v38, "stringValue");
        v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
        v42 = v41;

        if (!objc_msgSend(v42, "caseInsensitiveCompare:", v72))
        {
          objc_msgSend(v11, "removeObjectAtIndex:", m);
          v78 = 1;
        }

      }
    }
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v77;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
    if (!v43)
      goto LABEL_87;
    v74 = *(_QWORD *)v85;
LABEL_55:
    v75 = v43;
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v85 != v74)
        objc_enumerationMutation(obj);
      v45 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * v44);
      objc_msgSend(v45, "emailAddressValue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "simpleAddress");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
      {
        v49 = v47;
      }
      else
      {
        objc_msgSend(v45, "stringValue");
        v49 = (id)objc_claimAutoreleasedReturnValue();
      }
      v50 = v49;

      v51 = objc_msgSend(v11, "count");
      if (v51)
      {
        for (n = v51 - 1; n != -1; --n)
        {
          if (v35)
          {
            objc_msgSend(v11, "objectAtIndex:", n);
            v53 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "emailAddressValue");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "displayName");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
              goto LABEL_67;
          }
          else
          {
            objc_msgSend(v11, "objectAtIndex:", n);
            v53 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "emailAddressValue");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "simpleAddress");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {
LABEL_67:
              v56 = v55;
              v55 = v56;
              goto LABEL_68;
            }
          }
          objc_msgSend(v53, "stringValue");
          v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:
          v57 = v56;

          if (!objc_msgSend(v57, "caseInsensitiveCompare:", v50))
          {
            objc_msgSend(v11, "removeObjectAtIndex:", n);
            v78 = 1;
          }

        }
      }
      v58 = objc_msgSend(v14, "count");
      if (v58)
        break;
LABEL_85:

      if (++v44 == v75)
      {
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
        if (!v43)
        {
LABEL_87:

          goto LABEL_88;
        }
        goto LABEL_55;
      }
    }
    v59 = v58 - 1;
    while (1)
    {
      if (v35)
      {
        objc_msgSend(v14, "objectAtIndex:", v59);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "emailAddressValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "displayName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
          goto LABEL_79;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndex:", v59);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "emailAddressValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "simpleAddress");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
LABEL_79:
          v63 = v62;
          v62 = v63;
          goto LABEL_80;
        }
      }
      objc_msgSend(v60, "stringValue");
      v63 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:
      v64 = v63;

      if (!objc_msgSend(v64, "caseInsensitiveCompare:", v50))
      {
        objc_msgSend(v14, "removeObjectAtIndex:", v59);
        v79 = 1;
      }

      if (--v59 == -1)
        goto LABEL_85;
    }
  }
LABEL_88:
  if (objc_msgSend(v14, "count"))
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v65 = v11;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v81;
      do
      {
        for (ii = 0; ii != v66; ++ii)
        {
          if (*(_QWORD *)v81 != v67)
            objc_enumerationMutation(v65);
          v69 = objc_msgSend(v14, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * ii));
          if (v69 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v14, "removeObjectAtIndex:", v69);
            v79 = 1;
          }
        }
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
      }
      while (v66);
    }

  }
  if ((v76 & 1) != 0)
    objc_msgSend(v71, "setToRecipients:", v77);
  if ((v78 & 1) != 0)
    objc_msgSend(v71, "setCcRecipients:", v11);
  if ((v79 & 1) != 0)
    objc_msgSend(v71, "setBccRecipients:", v14);

}

+ (BOOL)alwaysBCCSelf
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D1DFF8]);

  return v3;
}

+ (id)bccSelfAddressForDelegate:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D4D620];
  objc_msgSend(a3, "sendingEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountContainingEmailAddress:includingInactive:", v4, 1);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v5;
  if (v5
    || (objc_msgSend(MEMORY[0x1E0D4D620], "defaultMailAccountForDelivery"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v6, "emailAddressStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fullUserName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D1E6C0];
    objc_msgSend(v8, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsWithEmailAddress:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setDisplayName:", v9);
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)_mergeModel:(id)a3 withDelegate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;

  v30 = a3;
  v5 = a4;
  objc_msgSend(v30, "toRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "toRecipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v5, "toRecipients");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v30, "toRecipients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v12);

    }
    else
    {
      objc_msgSend(v30, "toRecipients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setToRecipients:", v11);

  }
  objc_msgSend(v30, "ccRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v5, "ccRecipients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v5, "ccRecipients");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v30, "ccRecipients");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v19);

    }
    else
    {
      objc_msgSend(v30, "ccRecipients");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setCcRecipients:", v18);

  }
  objc_msgSend(v30, "bccRecipients");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    objc_msgSend(v5, "bccRecipients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend(v5, "bccRecipients");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v30, "bccRecipients");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObjectsFromArray:", v26);

    }
    else
    {
      objc_msgSend(v30, "bccRecipients");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setBccRecipients:", v25);

  }
  objc_msgSend(v30, "subject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v28)
  {
    objc_msgSend(v30, "subject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubject:", v29);

  }
}

+ (void)_updateDelegate:(id)a3 toRecipients:(id)a4 ccRecipients:(id)a5 bccRecipients:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v21, "toRecipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "addObjectsFromArray:", v9);
    objc_msgSend(v13, "ef_map:", &__block_literal_global_63);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setToRecipients:", v14);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v21, "ccRecipients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "addObjectsFromArray:", v10);
    objc_msgSend(v16, "ef_map:", &__block_literal_global_64);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCcRecipients:", v17);

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v21, "bccRecipients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "addObjectsFromArray:", v11);
    objc_msgSend(v19, "ef_map:", &__block_literal_global_65);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBccRecipients:", v20);

  }
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_setupForReplyWithModel:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v74 = a1;
  objc_msgSend(a1, "_mergeModel:withDelegate:", v6, v7);
  objc_msgSend(v6, "legacyMessage");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "headersIfAvailable");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAddressStrings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v76, "firstSender");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v75, "containsObject:", v15);
  if (v16)
  {
    v17 = (void *)objc_msgSend(v77, "copyAddressListForReplyTo");
    objc_msgSend(v17, "ef_map:", &__block_literal_global_66);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    objc_msgSend(v76, "to");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ef_map:", &__block_literal_global_67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    objc_msgSend(v76, "firstSender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "firstSender");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSendingEmailAddress:", v24);

    v25 = objc_msgSend(v19, "count");
    v26 = v19;
    if (v25)
      goto LABEL_17;
    objc_msgSend(v22, "ef_map:", &__block_literal_global_68);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v23;
    objc_msgSend(v28, "emailAddressValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "simpleAddress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      objc_msgSend(v28, "stringValue");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v32;

    v39 = objc_msgSend(v27, "containsObject:", v38);
    v26 = v22;
    if (!v39)
    {
LABEL_17:
      objc_msgSend(v7, "setToRecipients:", v26);
    }
    else
    {
      v88[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setToRecipients:", v40);

    }
  }
  else
  {
    v33 = (void *)objc_msgSend(v77, "copyAddressListForReplyTo");
    if (objc_msgSend(v33, "count"))
    {
      v34 = v33;
    }
    else
    {
      objc_msgSend(v7, "toRecipients");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36)
      {
        v34 = 0;
      }
      else
      {
        v37 = (void *)objc_msgSend(v77, "copyAddressListForReplyTo");
        if (objc_msgSend(v37, "count"))
        {
          v34 = v37;
        }
        else
        {
          objc_msgSend(v76, "senders");
          v41 = objc_claimAutoreleasedReturnValue();

          v34 = (id)v41;
        }
      }
    }
    objc_msgSend(v74, "_updateDelegate:toRecipients:ccRecipients:bccRecipients:", v7, v34, 0, 0);

  }
  objc_msgSend(v7, "subject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length") == 0;

  if (v43)
  {
    objc_msgSend(v76, "subject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "subjectWithoutPrefix");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E7A8], "nonLocalizedReplyPrefix");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _subjectWithPrefix(v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSubject:", v47);
  }
  objc_msgSend(v77, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    v50 = v48;
  }
  else
  {
    objc_msgSend(v77, "firstHeaderForKey:", *MEMORY[0x1E0D1E588]);
    v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = v50;
  v52 = *MEMORY[0x1E0D1E570];
  objc_msgSend(v77, "firstHeaderForKey:", *MEMORY[0x1E0D1E570]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalMessage");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "serializedRepresentation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "references");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v49)
  {
    if (!v56)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v49);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
        goto LABEL_30;
      goto LABEL_32;
    }
    objc_msgSend(v56, "arrayByAddingObject:", v49);
    v58 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v58;
  }
  if (!v51)
  {
LABEL_30:
    if (!v57 && !v53)
      goto LABEL_41;
  }
LABEL_32:
  v59 = objc_alloc_init(MEMORY[0x1E0D46110]);
  v60 = v59;
  if (v51)
    objc_msgSend(v59, "setHeader:forKey:", v51, *MEMORY[0x1E0D1E588]);
  if (v55)
  {
    objc_msgSend(v55, "base64EncodedDataWithOptions:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setHeader:forKey:", v61, *MEMORY[0x1E0D45F18]);

  }
  if (v53)
    objc_msgSend(v60, "setHeader:forKey:", v53, v52);
  if (v57)
    objc_msgSend(v60, "setReferences:", v57);
  objc_msgSend(v7, "setSavedHeaders:", v60);

LABEL_41:
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__2;
  v86 = __Block_byref_object_dispose__2;
  v87 = 0;
  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v83[5];
    v83[5] = v63;

    objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_79;
    v78[3] = &unk_1E5A665D8;
    v79 = v53;
    v80 = v7;
    v81 = &v82;
    objc_msgSend(v65, "isAvailable:", v78);

  }
  else
  {
    objc_msgSend(v76, "preferredEmailAddressToReplyWith");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v83[5];
    v83[5] = v66;

    v68 = v83[5];
    if (!v68)
    {
      objc_msgSend(v6, "preferredSendingEmailAddress");
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)v83[5];
      v83[5] = v69;

      v68 = v83[5];
    }
    objc_msgSend(v7, "setSendingEmailAddress:", v68);
  }
  if (objc_msgSend(v6, "isQuickReply"))
    objc_msgSend(v7, "setIsQuickReply:", 1);
  objc_msgSend(v7, "composeWebView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    objc_msgSend(v74, "_quoteFromModel:delegate:", v6, v7);
  if (objc_msgSend(v6, "composeType") == 4 || objc_msgSend(v6, "composeType") == 5)
  {
    v72 = objc_msgSend(v6, "composeType");
    objc_msgSend(v74, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", v72, v83[5], v7);
  }

  _Block_object_dispose(&v82, 8);
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

void __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_79(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", *(_QWORD *)(a1 + 32), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSendingEmailAddressAsHME:isComposeTypeReply:", v7, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forwardingEmailForPrimaryAccount");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(a1 + 40), "setSendingEmailAddress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

+ (void)_setupForForwardWithModel:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(a1, "_mergeModel:withDelegate:", v24, v6);
  objc_msgSend(v24, "legacyMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(v7, "subject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subjectWithoutPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E7A8], "nonLocalizedForwardPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _subjectWithPrefix(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSubject:", v13);
  }
  objc_msgSend(v24, "originalMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serializedRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "headersIfAvailable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D46110]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setReferences:", v20);

    if (v16)
    {
      objc_msgSend(v16, "base64EncodedDataWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHeader:forKey:", v21, *MEMORY[0x1E0D45F00]);

    }
    objc_msgSend(v6, "setSavedHeaders:", v19);

  }
  objc_msgSend(v7, "preferredEmailAddressToReplyWith");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v24, "preferredSendingEmailAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setSendingEmailAddress:", v22);
  objc_msgSend(v6, "composeWebView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(a1, "_quoteFromModel:delegate:", v24, v6);
  objc_msgSend(a1, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", objc_msgSend(v24, "composeType"), v22, v6);

}

+ (void)_setupForReplyAllWithModel:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(a1, "_setupForReplyWithModel:delegate:", v7, v6);
  objc_msgSend(a1, "setupSwitchToReplyAllWithModel:delegate:", v7, v6);

}

+ (void)setupSwitchToReplyAllWithModel:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;

  v40 = a3;
  v6 = a4;
  objc_msgSend(v40, "legacyMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "to");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cc");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "ec_emailAddressConvertiblesSetFromArray:includeInvalid:", v8, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E20];
  v36 = (void *)v9;
  objc_msgSend(v6, "toRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ec_emailAddressConvertiblesSetFromArray:includeInvalid:", v11, 1);
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mailbox");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emailAddressStrings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstSender");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emailAddressValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "simpleAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(v15, "stringValue");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  objc_msgSend(v6, "savedHeaders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "headersForKey:", *MEMORY[0x1E0D1E570]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v14, "containsObject:", v20))
  {
    if (v8 && !v22)
      objc_msgSend(v39, "addObjectsFromArray:", v8);
    if (v38)
      objc_msgSend(v39, "addObjectsFromArray:", v38);
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v26 = v20;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "preferredEmailAddressToReplyWith");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(v40, "preferredSendingEmailAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = v27;
      objc_msgSend(v28, "emailAddressValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "simpleAddress");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        objc_msgSend(v28, "stringValue");
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;

      v26 = v28;
      v25 = v28;
      v20 = v33;
    }
    goto LABEL_23;
  }
  if (v38)
    objc_msgSend(v39, "addObjectsFromArray:", v38);
  objc_msgSend(v36, "unionSet:", v34, v34);
  if (v8 && (objc_msgSend(v36, "isEqual:", v34) & 1) == 0)
  {
    objc_msgSend(v6, "toRecipients");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ef_map:", &__block_literal_global_82);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObjectsFromArray:", v24);

    objc_msgSend(v36, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ef_map:", &__block_literal_global_83);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObjectsFromArray:", v26);
LABEL_23:

  }
  objc_msgSend(a1, "_updateDelegate:toRecipients:ccRecipients:bccRecipients:", v6, v37, v39, 0, v34);
  objc_msgSend(a1, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", objc_msgSend(v40, "composeType"), v20, v6);

}

id __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

id __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v2;
  v6 = v4;

  return v6;
}

+ (void)setupSwitchToReplyWithModel:(id)a3 delegate:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setCcRecipients:", 0);
  objc_msgSend(v4, "setBccRecipients:", 0);

}

+ (void)_setupForNewMessageWithModel:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SEL v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37 = a1;
  objc_msgSend(a1, "_mergeModel:withDelegate:", v7, v8);
  objc_msgSend(v7, "preferredSendingEmailAddress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideMyEmailFrom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v7, "hideMyEmailFrom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHideMyEmailAddressForMailToURLAddressString:", v11);

    objc_msgSend(v7, "hideMyEmailFrom");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v12;
  }
  else
  {
    v13 = v38;
  }
  v39 = v13;
  objc_msgSend(v8, "setSendingEmailAddress:");
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v15 = objc_msgSend(v8, "contentVariationIndex"), v15 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v7, "contentVariations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v21;
    objc_msgSend(v21, "body");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MFMailCompositionContext processMessageBody:asHTML:](_MFMailCompositionContext, "processMessageBody:asHTML:", v22, objc_msgSend(v21, "bodyIsHTML"));
    v23 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v23;
    if (v23)
      objc_msgSend(v14, "addObject:", v23);
    objc_msgSend(v7, "attachmentContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v36, "attachmentIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = a2;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v41;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v25);
          objc_msgSend(v24, "attachmentForHostIdentifier:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v28));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v14, "addObject:", v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v34, v37, CFSTR("MFComposeTypeFactory.m"), 946, CFSTR("Unexpected found nil attachment for host identifier."));

          }
          ++v28;
        }
        while (v26 != v28);
        v31 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v26 = v31;
      }
      while (v31);
    }

  }
  else
  {
    objc_msgSend(v7, "messageBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v14, "addObject:", v16);
    objc_msgSend(v7, "deferredAttachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      objc_msgSend(v7, "attachments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v19);

    }
  }
  objc_msgSend(v37, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:signpostID:", v14, 1, 0, 1, v8, objc_msgSend(v7, "signpostID"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "addSignature:", 0);
  if (objc_msgSend(v7, "originatingFromAttachmentMarkup"))
  {
    objc_msgSend(v7, "legacyMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "preferredEmailAddressToReplyWith");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      objc_msgSend(v7, "preferredSendingEmailAddress");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setSendingEmailAddress:", v33);

  }
  objc_msgSend(v37, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", objc_msgSend(v7, "composeType"), v39, v8);

}

+ (void)addAttachment:(id)a3 prepend:(BOOL)a4 withCompositionModel:(id)a5 delegate:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a4;
  v15 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v8 && objc_msgSend(v10, "composeType") == 0;
  objc_msgSend(a1, "_markupForInlineAttachment:willBeIncluded:prependBlankLine:delegate:", v15, 1, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v11, "composeWebView");
    if (v8)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "prependMarkupString:quote:", v13, 0);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendMarkupString:quote:", v13, 0);
    }

  }
}

+ (unint64_t)imageScaleFromUserDefaults
{
  void *v2;
  unint64_t v3;

  if (!objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "mf_copyCompositionServicesPreferenceValueForKey:", *MEMORY[0x1E0D4D7F0]);
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

+ (void)setupWithCompositionModel:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v6, "composeType"))
  {
    case 0:
      objc_msgSend(a1, "_setupForNewMessageWithModel:delegate:", v6, v7);
      break;
    case 4:
      objc_msgSend(a1, "_setupForReplyWithModel:delegate:", v6, v7);
      break;
    case 5:
      objc_msgSend(a1, "_setupForReplyAllWithModel:delegate:", v6, v7);
      break;
    case 6:
      objc_msgSend(a1, "_setupForForwardWithModel:delegate:", v6, v7);
      break;
    default:
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = objc_msgSend(v6, "composeType");
        _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled composition case: %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }

}

+ (void)setupWithContent:(id)a3 delegate:(id)a4 signpostID:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(a1, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:signpostID:", v9, 1, 0, 0, v8, a5);
  objc_msgSend(v8, "composeWebView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:shouldQuote:", 1, 0);

}

+ (id)messageFromDelegate:(id)a3 withSubstituteDOMDocument:(id)a4 compositionSpecification:(id)a5 originatingBundleID:(id)a6 sourceAccountManagement:(int)a7 writeAttachmentPlaceholders:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  BOOL v33;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFComposeTypeFactory.m"), 1036, CFSTR("Current thread must be main"));

  }
  objc_msgSend(v14, "composeWebView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shouldCreateRichTextRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke;
  v26[3] = &unk_1E5A666B0;
  v31 = a1;
  v19 = v14;
  v27 = v19;
  v20 = v16;
  v28 = v20;
  v32 = a7;
  v21 = v15;
  v29 = v21;
  v33 = a8;
  v22 = v17;
  v30 = v22;
  objc_msgSend(v18, "then:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  id *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v3 = objc_msgSend(a2, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 64), "headersFromDelegate:originatingBundleID:sourceAccountManagement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5A8]), "initWithCompositionSpecification:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setShouldWriteAttachmentPlaceholders:", *(unsigned __int8 *)(a1 + 76));
  objc_msgSend(v4, "firstSenderAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass() & 1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "future");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 56);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_2;
    v21[3] = &unk_1E5A66620;
    v22 = *(id *)(a1 + 32);
    v26 = v8;
    v23 = v5;
    v24 = v4;
    v12 = v9;
    v25 = v12;
    objc_msgSend(v11, "getHTMLDataObject:", v21);
    v13 = &v22;
    v14 = &v23;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "plainTextContent");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_3;
    v17[3] = &unk_1E5A66648;
    v20 = v8;
    v18 = v5;
    v19 = v4;
    objc_msgSend(v12, "then:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &v18;
    v14 = &v19;
  }

  objc_msgSend(v10, "then:", &__block_literal_global_105);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  objc_msgSend(v33, "htmlString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "otherHTMLStringsAndAttachments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "plainTextAlternative");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "composeWebView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "compositionContextID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentsForContext:", v9);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
LABEL_6:
    v10 = v35;
    goto LABEL_38;
  }
  v38 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v32 = a1;
  if (v35)
  {
    objc_msgSend(v35, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v5);

    objc_msgSend(v35, "charset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v12)
  {

    goto LABEL_33;
  }
  v13 = *(_QWORD *)v40;
  v37 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "addObject:", v15);
        continue;
      }
      v16 = v15;
      v17 = v16;
      if (!v6)
      {
        objc_msgSend(v16, "charset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v18);

      objc_msgSend(v17, "charset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "encoding");
      LOBYTE(v20) = v20 == objc_msgSend(v6, "encoding");

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v17, "charset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "encoding") == 4)
        {
          v22 = objc_msgSend(v6, "encoding") == 1;

          if (v22)
          {
            objc_msgSend(v17, "charset");
            v23 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v23;
            goto LABEL_27;
          }
        }
        else
        {

        }
        objc_msgSend(v17, "charset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "encoding") == 1)
        {
          v25 = objc_msgSend(v6, "encoding") == 4;

          if (v25)
            goto LABEL_27;
        }
        else
        {

        }
        v37 = 0;
      }
LABEL_27:

    }
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v12);

  if ((v37 & 1) == 0)
  {
    v26 = (uint64_t)v35;
    v3 = v11;
    goto LABEL_37;
  }
LABEL_33:
  objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E700]), "initWithString:charset:", v27, v6);
    v28 = v35;
  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E700]), "initWithString:charset:", v27, v6);
    v26 = 0;
    objc_msgSend(v4, "insertObject:atIndex:", v28, 0);
  }

  v3 = v4;
LABEL_37:

  v10 = (void *)v26;
  a1 = v32;
LABEL_38:
  v36 = v10;
  v29 = (void *)objc_msgSend(*(id *)(a1 + 40), "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:");
  v30 = *(void **)(a1 + 56);
  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v29);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finishWithError:", v31);

  }
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48) && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v7)
            {
              objc_msgSend(v11, "string");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "appendString:withQuoteLevel:", v12, 0);

            }
            else
            {
              v7 = v11;
            }
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v18);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "createMessageWithPlainTextDocumentsAndAttachments:headers:", v4, *(_QWORD *)(a1 + 40), (_QWORD)v18);
  v14 = (void *)MEMORY[0x1E0D1EEC0];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "setDateSentAsTimeIntervalSince1970:");

  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)messageFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  objc_msgSend(a1, "messageFromDelegate:withSubstituteDOMDocument:compositionSpecification:originatingBundleID:sourceAccountManagement:writeAttachmentPlaceholders:", a3, 0, 0, a4, *(_QWORD *)&a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)hijackThreadFromDelegate:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "savedHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHeaderForKey:", *MEMORY[0x1E0D1E588]);
  objc_msgSend(v3, "setReferences:", 0);
  objc_msgSend(v4, "setSavedHeaders:", v3);

}

+ (id)subjectFromSubject:(id)a3 withComposeType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)(a4 - 4) >= 2)
  {
    if (a4 != 6)
    {
      v9 = v5;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D1E7A8], "nonLocalizedForwardPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _subjectWithPrefix(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E7A8], "nonLocalizedReplyPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _subjectWithPrefix(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v8;

LABEL_7:
  return v9;
}

+ (void)_setContent:(_QWORD *)a3 includeAttachments:(os_log_t)log shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:.cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Unable to find content ID for MIME attachment: %{public}@", buf, 0xCu);

}

@end
