@implementation ICASSmartFoldersItemData

- (ICASSmartFoldersItemData)initWithTotalCountOfSmartFoldersWithTagsFilter:(id)a3 totalCountOfSmartFoldersWithDateCreatedFilter:(id)a4 totalCountOfSmartFoldersWithDateModifiedFilter:(id)a5 totalCountOfSmartFoldersWithSharedFilter:(id)a6 totalCountOfSmartFoldersWithMentionsFilter:(id)a7 totalCountOfSmartFoldersWithChecklistsFilter:(id)a8 totalCountOfSmartFoldersWithAttachmentsFilter:(id)a9 totalCountOfSmartFoldersWithFoldersFilter:(id)a10 totalCountOfSmartFoldersWithQuickNotesFilter:(id)a11 totalCountOfSmartFoldersWithPinnedNotesFilter:(id)a12 totalCountOfSmartFoldersWithLockedNotesFilter:(id)a13 totalCountOfSmartFoldersWithUnknownFilter:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ICASSmartFoldersItemData *v24;
  ICASSmartFoldersItemData *v25;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v28 = a4;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v29 = a7;
  v34 = a7;
  v30 = a8;
  v33 = a8;
  v32 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v39.receiver = self;
  v39.super_class = (Class)ICASSmartFoldersItemData;
  v24 = -[ICASSmartFoldersItemData init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_totalCountOfSmartFoldersWithTagsFilter, a3);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithDateCreatedFilter, v28);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithDateModifiedFilter, a5);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithSharedFilter, a6);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithMentionsFilter, v29);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithChecklistsFilter, v30);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithAttachmentsFilter, a9);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithFoldersFilter, a10);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithQuickNotesFilter, a11);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithPinnedNotesFilter, a12);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithLockedNotesFilter, a13);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithUnknownFilter, a14);
  }

  return v25;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SmartFoldersItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
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
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[12];
  _QWORD v42[14];

  v42[12] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("totalCountOfSmartFoldersWithTagsFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithTagsFilter](self, "totalCountOfSmartFoldersWithTagsFilter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithTagsFilter](self, "totalCountOfSmartFoldersWithTagsFilter");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v39 = (void *)v3;
  v42[0] = v3;
  v41[1] = CFSTR("totalCountOfSmartFoldersWithDateCreatedFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithDateCreatedFilter](self, "totalCountOfSmartFoldersWithDateCreatedFilter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithDateCreatedFilter](self, "totalCountOfSmartFoldersWithDateCreatedFilter");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v37 = (void *)v4;
  v42[1] = v4;
  v41[2] = CFSTR("totalCountOfSmartFoldersWithDateModifiedFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithDateModifiedFilter](self, "totalCountOfSmartFoldersWithDateModifiedFilter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithDateModifiedFilter](self, "totalCountOfSmartFoldersWithDateModifiedFilter");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v35 = (void *)v5;
  v42[2] = v5;
  v41[3] = CFSTR("totalCountOfSmartFoldersWithSharedFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithSharedFilter](self, "totalCountOfSmartFoldersWithSharedFilter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithSharedFilter](self, "totalCountOfSmartFoldersWithSharedFilter");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v33 = (void *)v6;
  v42[3] = v6;
  v41[4] = CFSTR("totalCountOfSmartFoldersWithMentionsFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithMentionsFilter](self, "totalCountOfSmartFoldersWithMentionsFilter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithMentionsFilter](self, "totalCountOfSmartFoldersWithMentionsFilter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v31 = (void *)v7;
  v42[4] = v7;
  v41[5] = CFSTR("totalCountOfSmartFoldersWithChecklistsFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithChecklistsFilter](self, "totalCountOfSmartFoldersWithChecklistsFilter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithChecklistsFilter](self, "totalCountOfSmartFoldersWithChecklistsFilter");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v29 = (void *)v8;
  v42[5] = v8;
  v41[6] = CFSTR("totalCountOfSmartFoldersWithAttachmentsFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithAttachmentsFilter](self, "totalCountOfSmartFoldersWithAttachmentsFilter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithAttachmentsFilter](self, "totalCountOfSmartFoldersWithAttachmentsFilter");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v27 = (void *)v9;
  v42[6] = v9;
  v41[7] = CFSTR("totalCountOfSmartFoldersWithFoldersFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithFoldersFilter](self, "totalCountOfSmartFoldersWithFoldersFilter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithFoldersFilter](self, "totalCountOfSmartFoldersWithFoldersFilter");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v42[7] = v10;
  v41[8] = CFSTR("totalCountOfSmartFoldersWithQuickNotesFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithQuickNotesFilter](self, "totalCountOfSmartFoldersWithQuickNotesFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithQuickNotesFilter](self, "totalCountOfSmartFoldersWithQuickNotesFilter");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v42[8] = v13;
  v41[9] = CFSTR("totalCountOfSmartFoldersWithPinnedNotesFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithPinnedNotesFilter](self, "totalCountOfSmartFoldersWithPinnedNotesFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithPinnedNotesFilter](self, "totalCountOfSmartFoldersWithPinnedNotesFilter");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v42[9] = v16;
  v41[10] = CFSTR("totalCountOfSmartFoldersWithLockedNotesFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithLockedNotesFilter](self, "totalCountOfSmartFoldersWithLockedNotesFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithLockedNotesFilter](self, "totalCountOfSmartFoldersWithLockedNotesFilter");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v42[10] = v19;
  v41[11] = CFSTR("totalCountOfSmartFoldersWithUnknownFilter");
  -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithUnknownFilter](self, "totalCountOfSmartFoldersWithUnknownFilter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[ICASSmartFoldersItemData totalCountOfSmartFoldersWithUnknownFilter](self, "totalCountOfSmartFoldersWithUnknownFilter");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = objc_opt_new();
  }
  v23 = (void *)v22;
  v42[11] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSNumber)totalCountOfSmartFoldersWithTagsFilter
{
  return self->_totalCountOfSmartFoldersWithTagsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithDateCreatedFilter
{
  return self->_totalCountOfSmartFoldersWithDateCreatedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithDateModifiedFilter
{
  return self->_totalCountOfSmartFoldersWithDateModifiedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithSharedFilter
{
  return self->_totalCountOfSmartFoldersWithSharedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithMentionsFilter
{
  return self->_totalCountOfSmartFoldersWithMentionsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithChecklistsFilter
{
  return self->_totalCountOfSmartFoldersWithChecklistsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithAttachmentsFilter
{
  return self->_totalCountOfSmartFoldersWithAttachmentsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithFoldersFilter
{
  return self->_totalCountOfSmartFoldersWithFoldersFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithQuickNotesFilter
{
  return self->_totalCountOfSmartFoldersWithQuickNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithPinnedNotesFilter
{
  return self->_totalCountOfSmartFoldersWithPinnedNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithLockedNotesFilter
{
  return self->_totalCountOfSmartFoldersWithLockedNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithUnknownFilter
{
  return self->_totalCountOfSmartFoldersWithUnknownFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithUnknownFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithLockedNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithPinnedNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithQuickNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithFoldersFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithAttachmentsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithChecklistsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithMentionsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithSharedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithDateModifiedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithDateCreatedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithTagsFilter, 0);
}

@end
