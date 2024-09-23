@implementation RichLinkAttachmentSubstituter

- (RichLinkAttachmentSubstituter)init
{
  RichLinkAttachmentSubstituter *v2;
  NSMutableArray *v3;
  NSMutableArray *archivedAttachments;
  RichLinkAttachmentSubstituter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RichLinkAttachmentSubstituter;
  v2 = -[RichLinkAttachmentSubstituter init](&v7, sel_init);
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
  LPARAssetAttachmentSubstitute *v9;
  NSMutableArray *archivedAttachments;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  if (self->_shouldSubstituteAttachments)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend(v8, "data");
      v9 = (LPARAssetAttachmentSubstitute *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v9 = -[LPARAssetAttachmentSubstitute initWithARAsset:]([LPARAssetAttachmentSubstitute alloc], "initWithARAsset:", v8);
        -[LPARAssetAttachmentSubstitute setIndex:](v9, "setIndex:", -[NSMutableArray count](self->_archivedAttachments, "count"));
        archivedAttachments = self->_archivedAttachments;
        objc_msgSend(v8, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](archivedAttachments, "addObject:", v11);
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    if (self->_shouldSubstituteAttachments)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        objc_msgSend(v8, "data");
        v9 = (LPARAssetAttachmentSubstitute *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v9 = -[LPImageAttachmentSubstitute initWithImage:]([LPImageAttachmentSubstitute alloc], "initWithImage:", v8);
          -[LPARAssetAttachmentSubstitute setIndex:](v9, "setIndex:", -[NSMutableArray count](self->_archivedAttachments, "count"));
          v12 = self->_archivedAttachments;
          objc_msgSend(v8, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v12, "addObject:", v11);
          goto LABEL_13;
        }
LABEL_14:

        goto LABEL_22;
      }
      if (self->_shouldSubstituteAttachments)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          objc_msgSend(v8, "data");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v9 = -[LPVideoAttachmentSubstitute initWithVideo:]([LPVideoAttachmentSubstitute alloc], "initWithVideo:", v8);
            -[LPARAssetAttachmentSubstitute setIndex:](v9, "setIndex:", -[NSMutableArray count](self->_archivedAttachments, "count"));
            v14 = self->_archivedAttachments;
            objc_msgSend(v8, "data");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v14, "addObject:", v11);
            goto LABEL_13;
          }

        }
      }
    }
  }
  if (self->_shouldIgnoreAppStoreMetadata && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RichLinkAttachmentSubstituter archiver:willEncodeObject:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    v9 = 0;
  }
  else
  {
    v9 = (LPARAssetAttachmentSubstitute *)v7;
  }
LABEL_22:

  return v9;
}

- (id)applyAttachmentSubstitutionForObject:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSUInteger v23;
  NSObject *v24;
  NSObject *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  NSUInteger v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "index");
    if (v6 < -[NSArray count](self->_attachmentsForUnarchiving, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "setFileURL:", v7);
LABEL_21:
        v20 = -[LPARAsset _initWithARAsset:]([LPARAsset alloc], "_initWithARAsset:", v5);
        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "setData:", v7);
        goto LABEL_21;
      }
      v24 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 134217984;
        v28 = objc_msgSend(v5, "index");
        _os_log_impl(&dword_1A0C41000, v24, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
      }
LABEL_31:

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v5, "index");
      v12 = -[NSArray count](self->_attachmentsForUnarchiving, "count");
      v27 = 134218240;
      v28 = v11;
      v29 = 2048;
      v30 = v12;
      _os_log_impl(&dword_1A0C41000, v10, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
    }
LABEL_11:

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    v9 = objc_msgSend(v8, "index");
    if (v9 < -[NSArray count](self->_attachmentsForUnarchiving, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", objc_msgSend(v8, "index"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "setFileURL:", v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = (id)LPLogChannelFetching();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v27 = 134217984;
            v28 = objc_msgSend(v8, "index");
            _os_log_impl(&dword_1A0C41000, v24, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
          }
          goto LABEL_31;
        }
        objc_msgSend(v8, "setData:", v7);
      }
      v20 = -[LPImage _initWithImage:]([LPImage alloc], "_initWithImage:", v8);
      goto LABEL_41;
    }
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v8, "index");
      v19 = -[NSArray count](self->_attachmentsForUnarchiving, "count");
      v27 = 134218240;
      v28 = v18;
      v29 = 2048;
      v30 = v19;
      _os_log_impl(&dword_1A0C41000, v10, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = v4;
  v16 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v17 = objc_msgSend(v15, "index");
    if (v17 < -[NSArray count](self->_attachmentsForUnarchiving, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", objc_msgSend(v16, "index"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "setFileURL:", v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v25 = (id)LPLogChannelFetching();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v27 = 134217984;
            v28 = objc_msgSend(v16, "index");
            _os_log_impl(&dword_1A0C41000, v25, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        objc_msgSend(v16, "setData:", v7);
      }
      v20 = -[LPVideo _initWithVideo:]([LPVideo alloc], "_initWithVideo:", v16);
LABEL_41:
      v16 = v20;

      goto LABEL_42;
    }
    v21 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v16, "index");
      v23 = -[NSArray count](self->_attachmentsForUnarchiving, "count");
      v27 = 134218240;
      v28 = v22;
      v29 = 2048;
      v30 = v23;
      _os_log_impl(&dword_1A0C41000, v21, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v16 = (void *)v13;
LABEL_42:

  }
  return v16;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  id v5;
  void *v6;

  if (self->_shouldSubstituteAttachments)
  {
    -[RichLinkAttachmentSubstituter applyAttachmentSubstitutionForObject:](self, "applyAttachmentSubstitutionForObject:", a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a4;
  }
  v6 = v5;

  return v6;
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

- (void)archiver:(uint64_t)a3 willEncodeObject:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_1A0C41000, a1, a3, "RichLink: Did not encode an instance of LPiTunesMediaSoftwareMetadata because it had no screenshots.", a5, a6, a7, a8, 0);
}

@end
