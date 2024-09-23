@implementation ICInlineAttachment

- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (uint64_t *)*((_QWORD *)a3 + 5);
    if (*((char *)v12 + 23) < 0)
    {
      v12 = (uint64_t *)*v12;
      v13 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8);
    }
    else
    {
      v13 = *((unsigned __int8 *)v12 + 23);
    }
    v14 = objc_msgSend(v11, "initWithBytes:length:encoding:", v12, v13, 4);
    if (v9)
    {
      -[ICInlineAttachment identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

    }
    v10 = (__CFString *)v14;
  }
  else
  {
    v10 = &stru_1E76DB108;
  }
  if ((*((_DWORD *)a3 + 8) & 0x1000000) != 0)
    v16 = *((_QWORD *)a3 + 29);
  else
    v16 = 0;
  -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:](self, "requireMinimumSupportedVersionAndPropagateToChildObjects:", v16);
  v17 = *((_DWORD *)a3 + 8);
  if ((v17 & 0x40) != 0)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = (uint64_t *)*((_QWORD *)a3 + 10);
    if (*((char *)v19 + 23) < 0)
    {
      v19 = (uint64_t *)*v19;
      v20 = *(_QWORD *)(*((_QWORD *)a3 + 10) + 8);
    }
    else
    {
      v20 = *((unsigned __int8 *)v19 + 23);
    }
    v21 = (void *)objc_msgSend(v18, "initWithBytes:length:encoding:", v19, v20, 4);
    -[ICInlineAttachment setTypeUTI:](self, "setTypeUTI:", v21);

    v17 = *((_DWORD *)a3 + 8);
  }
  if ((v17 & 0x20) != 0)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = (uint64_t *)*((_QWORD *)a3 + 9);
    if (*((char *)v23 + 23) < 0)
    {
      v23 = (uint64_t *)*v23;
      v24 = *(_QWORD *)(*((_QWORD *)a3 + 9) + 8);
    }
    else
    {
      v24 = *((unsigned __int8 *)v23 + 23);
    }
    v25 = (void *)objc_msgSend(v22, "initWithBytes:length:encoding:", v23, v24, 4);
    -[ICInlineAttachment setAltText:](self, "setAltText:", v25);

  }
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    v26 = objc_alloc(MEMORY[0x1E0C99D50]);
    v27 = (uint64_t *)*((_QWORD *)a3 + 38);
    if (*((char *)v27 + 23) < 0)
    {
      v27 = (uint64_t *)*v27;
      v28 = *(_QWORD *)(*((_QWORD *)a3 + 38) + 8);
    }
    else
    {
      v28 = *((unsigned __int8 *)v27 + 23);
    }
    v29 = (void *)objc_msgSend(v26, "initWithBytes:length:", v27, v28);
    v40 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v29, 0, &v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v40;
    v32 = v31;
    if (!v30 || v31)
    {
      v37 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        -[ICInlineAttachment className](self, "className");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineAttachment identifier](self, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v38;
        v43 = 2112;
        v44 = v39;
        v45 = 2112;
        v46 = v32;
        _os_log_error_impl(&dword_1BD918000, v37, OS_LOG_TYPE_ERROR, "Error parsing metadata JSON for %@ (%@): %@", buf, 0x20u);

      }
      v34 = v37;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("creationDateKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v34, "doubleValue");
        objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineAttachment setCreationDate:](self, "setCreationDate:", v36);

      }
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tokenContentIdentifierKey"));
      v37 = objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachment setTokenContentIdentifier:](self, "setTokenContentIdentifier:", v37);
    }

  }
}

- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  int64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  BOOL v27;
  id v28;
  _QWORD *v29;
  NSObject *v30;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[ICInlineAttachment identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICInlineAttachment identifier](self, "identifier");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 5) == google::protobuf::internal::empty_string_)
    {
      v10 = (_QWORD *)operator new();
      *v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      *((_QWORD *)a3 + 5) = v10;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  v11 = -[ICInlineAttachment intrinsicNotesVersionForScenario:](self, "intrinsicNotesVersionForScenario:", 1);
  if (v11)
  {
    *((_DWORD *)a3 + 8) |= 0x1000000u;
    *((_QWORD *)a3 + 29) = v11;
  }
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICInlineAttachment typeUTI](self, "typeUTI");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x40u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 10) == google::protobuf::internal::empty_string_)
    {
      v14 = (_QWORD *)operator new();
      *v14 = 0;
      v14[1] = 0;
      v14[2] = 0;
      *((_QWORD *)a3 + 10) = v14;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICInlineAttachment altText](self, "altText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICInlineAttachment altText](self, "altText");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v16, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x20u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 9) == google::protobuf::internal::empty_string_)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = 0;
      v17[2] = 0;
      *((_QWORD *)a3 + 9) = v17;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  objc_msgSend(v19, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ic_setNonNilObject:forKey:", v21, CFSTR("creationDateKey"));

  -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ic_setNonNilObject:forKey:", v22, CFSTR("tokenContentIdentifierKey"));

  if (objc_msgSend(v18, "count"))
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v18, 0, &v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v35;
    v25 = v24;
    if (v23)
      v26 = v24 == 0;
    else
      v26 = 0;
    v27 = v26;
    if (v26)
    {
      v28 = objc_retainAutorelease(v23);
      objc_msgSend(v28, "bytes");
      objc_msgSend(v28, "length");
      *((_DWORD *)a3 + 9) |= 2u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*((_QWORD *)a3 + 38) == google::protobuf::internal::empty_string_)
      {
        v29 = (_QWORD *)operator new();
        *v29 = 0;
        v29[1] = 0;
        v29[2] = 0;
        *((_QWORD *)a3 + 38) = v29;
      }
      MEMORY[0x1C3B7A7E8]();
    }
    else
    {
      v30 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[ICInlineAttachment className](self, "className");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineAttachment identifier](self, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v33;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v25;
        _os_log_error_impl(&dword_1BD918000, v30, OS_LOG_TYPE_ERROR, "Error converting metadata to JSON for %@ (%@): %@", buf, 0x20u);

      }
    }

  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)newHashtagAttachmentWithIdentifier:(id)a3 hashtagText:(id)a4 creatingHashtagIfNecessary:(BOOL)a5 note:(id)a6 parentAttachment:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  id v30;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v30 = a7;
  objc_msgSend(v14, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICHashtag hashtagWithDisplayText:account:createIfNecessary:](ICHashtag, "hashtagWithDisplayText:account:createIfNecessary:", v13, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "displayText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_withHashtagPrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    objc_msgSend(v13, "ic_withHashtagPrefix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "standardizedContent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a1;
  if (v20)
  {
    v21 = a1;
    v22 = v12;
    v23 = v30;
    v24 = (void *)objc_msgSend(v21, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v12, CFSTR("com.apple.notes.inlinetextattachment.hashtag"), v19, v20, v14, v30);
  }
  else
  {
    +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", v13);
    v28 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = a1;
    v22 = v12;
    v23 = v30;
    v24 = (void *)objc_msgSend(v26, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v12, CFSTR("com.apple.notes.inlinetextattachment.hashtag"), v19, v25, v14, v30);

    v13 = v28;
  }

  if (!v18)
  if (v24 && v16)
    objc_msgSend(v29, "reviveOrTouchHashtag:", v16);

  return v24;
}

