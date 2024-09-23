@implementation ICTTMergeableAttributedString

- (void)updateCache
{
  NSAttributedString *editsAttributedString;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString updateCache](&v4, sel_updateCache);
  editsAttributedString = self->_editsAttributedString;
  self->_editsAttributedString = 0;

}

- (ICTTMergeableAttributedString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7
{
  ICTTMergeableAttributedString *v8;
  ICTTMergeableAttributedString *v9;
  unsigned int v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  int v14;
  char *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  NSRange v19;
  void *v20;
  ICTTMergeableAttributedString *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  ICTTMergeableAttributedString *v25;
  ICTTMergeableAttributedString *v27;
  objc_super v28;
  NSRange v29;
  NSRange v30;

  v28.receiver = self;
  v28.super_class = (Class)ICTTMergeableAttributedString;
  v8 = -[ICTTMergeableString initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:](&v28, sel_initWithArchive_replicaID_orderedSubstrings_timestamp_fragment_, a3, a4, a5, a6, a7);
  v9 = v8;
  if (v8)
  {
    v10 = *((_DWORD *)a3 + 22);
    v27 = v8;
    -[ICTTMergeableString attributedString](v8, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    v13 = 0;
    if (v10)
    {
      v14 = 0;
      v15 = (char *)a3 + 80;
      v16 = 1;
      while (1)
      {
        v17 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)v15, v14);
        +[ICTTMergeableAttributedString attributesForRun:](ICTTMergeableAttributedString, "attributesForRun:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || (*(_BYTE *)(v17 + 32) & 1) == 0)
          break;
        v29.length = *(unsigned int *)(v17 + 48);
        v29.location = v13;
        v30.location = 0;
        v30.length = v12;
        v19 = NSIntersectionRange(v29, v30);
        -[ICTTMergeableString attributedString](v27, "attributedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAttributes:range:", v18, v19.location, v19.length);

        v13 += *(unsigned int *)(v17 + 48);
        v16 = ++v14 < v10;
        if (v10 == v14)
          goto LABEL_7;
      }
      v22 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.2();

    }
    else
    {
LABEL_7:
      v16 = 0;
    }
    v23 = v13 == v12;
    v9 = v27;
    if (!v23)
    {
      -[ICTTMergeableString dumpData](v27, "dumpData");
      v24 = os_log_create("com.apple.notes", "SimulatedCrash");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.1();

      v9 = v27;
    }
    if (v16)
      v21 = 0;
    else
      v21 = v9;
  }
  else
  {
    v21 = 0;
  }
  v25 = v21;

  return v25;
}

+ (id)attributesForRun:(const void *)a3
{
  _QWORD *v4;
  void *v5;
  int v6;
  ICTTFont *v7;
  ICTTFont *v8;
  uint64_t v9;
  ICTTFont *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  ICTTParagraphStyle *v21;
  ICTTParagraphStyle *v22;
  uint64_t v23;
  ICTTParagraphStyle *v24;
  float *v25;
  double v26;
  float v27;
  CGColorSpace *v28;
  CGColor *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  ICTTAttachment *v33;
  uint64_t *v34;
  void *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  uint64_t *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  int v59;
  ICFallbackSystemTextAttachment *v60;
  void *v61;
  void *v63;
  CGFloat components;
  double v65;
  double v66;
  double v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = *((_DWORD *)a3 + 8);
  if ((v6 & 4) != 0)
  {
    v7 = [ICTTFont alloc];
    v8 = v7;
    v9 = *((_QWORD *)a3 + 7);
    if (!v9)
      v9 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v7) + 56);
    v10 = -[ICTTFont initWithArchive:](v8, "initWithArchive:", v9);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, ICTTAttributeNameFont);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)a3 + 13));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, ICTTAttributeNameFontHints);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x10) != 0 && *((_DWORD *)a3 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, ICTTAttributeNameUnderline);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x20) != 0 && *((_DWORD *)a3 + 17))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, ICTTAttributeNameStrikethrough);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x1000) != 0 && *((_DWORD *)a3 + 30))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, ICTTAttributeNameEmphasis);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)a3 + 20));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, ICTTAttributeNameSuperscript);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x80) != 0)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = (uint64_t *)*((_QWORD *)a3 + 9);
    if (*((char *)v17 + 23) < 0)
    {
      v17 = (uint64_t *)*v17;
      v18 = *(_QWORD *)(*((_QWORD *)a3 + 9) + 8);
    }
    else
    {
      v18 = *((unsigned __int8 *)v17 + 23);
    }
    v19 = (void *)objc_msgSend(v16, "initWithBytes:length:encoding:", v17, v18, 4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("NSLink"));

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 2) != 0)
  {
    v21 = [ICTTParagraphStyle alloc];
    v22 = v21;
    v23 = *((_QWORD *)a3 + 5);
    if (!v23)
      v23 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v21) + 40);
    v24 = -[ICTTParagraphStyle initWithArchive:](v22, "initWithArchive:", v23);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, ICTTAttributeNameParagraphStyle);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x100) != 0)
  {
    v25 = (float *)*((_QWORD *)a3 + 11);
    if (v25)
    {
      components = v25[10];
    }
    else
    {
      v4 = (_QWORD *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
      v25 = (float *)*((_QWORD *)a3 + 11);
      components = *(float *)(v4[11] + 40);
      if (!v25)
      {
        v4 = (_QWORD *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
        v25 = (float *)*((_QWORD *)a3 + 11);
        v65 = *(float *)(v4[11] + 44);
        if (!v25)
        {
          v4 = (_QWORD *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
          v25 = (float *)*((_QWORD *)a3 + 11);
          v26 = *(float *)(v4[11] + 48);
          v66 = v26;
          if (!v25)
          {
            v4 = (_QWORD *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
            v25 = (float *)v4[11];
            v26 = v66;
          }
          goto LABEL_33;
        }
LABEL_32:
        v26 = v25[12];
        v66 = v26;
LABEL_33:
        v27 = v25[13];
        v67 = v27;
        if (components != 0.0 || v65 != 0.0 || v26 != 0.0 || v27 != 1.0)
        {
          v28 = (CGColorSpace *)TSUDeviceRGBColorSpace();
          v29 = CGColorCreate(v28, &components);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, ICTTAttributeNameForegroundColor);
          CGColorRelease(v29);
        }
        v6 = *((_DWORD *)a3 + 8);
        goto LABEL_39;
      }
    }
    v65 = v25[11];
    goto LABEL_32;
  }
LABEL_39:
  if ((v6 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[ICTTMergeableAttributedString writingDirectionForAttribute:](ICTTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 21)));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("NSWritingDirection"));

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x400) == 0)
    goto LABEL_54;
  v32 = *((_QWORD *)a3 + 12);
  if (!v32)
    v32 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4) + 96);
  if ((~*(_DWORD *)(v32 + 32) & 3) == 0)
  {
    v33 = objc_alloc_init(ICTTAttachment);
    v34 = *(uint64_t **)(v32 + 40);
    if (*((char *)v34 + 23) < 0)
      v34 = (uint64_t *)*v34;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTAttachment setAttachmentIdentifier:](v33, "setAttachmentIdentifier:", v35);

    v36 = objc_alloc(MEMORY[0x1E0CB3940]);
    v37 = *(uint64_t **)(v32 + 48);
    if (*((char *)v37 + 23) < 0)
    {
      v37 = (uint64_t *)*v37;
      v38 = *(_QWORD *)(*(_QWORD *)(v32 + 48) + 8);
    }
    else
    {
      v38 = *((unsigned __int8 *)v37 + 23);
    }
    v41 = (void *)objc_msgSend(v36, "initWithBytes:length:encoding:", v37, v38, 4);
    -[ICTTAttachment setAttachmentUTI:](v33, "setAttachmentUTI:", v41);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("NSAttachment"));
    v6 = *((_DWORD *)a3 + 8);
