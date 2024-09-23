@implementation LPMessagesPayload

- (LPMessagesPayload)initWithCoder:(id)a3
{
  id v4;
  LPMessagesPayload *v5;
  uint64_t v6;
  LPLinkMetadata *metadata;
  LPLinkMetadata *v8;
  LPMessagesPayload *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LPMessagesPayload;
  v5 = -[LPMessagesPayload init](&v11, sel_init);
  if (v5)
  {
    v5->_placeholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("richLinkIsPlaceholder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("richLinkMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v5->_metadata;
      v5->_metadata = 0;

    }
    v9 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_placeholder, CFSTR("richLinkIsPlaceholder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("richLinkMetadata"));

}

+ (id)_linkWithDataRepresentation:(id)a3 substitutingAttachments:(BOOL)a4 attachments:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  RichLinkAttachmentSubstituter *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LPMessagesPayload *v26;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  _BYTE v45[24];
  uint64_t v46;

  v6 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, 0);
  objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLink"));
  objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkARAssetAttachmentSubstitute"));
  objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkImageAttachmentSubstitute"));
  objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkVideoAttachmentSubstitute"));
  objc_msgSend(v9, "_enableStrictSecureDecodingMode");
  objc_msgSend(v9, "setDecodingFailurePolicy:", 1);
  if (v6)
  {
    v10 = objc_alloc_init(RichLinkAttachmentSubstituter);
    -[RichLinkAttachmentSubstituter setAttachmentsForUnarchiving:](v10, "setAttachmentsForUnarchiving:", v8);
    objc_msgSend(v9, "setDelegate:", v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = &off_1E44A6000;
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB2CD0];
  v44 = 0;
  objc_msgSend(v9, "decodeTopLevelObjectOfClasses:forKey:error:", v15, v16, &v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v44;

  objc_msgSend(v9, "finishDecoding");
  if (v18)
  {
    v19 = LPLogChannelFetching();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[LPMessagesPayload _linkWithDataRepresentation:substitutingAttachments:attachments:].cold.4((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
LABEL_7:
    v26 = 0;
    goto LABEL_8;
  }
  if (!v17)
  {
    v29 = LPLogChannelFetching();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[LPMessagesPayload _linkWithDataRepresentation:substitutingAttachments:attachments:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v17;
    -[LPMessagesPayload metadata](v26, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMessagesPayload setNeedsCompleteFetch:](v26, "setNeedsCompleteFetch:", objc_msgSend(v28, "_isCurrentlyLoadingOrIncomplete"));

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_alloc_init(LPMessagesPayload);
    -[LPMessagesPayload setMetadata:](v26, "setMetadata:", v17);
    -[LPMessagesPayload metadata](v26, "metadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMessagesPayload setNeedsCompleteFetch:](v26, "setNeedsCompleteFetch:", objc_msgSend(v37, "_isCurrentlyLoadingOrIncomplete"));

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = (void *)objc_opt_class();
      +[LPMessagesPayload _linkWithDataRepresentation:substitutingAttachments:attachments:].cold.3(v43, (uint64_t)v45, v42);
    }

    goto LABEL_7;
  }
  v26 = objc_alloc_init(LPMessagesPayload);
  v38 = v17;
  objc_msgSend(v38, "metadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMessagesPayload setMetadata:](v26, "setMetadata:", v39);

  -[LPMessagesPayload setNeedsSubresourceFetch:](v26, "setNeedsSubresourceFetch:", objc_msgSend(v38, "hasFetchedSubresources") ^ 1);
  v40 = objc_msgSend(v38, "hasCompletedFetch");
  if (v40)
  {
    objc_msgSend(v38, "metadata");
    v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v14, "_isCurrentlyLoadingOrIncomplete");
  }
  else
  {
    v41 = 1;
  }
  -[LPMessagesPayload setNeedsCompleteFetch:](v26, "setNeedsCompleteFetch:", v41);
  if (v40)

LABEL_8:
  return v26;
}

+ (id)linkWithDataRepresentation:(id)a3 attachments:(id)a4
{
  objc_msgSend(a1, "_linkWithDataRepresentation:substitutingAttachments:attachments:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)linkWithDataRepresentationWithoutSubstitutingAttachments:(id)a3
{
  objc_msgSend(a1, "_linkWithDataRepresentation:substitutingAttachments:attachments:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performSubstitutionWithAttachments:(id)a3
{
  id v4;
  RichLinkAttachmentSubstituter *v5;
  LPLinkMetadata *metadata;
  RichLinkAttachmentSubstituter *v7;
  _QWORD v8[5];
  RichLinkAttachmentSubstituter *v9;

  v4 = a3;
  v5 = objc_alloc_init(RichLinkAttachmentSubstituter);
  -[RichLinkAttachmentSubstituter setAttachmentsForUnarchiving:](v5, "setAttachmentsForUnarchiving:", v4);
  metadata = self->_metadata;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__LPMessagesPayload_performSubstitutionWithAttachments___block_invoke;
  v8[3] = &unk_1E44A99D8;
  v8[4] = self;
  v7 = v5;
  v9 = v7;
  -[LPLinkMetadata _enumerateSubstitutableFields:](metadata, "_enumerateSubstitutableFields:", v8);

}

void __56__LPMessagesPayload_performSubstitutionWithAttachments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "valueForKeyPath:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "applyAttachmentSubstitutionForObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {

      v4 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setValue:forKeyPath:", v4, v7);

  }
}

- (id)dataRepresentationWithOutOfLineAttachments:(id *)a3
{
  void *v5;
  RichLinkAttachmentSubstituter *v6;
  void *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLink"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkARAssetAttachmentSubstitute"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkImageAttachmentSubstitute"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkVideoAttachmentSubstitute"), objc_opt_class());
  v6 = objc_alloc_init(RichLinkAttachmentSubstituter);
  -[RichLinkAttachmentSubstituter setShouldSubstituteAttachments:](v6, "setShouldSubstituteAttachments:", a3 != 0);
  -[RichLinkAttachmentSubstituter setShouldIgnoreAppStoreMetadata:](v6, "setShouldIgnoreAppStoreMetadata:", -[LPMessagesPayload _needsWorkaroundForAppStoreTransformerCrash](self, "_needsWorkaroundForAppStoreTransformerCrash"));
  objc_msgSend(v5, "setDelegate:", v6);
  objc_msgSend(v5, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[RichLinkAttachmentSubstituter archivedAttachments](v6, "archivedAttachments");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)needsCompleteFetch
{
  return self->_needsCompleteFetch
      || -[LPMessagesPayload _needsWorkaroundForAppStoreTransformerCrash](self, "_needsWorkaroundForAppStoreTransformerCrash");
}

- (BOOL)_needsWorkaroundForAppStoreTransformerCrash
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  BOOL v7;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  return v7;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)needsSubresourceFetch
{
  return self->_needsSubresourceFetch;
}

- (void)setNeedsSubresourceFetch:(BOOL)a3
{
  self->_needsSubresourceFetch = a3;
}

- (void)setNeedsCompleteFetch:(BOOL)a3
{
  self->_needsCompleteFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (void)_linkWithDataRepresentation:(uint64_t)a3 substitutingAttachments:(uint64_t)a4 attachments:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_1A0C41000, a1, a3, "RichLink: Failed to decode; object was nil", a5, a6, a7, a8, 0);
}

+ (void)_linkWithDataRepresentation:(uint64_t)a3 substitutingAttachments:(uint64_t)a4 attachments:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "RichLink: Failed to decode with exception: %@", a5, a6, a7, a8, 2u);
}

+ (void)_linkWithDataRepresentation:(void *)a1 substitutingAttachments:(uint64_t)a2 attachments:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_error_impl(&dword_1A0C41000, a3, OS_LOG_TYPE_ERROR, "RichLink: Failed to decode; object was of an unexpected class: %@",
    (uint8_t *)a2,
    0xCu);

}

+ (void)_linkWithDataRepresentation:(uint64_t)a3 substitutingAttachments:(uint64_t)a4 attachments:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "RichLink: Failed to decode with error: %@", a5, a6, a7, a8, 2u);
}

@end