+ (id)newHashtagAttachmentWithIdentifier:(id)a3 forHashtag:(id)a4 note:(id)a5 parentAttachment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "displayText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_withHashtagPrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "standardizedContent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v13, CFSTR("com.apple.notes.inlinetextattachment.hashtag"), v15, v16, v12, v11);

  if (v10 && v17)
    objc_msgSend(a1, "reviveOrTouchHashtag:", v10);

  return v17;
}

+ (void)reviveOrTouchHashtag:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "needsInitialFetchFromCloud") & 1) == 0)
  {
    if (objc_msgSend(v3, "markedForDeletion"))
      objc_msgSend(v3, "unmarkForDeletion");
    else
      objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Touched tag"));
  }

}

+ (id)newMentionAttachmentWithIdentifier:(id)a3 mentionText:(id)a4 userRecordName:(id)a5 note:(id)a6 parentAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(a4, "ic_mentionString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v15, CFSTR("com.apple.notes.inlinetextattachment.mention"), v16, v14, v13, v12);

  return v17;
}

+ (id)newLinkAttachmentWithIdentifier:(id)a3 toNote:(id)a4 fromNote:(id)a5 parentAttachment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[ICAppURLUtilities entityURIForNote:](ICAppURLUtilities, "entityURIForNote:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleForLinking");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v13, CFSTR("com.apple.notes.inlinetextattachment.link"), v15, v16, v11, v10);

  return v17;
}

+ (id)newCalculateResultAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6
{
  const __CFString *v6;

  if (a6)
    v6 = CFSTR("ICInlineAttachmentCalculateStateInvalidRTL");
  else
    v6 = CFSTR("ICInlineAttachmentCalculateStateInvalidLTR");
  return (id)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", a3, CFSTR("com.apple.notes.inlinetextattachment.calculateresult"), 0, v6, a4, a5);
}

+ (id)newCalculateGraphExpressionAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = a6;
  v11 = CFSTR("ICInlineAttachmentCalculateStateValidLTR");
  if (a6)
    v11 = CFSTR("ICInlineAttachmentCalculateStateValidRTL");
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = v11;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "ic_calculateGraphExpressionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v6)
  {
    objc_msgSend(v17, "ic_rightToLeftString");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  v20 = (void *)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v16, CFSTR("com.apple.notes.inlinetextattachment.calculategraphexpression"), v18, v13, v15, v14);

  return v20;
}

+ (id)newAttachmentWithIdentifier:(id)a3 typeUTI:(id)a4 altText:(id)a5 tokenContentIdentifier:(id)a6 note:(id)a7 parentAttachment:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  if (!objc_msgSend(v18, "length"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "altText.length", "+[ICInlineAttachment newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:]", 1, 0, CFSTR("Inline attachment must have a non-empty alt text"));
  objc_msgSend(v15, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v19, v20);

  objc_msgSend(v15, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "persistentStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "assignToPersistentStore:", v23);

  objc_msgSend(v15, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccount:", v24);

  objc_msgSend(v21, "setNote:", v15);
  objc_msgSend(v21, "setParentAttachment:", v16);
  if (objc_msgSend(v15, "isPasswordProtected"))
  {
    objc_msgSend(v21, "setIsPasswordProtected:", 1);
    objc_msgSend(v21, "initializeCryptoProperties");
  }
  objc_msgSend(v21, "setTypeUTI:", v14);
  objc_msgSend(v21, "setAltText:", v18);

  objc_msgSend(v21, "setTokenContentIdentifier:", v17);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCreationDate:", v25);

  objc_msgSend(v15, "addInlineAttachmentsObject:", v21);
  objc_msgSend(v16, "addInlineAttachmentsObject:", v21);

  return v21;
}

+ (id)cloneInlineAttachmentWithIdentifier:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICInlineAttachment, "attachmentWithIdentifier:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__25;
  v19 = __Block_byref_object_dispose__25;
  v20 = 0;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__ICInlineAttachment_cloneInlineAttachmentWithIdentifier_context___block_invoke;
    v12[3] = &unk_1E76C7730;
    v14 = &v15;
    v13 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v12);

    v9 = (void *)v16[5];
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __66__ICInlineAttachment_cloneInlineAttachmentWithIdentifier_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "clone");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)existingInlineAttachmentWithTokenContentIdentifier:(id)a3 typeUTI:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "predicateForTypeUTI:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForTokenContentIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v22[0] = v10;
  v22[1] = v11;
  v22[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v15);
  objc_msgSend(v16, "setFetchLimit:", 1);
  v21 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v16, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v21;
  if (v18)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICInlineAttachment existingInlineAttachmentWithTokenContentIdentifier:typeUTI:context:]", 1, 0, CFSTR("Failed to fetch inline attachments with standardizedContent %@: %@"), v8, v18);
  objc_msgSend(v17, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)clone
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

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment altText](self, "altText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment parentAttachment](self, "parentAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v5, v6, v7, v8, v9, v10);

  return v11;
}

+ (id)canonicalHashtagAttachmentsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("creationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expressionForFunction:arguments:", CFSTR("min:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v9, "setName:", CFSTR("minCreationDate"));
  objc_msgSend(v9, "setExpression:", v8);
  objc_msgSend(v9, "setExpressionResultType:", 900);
  +[ICInlineAttachment fetchRequest](ICInlineAttachment, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("objectID");
  v25[1] = CFSTR("tokenContentIdentifier");
  v25[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  objc_msgSend(v10, "setPropertiesToGroupBy:", &unk_1E771AB18);
  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(a1, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  v23 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v10, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICInlineAttachment canonicalHashtagAttachmentsInContext:].cold.1(v14, v15);
    v16 = (void *)MEMORY[0x1E0C9AA60];
    v17 = v15;
  }
  else
  {
    objc_msgSend(v13, "ic_map:", &__block_literal_global_33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v17);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v22 = v8;
    v18 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v15, v20, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v18;
    v8 = v22;
  }

  return v16;
}

uint64_t __59__ICInlineAttachment_canonicalHashtagAttachmentsInContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("objectID"));
}

+ (void)changeLinkDestinationFromNote:(id)a3 toNote:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "managedObjectContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_15;
  v9 = (void *)v8;
  objc_msgSend(v7, "managedObjectContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_15;
  }
  v11 = (void *)v10;
  objc_msgSend(v6, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
  {
LABEL_15:
    v35 = (void *)MEMORY[0x1E0D641A0];
    v36 = CFSTR("From note context must be non-nil and the same as to note context");
LABEL_16:
    objc_msgSend(v35, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICInlineAttachment changeLinkDestinationFromNote:toNote:]", 1, 0, v36);
    goto LABEL_17;
  }
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_19;
  }
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
LABEL_19:
    v35 = (void *)MEMORY[0x1E0D641A0];
    v36 = CFSTR("From and to notes must have non-empty identifiers");
    goto LABEL_16;
  }
  v40 = a1;
  +[ICAppURLUtilities entityURIForNote:](ICAppURLUtilities, "entityURIForNote:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAppURLUtilities entityURIForNote:](ICAppURLUtilities, "entityURIForNote:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3528];
  +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v38;
  +[ICInlineAttachment predicateForTypeUTI:](ICInlineAttachment, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.link"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v37;
  v39 = v17;
  objc_msgSend(v17, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachment predicateForTokenContentIdentifier:](ICInlineAttachment, "predicateForTokenContentIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  objc_msgSend(v6, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachment ic_objectsMatchingPredicate:context:](ICInlineAttachment, "ic_objectsMatchingPredicate:context:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v18, "absoluteString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTokenContentIdentifier:", v32);

        objc_msgSend(v7, "titleForLinking");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAltText:", v33);

        objc_msgSend(v31, "updateChangeCountWithReason:", CFSTR("Updated link destination"));
        v34 = (id)objc_msgSend(v31, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICInlineAttachmentDataChangedNotification"));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v28);
  }

  objc_msgSend(v40, "regenerateDerivedDataForInlineAttachments:reason:", v26, CFSTR("Updated link destination"));
  v6 = v41;
LABEL_17:

}

+ (void)enumerateLinksToNote:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 context:(id)a7 usingBlock:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  id v17;

  v9 = a6;
  v10 = a5;
  v14 = a8;
  v15 = a7;
  +[ICAppURLUtilities entityURIForNote:](ICAppURLUtilities, "entityURIForNote:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerateInlineAttachmentsInContext:typeUTI:tokenContentIdentifier:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v15, CFSTR("com.apple.notes.inlinetextattachment.link"), v16, a4, v10, v9, v14);

}

+ (void)enumerateInlineAttachmentsInContext:(id)a3 typeUTI:(id)a4 tokenContentIdentifier:(id)a5 batchSize:(unint64_t)a6 visibleOnly:(BOOL)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v9 = a8;
  v10 = a7;
  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  v18 = (void *)objc_opt_new();
  if (v15)
  {
    objc_msgSend(a1, "predicateForTypeUTI:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_addNonNilObject:", v19);

  }
  if (v16)
  {
    objc_msgSend(a1, "predicateForTokenContentIdentifier:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_addNonNilObject:", v20);

  }
  if (v10)
  {
    objc_msgSend(a1, "predicateForVisibleAttachmentsInContext:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_addNonNilObject:", v21);

  }
  v22 = (void *)MEMORY[0x1E0CB3528];
  v23 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v24, 0, 0, v25, a6, v9, v17);
}

+ (void)regenerateDerivedDataForInlineAttachments:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ic_compactMap:", &__block_literal_global_69);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "attachmentModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "regenerateTextContentInNote");

        objc_msgSend(v13, "updateChangeCountWithReason:", v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "ic_map:", &__block_literal_global_72);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v21, "regenerateTitle:snippet:", 1, 1))
        {
          objc_msgSend(v21, "markShareDirtyIfNeededWithReason:", v6);
          objc_msgSend(v21, "updateChangeCountWithReason:", v6);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

uint64_t __71__ICInlineAttachment_regenerateDerivedDataForInlineAttachments_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parentAttachment");
}

uint64_t __71__ICInlineAttachment_regenerateDerivedDataForInlineAttachments_reason___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "note");
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (id)parentEncryptableObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICInlineAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICInlineAttachment account](self, "account");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isCalculateResultAttachment
{
  void *v2;
  char v3;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculateresult"));

  return v3;
}

- (BOOL)isCalculateGraphExpressionAttachment
{
  void *v2;
  char v3;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculategraphexpression"));

  return v3;
}

- (BOOL)isLinkAttachment
{
  void *v2;
  char v3;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.link"));

  return v3;
}

- (BOOL)isMentionAttachment
{
  void *v2;
  char v3;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.mention"));

  return v3;
}

