@implementation _BlastDoorLPMessagesPayload

- (_BlastDoorLPMessagesPayload)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPMessagesPayload *v5;
  uint64_t v6;
  _BlastDoorLPLinkMetadata *metadata;
  _BlastDoorLPLinkMetadata *v8;
  _BlastDoorLPMessagesPayload *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPMessagesPayload;
  v5 = -[_BlastDoorLPMessagesPayload init](&v11, sel_init);
  if (v5)
  {
    v5->_placeholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("richLinkIsPlaceholder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("richLinkMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (_BlastDoorLPLinkMetadata *)v6;

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
  _BOOL8 placeholder;
  id v5;

  placeholder = self->_placeholder;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", placeholder, CFSTR("richLinkIsPlaceholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("richLinkMetadata"));

}

+ (id)linkWithDataRepresentation:(id)a3 attachments:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BlastDoorRichLinkAttachmentSubstituter *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _BlastDoorLPMessagesPayload *v16;
  id v17;
  void *v18;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLink"));
  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkARAssetAttachmentSubstitute"));
  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkImageAttachmentSubstitute"));
  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("RichLinkVideoAttachmentSubstitute"));
  objc_msgSend(v7, "_enableStrictSecureDecodingMode");
  objc_msgSend(v7, "setDecodingFailurePolicy:", 1);
  v8 = objc_alloc_init(_BlastDoorRichLinkAttachmentSubstituter);
  -[_BlastDoorRichLinkAttachmentSubstituter setAttachmentsForUnarchiving:](v8, "setAttachmentsForUnarchiving:", v6);
  objc_msgSend(v7, "setDelegate:", v8);
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB2CD0];
  v20[0] = 0;
  objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", v12, v13, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20[0];

  objc_msgSend(v7, "finishDecoding");
  if (!v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v14;
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_alloc_init(_BlastDoorLPMessagesPayload);
      -[_BlastDoorLPMessagesPayload setMetadata:](v16, "setMetadata:", v14);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_alloc_init(_BlastDoorLPMessagesPayload);
      v17 = v14;
      objc_msgSend(v17, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BlastDoorLPMessagesPayload setMetadata:](v16, "setMetadata:", v18);

      -[_BlastDoorLPMessagesPayload setNeedsSubresourceFetch:](v16, "setNeedsSubresourceFetch:", objc_msgSend(v17, "hasFetchedSubresources") ^ 1);
      -[_BlastDoorLPMessagesPayload setNeedsCompleteFetch:](v16, "setNeedsCompleteFetch:", objc_msgSend(v17, "hasCompletedFetch") ^ 1);

      goto LABEL_9;
    }
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (id)dataRepresentationWithOutOfLineAttachments:(id *)a3
{
  void *v5;
  _BlastDoorRichLinkAttachmentSubstituter *v6;
  void *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLink"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkARAssetAttachmentSubstitute"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkImageAttachmentSubstitute"), objc_opt_class());
  objc_msgSend(v5, "setClassName:forClass:", CFSTR("RichLinkVideoAttachmentSubstitute"), objc_opt_class());
  v6 = objc_alloc_init(_BlastDoorRichLinkAttachmentSubstituter);
  -[_BlastDoorRichLinkAttachmentSubstituter setShouldSubstituteAttachments:](v6, "setShouldSubstituteAttachments:", a3 != 0);
  -[_BlastDoorRichLinkAttachmentSubstituter setShouldIgnoreAppStoreMetadata:](v6, "setShouldIgnoreAppStoreMetadata:", -[_BlastDoorLPMessagesPayload _needsWorkaroundForAppStoreTransformerCrash](self, "_needsWorkaroundForAppStoreTransformerCrash"));
  objc_msgSend(v5, "setDelegate:", v6);
  objc_msgSend(v5, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[_BlastDoorRichLinkAttachmentSubstituter archivedAttachments](v6, "archivedAttachments");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)needsCompleteFetch
{
  return self->_needsCompleteFetch
      || -[_BlastDoorLPMessagesPayload _needsWorkaroundForAppStoreTransformerCrash](self, "_needsWorkaroundForAppStoreTransformerCrash");
}

- (BOOL)_needsWorkaroundForAppStoreTransformerCrash
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  BOOL v7;

  -[_BlastDoorLPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[_BlastDoorLPLinkMetadata specialization](self->_metadata, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  return v7;
}

- (_BlastDoorLPLinkMetadata)metadata
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

@end