LABEL_54:
    if ((v6 & 0x2000) != 0)
    {
      v42 = *((_QWORD *)a3 + 14);
      if (!v42)
        v42 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4) + 112);
      if ((~*(_DWORD *)(v42 + 32) & 7) == 0)
      {
        v43 = objc_alloc(MEMORY[0x1E0C99D50]);
        v44 = *(uint64_t **)(v42 + 64);
        if (*((char *)v44 + 23) < 0)
        {
          v44 = (uint64_t *)*v44;
          v45 = *(_QWORD *)(*(_QWORD *)(v42 + 64) + 8);
        }
        else
        {
          v45 = *((unsigned __int8 *)v44 + 23);
        }
        v46 = (void *)objc_msgSend(v43, "initWithBytes:length:", v44, v45);
        v47 = objc_alloc(MEMORY[0x1E0CB3940]);
        v48 = *(uint64_t **)(v42 + 48);
        if (*((char *)v48 + 23) < 0)
        {
          v48 = (uint64_t *)*v48;
          v49 = *(_QWORD *)(*(_QWORD *)(v42 + 48) + 8);
        }
        else
        {
          v49 = *((unsigned __int8 *)v48 + 23);
        }
        v50 = (void *)objc_msgSend(v47, "initWithBytes:length:encoding:", v48, v49, 4);
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v52 = *(uint64_t **)(v42 + 56);
        if (*((char *)v52 + 23) < 0)
        {
          v52 = (uint64_t *)*v52;
          v53 = *(_QWORD *)(*(_QWORD *)(v42 + 56) + 8);
        }
        else
        {
          v53 = *((unsigned __int8 *)v52 + 23);
        }
        v54 = (void *)objc_msgSend(v51, "initWithBytes:length:encoding:", v52, v53, 4);
        v55 = *(uint64_t **)(v42 + 40);
        if (*((char *)v55 + 23) < 0)
          v55 = (uint64_t *)*v55;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v55, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v54, "isEqualToString:", v58);

        if (v59)
        {
          v60 = (ICFallbackSystemTextAttachment *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1260]), "initWithImageContent:", v46);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0DC10F0]);
        }
        else
        {
          v60 = -[ICFallbackSystemTextAttachment initWithData:type:contentIdentifier:systemClassName:]([ICFallbackSystemTextAttachment alloc], "initWithData:type:contentIdentifier:systemClassName:", v46, v50, v56, v54);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("NSAttachment"));
        }

      }
    }
    if ((*((_BYTE *)a3 + 33) & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)a3 + 13));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, ICTTAttributeNameTimestamp);

    }
    v40 = v5;
    goto LABEL_79;
  }
  v39 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    +[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) attributesForRun:].cold.1();

  v40 = 0;
LABEL_79:

  return v40;
}

+ (int64_t)writingDirectionForAttribute:(int)a3
{
  if ((a3 - 1) >= 4)
    return -1;
  else
    return (a3 - 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editsAttributedString, 0);
}

+ (NSSet)allowedAttributesForStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICTTMergeableAttributedString_allowedAttributesForStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ICTTMergeableAttributedString allowedAttributesForStyle]::once != -1)
    dispatch_once(&+[ICTTMergeableAttributedString allowedAttributesForStyle]::once, block);
  return (NSSet *)(id)+[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes;
}