- (BOOL)isHashtagAttachment
{
  void *v2;
  char v3;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));

  return v3;
}

+ (id)predicateForTypeUTI:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("typeUTI == %@"), a3);
}

+ (id)predicateForTokenContentIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("tokenContentIdentifier == %@"), a3);
}

+ (id)predicateForMentionsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.mention"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleAttachmentsInContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)tokenContentIdentifier
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_tokenContentIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTokenContentIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_tokenContentIdentifier);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, v5);

}

- (NSString)altText
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_altText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAltText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  NSStringFromSelector(sel_altText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, v5);

  -[ICInlineAttachment markDisplayTextNeedsUpdate](self, "markDisplayTextNeedsUpdate");
}

- (id)nonNilAltText
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[ICInlineAttachment altText](self, "altText");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E76DB108;
  v4 = v2;

  return v4;
}

- (id)fallbackDisplayText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  if (-[ICInlineAttachment isHashtagAttachment](self, "isHashtagAttachment"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_hashtagCharacterString");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_ellipsisCharacterString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (-[ICInlineAttachment isMentionAttachment](self, "isMentionAttachment"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_mentionCharacterString");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment"))
  {
    v8 = -[ICInlineAttachment isRightToLeftCalculateAttachment](self, "isRightToLeftCalculateAttachment");
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateEqualsSignString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "ic_ellipsisCharacterString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    v8 = -[ICInlineAttachment isRightToLeftCalculateAttachment](self, "isRightToLeftCalculateAttachment");
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateGraphExpressionString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v9;
  if (v8)
    objc_msgSend(v9, "ic_rightToLeftString");
  else
    objc_msgSend(v9, "ic_leftToRightString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v7;
}

- (NSString)displayText
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *displayText;

  if (!-[NSString length](self->_displayText, "length"))
  {
    -[ICInlineAttachment altText](self, "altText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      -[ICInlineAttachment altText](self, "altText");
    else
      -[ICInlineAttachment fallbackDisplayText](self, "fallbackDisplayText");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (-[ICInlineAttachment isHashtagAttachment](self, "isHashtagAttachment"))
    {
      -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachment note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICHashtag hashtagWithStandardizedContent:account:](ICHashtag, "hashtagWithStandardizedContent:account:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "displayText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        objc_msgSend(v8, "displayText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ic_withHashtagPrefix");
        v12 = objc_claimAutoreleasedReturnValue();

        v3 = (NSString *)v12;
      }
    }
    else if (-[ICInlineAttachment isLinkAttachment](self, "isLinkAttachment"))
    {
      -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        +[ICAppURLUtilities noteIdentifierFromNotesAppURL:](ICAppURLUtilities, "noteIdentifierFromNotesAppURL:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineAttachment managedObjectContext](self, "managedObjectContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "titleForLinking");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          v18 = v17;

          v3 = v18;
        }

      }
    }
    else
    {
      if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment")
        && !-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
      {
        goto LABEL_21;
      }
      if (-[ICInlineAttachment isValidCalculateAttachment](self, "isValidCalculateAttachment"))
        -[ICInlineAttachment altText](self, "altText");
      else
        -[ICInlineAttachment fallbackDisplayText](self, "fallbackDisplayText");
      v8 = v3;
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    v19 = (NSString *)-[NSString copy](v3, "copy");
    displayText = self->_displayText;
    self->_displayText = v19;

    return v3;
  }
  v3 = self->_displayText;
  return v3;
}

- (void)markDisplayTextNeedsUpdate
{
  NSString *displayText;

  displayText = self->_displayText;
  self->_displayText = (NSString *)&stru_1E76DB108;

}

- (signed)attachmentType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));

  if ((v4 & 1) != 0)
    return 1;
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.mention"));

  if ((v7 & 1) != 0)
    return 2;
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.link"));

  if ((v9 & 1) != 0)
    return 3;
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculateresult"));

  if ((v11 & 1) != 0)
    return 4;
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculategraphexpression"));

  if (v13)
    return 5;
  else
    return 0;
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  void *v5;
  int64_t v6;
  int64_t result;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  objc_super v18;

  if (-[ICCloudSyncingObject isUnsupported](self, "isUnsupported"))
    return -[ICInlineAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  if (-[ICCloudSyncingObject needsInitialFetchFromCloudCheckingParent](self, "needsInitialFetchFromCloudCheckingParent"))
  {
    return -[ICInlineAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  }
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -[ICInlineAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  if ((-[ICInlineAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
  {
LABEL_5:
    v6 = 13;
    goto LABEL_10;
  }
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculateresult"));

  if ((v9 & 1) == 0)
  {
    -[ICInlineAttachment typeUTI](self, "typeUTI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.calculategraphexpression"));

    if ((v11 & 1) == 0)
    {
      -[ICInlineAttachment typeUTI](self, "typeUTI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.link"));

      if ((v13 & 1) == 0)
      {
        -[ICInlineAttachment typeUTI](self, "typeUTI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));

        if ((v15 & 1) != 0)
        {
          v6 = 7;
        }
        else
        {
          -[ICInlineAttachment typeUTI](self, "typeUTI");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.notes.inlinetextattachment.mention"));

          if (v17)
            v6 = 7;
          else
            v6 = 6;
        }
        goto LABEL_10;
      }
      goto LABEL_5;
    }
  }
  v6 = 15;
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)ICInlineAttachment;
  result = -[ICCloudSyncingObject intrinsicNotesVersionForScenario:](&v18, sel_intrinsicNotesVersionForScenario_, a3);
  if (v6 > result)
    return v6;
  return result;
}

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject awakeFromFetch](&v7, sel_awakeFromFetch);
  if (!-[ICInlineAttachment didAddAttachmentDataChangedObservers](self, "didAddAttachmentDataChangedObservers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment objectID](self, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICInlineAttachmentDataChangedNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICAccountDidAddHashtagNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICAccountDidPurgeHashtagNotification"), 0);

    -[ICInlineAttachment setDidAddAttachmentDataChangedObservers:](self, "setDidAddAttachmentDataChangedObservers:", 1);
  }
}

