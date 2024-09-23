@implementation ICAddAttachmentsManager

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_58);
  return (id)sharedManager_sharedManager;
}

void __40__ICAddAttachmentsManager_sharedManager__block_invoke()
{
  ICAddAttachmentsManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICAddAttachmentsManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  ICAddAttachmentsManager *v68;
  id v69;
  void *v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v9 = a5;
  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x1E0D63B10];
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultFolderInContext:", v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v17;
  }
  v20 = (void *)objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v13);
  v21 = v20;
  if (v9)
    objc_msgSend(v20, "markAsSystemPaperIfNeeded:", 1);
  objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Saved attachment to new note"));
  v74 = v13;
  if (objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
  {
    v22 = v21;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[ICAddAttachmentsManager styleForTitleLength:](self, "styleForTitleLength:", objc_msgSend(v24, "length"));

    objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v26, *MEMORY[0x1E0D63928]);

    v27 = (void *)MEMORY[0x1E0D64238];
    objc_msgSend(v14, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "rangeForTitleInContent:truncated:", v28, 0);
    v31 = v30;

    if (v29 != 0x7FFFFFFFFFFFFFFFLL && v29 + v31 <= (unint64_t)objc_msgSend(v14, "length"))
    {
      v32 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v32, "addAttributes:range:", v23, v29, v31);
      v33 = objc_msgSend(v32, "copy");

      v14 = (id)v33;
    }
    v34 = v74;

    v35 = v22;
    goto LABEL_11;
  }
  v69 = v12;
  v70 = v21;
  v68 = self;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v12;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (!v37)
  {
    v72 = 0;
    v73 = 0;
LABEL_29:

    v56 = 0;
    v34 = v74;
    v35 = v70;
    goto LABEL_32;
  }
  v38 = v37;
  v72 = 0;
  v73 = 0;
  v39 = *(_QWORD *)v76;
  v40 = *MEMORY[0x1E0CEC520];
  v67 = v15;
LABEL_14:
  v41 = 0;
  while (1)
  {
    if (*(_QWORD *)v76 != v39)
      objc_enumerationMutation(obj);
    v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v41);
    objc_msgSend(v42, "attachment", v67);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      objc_msgSend(v42, "attachment");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v56;
      goto LABEL_31;
    }
    objc_msgSend(v42, "mediaUTI");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
      break;
    v47 = (void *)v46;
    v48 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v42, "mediaUTI");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "typeWithIdentifier:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "conformsToType:", v40);

    if (!v51)
      break;
    ++v72;
LABEL_24:
    if (v38 == ++v41)
    {
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      v15 = v67;
      if (v38)
        goto LABEL_14;
      goto LABEL_29;
    }
  }
  v52 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v42, "mediaUTI");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = objc_msgSend(v52, "typeUTIIsPlayableMovie:", v53);

  if ((_DWORD)v52)
  {
    ++v73;
    goto LABEL_24;
  }
  objc_msgSend(v42, "title");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "length");

  if (!v55)
    goto LABEL_24;
  objc_msgSend(v42, "attachment");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  objc_msgSend(v42, "title");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v67;
  v34 = v74;
  v35 = v70;
  if (v57)
    goto LABEL_49;
LABEL_32:
  if (v72)
  {
    if (v73)
    {
      v58 = (void *)MEMORY[0x1E0D64218];
      if (v72 == 1)
      {
        if (v73 == 1)
          v59 = CFSTR("Saved Photo and Saved Video");
        else
          v59 = CFSTR("Saved Photo and Saved Videos");
      }
      else if (v73 == 1)
      {
        v59 = CFSTR("Saved Photos and Saved Video");
      }
      else
      {
        v59 = CFSTR("Saved Photos and Saved Videos");
      }
    }
    else
    {
      v58 = (void *)MEMORY[0x1E0D64218];
      if (v72 == 1)
        v59 = CFSTR("Saved Photo");
      else
        v59 = CFSTR("Saved Photos");
    }
LABEL_48:
    objc_msgSend(v58, "localizedFrameworkStringForKey:value:table:allowSiri:", v59, v59, 0, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
LABEL_49:
      v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKey:", v61, *MEMORY[0x1E0D63928]);

      if (v56)
      {
        v62 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v56, "urlString");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "URLWithString:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v64, "ic_isMapURL"))
          objc_msgSend(v60, "setObject:forKey:", v64, *MEMORY[0x1E0DC1160]);

      }
      v35 = v70;
      objc_msgSend(v70, "textStorage");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v57, v60);
      objc_msgSend(v65, "appendAttributedString:", v66);

      v34 = v74;
    }
  }
  else if (v73)
  {
    v58 = (void *)MEMORY[0x1E0D64218];
    if (v73 == 1)
      v59 = CFSTR("Saved Video");
    else
      v59 = CFSTR("Saved Videos");
    goto LABEL_48;
  }

  self = v68;
  v12 = v69;
