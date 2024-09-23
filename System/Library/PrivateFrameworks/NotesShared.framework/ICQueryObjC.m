@implementation ICQueryObjC

- (void).cxx_destruct
{
  swift_release();
}

- (NSPredicate)predicate
{
  id v2;

  swift_beginAccess();
  ICQueryType.predicate.getter();
  return (NSPredicate *)v2;
}

+ (id)objc_queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return _s11NotesShared7ICQueryC023makeQueryForSystemPaperA021allowsRecentlyDeletedACSb_tFZ_0(a3);
}

+ (id)objc_queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return _s11NotesShared7ICQueryC012makeQueryForbA0_21allowsRecentlyDeletedACSb_SbtFZ_0(a3, a4);
}

- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  ICQueryObjC *v9;
  ICFilterSelection *v10;
  void *v11;
  void *v12;

  swift_beginAccess();
  swift_retain();
  v7 = a3;
  v8 = a4;
  v9 = self;
  ICQueryType.filterSelection(managedObjectContext:accountObjectID:)(v10, (NSManagedObjectContext)v7, (NSManagedObjectID)v8);
  v12 = v11;

  swift_release();
  return v12;
}

- (id)tagSelectionWithManagedObjectContext:(id)a3
{
  id v5;
  ICQueryObjC *v6;
  ICTagSelection *v7;
  void *v8;
  void *v9;
  NSManagedObjectContext_optional v11;

  swift_beginAccess();
  swift_retain();
  v5 = a3;
  v6 = self;
  v11.value.super.isa = (Class)a3;
  ICQueryType.tagSelection(managedObjectContext:)(v7, v11);
  v9 = v8;

  swift_release();
  return v9;
}

- (int64_t)minimumSupportedVersion
{
  int64_t result;

  swift_beginAccess();
  ICQueryType.minimumSupportedVersion.getter();
  return result;
}

- (BOOL)canBeEdited
{
  uint64_t v2;

  v2 = swift_beginAccess();
  return ICQueryType.canBeEdited.getter(v2) & 1;
}

- (NSString)entityName
{
  return (NSString *)(id)sub_1BDBFD6C8();
}

- (NSString)debugDescription
{
  ICQueryObjC *v2;
  void *v3;

  v2 = self;
  sub_1BDB72C4C();

  v3 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  ICQueryObjC *v4;
  ICQueryObjC *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BDBFE184();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1BDB72D94((uint64_t)v8);

  sub_1BDAC350C((uint64_t)v8, qword_1ED239CF8);
  return v6 & 1;
}

- (ICQueryObjC)init
{
  ICQueryObjC *result;

  result = (ICQueryObjC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (id)objc_queryForNotesMatchingFilterSelection:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static ICQuery.makeQueryForNotesMatching(_:)(v4);

  return v5;
}

+ (id)objc_queryForNotesMatchingTagSelection:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  v4 = _s11NotesShared7ICQueryC012makeQueryForA8MatchingyACSo14ICTagSelectionCFZ_0(v3);

  return v4;
}

+ (id)objc_queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return _s11NotesShared7ICQueryC016makeQueryForMathA021allowsRecentlyDeletedACSb_tFZ_0(a3);
}

+ (id)objc_queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return _s11NotesShared7ICQueryC016makeQueryForCallA021allowsRecentlyDeletedACSb_tFZ_0(a3);
}

+ (id)objc_queryForRecentlyDeletedMathNotes
{
  return _s11NotesShared7ICQueryC031makeQueryForRecentlyDeletedMathA0ACyFZ_0();
}

+ (id)objc_queryForNonDeletedNotes
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  v2 = swift_allocObject();
  *(_BYTE *)(v2 + 16) = 0;
  v3 = v2 | 0x5000000000000000;
  v4 = (objc_class *)type metadata accessor for ICQuery();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR___ICQueryObjC_type] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  return objc_msgSendSuper2(&v7, sel_init);
}

+ (id)objc_queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return _s11NotesShared7ICQueryC018makeQueryForPinnedA0_21allowsRecentlyDeletedACSb_SbtFZ_0(a3, a4);
}

- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ICQueryObjC *v11;
  id v12;

  v5 = sub_1BDBFD6F8();
  v7 = v6;
  v8 = sub_1BDBFD6F8();
  v10 = v9;
  v11 = self;
  v12 = ICQuery.replacing(tagIdentifier:withNewTagIdentifier:)(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)removingTagIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ICQueryObjC *v7;
  id v8;

  v4 = sub_1BDBFD6F8();
  v6 = v5;
  v7 = self;
  v8 = ICQuery.removing(tagIdentifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end