void __58__ICTTMergeableAttributedString_allowedAttributesForStyle__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allowedTypingAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D1CC00];
  v6[0] = CFSTR("NSAttachment");
  v6[1] = v2;
  v6[2] = kDDFoundExistingLinkAttributeName;
  v6[3] = kUITextInputDictationResultMetadataAttributeName;
  v6[4] = TTPresentationAttributeNameApproxMaxItemNumber;
  v6[5] = CFSTR("NSTextAlternatives");
  v6[6] = *MEMORY[0x1E0DC10F0];
  v6[7] = TTPresentationAttributeNameMentionUnconfirmed;
  v6[8] = *MEMORY[0x1E0CB3040];
  v6[9] = TTPresentationAttributeNameHashtagUnconfirmed;
  v6[10] = TTPresentationAttributeNameAcceleratorLinkUnconfirmed;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes = v4;

}

void __56__ICTTMergeableAttributedString_allowedTypingAttributes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = ICTTAttributeNameFont;
  v4[1] = ICTTAttributeNameFontHints;
  v4[2] = ICTTAttributeNameUnderline;
  v4[3] = ICTTAttributeNameStrikethrough;
  v4[4] = ICTTAttributeNameEmphasis;
  v4[5] = ICTTAttributeNameForegroundColor;
  v4[6] = ICTTAttributeNameParagraphStyle;
  v4[7] = CFSTR("NSLink");
  v4[8] = *MEMORY[0x1E0CB3040];
  v4[9] = ICTTAttributeNameSuperscript;
  v4[10] = CFSTR("NSWritingDirection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes = v2;

}

