@implementation _INVocabularyGenerationDiff

- (void)setIsFullReset:(BOOL)a3
{
  self->_isFullReset = a3;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setUpdatedVocabularyItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIntentSlotName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDeletedSiriIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCountOfVocabularyItemsAfterApplying:(int64_t)a3
{
  self->_countOfVocabularyItemsAfterApplying = a3;
}

- (BOOL)isFullReset
{
  return self->_isFullReset;
}

- (BOOL)hasChanges
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[_INVocabularyGenerationDiff isFullReset](self, "isFullReset"))
    return 1;
  -[_INVocabularyGenerationDiff deletedSiriIDs](self, "deletedSiriIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v3 = 1;
  }
  else
  {
    -[_INVocabularyGenerationDiff updatedVocabularyItems](self, "updatedVocabularyItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "count") != 0;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_intentSlotName, 0);
  objc_storeStrong((id *)&self->_updatedVocabularyItems, 0);
  objc_storeStrong((id *)&self->_deletedSiriIDs, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[_INVocabularyGenerationDiff isFullReset](self, "isFullReset");
  -[_INVocabularyGenerationDiff deletedSiriIDs](self, "deletedSiriIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDiff updatedVocabularyItems](self, "updatedVocabularyItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>{\n  Reset=%d\n  deletedSiriIDs=%@\n  updatedVocabularyItems=%@\n}"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)deletedSiriIDs
{
  return self->_deletedSiriIDs;
}

- (NSArray)updatedVocabularyItems
{
  return self->_updatedVocabularyItems;
}

- (int64_t)countOfVocabularyItemsAfterApplying
{
  return self->_countOfVocabularyItemsAfterApplying;
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

@end
