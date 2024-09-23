@implementation ICAccountProxy

- (ICAccountProxy)initWithAccount:(id)a3
{
  id v4;
  ICAccountProxy *v5;
  ICAccountProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAccountProxy;
  v5 = -[ICAccountProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICAccountProxy setAccount:](v5, "setAccount:", v4);

  return v6;
}

+ (id)accountProxyWithAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccount:", v4);

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[ICAccountProxy account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  return v6;
}

- (BOOL)isLeaf
{
  return 1;
}

- (id)objectID
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (NSString)accountName
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  void *v4;

  -[ICAccountProxy account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "supportsVisibilityTestingType:", a3);

  return a3;
}

- (id)predicateForVisibleNotes
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForVisibleNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForPinnedNotes
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForPinnedNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForSearchableNotes
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForSearchableNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForSearchableAttachments
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForSearchableAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (NSArray)visibleNotes
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingVisibleNotesCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("account.visibleNotesCount"));
}

- (unint64_t)visibleNotesCount
{
  void *v2;
  unint64_t v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleNotesCount");

  return v3;
}

- (BOOL)noteIsVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICAccountProxy account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "noteIsVisible:", v4);

  return v6;
}

- (NSString)titleForNavigationBar
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)titleForTableViewCell
{
  void *v2;
  void *v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForTableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)visibleNoteContainerChildren
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (BOOL)isDeleted
{
  void *v2;
  char v3;

  -[ICAccountProxy account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeleted");

  return v3;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (NSString)containerIdentifier
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

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  return 0;
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (int)dateHeadersType
{
  return 1;
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (ICAccount)account
{
  return (ICAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