+ (NSSet)allowedTypingAttributes
{
  if (+[ICTTMergeableAttributedString allowedTypingAttributes]::once != -1)
    dispatch_once(&+[ICTTMergeableAttributedString allowedTypingAttributes]::once, &__block_literal_global_19);
  return (NSSet *)(id)+[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes;
}

+ (int)attributeForWritingDirection:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (void)saveAttributes:(id)a3 toArchive:(void *)a4
{
  id v5;
  topotext::Font *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  topotext::ParagraphStyle *v27;
  void *v28;
  const CGFloat *Components;
  size_t NumberOfComponents;
  int v31;
  float64x2_t v32;
  float64x2_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  topotext *v38;
  int v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  NSObject *v46;
  void *v47;
  _BOOL4 v48;
  uint64_t v49;
  id v50;
  _QWORD *v51;
  void *v52;
  BOOL v53;
  _QWORD *v54;
  id v55;
  void *v56;
  void *v57;
  BOOL v58;
  BOOL v59;
  _BOOL4 v60;
  uint64_t v61;
  id v62;
  _QWORD *v63;
  id v64;
  void *v65;
  void *v66;
  std::string *v67;
  _QWORD *v68;
  id v69;
  std::string *v70;
  uint64_t v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  _QWORD *v82;
  id v83;
  std::string *v84;
  _QWORD *v85;
  id v86;
  std::string *v87;
  void *v88;
  BOOL v89;
  void *v90;
  uint64_t v91;
  id v92[2];
  void *v93;
  void *v94;
  void *v95;
  float64x2_t v96;
  void *v97;
  void *v98;
  std::string buf;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameFont);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    *((_DWORD *)a4 + 8) |= 4u;
    v6 = (topotext::Font *)*((_QWORD *)a4 + 7);
    if (!v6)
    {
      v6 = (topotext::Font *)operator new();
      topotext::Font::Font(v6);
      *((_QWORD *)a4 + 7) = v6;
    }
    objc_msgSend(v95, "saveToArchive:", v6);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameFontHints);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameFontHints);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    *((_DWORD *)a4 + 8) |= 8u;
    *((_DWORD *)a4 + 13) = v9;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameUnderline);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameUnderline);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v12;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameStrikethrough);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameStrikethrough);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((_DWORD *)a4 + 17) = v15;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameEmphasis);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameEmphasis);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    *((_DWORD *)a4 + 8) |= 0x1000u;
    *((_DWORD *)a4 + 30) = v18;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSLink"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v98, "absoluteString");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_23;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_23:
        v20 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v19 = v98;
    }
    v20 = objc_retainAutorelease(v19);
    objc_msgSend(v20, "UTF8String");
    *((_DWORD *)a4 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a4 + 9) == google::protobuf::internal::empty_string_)
    {
      v21 = (_QWORD *)operator new();
      *v21 = 0;
      v21[1] = 0;
      v21[2] = 0;
      *((_QWORD *)a4 + 9) = v21;
    }
    MEMORY[0x1C3B7A7DC]();
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameSuperscript);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameSuperscript);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if (v24)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameSuperscript);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intValue");
      *((_DWORD *)a4 + 8) |= 0x40u;
      *((_DWORD *)a4 + 20) = v26;

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameParagraphStyle);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    *((_DWORD *)a4 + 8) |= 2u;
    v27 = (topotext::ParagraphStyle *)*((_QWORD *)a4 + 5);
    if (!v27)
    {
      v27 = (topotext::ParagraphStyle *)operator new();
      topotext::ParagraphStyle::ParagraphStyle(v27);
      *((_QWORD *)a4 + 5) = v27;
    }
    objc_msgSend(v94, "saveToArchive:", v27);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameForegroundColor);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    Components = CGColorGetComponents((CGColorRef)v28);
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v28);
    v31 = NumberOfComponents;
    if (NumberOfComponents == 4)
    {
      v32 = *(float64x2_t *)Components;
      v33 = *(float64x2_t *)(Components + 2);
      *((_DWORD *)a4 + 8) |= 0x100u;
      v34 = *((_QWORD *)a4 + 11);
      if (!v34)
      {
        *(float64x2_t *)v92 = v32;
        v96 = v33;
        v34 = operator new();
        topotext::Color::Color((topotext::Color *)v34);
        *((_QWORD *)a4 + 11) = v34;
        v33 = v96;
        v32 = *(float64x2_t *)v92;
      }
      *(_DWORD *)(v34 + 32) |= 1u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 2u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 4u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 8u;
      *(float32x4_t *)(v34 + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
    }
    else
    {
      v35 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        buf.__r_.__value_.__r.__words[0] = 0x404000200;
        LOWORD(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 2) = v31;
        _os_log_impl(&dword_1BD918000, v35, OS_LOG_TYPE_DEFAULT, "Incorrect number of color components for foreground color. Expected %d and got %d", (uint8_t *)&buf, 0xEu);
      }

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSWritingDirection"), v92[0]);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97 && objc_msgSend(v97, "count"))
  {
    objc_msgSend(v97, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "integerValue");

    v38 = (topotext *)+[ICTTMergeableAttributedString attributeForWritingDirection:](ICTTMergeableAttributedString, "attributeForWritingDirection:", v37);
    v39 = (int)v38;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v38))
      __assert_rtn("set_writingdirection", "topotext.pb.h", 4482, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
    *((_DWORD *)a4 + 8) |= 0x200u;
    *((_DWORD *)a4 + 21) = v39;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (!v41)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "ic_isSystemTextAttachment");

    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v42;
        objc_msgSend(v45, "contentIdentifier");
        v46 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "systemClassName");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v46 = 0;
        v93 = 0;
      }
      v55 = v42;
      objc_msgSend(v55, "fileType");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        objc_msgSend(v55, "contents");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = !objc_msgSend(v57, "length") || v46 == 0;
        v59 = v58 || v93 == 0;
        v60 = !v59;

        if (v60)
        {
          *((_DWORD *)a4 + 8) |= 0x2000u;
          v61 = *((_QWORD *)a4 + 14);
          if (!v61)
          {
            v61 = operator new();
            topotext::AttachmentInfo::AttachmentInfo((topotext::AttachmentInfo *)v61);
            *((_QWORD *)a4 + 14) = v61;
          }
          objc_msgSend(v55, "fileType", v93);
          v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v62, "UTF8String");
          *(_DWORD *)(v61 + 32) |= 2u;
          if (!google::protobuf::internal::empty_string_)
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          if (*(_QWORD *)(v61 + 48) == google::protobuf::internal::empty_string_)
          {
            v63 = (_QWORD *)operator new();
            *v63 = 0;
            v63[1] = 0;
            v63[2] = 0;
            *(_QWORD *)(v61 + 48) = v63;
          }
          MEMORY[0x1C3B7A7DC]();

          objc_msgSend(v55, "contents");
          v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v65 = (void *)objc_msgSend(v64, "bytes");
          objc_msgSend(v55, "contents");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::basic_string[abi:ne180100](&buf, v65, objc_msgSend(v66, "length"));
          *(_DWORD *)(v61 + 32) |= 8u;
          if (!google::protobuf::internal::empty_string_)
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          v67 = *(std::string **)(v61 + 64);
          if (v67 == (std::string *)google::protobuf::internal::empty_string_)
          {
            v67 = (std::string *)operator new();
            v67->__r_.__value_.__r.__words[0] = 0;
            v67->__r_.__value_.__l.__size_ = 0;
            v67->__r_.__value_.__r.__words[2] = 0;
            *(_QWORD *)(v61 + 64) = v67;
          }
          std::string::operator=(v67, &buf);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);

          -[NSObject UTF8String](objc_retainAutorelease(v46), "UTF8String");
          *(_DWORD *)(v61 + 32) |= 1u;
          if (!google::protobuf::internal::empty_string_)
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          if (*(_QWORD *)(v61 + 40) == google::protobuf::internal::empty_string_)
          {
            v68 = (_QWORD *)operator new();
            *v68 = 0;
            v68[1] = 0;
            v68[2] = 0;
            *(_QWORD *)(v61 + 40) = v68;
          }
          MEMORY[0x1C3B7A7DC]();
          v69 = objc_retainAutorelease(v93);
          std::string::basic_string[abi:ne180100](&buf, (void *)objc_msgSend(v69, "UTF8String"), objc_msgSend(v69, "length"));
          *(_DWORD *)(v61 + 32) |= 4u;
          if (!google::protobuf::internal::empty_string_)
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          v70 = *(std::string **)(v61 + 56);
          if (v70 == (std::string *)google::protobuf::internal::empty_string_)
          {
            v70 = (std::string *)operator new();
            v70->__r_.__value_.__r.__words[0] = 0;
            v70->__r_.__value_.__l.__size_ = 0;
            v70->__r_.__value_.__r.__words[2] = 0;
            *(_QWORD *)(v61 + 56) = v70;
          }
          std::string::operator=(v70, &buf);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);
        }
      }

    }
    else
    {
      if (!objc_msgSend(v42, "conformsToProtocol:", &unk_1EF53E378))
      {
LABEL_92:

        goto LABEL_93;
      }
      objc_msgSend(v42, "attachmentIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 == 0;

      if (v48)
      {
        v46 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          +[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:].cold.1();
      }
      else
      {
        *((_DWORD *)a4 + 8) |= 0x400u;
        v49 = *((_QWORD *)a4 + 12);
        if (!v49)
        {
          v49 = operator new();
          topotext::AttachmentInfo::AttachmentInfo((topotext::AttachmentInfo *)v49);
          *((_QWORD *)a4 + 12) = v49;
        }
        objc_msgSend(v42, "attachmentIdentifier");
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v50, "UTF8String");
        *(_DWORD *)(v49 + 32) |= 1u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*(_QWORD *)(v49 + 40) == google::protobuf::internal::empty_string_)
        {
          v51 = (_QWORD *)operator new();
          *v51 = 0;
          v51[1] = 0;
          v51[2] = 0;
          *(_QWORD *)(v49 + 40) = v51;
        }
        MEMORY[0x1C3B7A7DC]();

        objc_msgSend(v42, "attachmentUTI");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52 == 0;

        if (v53)
          goto LABEL_92;
        objc_msgSend(v42, "attachmentUTI");
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[NSObject UTF8String](v46, "UTF8String");
        *(_DWORD *)(v49 + 32) |= 2u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*(_QWORD *)(v49 + 48) == google::protobuf::internal::empty_string_)
        {
          v54 = (_QWORD *)operator new();
          *v54 = 0;
          v54[1] = 0;
          v54[2] = 0;
          *(_QWORD *)(v49 + 48) = v54;
        }
        MEMORY[0x1C3B7A7DC]();
      }
    }

    goto LABEL_92;
  }
