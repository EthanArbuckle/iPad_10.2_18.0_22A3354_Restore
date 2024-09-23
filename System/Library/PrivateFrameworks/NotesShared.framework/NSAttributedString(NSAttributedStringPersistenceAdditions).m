@implementation NSAttributedString(NSAttributedStringPersistenceAdditions)

+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateNewAttachments:error:
{
  objc_msgSend(a1, "ic_attributedStringWithArchive:dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:", a3, a4, a5, 0, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:
{
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  int i;
  uint64_t v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  NSUInteger v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSUInteger v57;
  NSUInteger v58;
  NSRange v59;
  __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[2];
  _QWORD v82[2];
  uint64_t v83;
  _QWORD v84[3];
  NSRange v85;
  NSRange v86;

  v84[1] = *MEMORY[0x1E0C80C00];
  v76 = a4;
  v13 = a5;
  v73 = a6;
  v75 = v13;
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = *(uint64_t **)(a3 + 40);
  if (*((char *)v15 + 23) < 0)
  {
    v15 = (uint64_t *)*v15;
    v16 = *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8);
  }
  else
  {
    v16 = *((unsigned __int8 *)v15 + 23);
  }
  v74 = (void *)objc_msgSend(v14, "initWithBytes:length:encoding:", v15, v16, 4);
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v74);
  v72 = a3;
  v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v13 || !a7)
  {
LABEL_48:
    if (!v78)
      goto LABEL_60;
    v46 = *(_DWORD *)(v72 + 88);
    if (v46)
    {
      v47 = 0;
      v48 = 0;
      v49 = v72 + 80;
      do
      {
        v50 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>(v49, v47);
        +[ICTTMergeableAttributedString attributesForRun:](ICTTMergeableAttributedString, "attributesForRun:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v53, "attachmentIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend(v53, "attachmentIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
            objc_msgSend(v53, "setAttachmentIdentifier:", v56);

        }
        v57 = *(unsigned int *)(v50 + 48);
        v86.location = objc_msgSend(v78, "ic_range", v72);
        v86.length = v58;
        v85.location = v48;
        v85.length = v57;
        v59 = NSIntersectionRange(v85, v86);
        objc_msgSend(v78, "setAttributes:range:", v51, v59.location, v59.length);
        v48 += *(unsigned int *)(v50 + 48);

        ++v47;
      }
      while (v46 != v47);
    }
    v60 = ICTTAttributeNameParagraphStyle;
    v61 = objc_msgSend(v78, "ic_range", v72);
    v63 = v62;
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __162__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_attributedStringWithArchive_dataPersister_note_parentAttachment_shouldCreateNewAttachments_error___block_invoke;
    v79[3] = &unk_1E76C8530;
    v64 = v78;
    v80 = v64;
    v13 = v75;
    objc_msgSend(v64, "enumerateAttribute:inRange:options:usingBlock:", v60, v61, v63, 0, v79);

    goto LABEL_61;
  }
  v17 = a3;
  v18 = *(unsigned int *)(a3 + 112);
  if ((_DWORD)v18)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v17 + 104, v20);
      if ((*(_BYTE *)(v21 + 32) & 0x40) != 0)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = *(uint64_t **)(v21 + 80);
        if (*((char *)v23 + 23) < 0)
        {
          v23 = (uint64_t *)*v23;
          v24 = *(_QWORD *)(*(_QWORD *)(v21 + 80) + 8);
        }
        else
        {
          v24 = *((unsigned __int8 *)v23 + 23);
        }
        v25 = (void *)objc_msgSend(v22, "initWithBytes:length:encoding:", v23, v24, 4, v72);
        v19 += +[ICTTAttachment typeUTIIsInlineAttachment:](ICTTAttachment, "typeUTIIsInlineAttachment:", v25);

      }
      ++v20;
    }
    while ((_DWORD)v18 != v20);
  }
  else
  {
    v19 = 0;
  }
  if (v18 >= v19)
    v26 = v18 - v19;
  else
    v26 = 0;
  v13 = v75;
  if ((objc_msgSend(v75, "canAddAttachments:", v26, v72) & 1) != 0)
  {
    if (!v78)
      goto LABEL_60;
    v27 = objc_msgSend(v75, "isPasswordProtected") ^ 1;
    if (!(_DWORD)v18)
      LOBYTE(v27) = 1;
    if ((v27 & 1) == 0)
    {
      for (i = 0; (_DWORD)v18 != i; ++i)
      {
        v29 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v17 + 104, i);
        if ((*(_BYTE *)(v29 + 32) & 0x40) != 0)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB3940]);
          v31 = *(uint64_t **)(v29 + 80);
          if (*((char *)v31 + 23) < 0)
          {
            v31 = (uint64_t *)*v31;
            v32 = *(_QWORD *)(*(_QWORD *)(v29 + 80) + 8);
          }
          else
          {
            v32 = *((unsigned __int8 *)v31 + 23);
          }
          v33 = (void *)objc_msgSend(v30, "initWithBytes:length:encoding:", v31, v32, 4);
          if (!+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:](ICAttachment, "isTypeUTISupportedForPasswordProtectedNotes:", v33))
          {
            if (a8)
            {
              v68 = (void *)MEMORY[0x1E0CB35C8];
              v69 = *MEMORY[0x1E0D63F50];
              v81[0] = *MEMORY[0x1E0D63F70];
              v81[1] = v69;
              v82[0] = CFSTR("Unsupported attachment for password protected notes");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v82[1] = v70;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 205, v71);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_60;
          }

        }
      }
    }
    if ((_DWORD)v18)
    {
      v34 = 0;
      v35 = v72 + 104;
      while (1)
      {
        v36 = (void *)MEMORY[0x1C3B7AC74]();
        v37 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34);
        if ((*(_BYTE *)(v37 + 32) & 0x40) != 0)
        {
          v39 = *(uint64_t **)(v37 + 80);
          if (*((char *)v39 + 23) < 0)
            v39 = (uint64_t *)*v39;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v39, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v13 = v75;
            if (+[ICTTAttachment typeUTIIsInlineAttachment:](ICTTAttachment, "typeUTIIsInlineAttachment:", v38))
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "UUIDString");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v73)
                objc_msgSend(v73, "addInlineAttachmentWithIdentifier:", v41);
              else
                objc_msgSend(v75, "addInlineAttachmentWithIdentifier:", v41);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v44, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34), v76, v77);
              objc_msgSend(v44, "updateChangeCountWithReason:", CFSTR("Loaded inline attachment from archive"));
              goto LABEL_44;
            }
          }
          else
          {
            v13 = v75;
          }
        }
        else
        {
          v38 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "UUIDString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAttachmentWithIdentifier:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34), v76, v77);
        objc_msgSend(v44, "updateChangeCountWithReason:", CFSTR("Loaded attachment from archive"));
        objc_msgSend(v44, "media");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "updateChangeCountWithReason:", CFSTR("Loaded attachment from archive"));