- (void)awakeFromInsert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject awakeFromInsert](&v7, sel_awakeFromInsert);
  if (!-[ICInlineAttachment didAddAttachmentDataChangedObservers](self, "didAddAttachmentDataChangedObservers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment objectID](self, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICInlineAttachmentDataChangedNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICAccountDidAddHashtagNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_markDisplayTextNeedsUpdate, CFSTR("ICAccountDidPurgeHashtagNotification"), 0);

    -[ICInlineAttachment setDidAddAttachmentDataChangedObservers:](self, "setDidAddAttachmentDataChangedObservers:", 1);
  }
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[ICInlineAttachment markDisplayTextNeedsUpdate](self, "markDisplayTextNeedsUpdate");
  v3.receiver = self;
  v3.super_class = (Class)ICInlineAttachment;
  -[ICInlineAttachment willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (_NSRange)animatableRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  if (-[ICInlineAttachment isMentionAttachment](self, "isMentionAttachment"))
  {
    -[ICInlineAttachment displayText](self, "displayText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ic_range");
    v6 = v5;
  }
  else
  {
    if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment"))
    {
      v6 = 0;
      v4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    -[ICInlineAttachment displayText](self, "displayText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateEqualsSignString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfString:", v8);
    v11 = v10;

    v4 = v9 + v11;
    -[ICInlineAttachment displayText](self, "displayText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "length") - (v9 + v11);
  }

LABEL_7:
  v12 = v4;
  v13 = v6;
  result.length = v13;
  result.location = v12;
  return result;
}

- (NSAttributedString)searchableTextContentInNote
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICInlineAttachment altText](self, "altText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_stringByRemovingLanguageDirectionCharacters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1E76DB108;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "ic_thinSpaceCharacterString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E76DB108);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  return (NSAttributedString *)v9;
}

- (_NSRange)displayTextRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSUInteger v19;
  NSRange v20;
  NSUInteger v21;
  NSUInteger v22;
  _QWORD v23[2];
  NSRange v24;
  _NSRange result;
  NSRange v26;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICInlineAttachment note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeForAttachment:", self);
  v11 = v10;

  -[ICInlineAttachment parentAttachment](self, "parentAttachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v12 && v11)
  {
    v23[0] = 0;
    v23[1] = 0;
    v15 = (id)objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("ICAttachmentSearchable"), location, v23);
    -[ICInlineAttachment note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "textOffsetAtSearchIndex:inSearchableString:", v23[0], v7);

    -[ICInlineAttachment nonNilAltText](self, "nonNilAltText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26.location = objc_msgSend(v18, "ic_range");
    v26.length = v19;
    v24.location = location - v9 - v17;
    v24.length = length;
    v20 = NSIntersectionRange(v24, v26);
    v14 = v20.location;
    v13 = v20.length;

  }
  v21 = v14;
  v22 = v13;
  result.length = v22;
  result.location = v21;
  return result;
}

- (void)updateMarkedForDeletionStateInlineAttachmentIsInUse:(BOOL)a3
{
  void *v5;
  int v6;

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (a3)
      v6 = 0;
    else
      v6 = -[ICInlineAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") ^ 1;
    if (!-[ICInlineAttachment markedForDeletion](self, "markedForDeletion") || (v6 & 1) != 0)
    {
      if ((-[ICInlineAttachment markedForDeletion](self, "markedForDeletion") & 1) == 0 && ((v6 ^ 1) & 1) == 0)
        -[ICInlineAttachment markForDeletion](self, "markForDeletion");
    }
    else
    {
      -[ICInlineAttachment unmarkForDeletion](self, "unmarkForDeletion");
    }
  }
}

- (void)markForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject markForDeletion](&v4, sel_markForDeletion);
  -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:](self, "propagateDeletionToHashtagForMarkForDeletion:", 1);
  -[ICInlineAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");

}

- (void)unmarkForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject unmarkForDeletion](&v4, sel_unmarkForDeletion);
  -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:](self, "propagateDeletionToHashtagForMarkForDeletion:", 0);
  -[ICInlineAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");

}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  ICInlineAttachment *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject ic_loggingValues](&v15, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICInlineAttachment managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __38__ICInlineAttachment_ic_loggingValues__block_invoke;
  v12 = &unk_1E76C73B0;
  v13 = v4;
  v14 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __38__ICInlineAttachment_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 40), "tokenContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_sha256");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("tokenContentIdentifierHash"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "displayText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("displayTextLength"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "altText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("altTextLength"));

  objc_msgSend(*(id *)(a1 + 40), "creationDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("creationDate"));

  if (objc_msgSend(*(id *)(a1 + 40), "isUnsupported"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isUnsupported"));
  if (objc_msgSend(*(id *)(a1 + 40), "isHashtagAttachment"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isHashtagAttachment"));
  if (objc_msgSend(*(id *)(a1 + 40), "isMentionAttachment"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isMentionAttachment"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mentionNotificationState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, CFSTR("mentionNotificationState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mentionNotificationAttemptCount"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, CFSTR("mentionNotificationAttemptCount"));

  }
}

+ (unint64_t)countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  return objc_msgSend(a1, "countOfVisibleInlineAttachmentsForHashtagStandardizedContent:includingTrash:account:", a3, 0, a4);
}

+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  return objc_msgSend(a1, "countOfVisibleInlineAttachmentsForHashtagStandardizedContent:includingTrash:account:", a3, 1, a4);
}

+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 includingTrash:(BOOL)a4 account:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  id v23;

  v8 = a5;
  objc_msgSend(a1, "predicateForTokenContentIdentifier:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.account == %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v10, v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    objc_msgSend(v8, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICBaseAttachment predicateForVisibleAttachmentsInContext:](ICBaseAttachment, "predicateForVisibleAttachmentsInContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObject:", v14);
  }
  v15 = (void *)MEMORY[0x1E0CB3528];
  v16 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v17);
  objc_msgSend(v18, "setIncludesSubentities:", 0);
  objc_msgSend(v8, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v20 = objc_msgSend(v19, "countForFetchRequest:error:", v18, &v23);
  v21 = v23;

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICInlineAttachment countOfVisibleInlineAttachmentsForHashtagStandardizedContent:includingTrash:account:]", 1, 0, CFSTR("Failed to fetch count of inline attachments for hashtag standardized content: %@"), v21);
    v20 = 0;
  }

  return v20;
}