LABEL_93:
  v71 = *MEMORY[0x1E0DC10F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F0], v93);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72 == 0;

  if (!v73)
  {
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "contentIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1260], "contentType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "identifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "imageContent");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "className");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76 && v78 && v79)
    {
      *((_DWORD *)a4 + 8) |= 0x2000u;
      v81 = *((_QWORD *)a4 + 14);
      if (!v81)
      {
        v81 = operator new();
        topotext::AttachmentInfo::AttachmentInfo((topotext::AttachmentInfo *)v81);
        *((_QWORD *)a4 + 14) = v81;
      }
      objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
      *(_DWORD *)(v81 + 32) |= 2u;
      if (!google::protobuf::internal::empty_string_)
        goto LABEL_121;
      if (*(_QWORD *)(v81 + 48) == google::protobuf::internal::empty_string_)
      {
        v82 = (_QWORD *)operator new();
        *v82 = 0;
        v82[1] = 0;
        v82[2] = 0;
        *(_QWORD *)(v81 + 48) = v82;
      }
      MEMORY[0x1C3B7A7DC]();
      v83 = objc_retainAutorelease(v79);
      std::string::basic_string[abi:ne180100](&buf, (void *)objc_msgSend(v83, "bytes"), objc_msgSend(v83, "length"));
      *(_DWORD *)(v81 + 32) |= 8u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      v84 = *(std::string **)(v81 + 64);
      if (v84 == (std::string *)google::protobuf::internal::empty_string_)
      {
        v84 = (std::string *)operator new();
        v84->__r_.__value_.__r.__words[0] = 0;
        v84->__r_.__value_.__l.__size_ = 0;
        v84->__r_.__value_.__r.__words[2] = 0;
        *(_QWORD *)(v81 + 64) = v84;
      }
      std::string::operator=(v84, &buf);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
      *(_DWORD *)(v81 + 32) |= 1u;
      if (!google::protobuf::internal::empty_string_)
LABEL_121:
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*(_QWORD *)(v81 + 40) == google::protobuf::internal::empty_string_)
      {
        v85 = (_QWORD *)operator new();
        *v85 = 0;
        v85[1] = 0;
        v85[2] = 0;
        *(_QWORD *)(v81 + 40) = v85;
      }
      MEMORY[0x1C3B7A7DC]();
      v86 = objc_retainAutorelease(v80);
      std::string::basic_string[abi:ne180100](&buf, (void *)objc_msgSend(v86, "UTF8String"), objc_msgSend(v86, "length"));
      *(_DWORD *)(v81 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      v87 = *(std::string **)(v81 + 56);
      if (v87 == (std::string *)google::protobuf::internal::empty_string_)
      {
        v87 = (std::string *)operator new();
        v87->__r_.__value_.__r.__words[0] = 0;
        v87->__r_.__value_.__l.__size_ = 0;
        v87->__r_.__value_.__r.__words[2] = 0;
        *(_QWORD *)(v81 + 56) = v87;
      }
      std::string::operator=(v87, &buf);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameTimestamp);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88 == 0;

  if (!v89)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", ICTTAttributeNameTimestamp);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "unsignedLongValue");
    *((_DWORD *)a4 + 8) |= 0x800u;
    *((_QWORD *)a4 + 13) = v91;

  }
}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString saveToArchive:](&v6, sel_saveToArchive_);
  -[ICTTMergeableString attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTTMergeableAttributedString saveAttributesOfString:toArchive:](ICTTMergeableAttributedString, "saveAttributesOfString:toArchive:", v5, a3);

}

+ (void)saveAttributesOfString:(id)a3 toArchive:(void *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  topotext::AttributeRun *v12;
  uint64_t v13;
  int32x2_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v16, 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *((_DWORD *)a4 + 23);
      v10 = *((int *)a4 + 22);
      if ((int)v10 >= v9)
      {
        if (v9 == *((_DWORD *)a4 + 24))
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a4 + 20, v9 + 1);
        v12 = google::protobuf::internal::GenericTypeHandler<topotext::AttributeRun>::New();
        v13 = *((_QWORD *)a4 + 10);
        v14 = *(int32x2_t *)((char *)a4 + 88);
        *((int32x2_t *)a4 + 11) = vadd_s32(v14, (int32x2_t)0x100000001);
        *(_QWORD *)(v13 + 8 * v14.i32[0]) = v12;
      }
      else
      {
        v11 = *((_QWORD *)a4 + 10);
        *((_DWORD *)a4 + 22) = v10 + 1;
        v12 = *(topotext::AttributeRun **)(v11 + 8 * v10);
      }
      v15 = ICTTBoundedCheckedCastNSUIntegerToUInt32(v17);
      *((_DWORD *)v12 + 8) |= 1u;
      *((_DWORD *)v12 + 12) = v15;
      +[ICTTMergeableAttributedString saveAttributes:toArchive:](ICTTMergeableAttributedString, "saveAttributes:toArchive:", v8, v12);
      v7 += v17;

    }
    while (v7 < v6);
  }

}

