@implementation PHObjectChangeDetails

- (PHObjectChangeDetails)initWithPHObject:(id)a3
{
  id v5;
  PHObjectChangeDetails *v6;
  PHObjectChangeDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHObjectChangeDetails;
  v6 = -[PHObjectChangeDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectBeforeChanges, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)objectBeforeChanges
{
  return self->_objectBeforeChanges;
}

- (id)objectAfterChanges
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_calculateDiffs
{
  void *v3;
  PHObject *v4;
  PHObject *objectAfterChanges;
  PHObject *v6;
  PHObject *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  PHObject *v19;

  os_unfair_lock_assert_owner(&self->_stateLock);
  if (!self->_objectAfterChanges)
  {
    -[PHObject photoLibrary](self->_objectBeforeChanges, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchUpdatedObject:", self->_objectBeforeChanges);
    v4 = (PHObject *)objc_claimAutoreleasedReturnValue();
    objectAfterChanges = self->_objectAfterChanges;
    self->_objectAfterChanges = v4;

    v6 = self->_objectAfterChanges;
    if (v6)
    {
      if (!-[PHObject isDeleted](v6, "isDeleted"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_assetContentChanged = -[PHObject hasContentEqualTo:](self->_objectAfterChanges, "hasContentEqualTo:", self->_objectBeforeChanges) ^ 1;
          return;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = self->_objectBeforeChanges;
          v7 = self->_objectAfterChanges;
          -[PHObject localizedTitle](v19, "localizedTitle");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          -[PHObject localizedTitle](v7, "localizedTitle");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (v8 == v9)
          {

          }
          else
          {
            v10 = v9;
            v11 = objc_msgSend(v8, "isEqualToString:", v9);

            if ((v11 & 1) == 0)
              goto LABEL_15;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[PHObject subtitle](v19, "subtitle");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            -[PHObject subtitle](v7, "subtitle");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (v12 == v13)
            {

            }
            else
            {
              v14 = v13;
              v15 = objc_msgSend(v12, "isEqualToString:", v13);

              if ((v15 & 1) == 0)
              {
LABEL_15:
                v16 = 0;
LABEL_21:
                self->_assetCollectionTitlePropertiesChanged = v16 ^ 1;

                return;
              }
            }
          }
          -[PHObject titleFontName](v19, "titleFontName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHObject titleFontName](v7, "titleFontName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 == v18)
            v16 = 1;
          else
            v16 = objc_msgSend(v17, "isEqualToString:", v18);

          goto LABEL_21;
        }
      }
    }
  }
}

- (BOOL)assetContentChanged
{
  void *v2;
  char v3;

  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)assetCollectionTitlePropertiesChanged
{
  void *v2;
  char v3;

  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)objectWasDeleted
{
  void *v2;
  char v3;

  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHObjectChangeDetails;
  -[PHObjectChangeDetails description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectChangeDetails objectBeforeChanges](self, "objectBeforeChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectChangeDetails objectAfterChanges](self, "objectAfterChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" before=%@, after=%@, assetContentChanged=%d"), v4, v5, -[PHObjectChangeDetails assetContentChanged](self, "assetContentChanged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectAfterChanges, 0);
  objc_storeStrong((id *)&self->_objectBeforeChanges, 0);
}

uint64_t __41__PHObjectChangeDetails_objectWasDeleted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_calculateDiffs");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v3)
    v4 = objc_msgSend(v3, "isDeleted");
  else
    v4 = 1;
  return objc_msgSend(v2, "numberWithInt:", v4);
}

uint64_t __62__PHObjectChangeDetails_assetCollectionTitlePropertiesChanged__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_calculateDiffs");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25));
}

uint64_t __44__PHObjectChangeDetails_assetContentChanged__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_calculateDiffs");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
}

id __43__PHObjectChangeDetails_objectAfterChanges__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_calculateDiffs");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isDeleted") & 1) != 0)
    v2 = 0;
  else
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  return v2;
}

@end
