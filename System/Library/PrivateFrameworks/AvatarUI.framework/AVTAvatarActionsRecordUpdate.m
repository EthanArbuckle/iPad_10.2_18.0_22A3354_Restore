@implementation AVTAvatarActionsRecordUpdate

- (AVTAvatarActionsRecordUpdate)initWithAvatarRecord:(id)a3 fromLeft:(BOOL)a4
{
  id v7;
  AVTAvatarActionsRecordUpdate *v8;
  AVTAvatarActionsRecordUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarActionsRecordUpdate;
  v8 = -[AVTAvatarActionsRecordUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarRecord, a3);
    v9->_fromLeft = a4;
  }

  return v9;
}

+ (id)recordUpdateForDeletingRecord:(id)a3 withDataSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "numberOfRecords") < 2)
  {
    v15 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__AVTAvatarActionsRecordUpdate_recordUpdateForDeletingRecord_withDataSource___block_invoke;
    v17[3] = &unk_1EA51DCC8;
    v18 = v6;
    v8 = objc_msgSend(v7, "indexOfRecordPassingTest:", v17);
    objc_msgSend(v7, "indexSetForEditableRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeIndex:", v8);
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v10, "closestIndexToIndex:greaterIndexesFirst:", v8, 1);
      v12 = v11 < v8;
      v13 = objc_alloc((Class)a1);
      objc_msgSend(v7, "recordAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithAvatarRecord:fromLeft:", v14, v12);

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

uint64_t __77__AVTAvatarActionsRecordUpdate_recordUpdateForDeletingRecord_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (BOOL)fromLeft
{
  return self->_fromLeft;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end
