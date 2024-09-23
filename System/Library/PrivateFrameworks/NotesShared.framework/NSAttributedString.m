@implementation NSAttributedString

void __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3B7AC74]();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EF53E378) & 1) != 0)
  {
    objc_msgSend(v3, "attachmentInContext:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (os_log_t)v5;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_7:

    }
  }
  else if (v3)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_7;
  }
  objc_autoreleasePoolPop(v4);

}

void __162__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_attributedStringWithArchive_dataPersister_note_parentAttachment_shouldCreateNewAttachments_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  ICTTTodo *v9;
  void *v10;
  void *v11;
  ICTTTodo *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "todo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(v16, "mutableCopy");
    v9 = [ICTTTodo alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "todo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICTTTodo initWithIdentifier:done:](v9, "initWithIdentifier:done:", v10, objc_msgSend(v11, "done"));
    objc_msgSend(v8, "setTodo:", v12);

    v13 = *(void **)(a1 + 32);
    v14 = ICTTAttributeNameParagraphStyle;
    v15 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v13, "addAttribute:value:range:", v14, v15, a3, a4);

  }
}

void __126__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_saveToArchive_flags_dataPersister_managedObjectContext_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  topotext::Attachment *v15;
  void *v16;
  int *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  topotext::Attachment *v21;
  uint64_t v22;
  int32x2_t v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  int32x2_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF53E378))
  {
    v4 = (void *)MEMORY[0x1C3B7AC74]();
    v5 = v3;
    objc_msgSend(v5, "attachmentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v5);
    v8 = a1[4];
    if (v7)
    {
      +[ICBaseAttachment attachmentWithIdentifier:context:](ICInlineAttachment, "attachmentWithIdentifier:context:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9 || (objc_msgSend(v9, "markedForDeletion") & 1) != 0)
        goto LABEL_20;
      v11 = (int *)a1[8];
      v12 = v11[29];
      v13 = v11[28];
      if ((int)v13 >= v12)
      {
        if (v12 == v11[30])
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v11 + 26, v12 + 1);
        v15 = google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
        v22 = *((_QWORD *)v11 + 13);
        v23 = *(int32x2_t *)(v11 + 28);
        *((int32x2_t *)v11 + 14) = vadd_s32(v23, (int32x2_t)0x100000001);
        *(_QWORD *)(v22 + 8 * v23.i32[0]) = v15;
      }
      else
      {
        v14 = *((_QWORD *)v11 + 13);
        v11[28] = v13 + 1;
        v15 = *(topotext::Attachment **)(v14 + 8 * v13);
      }
      v24 = a1[5];
      v25 = *(_QWORD *)(a1[7] + 8);
      v27 = *(void **)(v25 + 40);
      v26 = (void **)(v25 + 40);
      v39 = v27;
      v28 = objc_msgSend(v10, "saveToArchive:dataPersister:error:", v15, v24, &v39);
      v29 = v39;
    }
    else
    {
      +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v6, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (!v16 || (objc_msgSend(v16, "markedForDeletion") & 1) != 0)
        goto LABEL_20;
      v17 = (int *)a1[8];
      v18 = v17[29];
      v19 = v17[28];
      if ((int)v19 >= v18)
      {
        if (v18 == v17[30])
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v17 + 26, v18 + 1);
        v21 = google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
        v30 = *((_QWORD *)v17 + 13);
        v31 = *(int32x2_t *)(v17 + 28);
        *((int32x2_t *)v17 + 14) = vadd_s32(v31, (int32x2_t)0x100000001);
        *(_QWORD *)(v30 + 8 * v31.i32[0]) = v21;
      }
      else
      {
        v20 = *((_QWORD *)v17 + 13);
        v17[28] = v19 + 1;
        v21 = *(topotext::Attachment **)(v20 + 8 * v19);
      }
      v32 = a1[5];
      v33 = (a1[9] >> 1) & 1;
      v34 = *(_QWORD *)(a1[7] + 8);
      v35 = *(void **)(v34 + 40);
      v26 = (void **)(v34 + 40);
      v38 = v35;
      v28 = objc_msgSend(v10, "saveToArchive:dataPersister:stripImageMarkupMetadata:error:", v21, v32, v33, &v38);
      v29 = v38;
    }
    v36 = v29;
    v37 = *v26;
    *v26 = v36;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v28;
LABEL_20:

    objc_autoreleasePoolPop(v4);
  }

}