LABEL_44:
        objc_autoreleasePoolPop(v36);
        if ((_DWORD)v18 == ++v34)
          goto LABEL_48;
      }
    }
    goto LABEL_48;
  }
  if (a8)
  {
    v65 = (void *)MEMORY[0x1E0CB35C8];
    v83 = *MEMORY[0x1E0D63F70];
    v84[0] = CFSTR("Maximum attachments exceeded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 202, v66);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_60:
  v64 = 0;
LABEL_61:

  return v64;
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:error:
{
  objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:forParentAttachment:error:", a3, a4, a5, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:forParentAttachment:error:
{
  objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", a3, a4, a5, a6, 1, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateAttachments:error:
{
  objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", a3, a4, a5, 0, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _BYTE v24[128];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    topotext::String::String((topotext::String *)v24);
    v17 = objc_retainAutorelease(v13);
    v18 = (char *)objc_msgSend(v17, "bytes");
    v19 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v17, "length"));
    if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v24, v18, v19))
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "ic_attributedStringWithArchive:dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:", v24, v14, v15, v16, a7, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:].cold.2();

      v20 = 0;
    }
    topotext::String::~String((topotext::String *)v24);
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:].cold.1();

    v20 = 0;
  }

  return v20;
}

+ (void)enumerateAttachmentsInData:()NSAttributedStringPersistenceAdditions withBlock:
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  id v7;
  char *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  char v16;
  _BYTE v17[80];
  uint64_t v18;
  int v19;

  v5 = a3;
  v6 = a4;
  topotext::String::String((topotext::String *)v17);
  v7 = objc_retainAutorelease(v5);
  v8 = (char *)objc_msgSend(v7, "bytes");
  v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v7, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v17, v8, v9))
  {
    v15 = v5;
    v16 = 0;
    v10 = v19;
    if (v19)
    {
      v11 = 0;
      while (1)
      {
        +[ICTTMergeableAttributedString attributesForRun:](ICTTMergeableAttributedString, "attributesForRun:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)&v18, v11), v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v6)
              v6[2](v6, v13, &v16);
            if (v16)
              break;
          }
        }

        if (v10 == ++v11)
          goto LABEL_14;
      }

    }
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:].cold.2();

  }