LABEL_11:
  -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:](self, "saveAttachments:toNote:textBefore:textAfter:fetchFirst:", v12, v35, v14, v15, 0);

  return v35;
}

- (unsigned)styleForTitleLength:(int64_t)a3
{
  unsigned int result;

  result = +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle");
  if (result < 3 && a3 > 64)
    return 3;
  return result;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6
{
  -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:](self, "saveAttachments:toNote:textBefore:textAfter:fetchFirst:", a3, a4, a5, a6, 1);
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  ICTextController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  ICTextController *v120;
  id v121;
  id v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  id obj;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint8_t v131;
  _BYTE v132[7];
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint8_t buf[4];
  id v139;
  _BYTE v140[128];
  uint64_t v141;

  v7 = a7;
  v141 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v122 = a5;
  v121 = a6;
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v13, "refreshAllOfNoteWithIdentifier:context:", v14, v16);

  }
  v18 = objc_alloc_init(ICTextController);
  -[ICTextController setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:](v18, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:", v12, 0, 0);
  objc_msgSend(v12, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v18;
  objc_msgSend(v19, "setStyler:", v18);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModificationDate:", v20);

  if (objc_msgSend(v122, "length"))
  {
    objc_msgSend(v12, "textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "paragraphRangeForRange:", objc_msgSend(v23, "length"), 0);
    v25 = v24;

    if (v25)
    {
      objc_msgSend(v12, "textStorage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "replaceCharactersInRange:withString:", objc_msgSend(v27, "length"), 0, CFSTR("\n"));

      objc_msgSend(v12, "textStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modificationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTimestamp:range:", v29, objc_msgSend(v30, "length") - 1, 1);

    }
    objc_msgSend(v12, "textStorage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v32, "length"), 0, v122);

    objc_msgSend(v12, "textStorage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "replaceCharactersInRange:withString:", objc_msgSend(v34, "length"), 0, CFSTR("\n"));

    objc_msgSend(v12, "textStorage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modificationDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTimestamp:range:", v36, objc_msgSend(v37, "length") + ~objc_msgSend(v122, "length"), objc_msgSend(v122, "length") + 1);

  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v11;
  v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
  v38 = 0;
  if (v128)
  {
    v127 = *(_QWORD *)v135;
    v125 = *MEMORY[0x1E0CEC570];
    v124 = *MEMORY[0x1E0D636A0];
    v123 = (void *)*MEMORY[0x1E0CEC530];
    v129 = *MEMORY[0x1E0DC10F8];
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v135 != v127)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v39);
        objc_msgSend(v12, "account");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "attachmentIfExistsForAccount:", v41);
        v42 = objc_claimAutoreleasedReturnValue();

        if (v42)
        {
LABEL_13:
          -[NSObject setNote:](v42, "setNote:", v12);
          objc_msgSend(v12, "addAttachmentsObject:", v42);
          objc_msgSend(v40, "image");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            objc_msgSend(v40, "attachment");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "image");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (id)objc_msgSend(v44, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v45, 1, 0, 1, 0.0);

          }
          goto LABEL_32;
        }
        if (ICInternalSettingsDefaultToPaperKitPDFsAndScans())
        {
          objc_msgSend(v40, "mediaUTI");
          v47 = objc_claimAutoreleasedReturnValue();
          if (v47)
          {
            v48 = (void *)v47;
            v49 = (void *)MEMORY[0x1E0CEC3F8];
            objc_msgSend(v40, "mediaUTI");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "typeWithIdentifier:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "conformsToType:", v125);

            if (v52)
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "UUIDString");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addPaperDocumentAttachmentWithIdentifier:subtype:", v54, v124);
              v42 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "title");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setTitle:](v42, "setTitle:", v55);

              v56 = (void *)MEMORY[0x1E0D63C00];
              objc_msgSend(v40, "mediaURL");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v133 = 0;
              LOBYTE(v56) = objc_msgSend(v56, "createPaperDocumentForAttachment:fromLegacyMediaAtURL:error:", v42, v57, &v133);
              v58 = v133;

              if ((v56 & 1) != 0)
              {

                if (v42)
                  goto LABEL_13;
              }
              else
              {
                v59 = os_log_create("com.apple.notes", "DragAndDrop");
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v139 = v58;
                  _os_log_error_impl(&dword_1AC7A1000, v59, OS_LOG_TYPE_ERROR, "Failed to create paper document attachment; deleting and falling back to PDF (error: %@)",
                    buf,
                    0xCu);
                }

                objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", v42);
              }
            }
          }
        }
        objc_msgSend(v40, "mediaURL");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(v40, "mediaURL");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addAttachmentWithFileURL:", v61);
          v42 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "title");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setTitle:](v42, "setTitle:", v62);
LABEL_31:

          if (!v42)
            goto LABEL_43;