void __109__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_approximateAttachmentsSizeIncludingPreviews___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF53E378))
  {
    objc_msgSend(v7, "attachmentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "approximateArchiveSizeIncludingPreviews:", *(unsigned __int8 *)(a1 + 40));

    }
  }

}

void __94__NSAttributedString_Shared__ic_enumerateInlineAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3B7AC74]();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF53E378))
  {
    v5 = v3;
    if (+[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v5))
    {
      objc_msgSend(v5, "inlineAttachmentInContext:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }
    else
    {

    }
  }
  else if (v3)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __73__NSAttributedString_Shared__abstractAttachmentsInContext_range_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __96__NSAttributedString_Shared__ic_enumerateAbstractAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3B7AC74]();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF53E378))
  {
    v5 = v3;
    v6 = +[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v5);
    v7 = *(_QWORD *)(a1 + 32);
    if (v6)
      objc_msgSend(v5, "inlineAttachmentInContext:", v7);
    else
      objc_msgSend(v5, "attachmentInContext:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_10:

    }
  }
  else if (v3)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_10;
  }
  objc_autoreleasePoolPop(v4);

}

void __80__NSAttributedString_Shared__ic_attributedStringByRefreshingParagraphStyleUUIDs__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  if (a2)
  {
    v8 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUuid:", v7);

    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", ICTTAttributeNameParagraphStyle, v8, a3, a4);
  }
}

uint64_t __130__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineattachmentsOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, a2);
}

id __130__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineattachmentsOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isLinkAttachment"))
  {
    objc_msgSend(v6, "tokenContentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1160]);
  }
  objc_msgSend(v6, "displayText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_stringByRemovingLanguageDirectionCharacters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v4);
  else
    v11 = 0;

  return v11;
}

void __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EF53E378);
  v8 = v16;
  if (v7)
  {
    v9 = v16;
    if (!+[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v9))
    {
LABEL_14:

      v8 = v16;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v9, "inlineAttachmentInContext:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      if (!*(_BYTE *)(a1 + 64)
        || (!objc_msgSend(v11, "isUnsupported") ? (v13 = 0) : (v13 = v12),
            v14 = v13,
            v12,
            v14))
      {
        objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v10, 0);
        v15 = *(_QWORD *)(a1 + 56);
        if (v15)
          (*(void (**)(uint64_t, void *, void *, _QWORD))(v15 + 16))(v15, v10, v12, *(_QWORD *)(a1 + 48));
        goto LABEL_13;
      }
    }
    v12 = 0;
    goto LABEL_13;
  }
LABEL_15:

}

uint64_t __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

void __59__NSAttributedString_Shared__ic_searchableStringInContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v17 = v7;
    v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EF53E378);
    v8 = v17;
    if (v9)
    {
      v10 = v17;
      v11 = +[ICTTAttachment isInlineAttachment:](ICTTAttachment, "isInlineAttachment:", v10);
      v12 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        objc_msgSend(v10, "inlineAttachmentInContext:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "searchableTextContentInNote");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_11;
      }
      else
      {
        objc_msgSend(v10, "attachmentInContext:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "attachmentModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "searchableTextContentInNote");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
LABEL_11:

          v8 = v17;
          goto LABEL_12;
        }
      }
      if (!objc_msgSend(v14, "length"))
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));

        v14 = (void *)v16;
      }
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", a3, a4, v14);
      if (v13)
        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("ICAttachmentSearchable"), v13, a3, objc_msgSend(v14, "length"));
      goto LABEL_11;
    }
  }
LABEL_12:

}

void __59__NSAttributedString_UI__enumerateEditsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  ICTTTextEdit *v8;

  v7 = a2;
  v8 = -[ICTTTextEdit initWithAttributes:range:]([ICTTTextEdit alloc], "initWithAttributes:range:", v7, a3, a4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__NSAttributedString_UI__editsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Found NSAttachmentAttribute in text storage that isn't a ICTTAttachment: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