- (id)serialize
{
  id v3;
  _BYTE v5[128];

  topotext::String::String((topotext::String *)v5);
  -[ICTTMergeableAttributedString saveToArchive:](self, "saveToArchive:", v5);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v5)));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v5, (void *)objc_msgSend(v3, "mutableBytes"), objc_msgSend(v3, "length"));
  topotext::String::~String((topotext::String *)v5);
  return v3;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString i_saveDeltasSinceTimestamp:toArchive:](&v6, sel_i_saveDeltasSinceTimestamp_toArchive_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTTMergeableAttributedString saveAttributesOfString:toArchive:](ICTTMergeableAttributedString, "saveAttributesOfString:toArchive:", v5, a4);

}

+ (NSSet)allowedAttributesForModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICTTMergeableAttributedString_allowedAttributesForModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ICTTMergeableAttributedString allowedAttributesForModel]::once != -1)
    dispatch_once(&+[ICTTMergeableAttributedString allowedAttributesForModel]::once, block);
  return (NSSet *)(id)+[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes;
}

void __58__ICTTMergeableAttributedString_allowedAttributesForModel__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allowedTypingAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("NSAttachment");
  v5[1] = ICTTAttributeNameTimestamp;
  v5[2] = *MEMORY[0x1E0DC10F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes = v3;

}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  -[ICTTMergeableAttributedString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", a4, 0, a3);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (-[ICTTMergeableString length](self, "length"))
  {
    -[ICTTMergeableString attributedString](self, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = location - 1;
    if (!location)
      v10 = 0;
    if (length)
      v11 = location;
    else
      v11 = v10;
    objc_msgSend(v8, "attributesAtIndex:effectiveRange:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  v14.receiver = self;
  v14.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v13);

}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[ICTTMergeableString attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  void *__p;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  id v27;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  if (length)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__ICTTMergeableAttributedString_setAttributes_range___block_invoke;
    v26[3] = &unk_1E76C97A8;
    v26[4] = self;
    v10 = v9;
    v27 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", kDDFoundExistingLinkAttributeName);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSLink"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSLink"));
      }
    }
    v13 = v10;

    v25 = 0;
    v15 = -[ICTTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v13, location, length, &v25);
    if (v25)
    {
      if (!v15)
      {
        -[ICTTMergeableString attributedString](self, "attributedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAttributes:range:", v13, location, length);

        -[ICTTMergeableString delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "edited:range:changeInLength:", 1, location, length, 0);

      }
    }
    else
    {
      -[ICTTMergeableString delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginEditing");

      -[ICTTMergeableString beginEditing](self, "beginEditing");
      __p = 0;
      v23 = 0;
      v24 = 0;
      -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, location, length);
      v19 = __p;
      v20 = v23;
      while (v19 != v20)
        -[ICTTMergeableAttributedString setAttributes:substring:](self, "setAttributes:substring:", v13, *v19++);
      -[ICTTMergeableString endEditing](self, "endEditing");
      -[ICTTMergeableString delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "endEditing");

      if (__p)
      {
        v23 = __p;
        operator delete(__p);
      }
    }

  }
  else
  {
    v13 = v7;
  }

}

void __53__ICTTMergeableAttributedString_setAttributes_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "allowedAttributesForModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v8);

}

- (BOOL)attributesEqual:(id)a3 toRange:(_NSRange)a4 modelEqual:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  BOOL v15;
  _QWORD v16[2];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  -[ICTTMergeableString attributedString](self, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributesAtIndex:effectiveRange:", location, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v16[1] + v16[0] >= location + length)
  {
    v13 = -[ICTTMergeableAttributedString attributesEqual:to:modelEqual:](self, "attributesEqual:to:modelEqual:", v9, v11, &v15);
    v12 = v15;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  *a5 = v12;

  return v13;
}

- (BOOL)attributesEqual:(id)a3 to:(id)a4 modelEqual:(BOOL *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  CFTypeID v21;
  CFTypeID v22;
  int v23;
  int v24;
  int v25;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  *a5 = 1;
  v28 = v7;
  v9 = objc_msgSend(v7, "count");
  if (v9 == objc_msgSend(v8, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v7, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v30;
      v13 = 1;
      obj = v10;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v15, obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            *a5 = 0;
LABEL_25:

            LOBYTE(v13) = 0;
            v10 = obj;
            goto LABEL_26;
          }
          objc_msgSend(v28, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", v16);
          v21 = CFGetTypeID(v19);
          if (v21 == CGColorGetTypeID() && (v22 = CFGetTypeID(v16), v22 == CGColorGetTypeID()))
          {
            v23 = ICCGColorEquivalentToColor();
          }
          else
          {
            if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF53E1E8))
            {
              v24 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EF53E1E8);
              v25 = v20;
              if (v24)
                v25 = objc_msgSend(v19, "isEqualToModelComparable:", v16);
            }
            else
            {
              v25 = v20;
            }
            if (*a5)
              v23 = v25;
            else
              v23 = 0;
          }
          *a5 = v23;

          v13 &= v20;
          if (!(v13 | v23))
            goto LABEL_25;

        }
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v13) = 1;
    }
