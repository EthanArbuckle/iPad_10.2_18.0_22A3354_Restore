@implementation ICQuery

+ (id)queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForSystemPaperNotesAllowsRecentlyDeleted:](ICQueryObjC, "objc_queryForSystemPaperNotesAllowsRecentlyDeleted:", a3);
}

+ (id)queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return +[ICQueryObjC objc_queryForSharedNotes:allowsRecentlyDeleted:](ICQueryObjC, "objc_queryForSharedNotes:allowsRecentlyDeleted:", a3, a4);
}

- (BOOL)canBeEdited
{
  void *v2;
  char v3;

  -[ICQuery queryObjC](self, "queryObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBeEdited");

  return v3;
}

- (int64_t)minimumSupportedVersion
{
  void *v2;
  int64_t v3;

  -[ICQuery queryObjC](self, "queryObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumSupportedVersion");

  return v3;
}

- (NSString)entityName
{
  void *v2;
  void *v3;

  -[ICQuery queryObjC](self, "queryObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;

  -[ICQuery queryObjC](self, "queryObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v3;
}

- (id)tagSelectionWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQuery queryObjC](self, "queryObjC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagSelectionWithManagedObjectContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ICQuery queryObjC](self, "queryObjC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterSelectionWithManagedObjectContext:account:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)queryForNotesMatchingFilterSelection:(id)a3
{
  return +[ICQueryObjC objc_queryForNotesMatchingFilterSelection:](ICQueryObjC, "objc_queryForNotesMatchingFilterSelection:", a3);
}

+ (id)queryForNotesMatchingTagSelection:(id)a3
{
  return +[ICQueryObjC objc_queryForNotesMatchingTagSelection:](ICQueryObjC, "objc_queryForNotesMatchingTagSelection:", a3);
}

+ (id)queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForMathNotesAllowsRecentlyDeleted:](ICQueryObjC, "objc_queryForMathNotesAllowsRecentlyDeleted:", a3);
}

+ (id)queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForCallNotesAllowsRecentlyDeleted:](ICQueryObjC, "objc_queryForCallNotesAllowsRecentlyDeleted:", a3);
}

+ (id)queryForRecentlyDeletedMathNotes
{
  return +[ICQueryObjC objc_queryForRecentlyDeletedMathNotes](ICQueryObjC, "objc_queryForRecentlyDeletedMathNotes");
}

+ (id)queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return +[ICQueryObjC objc_queryForPinnedNotes:allowsRecentlyDeleted:](ICQueryObjC, "objc_queryForPinnedNotes:allowsRecentlyDeleted:", a3, a4);
}

- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ICQuery queryObjC](self, "queryObjC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replacingTagIdentifier:withNewTagIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)removingTagIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQuery queryObjC](self, "queryObjC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removingTagIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