+ (BOOL)isHashtagStandardizedContent:(id)a3 usedInAccount:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:account:", v7, v6);
  +[ICFolder visibleSmartFoldersForHashtagStandardizedContent:account:](ICFolder, "visibleSmartFoldersForHashtagStandardizedContent:account:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  return (v8 | v10) != 0;
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  v3 = a3;
  if (-[ICInlineAttachment isHashtagAttachment](self, "isHashtagAttachment"))
  {
    -[ICInlineAttachment note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_class();
    -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isHashtagStandardizedContent:usedInAccount:", v8, v6);

    if (v3)
    {
      if ((v9 & 1) == 0)
      {
        -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICInlineAttachment note](self, "note");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICHashtag hashtagWithStandardizedContent:account:](ICHashtag, "hashtagWithStandardizedContent:account:", v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "markedForDeletion") & 1) == 0)
        {
          v14 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:].cold.1(v13);

          objc_msgSend(v13, "markForDeletion");
        }
LABEL_13:

      }
    }
    else if (v9)
    {
      -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICHashtag hashtagWithStandardizedContent:onlyVisible:account:](ICHashtag, "hashtagWithStandardizedContent:onlyVisible:account:", v15, 0, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "markedForDeletion"))
      {
        v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:].cold.2(v13);

        objc_msgSend(v13, "unmarkForDeletion");
      }
      goto LABEL_13;
    }

  }
}

+ (id)recentlyUsedDatesForHashtagsStandardizedContents:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  id v49;
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:context:].cold.1(v8);

  v9 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("creationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionForFunction:arguments:", CFSTR("max:"), v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v13, "setName:", CFSTR("maxCreationDate"));
  v41 = (void *)v12;
  objc_msgSend(v13, "setExpression:", v12);
  objc_msgSend(v13, "setExpressionResultType:", 900);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("tokenContentIdentifier IN %@"), v6);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleObjects");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3528];
  v39 = (void *)v15;
  v40 = (void *)v14;
  v52[0] = v14;
  v52[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v18;
  objc_msgSend(v19, "setPredicate:", v18);
  objc_msgSend(v19, "setPropertiesToGroupBy:", &unk_1E771AB30);
  v51[0] = CFSTR("tokenContentIdentifier");
  v51[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPropertiesToFetch:", v20);

  objc_msgSend(v19, "setResultType:", 2);
  v49 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v19, &v49);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v49;
  v42 = v7;
  v43 = v6;
  v37 = v22;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:context:]", 1, 0, CFSTR("Failed to fetch last used dates for hashtags: %@"), v22);
  }
  else
  {
    v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEFAULT, "Fetched last used dates for hashtags", buf, 2u);
    }

  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tokenContentIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("maxCreationDate"));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v31)
          v34 = v32 == 0;
        else
          v34 = 1;
        if (!v34)
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, v31);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v27);
  }

  v35 = (void *)objc_msgSend(v24, "copy");
  return v35;
}

+ (void)regenerateTokenContentIdentifierForHashtagAttachmentsInContext:(id)a3 currentTokenContentIdentifier:(id)a4 save:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v5 = a5;
  v40[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "predicateForTokenContentIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v40[0] = v9;
  v40[1] = v10;
  v40[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v34 = v14;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v17)
    {
      v18 = v17;
      v28 = v15;
      v29 = v11;
      v30 = v5;
      v31 = v10;
      v32 = v9;
      v33 = v8;
      v19 = 0;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v22, "altText");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v22, "altText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "tokenContentIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v25);

            if ((v27 & 1) == 0)
            {
              objc_msgSend(v22, "setTokenContentIdentifier:", v25);
              objc_msgSend(v22, "updateChangeCountWithReason:", CFSTR("Changed token content identifier"));
              v19 = 1;
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v18);

      v9 = v32;
      v8 = v33;
      v10 = v31;
      v15 = v28;
      v11 = v29;
      v14 = v34;
      if ((v30 & v19) == 1)
        objc_msgSend(v33, "ic_save");
    }
    else
    {

    }
  }

}

- (NSString)calculateState
{
  if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment")
    && !-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment", "-[ICInlineAttachment calculateState]", 1, 0, CFSTR("Getting Calculate state for inline attachment of wrong type"));
  }
  return -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
}

- (void)setCalculateState:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment")
    && !-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment", "-[ICInlineAttachment setCalculateState:]", 1, 0, CFSTR("Setting Calculate state for inline attachment of wrong type"));
  }
  -[ICInlineAttachment setTokenContentIdentifier:](self, "setTokenContentIdentifier:", v4);

}

- (BOOL)isValidCalculateAttachment
{
  void *v3;
  char v4;
  void *v5;

  -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", CFSTR("ICInlineAttachmentCalculateStateValidLTR")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", CFSTR("ICInlineAttachmentCalculateStateValidRTL"));

  }
  return v4;
}

- (BOOL)isRightToLeftCalculateAttachment
{
  void *v3;
  char v4;
  void *v5;

  -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", CFSTR("ICInlineAttachmentCalculateStateValidRTL")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", CFSTR("ICInlineAttachmentCalculateStateInvalidRTL"));

  }
  return v4;
}

- (BOOL)updateCalculateResult:(id)a3 isRightToLeft:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isCalculateResultAttachment", "-[ICInlineAttachment updateCalculateResult:isRightToLeft:]", 1, 0, CFSTR("Updating Calculate result for inline attachment of wrong type"));
  objc_msgSend(v6, "formattedResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateEqualsSignString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "formattedResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  v12 = -[ICInlineAttachment updateCalculateText:isValid:isRightToLeft:](self, "updateCalculateText:isValid:isRightToLeft:", v9, v6 != 0, v4);
  return v12;
}

