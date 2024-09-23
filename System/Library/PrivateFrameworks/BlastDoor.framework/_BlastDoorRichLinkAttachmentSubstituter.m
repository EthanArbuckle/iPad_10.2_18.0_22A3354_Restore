@implementation _BlastDoorRichLinkAttachmentSubstituter

- (_BlastDoorRichLinkAttachmentSubstituter)init
{
  _BlastDoorRichLinkAttachmentSubstituter *v2;
  NSMutableArray *v3;
  NSMutableArray *archivedAttachments;
  _BlastDoorRichLinkAttachmentSubstituter *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorRichLinkAttachmentSubstituter;
  v2 = -[_BlastDoorRichLinkAttachmentSubstituter init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    archivedAttachments = v2->_archivedAttachments;
    v2->_archivedAttachments = v3;

    *(_WORD *)&v2->_shouldSubstituteAttachments = 1;
    v5 = v2;
  }

  return v2;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BlastDoorLPARAssetAttachmentSubstitute *v9;
  _BlastDoorLPVideoAttachmentSubstitute *v10;
  NSMutableArray *archivedAttachments;
  void *v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (self->_shouldSubstituteAttachments)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = -[_BlastDoorLPARAssetAttachmentSubstitute initWithARAsset:]([_BlastDoorLPARAssetAttachmentSubstitute alloc], "initWithARAsset:", v8);
LABEL_7:
      v10 = (_BlastDoorLPVideoAttachmentSubstitute *)v9;
      -[_BlastDoorLPARAssetAttachmentSubstitute setIndex:](v9, "setIndex:", -[NSMutableArray count](self->_archivedAttachments, "count"));
      archivedAttachments = self->_archivedAttachments;
      objc_msgSend(v8, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](archivedAttachments, "addObject:", v12);
      goto LABEL_17;
    }
    if (self->_shouldSubstituteAttachments)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        v9 = -[_BlastDoorLPImageAttachmentSubstitute initWithImage:]([_BlastDoorLPImageAttachmentSubstitute alloc], "initWithImage:", v8);
        goto LABEL_7;
      }
      if (self->_shouldSubstituteAttachments)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v7;
          objc_msgSend(v13, "data");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v10 = -[_BlastDoorLPVideoAttachmentSubstitute initWithVideo:]([_BlastDoorLPVideoAttachmentSubstitute alloc], "initWithVideo:", v13);
            -[_BlastDoorLPVideoAttachmentSubstitute setIndex:](v10, "setIndex:", -[NSMutableArray count](self->_archivedAttachments, "count"));
            v15 = self->_archivedAttachments;
            objc_msgSend(v13, "data");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v15, "addObject:", v16);

            goto LABEL_17;
          }

        }
      }
    }
  }
  if (self->_shouldIgnoreAppStoreMetadata && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = 0;
  else
    v10 = (_BlastDoorLPVideoAttachmentSubstitute *)v7;
LABEL_17:

  return v10;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  if (self->_shouldSubstituteAttachments
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || self->_shouldSubstituteAttachments
     && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || self->_shouldSubstituteAttachments && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))))
  {
    v7 = a4;
    v8 = objc_msgSend(v7, "index");
    if (v8 >= -[NSArray count](self->_attachmentsForUnarchiving, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", objc_msgSend(v7, "index"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "setFileURL:", v9);
        v10 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

    }
  }
  else
  {
    v11 = a4;
  }

  return v11;
}

- (NSMutableArray)archivedAttachments
{
  return self->_archivedAttachments;
}

- (NSArray)attachmentsForUnarchiving
{
  return self->_attachmentsForUnarchiving;
}

- (void)setAttachmentsForUnarchiving:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldSubstituteAttachments
{
  return self->_shouldSubstituteAttachments;
}

- (void)setShouldSubstituteAttachments:(BOOL)a3
{
  self->_shouldSubstituteAttachments = a3;
}

- (BOOL)shouldIgnoreAppStoreMetadata
{
  return self->_shouldIgnoreAppStoreMetadata;
}

- (void)setShouldIgnoreAppStoreMetadata:(BOOL)a3
{
  self->_shouldIgnoreAppStoreMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsForUnarchiving, 0);
  objc_storeStrong((id *)&self->_archivedAttachments, 0);
}

@end