LABEL_26:

  }
  else
  {
    LOBYTE(v13) = 0;
    *a5 = 0;
  }

  return v13;
}

- (void)setAttributes:(id)a3 substring:(void *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  ICTTMergeableStringUndoAttributeCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  ICTTMergeableStringUndoAttributeCommand *v27;
  void *__p;
  void *v29;
  _QWORD *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD v34[4];
  ICTTMergeableStringUndoAttributeCommand *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v6 = a3;
  if (a4 && !*((_BYTE *)a4 + 44))
  {
    v39 = 0;
    v7 = -[ICTTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v6, *((unsigned int *)a4 + 10), *((unsigned int *)a4 + 4), &v39);
    if (!v39)
    {
      -[ICTTMergeableString delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[ICTTMergeableString delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "wantsUndoCommands");

        if (v13)
        {
          v14 = objc_alloc_init(ICTTMergeableStringUndoAttributeCommand);
          if (*((_BYTE *)a4 + 44))
            v15 = 0;
          else
            v15 = *((unsigned int *)a4 + 4);
          v25 = *((unsigned int *)a4 + 10);
          -[ICTTMergeableString attributedString](self, "attributedString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __57__ICTTMergeableAttributedString_setAttributes_substring___block_invoke;
          v34[3] = &unk_1E76C97D0;
          v36 = a4;
          v37 = v25;
          v38 = v15;
          v27 = v14;
          v35 = v27;
          objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", v25, v15, 0, v34);

          -[ICTTMergeableUndoString addUndoCommand:](self, "addUndoCommand:", v27);
        }
      }
    }
    if (!v7)
    {
      -[ICTTMergeableString attributedString](self, "attributedString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*((_BYTE *)a4 + 44))
        v10 = 0;
      else
        v10 = *((unsigned int *)a4 + 4);
      objc_msgSend(v8, "setAttributes:range:", v6, *((unsigned int *)a4 + 10), v10);

    }
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)*((_QWORD *)a4 + 3);
      *((_QWORD *)a4 + 3) = v16;

      -[ICTTMergeableString delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v19 = operator new(8uLL);
        __p = v19;
        *v19 = a4;
        v29 = v19 + 1;
        v30 = v19 + 1;
        -[ICTTMergeableString getCharacterRanges:forSubstrings:](self, "getCharacterRanges:forSubstrings:", &v31, &__p);
        v20 = (uint64_t *)v31;
        v21 = v32;
        while (v20 != v21)
        {
          v22 = *v20;
          v23 = v20[1];
          -[ICTTMergeableString delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "edited:range:changeInLength:", 1, v22, v23, 0);

          v20 += 2;
        }
        if (__p)
        {
          v29 = __p;
          operator delete(__p);
        }
        if (v31)
        {
          v32 = (uint64_t *)v31;
          operator delete(v31);
        }
      }
      -[ICTTMergeableString setHasLocalChanges:](self, "setHasLocalChanges:", 1);
    }
  }

}

void __57__ICTTMergeableAttributedString_setAttributes_substring___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  int v11;
  uint64_t *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  id v18;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  LODWORD(a3) = ICTTBoundedCheckedCastNSUIntegerToUInt32(a3 - *(_QWORD *)(a1 + 48));
  v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32(a4);
  v10 = *(id *)v8;
  v11 = *(_DWORD *)(v8 + 8);
  v12 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "attributeRanges");
  v13 = v10;
  v15 = v13;
  v16 = v11 + a3;
  v17 = v9;
  v14 = v7;
  v18 = v14;
  std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::push_back[abi:ne180100](v12, (uint64_t *)&v15);

}

- (NSAttributedString)editsAttributedString
{
  NSAttributedString *editsAttributedString;
  NSAttributedString *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  NSAttributedString *v18;
  NSAttributedString *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  editsAttributedString = self->_editsAttributedString;
  if (editsAttributedString)
  {
    v3 = editsAttributedString;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[ICTTMergeableString attributedString](self, "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:", v7);

    -[ICTTMergeableString attributedString](self, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = ICTTAttributeNameTimestamp;
    -[ICTTMergeableString attributedString](self, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ic_range");
    v14 = v13;
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke;
    v26[3] = &unk_1E76C97F8;
    v16 = v8;
    v27 = v16;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, v12, v14, 0, v26);

    v21 = v15;
    v22 = 3221225472;
    v23 = __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke_2;
    v24 = &unk_1E76C9820;
    v17 = v16;
    v25 = v17;
    -[ICTTMergeableString traverseUnordered:](self, "traverseUnordered:", &v21);
    v18 = (NSAttributedString *)objc_msgSend(v17, "copy", v21, v22, v23, v24);
    v19 = self->_editsAttributedString;
    self->_editsAttributedString = v18;

    v3 = self->_editsAttributedString;
  }
  return v3;
}

void __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", ICTTAttributeNameTimestamp, v7, a3, a4);

}

uint64_t __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 44))
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", ICTTAttributeNameReplicaID, *(_QWORD *)a2, *(unsigned int *)(a2 + 40), *(unsigned int *)(a2 + 16));
  return result;
}