- (BOOL)updateCalculateGraphExpressionIsRightToLeft:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (!-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isCalculateGraphExpressionAttachment", "-[ICInlineAttachment updateCalculateGraphExpressionIsRightToLeft:]", 1, 0, CFSTR("Updating Calculate graph expression for inline attachment of wrong type"));
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateGraphExpressionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICInlineAttachment updateCalculateText:isValid:isRightToLeft:](self, "updateCalculateText:isValid:isRightToLeft:", v5, 1, v3);

  return v6;
}

- (BOOL)updateCalculateText:(id)a3 isValid:(BOOL)a4 isRightToLeft:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v21;
  char v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  unint64_t v27;
  __CFString *v28;
  unint64_t v29;
  void *v30;
  char v31;
  BOOL v32;
  void *v33;
  void *v34;
  id v35;

  v6 = a4;
  v8 = a3;
  if (!-[ICInlineAttachment isCalculateResultAttachment](self, "isCalculateResultAttachment")
    && !-[ICInlineAttachment isCalculateGraphExpressionAttachment](self, "isCalculateGraphExpressionAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment", "-[ICInlineAttachment updateCalculateText:isValid:isRightToLeft:]", 1, 0, CFSTR("Updating Calculate text for inline attachment of wrong type"));
  }
  if (a5)
  {
    objc_msgSend(v8, "ic_rightToLeftString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("ICInlineAttachmentCalculateStateValidRTL");
    v11 = CFSTR("ICInlineAttachmentCalculateStateInvalidRTL");
  }
  else
  {
    objc_msgSend(v8, "ic_leftToRightString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("ICInlineAttachmentCalculateStateValidLTR");
    v11 = CFSTR("ICInlineAttachmentCalculateStateInvalidLTR");
  }

  if (v6)
    v12 = (__CFString *)v10;
  else
    v12 = (__CFString *)v11;
  v13 = v12;
  -[ICInlineAttachment calculateState](self, "calculateState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = (__CFString *)*MEMORY[0x1E0C9B0D0];
  if ((__CFString *)*MEMORY[0x1E0C9B0D0] == v13)
    v16 = 0;
  else
    v16 = v13;
  v17 = v16;
  if (v15 == v14)
    v18 = 0;
  else
    v18 = v14;
  v19 = v18;
  if (v15 == v13 && v19 == 0)
  {

LABEL_28:
    v24 = 0;
    goto LABEL_30;
  }
  v21 = v19;
  if (v15 == v13 || v19 == 0)
  {

  }
  else
  {
    v23 = -[__CFString isEqual:](v17, "isEqual:", v19);

    if ((v23 & 1) != 0)
      goto LABEL_28;
  }
  -[ICInlineAttachment setCalculateState:](self, "setCalculateState:", v13);
  v24 = 1;
LABEL_30:
  -[ICInlineAttachment altText](self, "altText");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v15 == v9)
    v26 = 0;
  else
    v26 = v9;
  v27 = v26;
  if (v15 == v25)
    v28 = 0;
  else
    v28 = v25;
  v29 = v28;
  if (v27 | v29)
  {
    v30 = (void *)v29;
    if (v27 && v29)
    {
      v31 = objc_msgSend((id)v27, "isEqual:", v29);

      if ((v31 & 1) != 0)
      {
        if (v24)
          goto LABEL_46;
LABEL_43:
        v32 = 0;
        goto LABEL_50;
      }
    }
    else
    {

    }
    -[ICInlineAttachment setAltText:](self, "setAltText:", v9);
  }
  else
  {

    if ((v24 & 1) == 0)
      goto LABEL_43;
  }
LABEL_46:
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment objectID](self, "objectID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "postNotificationName:object:", CFSTR("ICInlineAttachmentDataChangedNotification"), v34);

  }
  else
  {
    v35 = (id)-[ICInlineAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICInlineAttachmentDataChangedNotification"));
  }
  v32 = 1;
LABEL_50:

  return v32;
}

- (BOOL)animateInsertion
{
  return self->_animateInsertion;
}

- (void)setAnimateInsertion:(BOOL)a3
{
  self->_animateInsertion = a3;
}

- (BOOL)didAddAttachmentDataChangedObservers
{
  return self->_didAddAttachmentDataChangedObservers;
}

- (void)setDidAddAttachmentDataChangedObservers:(BOOL)a3
{
  self->_didAddAttachmentDataChangedObservers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
}

+ (void)purgeAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInlineAttachmentsObject:", v7);

    objc_msgSend(v7, "parentAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeInlineAttachmentsObject:", v7);

    objc_msgSend(v7, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteObject:", v7);

  }
}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return +[ICUnsupportedObjectPredicateHelper predicateForSupportedInlineAttachmentsInContext:](ICUnsupportedObjectPredicateHelper, "predicateForSupportedInlineAttachmentsInContext:", a3);
}

