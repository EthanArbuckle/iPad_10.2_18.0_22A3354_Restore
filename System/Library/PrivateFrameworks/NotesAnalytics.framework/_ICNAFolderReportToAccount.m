@implementation _ICNAFolderReportToAccount

- (_ICNAFolderReportToAccount)init
{
  _ICNAFolderReportToAccount *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ICNAFolderReportToAccount;
  result = -[_ICNAFolderReportToAccount init](&v3, sel_init);
  if (result)
  {
    result->_folderCollaborationMatrix[2][2] = 0;
    *(_OWORD *)&result->_folderCollaborationMatrix[1][1] = 0u;
    *(_OWORD *)&result->_folderCollaborationMatrix[0][0] = 0u;
  }
  return result;
}

- (void)updateFolderCollaborationMatrixWithCollaborationStatus:(id)a3 collaborationType:(id)a4
{
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;

  v6 = a4;
  v7 = objc_msgSend(a3, "collaborationStatus");
  v8 = 3;
  if (v7 == 1)
    v8 = 0;
  v9 = v7 != 2 && v7 != 1;
  if (v7 == 2)
    v8 = 1;
  v10 = v7 != 3 && v9;
  if (v7 == 3)
    v11 = 2;
  else
    v11 = v8;
  v12 = objc_msgSend(v6, "collaborationType");

  if ((unint64_t)(v12 - 1) <= 2 && !v10)
  {
    v13 = (char *)self + 12 * v11 + 4 * v12 - 4;
    ++*((_DWORD *)v13 + 2);
  }
}

- (unint64_t)countOfFoldersWithCollaborationStatus:(int64_t)a3 collaborationType:(int64_t)a4
{
  return self->_folderCollaborationMatrix[a3][a4];
}

- (unint64_t)countOfFolders
{
  return self->_countOfFolders;
}

- (void)setCountOfFolders:(unint64_t)a3
{
  self->_countOfFolders = a3;
}

- (unint64_t)countOfCustomSmartFolders
{
  return self->_countOfCustomSmartFolders;
}

- (void)setCountOfCustomSmartFolders:(unint64_t)a3
{
  self->_countOfCustomSmartFolders = a3;
}

- (unint64_t)countOfSmartFoldersWithTagsFilter
{
  return self->_countOfSmartFoldersWithTagsFilter;
}

- (void)setCountOfSmartFoldersWithTagsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithTagsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithDateCreatedFilter
{
  return self->_countOfSmartFoldersWithDateCreatedFilter;
}

- (void)setCountOfSmartFoldersWithDateCreatedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithDateCreatedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithDateModifiedFilter
{
  return self->_countOfSmartFoldersWithDateModifiedFilter;
}

- (void)setCountOfSmartFoldersWithDateModifiedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithDateModifiedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithSharedFilter
{
  return self->_countOfSmartFoldersWithSharedFilter;
}

- (void)setCountOfSmartFoldersWithSharedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithSharedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithMentionsFilter
{
  return self->_countOfSmartFoldersWithMentionsFilter;
}

- (void)setCountOfSmartFoldersWithMentionsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithMentionsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithChecklistsFilter
{
  return self->_countOfSmartFoldersWithChecklistsFilter;
}

- (void)setCountOfSmartFoldersWithChecklistsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithChecklistsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithAttachmentsFilter
{
  return self->_countOfSmartFoldersWithAttachmentsFilter;
}

- (void)setCountOfSmartFoldersWithAttachmentsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithAttachmentsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithFoldersFilter
{
  return self->_countOfSmartFoldersWithFoldersFilter;
}

- (void)setCountOfSmartFoldersWithFoldersFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithFoldersFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithQuickNotesFilter
{
  return self->_countOfSmartFoldersWithQuickNotesFilter;
}

- (void)setCountOfSmartFoldersWithQuickNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithQuickNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithPinnedNotesFilter
{
  return self->_countOfSmartFoldersWithPinnedNotesFilter;
}

- (void)setCountOfSmartFoldersWithPinnedNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithPinnedNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithLockedNotesFilter
{
  return self->_countOfSmartFoldersWithLockedNotesFilter;
}

- (void)setCountOfSmartFoldersWithLockedNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithLockedNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithUnknownFilter
{
  return self->_countOfSmartFoldersWithUnknownFilter;
}

- (void)setCountOfSmartFoldersWithUnknownFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithUnknownFilter = a3;
}

@end