LABEL_32:
          v130 = v39;
          +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v42);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)objc_msgSend(v73, "mutableCopy");

          objc_msgSend(v74, "addAttribute:value:range:", v129, v72, 0, objc_msgSend(v74, "length"));
          objc_msgSend(v12, "textStorage");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "length");

          if (objc_msgSend(v12, "attachmentViewType") == 1)
          {
            v77 = v12;
            if (v76 >= 2)
            {
              objc_msgSend(v12, "textStorage");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "string");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v80, "characterIsMember:", objc_msgSend(v79, "characterAtIndex:", v76 - 1)))
              {
                objc_msgSend(v12, "textStorage");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "attribute:atIndex:longestEffectiveRange:inRange:", v129, v76 - 2, 0, v76 - 2, 1);
                v82 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend(v72, "supportsMultipleThumbnailsOnSameLine"))
                {
                  --v76;
                }

              }
            }
            v12 = v77;
          }
          objc_msgSend(v12, "textStorage");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "replaceCharactersInRange:withAttributedString:", v76, 0, v74);

          objc_msgSend(v12, "textStorage");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "modificationDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 1;
          objc_msgSend(v84, "setTimestamp:range:", v85, v76, 1);

          -[NSObject updateChangeCountWithReason:](v42, "updateChangeCountWithReason:", CFSTR("Saved attachment"));
          -[NSObject media](v42, "media");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "updateChangeCountWithReason:", CFSTR("Saved attachment"));

          objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "save");

          +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "generatePreviewIfNeededForAttachment:", v42);

          v39 = v130;
LABEL_42:

          goto LABEL_43;
        }
        objc_msgSend(v40, "mediaData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend(v40, "mediaUTI");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "mediaData");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "mediaFilenameExtension");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v12;
          v67 = v62;
          v68 = v64;
          v69 = v65;
LABEL_30:
          objc_msgSend(v66, "addAttachmentWithUTI:data:filenameExtension:", v67, v68, v69);
          v42 = objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        objc_msgSend(v40, "image");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
        {
          objc_msgSend(v40, "image");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "ic_JPEGData");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v123, "preferredFilenameExtension");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v12;
          v67 = v65;
          v68 = v62;
          v69 = v64;
          goto LABEL_30;
        }
        objc_msgSend(v40, "attributedContentText");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "length");

        if (!v90)
        {
          v42 = os_log_create("com.apple.notes", "DragAndDrop");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:].cold.2(&v131, v132, v42);
          goto LABEL_42;
        }
LABEL_43:
        ++v39;
      }
      while (v128 != v39);
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
      v128 = v91;
    }
    while (v91);
  }

  if (objc_msgSend(v121, "length"))
  {
    objc_msgSend(v12, "textStorage");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "string");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "paragraphRangeForRange:", objc_msgSend(v94, "length"), 0);
    v96 = v95;

    if (v96)
    {
      objc_msgSend(v12, "textStorage");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "replaceCharactersInRange:withString:", objc_msgSend(v98, "length"), 0, CFSTR("\n"));

      objc_msgSend(v12, "textStorage");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modificationDate");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setTimestamp:range:", v100, objc_msgSend(v101, "length") - 1, 1);

    }
    objc_msgSend(v12, "textStorage");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v103, "length"), 0, v121);

    objc_msgSend(v12, "textStorage");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "replaceCharactersInRange:withString:", objc_msgSend(v105, "length"), 0, CFSTR("\n"));

    objc_msgSend(v12, "textStorage");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modificationDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "length");
    v110 = v109 + ~objc_msgSend(v121, "length");
    v111 = objc_msgSend(v121, "length") + 1;
    v112 = v106;
    v113 = v107;
    v114 = v110;
    goto LABEL_53;
  }
  if ((v38 & 1) != 0 && objc_msgSend(v12, "attachmentViewType") != 1)
  {
    objc_msgSend(v12, "textStorage");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "replaceCharactersInRange:withString:", objc_msgSend(v119, "length"), 0, CFSTR("\n"));

    objc_msgSend(v12, "textStorage");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modificationDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v108, "length") - 1;
    v112 = v106;
    v113 = v107;
    v111 = 1;
LABEL_53:
    objc_msgSend(v112, "setTimestamp:range:", v113, v114, v111);

  }
  if (objc_msgSend(obj, "count") || objc_msgSend(v122, "length") || objc_msgSend(v121, "length"))
  {
    objc_msgSend(v12, "textStorage");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "fixupAfterEditing");

    objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Saved attachment"));
  }
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "save");

  v117 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
    -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:].cold.1(v12, v117);

}

- (void)saveAttachments:(void *)a1 toNote:(NSObject *)a2 textBefore:textAfter:fetchFirst:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "POST SAVE note: %@", (uint8_t *)&v4, 0xCu);

}

- (void)saveAttachments:(os_log_t)log toNote:textBefore:textAfter:fetchFirst:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "created media attachment without knowing how to save it.", buf, 2u);
}

@end