- (NSString)recordType
{
  return (NSString *)CFSTR("InlineAttachment");
}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  objc_super v38;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)ICInlineAttachment;
  v13 = -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v38, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, v11, a5, v12);
  if (v13)
  {
    -[ICInlineAttachment writeMergeableFieldStateIfNecessary:](self, "writeMergeableFieldStateIfNecessary:", v12);
    objc_msgSend(v10, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment setIdentifier:](self, "setIdentifier:", v15);

    objc_opt_class();
    objc_msgSend(v10, "encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UTIEncrypted"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment setTypeUTI:](self, "setTypeUTI:", v19);

    -[ICInlineAttachment managedObjectContext](self, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "noteFromAttachmentRecord:accountID:context:", v10, v11, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[ICInlineAttachment setNote:](self, "setNote:", v21);
      -[ICInlineAttachment note](self, "note");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addInlineAttachmentsObject:", self);

    }
    -[ICInlineAttachment parentAttachmentFromRecord:accountID:context:](self, "parentAttachmentFromRecord:accountID:context:", v10, v11, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[ICBaseAttachment setParentAttachment:](self, "setParentAttachment:", v23);
      -[ICInlineAttachment parentAttachment](self, "parentAttachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addInlineAttachmentsObject:", self);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CreationDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachment setCreationDate:](self, "setCreationDate:", v25);

    if ((-[ICInlineAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      objc_opt_class();
      objc_msgSend(v10, "encryptedValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AltTextEncrypted"));
      v36 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "ic_stringValue");
      v37 = v20;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachment setAltText:](self, "setAltText:", v29);

      objc_opt_class();
      objc_msgSend(v10, "encryptedValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("TokenContentIdentifierEncrypted"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "ic_stringValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachment setTokenContentIdentifier:](self, "setTokenContentIdentifier:", v33);

      v20 = v37;
      v21 = v36;
    }
    v34 = (id)-[ICInlineAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICInlineAttachmentDataChangedNotification"), v36);

  }
  return v13;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)ICInlineAttachment;
  v6 = a4;
  -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v31, sel_makeCloudKitRecordForApproach_mergeableFieldState_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachment note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachment parentAttachment](self, "parentAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachment writeMergeableFieldStateIfNecessary:](self, "writeMergeableFieldStateIfNecessary:", v6);
  v12 = (_QWORD *)MEMORY[0x1E0C94A40];
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v9, *MEMORY[0x1E0C94A40]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("Note"));

  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v11, *v12);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("ParentAttachment"));

  }
  -[ICInlineAttachment altText](self, "altText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICInlineAttachment altText](self, "altText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ic_dataValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encryptedValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("AltTextEncrypted"));

  }
  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ICCloudSyncingObject creationDate](self, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("CreationDate"));

  }
  -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ic_dataValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encryptedValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("TokenContentIdentifierEncrypted"));

  }
  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[ICInlineAttachment typeUTI](self, "typeUTI");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ic_dataValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encryptedValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("UTIEncrypted"));

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0D641A0];
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICInlineAttachment(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 1, CFSTR("Trying to create a record for an inline attachment that is of an unknown type: %@"), v26);
  }

  return v7;
}

- (void)writeMergeableFieldStateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[ICInlineAttachment identifier](self, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("TokenContentIdentifierEncrypted"));

  }
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(a3, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICInlineAttachment, "attachmentWithIdentifier:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Note"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "className");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v20;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v9;
      _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Found an %@ (%@) in the cloud with no note in account ID %@", buf, 0x20u);

    }
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v11, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote existingCloudObjectForRecordID:accountID:context:](ICNote, "existingCloudObjectForRecordID:accountID:context:", v13, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "className");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "recordName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "recordName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v9;
      _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a note (%@) that we don't know about yet in account ID %@", buf, 0x2Au);

    }
    +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = +[ICNote newNoteWithoutIdentifierInAccount:](ICNote, "newNoteWithoutIdentifierInAccount:", v16);
    objc_msgSend(v12, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifier:", v18);

    objc_msgSend(v14, "setNeedsInitialFetchFromCloud:", 1);
LABEL_9:

  }
  return v14;
}

- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ParentAttachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachment existingCloudObjectForRecordID:accountID:context:](ICAttachment, "existingCloudObjectForRecordID:accountID:context:", v13, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[ICInlineAttachment className](self, "className");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v22;
        _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a parent attachment (%@) that we don't know about yet", buf, 0x20u);

      }
      objc_msgSend(v12, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachment note](self, "note");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[ICBaseAttachment newAttachmentWithIdentifier:note:](ICAttachment, "newAttachmentWithIdentifier:note:", v17, v18);

      objc_msgSend(v14, "setNeedsInitialFetchFromCloud:", 1);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "noteFromAttachmentRecord:accountID:context:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addInlineAttachmentWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCreationDate:", v14);

  objc_msgSend(v13, "mergeCloudKitRecord:accountID:approach:", v9, v8, 0);
  objc_msgSend(v13, "setServerRecord:", v9);

  objc_msgSend(v13, "setInCloud:", 1);
  objc_msgSend(v13, "clearChangeCountWithReason:", CFSTR("Created inline attachment"));
  objc_msgSend(v13, "updateParentReferenceIfNecessary");
  v15 = (id)objc_msgSend(v13, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));

  return v13;
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](&v7, sel_objectWasFetchedFromCloudWithRecord_accountID_force_, a3, a4, a5);
  v6 = (id)-[ICInlineAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));
}

- (BOOL)isInICloudAccount
{
  ICInlineAttachment *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICInlineAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__ICInlineAttachment_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C76B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __49__ICInlineAttachment_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isInCloud"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInICloudAccount");

  }
}

- (BOOL)hasAllMandatoryFields
{
  unsigned int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICInlineAttachment;
  v3 = -[ICCloudSyncingObject hasAllMandatoryFields](&v16, sel_hasAllMandatoryFields);
  -[ICInlineAttachment note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 & objc_msgSend(v4, "hasAllMandatoryFields");

  -[ICInlineAttachment typeUTI](self, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
    v5 = 0;

  -[ICInlineAttachment parentAttachment](self, "parentAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICInlineAttachment parentAttachment](self, "parentAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 &= objc_msgSend(v8, "hasAllMandatoryFields");

  }
  if (-[ICInlineAttachment isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICInlineAttachment encryptedValuesJSON](self, "encryptedValuesJSON");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length") == 0;
  }
  else
  {
    -[ICInlineAttachment tokenContentIdentifier](self, "tokenContentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    -[ICInlineAttachment altText](self, "altText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "length");
    if (v12)
      v10 = v13 == 0;
    else
      v10 = 1;
  }
  v14 = !v10;

  return v5 & v14;
}

- (void)deleteFromLocalDatabase
{
  +[ICInlineAttachment purgeAttachment:](ICInlineAttachment, "purgeAttachment:", self);
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

+ (void)canonicalHashtagAttachmentsInContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Failed fetching canonical hashtag attachment identifiers: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking hashtag for deletion because there are no more references to it: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Unmarking hashtag for deletion because there is a new reference to it: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

+ (void)recentlyUsedDatesForHashtagsStandardizedContents:(os_log_t)log context:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Fetching last used dates for hashtags", v1, 2u);
}

@end