LABEL_14:
  topotext::String::~String((topotext::String *)v17);

}

- (uint64_t)ic_saveToArchive:()NSAttributedStringPersistenceAdditions flags:dataPersister:managedObjectContext:error:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v12 = a5;
  v13 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  objc_msgSend(a1, "string");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  objc_msgSend(a1, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4);
  *(_DWORD *)(a3 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(a3 + 40) == google::protobuf::internal::empty_string_)
  {
    v16 = (_QWORD *)operator new();
    *v16 = 0;
    v16[1] = 0;
    v16[2] = 0;
    *(_QWORD *)(a3 + 40) = v16;
  }
  MEMORY[0x1C3B7A7E8]();

  +[ICTTMergeableAttributedString saveAttributesOfString:toArchive:](ICTTMergeableAttributedString, "saveAttributesOfString:toArchive:", a1, a3);
  if ((a4 & 1) != 0)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__7;
    v32 = __Block_byref_object_dispose__7;
    v33 = 0;
    v17 = objc_msgSend(a1, "length");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __126__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_saveToArchive_flags_dataPersister_managedObjectContext_error___block_invoke;
    v21[3] = &unk_1E76C8558;
    v26 = a3;
    v22 = v13;
    v24 = &v34;
    v23 = v12;
    v25 = &v28;
    v27 = a4;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v17, 0, v21);
    if (a7)
    {
      v18 = (void *)v29[5];
      if (v18)
        *a7 = objc_retainAutorelease(v18);
    }

    _Block_object_dispose(&v28, 8);
  }
  v19 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (id)ic_serializeWithFlags:()NSAttributedStringPersistenceAdditions dataPersister:managedObjectContext:error:
{
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  _BYTE v19[128];

  v10 = a4;
  v11 = a5;
  objc_msgSend(a1, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  topotext::String::String((topotext::String *)v19);
  v18 = 0;
  v13 = objc_msgSend(v12, "ic_saveToArchive:flags:dataPersister:managedObjectContext:error:", v19, a3, v10, v11, &v18);
  v14 = v18;
  v15 = v14;
  if (v13)
  {
    v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v19)));
    google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v19, (void *)objc_msgSend(v16, "mutableBytes"), objc_msgSend(v16, "length"));
  }
  else
  {
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }

  topotext::String::~String((topotext::String *)v19);
  return v16;
}

- (uint64_t)ic_approximateAttachmentsSizeIncludingPreviews:()NSAttributedStringPersistenceAdditions
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_approximateAttachmentsSizeIncludingPreviews___block_invoke;
  v8[3] = &unk_1E76C8580;
  v8[4] = &v10;
  v9 = a3;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v5, 0, v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)ic_isCopyableSize
{
  return (unint64_t)objc_msgSend(a1, "ic_approximateAttachmentsSizeIncludingPreviews:", 1) >> 24 == 0;
}

+ (void)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "ic_attributedStringWithData receiving nil data input", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "NSAttributedString TT protobuf corrupt.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
