@implementation _ICNAFolderReportToDevice

- (_ICNAFolderReportToDevice)init
{
  _ICNAFolderReportToDevice *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ICNAFolderReportToDevice;
  result = -[_ICNAFolderReportToDevice init](&v3, sel_init);
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

@end