- (id)editAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  ICTTTextEdit *v6;
  ICTTTextEdit *v7;
  _QWORD v9[2];

  -[ICTTMergeableAttributedString editsAttributedString](self, "editsAttributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesAtIndex:effectiveRange:", a3, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [ICTTTextEdit alloc];
  v7 = -[ICTTTextEdit initWithAttributes:range:](v6, "initWithAttributes:range:", v5, v9[0], v9[1]);

  return v7;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSUInteger v9;
  NSRange v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSRange v15;
  NSRange v16;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTTMergeableAttributedString editsAttributedString](self, "editsAttributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.location = objc_msgSend(v8, "ic_range");
  v16.length = v9;
  v15.location = location;
  v15.length = length;
  v10 = NSIntersectionRange(v15, v16);

  -[ICTTMergeableAttributedString editsAttributedString](self, "editsAttributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__ICTTMergeableAttributedString_enumerateEditsInRange_usingBlock___block_invoke;
  v13[3] = &unk_1E76C9848;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v13);

}

void __66__ICTTMergeableAttributedString_enumerateEditsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  ICTTTextEdit *v7;
  id v8;

  v8 = a2;
  v7 = -[ICTTTextEdit initWithAttributes:range:]([ICTTTextEdit alloc], "initWithAttributes:range:", v8, a3, a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)editsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__ICTTMergeableAttributedString_editsInRange___block_invoke;
  v10[3] = &unk_1E76C9870;
  v7 = v6;
  v11 = v7;
  -[ICTTMergeableAttributedString enumerateEditsInRange:usingBlock:](self, "enumerateEditsInRange:usingBlock:", location, length, v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

uint64_t __46__ICTTMergeableAttributedString_editsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSArray)edits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[ICTTMergeableAttributedString editsAttributedString](self, "editsAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_range");
  -[ICTTMergeableAttributedString editsInRange:](self, "editsInRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)setTimestamp:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSUInteger v9;
  NSRange v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICTTMergeableAttributedString *v15;
  NSRange v16;
  NSRange v17;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[ICTTMergeableString attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17.location = objc_msgSend(v8, "ic_range");
  v17.length = v9;
  v16.location = location;
  v16.length = length;
  v10 = NSIntersectionRange(v16, v17);

  -[ICTTMergeableString attributedString](self, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__ICTTMergeableAttributedString_setTimestamp_range___block_invoke;
  v13[3] = &unk_1E76C9898;
  v12 = v7;
  v14 = v12;
  v15 = self;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v13);

}

void __52__ICTTMergeableAttributedString_setTimestamp_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_msgSend(a2, "mutableCopy");
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, ICTTAttributeNameTimestamp);
  if (v7)

  v10 = *(void **)(a1 + 40);
  v11 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v10, "setAttributes:range:", v11, a3, a4);

}

- (void)removeTimestampsForReplicaID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICTTMergeableAttributedString *v12;

  v4 = a3;
  -[ICTTMergeableAttributedString editsAttributedString](self, "editsAttributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_range");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ICTTMergeableAttributedString_removeTimestampsForReplicaID___block_invoke;
  v10[3] = &unk_1E76C98C0;
  v9 = v4;
  v11 = v9;
  v12 = self;
  -[ICTTMergeableAttributedString enumerateEditsInRange:usingBlock:](self, "enumerateEditsInRange:usingBlock:", v6, v8, v10);

}

void __62__ICTTMergeableAttributedString_removeTimestampsForReplicaID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "replicaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend(v8, "range");
    objc_msgSend(v5, "setTimestamp:range:", 0, v6, v7);
  }

}

- (void)setEditsAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_editsAttributedString, a3);
}

- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  topotext::String *v8;
  uint64_t v9;
  ICTTMergeableAttributedString *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 10)
  {
    objc_opt_class();
    objc_msgSend(v4, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_DWORD *)(v5 + 48) == 10)
      v9 = *(_QWORD *)(v5 + 40);
    else
      v9 = topotext::String::default_instance(v8);
    objc_msgSend(v7, "replica");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedTopotextTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICTTMergeableString initWithArchive:replicaID:timestamp:](self, "initWithArchive:replicaID:timestamp:", v9, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICTTMergeableString initWithReplicaID:](self, "initWithReplicaID:", v7);
  }

  objc_msgSend(v4, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString setDocument:](v10, "setDocument:", v13);

  return v10;
}

- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3 string:(const void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICTTMergeableAttributedString *v11;
  NSObject *v12;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "replica");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedTopotextTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICTTMergeableString initWithArchive:replicaID:timestamp:](self, "initWithArchive:replicaID:timestamp:", a4, v9, v10);

  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICTTMergeableAttributedString(ICCRDataType) initWithICCRCoder:string:].cold.1(v12);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICTTMergeableString initWithReplicaID:](self, "initWithReplicaID:", v9);
  }

  return v11;
}

- (void)encodeWithICCRCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  topotext::String *v9;
  id v10;

  v10 = a3;
  -[ICTTMergeableString document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedTopotextTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.document.sharedTopotextTimestamp == self.timestamp", "-[ICTTMergeableAttributedString(ICCRDataType) encodeWithICCRCoder:]", 1, 0, CFSTR("Timestamp should be the same the as one in document."));
  v7 = objc_msgSend(v10, "currentDocumentObjectForEncoding");
  v8 = v7;
  if (*(_DWORD *)(v7 + 48) == 10)
  {
    v9 = *(topotext::String **)(v7 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v7);
    *(_DWORD *)(v8 + 48) = 10;
    v9 = (topotext::String *)operator new();
    topotext::String::String(v9);
    *(_QWORD *)(v8 + 40) = v9;
  }
  -[ICTTMergeableAttributedString encodeWithICCRCoder:string:](self, "encodeWithICCRCoder:string:", v10, v9);

}

- (void)encodeWithICCRCoder:(id)a3 string:(void *)a4
{
  -[ICTTMergeableAttributedString saveToArchive:](self, "saveToArchive:", a4);
}

@end
