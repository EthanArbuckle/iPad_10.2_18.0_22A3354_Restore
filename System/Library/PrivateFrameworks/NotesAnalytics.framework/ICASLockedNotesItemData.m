@implementation ICASLockedNotesItemData

- (ICASLockedNotesItemData)initWithTotalCountOfV1LockedNotes:(id)a3 totalCountOfV2LockedNotes:(id)a4 totalCountOfLockedNotesWithDivergedMode:(id)a5 totalCountOfLockedNotesWithDivergedPassword:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASLockedNotesItemData *v15;
  ICASLockedNotesItemData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASLockedNotesItemData;
  v15 = -[ICASLockedNotesItemData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_totalCountOfV1LockedNotes, a3);
    objc_storeStrong((id *)&v16->_totalCountOfV2LockedNotes, a4);
    objc_storeStrong((id *)&v16->_totalCountOfLockedNotesWithDivergedMode, a5);
    objc_storeStrong((id *)&v16->_totalCountOfLockedNotesWithDivergedPassword, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("LockedNotesItemData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("totalCountOfV1LockedNotes");
  -[ICASLockedNotesItemData totalCountOfV1LockedNotes](self, "totalCountOfV1LockedNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASLockedNotesItemData totalCountOfV1LockedNotes](self, "totalCountOfV1LockedNotes");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("totalCountOfV2LockedNotes");
  -[ICASLockedNotesItemData totalCountOfV2LockedNotes](self, "totalCountOfV2LockedNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASLockedNotesItemData totalCountOfV2LockedNotes](self, "totalCountOfV2LockedNotes");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("totalCountOfLockedNotesWithDivergedMode");
  -[ICASLockedNotesItemData totalCountOfLockedNotesWithDivergedMode](self, "totalCountOfLockedNotesWithDivergedMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASLockedNotesItemData totalCountOfLockedNotesWithDivergedMode](self, "totalCountOfLockedNotesWithDivergedMode");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("totalCountOfLockedNotesWithDivergedPassword");
  -[ICASLockedNotesItemData totalCountOfLockedNotesWithDivergedPassword](self, "totalCountOfLockedNotesWithDivergedPassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASLockedNotesItemData totalCountOfLockedNotesWithDivergedPassword](self, "totalCountOfLockedNotesWithDivergedPassword");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)totalCountOfV1LockedNotes
{
  return self->_totalCountOfV1LockedNotes;
}

- (NSNumber)totalCountOfV2LockedNotes
{
  return self->_totalCountOfV2LockedNotes;
}

- (NSNumber)totalCountOfLockedNotesWithDivergedMode
{
  return self->_totalCountOfLockedNotesWithDivergedMode;
}

- (NSNumber)totalCountOfLockedNotesWithDivergedPassword
{
  return self->_totalCountOfLockedNotesWithDivergedPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfLockedNotesWithDivergedPassword, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedNotesWithDivergedMode, 0);
  objc_storeStrong((id *)&self->_totalCountOfV2LockedNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfV1LockedNotes, 0);
}

@end
