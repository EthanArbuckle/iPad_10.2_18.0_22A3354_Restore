@implementation ICNoteContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFolderIdentifiersOrderedSetDocument, 0);
}

- (ICCROrderedSet)subFolderIdentifiersOrderedSet
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICNoteContainer subFolderIdentifiersOrderedSetDocument](self, "subFolderIdentifiersOrderedSetDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCROrderedSet *)v5;
}

- (ICTTOrderedSetVersionedDocument)subFolderIdentifiersOrderedSetDocument
{
  ICTTOrderedSetVersionedDocument *subFolderIdentifiersOrderedSetDocument;
  ICTTOrderedSetVersionedDocument *v4;
  void *v5;
  void *v6;
  ICTTOrderedSetVersionedDocument *v7;
  ICTTOrderedSetVersionedDocument *v8;

  subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
  if (!subFolderIdentifiersOrderedSetDocument)
  {
    v4 = [ICTTOrderedSetVersionedDocument alloc];
    -[ICNoteContainer subFolderOrderMergeableData](self, "subFolderOrderMergeableData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICTTVersionedDocument initWithData:replicaID:](v4, "initWithData:replicaID:", v5, v6);
    v8 = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = v7;

    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
  }
  return subFolderIdentifiersOrderedSetDocument;
}

- (BOOL)isSharedViaICloud
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return -[ICCloudSyncingObject isSharedViaICloud](&v3, sel_isSharedViaICloud);
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return -[ICCloudSyncingObject isSharedReadOnly](&v3, sel_isSharedReadOnly);
}

- (void)willRefresh:(BOOL)a3
{
  _BOOL8 v3;
  ICTTOrderedSetVersionedDocument *subFolderIdentifiersOrderedSetDocument;
  objc_super v6;

  v3 = a3;
  if (!-[ICNoteContainer isSubFolderOrderMergeableDataDirty](self, "isSubFolderOrderMergeableDataDirty"))
  {
    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)ICNoteContainer;
  -[ICNoteContainer willRefresh:](&v6, sel_willRefresh_, v3);
}

- (void)willTurnIntoFault
{
  ICTTOrderedSetVersionedDocument *subFolderIdentifiersOrderedSetDocument;
  objc_super v4;

  if (!-[ICNoteContainer isSubFolderOrderMergeableDataDirty](self, "isSubFolderOrderMergeableDataDirty"))
  {
    subFolderIdentifiersOrderedSetDocument = self->_subFolderIdentifiersOrderedSetDocument;
    self->_subFolderIdentifiersOrderedSetDocument = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)ICNoteContainer;
  -[ICNoteContainer willTurnIntoFault](&v4, sel_willTurnIntoFault);
}

- (BOOL)isSubFolderOrderMergeableDataDirty
{
  return self->_subFolderOrderMergeableDataDirty;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (NSString)cacheKey
{
  return (NSString *)&stru_1E76DB108;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 1;
}

- (id)predicateForVisibleNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (id)predicateForPinnedNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (id)predicateForSearchableNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (id)predicateForSearchableAttachments
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (BOOL)canBeSharedViaICloud
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  return -[ICCloudSyncingObject canBeSharedViaICloud](&v3, sel_canBeSharedViaICloud);
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (NSArray)visibleNotes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unint64_t)visibleNotesCount
{
  return 0;
}

- (BOOL)noteIsVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[ICNoteContainer predicateForVisibleNotes](self, "predicateForVisibleNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  return v6;
}

- (NSString)titleForNavigationBar
{
  return (NSString *)&stru_1E76DB108;
}

- (NSString)titleForTableViewCell
{
  return (NSString *)&stru_1E76DB108;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("owner"));
}

- (NSString)accountName
{
  return 0;
}

- (NSString)containerIdentifier
{
  return 0;
}

- (BOOL)supportsEditingNotes
{
  return 0;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (NSArray)visibleSubFolders
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSData)subFolderOrderMergeableData
{
  return 0;
}

- (void)willSave
{
  objc_super v3;

  -[ICNoteContainer saveSubFolderMergeableDataIfNeeded](self, "saveSubFolderMergeableDataIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)ICNoteContainer;
  -[ICCloudSyncingObject willSave](&v3, sel_willSave);
}

- (void)saveSubFolderMergeableDataIfNeeded
{
  if (-[ICNoteContainer isSubFolderOrderMergeableDataDirty](self, "isSubFolderOrderMergeableDataDirty"))
    -[ICNoteContainer writeSubFolderMergeableData](self, "writeSubFolderMergeableData");
}

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  id v4;
  ICTTOrderedSetVersionedDocument *v5;
  void *v6;
  ICTTOrderedSetVersionedDocument *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = [ICTTOrderedSetVersionedDocument alloc];
  -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICTTVersionedDocument initWithData:replicaID:](v5, "initWithData:replicaID:", v4, v6);

  -[ICNoteContainer subFolderIdentifiersOrderedSetDocument](self, "subFolderIdentifiersOrderedSetDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mergeWithOrderedSetVersionedDocument:", v7);

  v10 = v9 == 2;
  if (v9 == 2)
    -[ICNoteContainer setSubFolderOrderMergeableDataDirty:](self, "setSubFolderOrderMergeableDataDirty:", 1);

  return v10;
}

- (void)writeSubFolderMergeableData
{
  void *v3;
  id v4;

  if (-[ICNoteContainer isSubFolderOrderMergeableDataDirty](self, "isSubFolderOrderMergeableDataDirty"))
    -[ICNoteContainer setSubFolderOrderMergeableDataDirty:](self, "setSubFolderOrderMergeableDataDirty:", 0);
  -[ICNoteContainer subFolderIdentifiersOrderedSetDocument](self, "subFolderIdentifiersOrderedSetDocument");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteContainer setSubFolderOrderMergeableData:](self, "setSubFolderOrderMergeableData:", v3);

}

- (void)updateSubFolderMergeableDataChangeCount
{
  -[ICCloudSyncingObject updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Updated subfolders"));
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (void)applyDateHeadersType:(int)a3
{
  if (a3 <= 2)
    -[ICNoteContainer setDateHeadersType:](self, "setDateHeadersType:");
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (void)setSubFolderIdentifiersOrderedSetDocument:(id)a3
{
  objc_storeStrong((id *)&self->_subFolderIdentifiersOrderedSetDocument, a3);
}

- (void)setSubFolderOrderMergeableDataDirty:(BOOL)a3
{
  self->_subFolderOrderMergeableDataDirty = a3;
}

@end
