@implementation HFAccessoryListUtilities

+ (id)createRoomSectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5
{
  void *v6;
  unint64_t v7;
  void *ObjCClassMetadata;
  id v9;
  void *v10;

  v6 = _Block_copy(a5);
  sub_1DD352AB0(0, (unint64_t *)&qword_1ED3783D0);
  v7 = sub_1DD63E1F4();
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v6);
  v9 = a4;
  sub_1DD370A98(v7, v9, ObjCClassMetadata, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  sub_1DD352AB0(0, (unint64_t *)&unk_1ED378360);
  v10 = (void *)sub_1DD63E1DC();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)accessoryRepresentableItemForAccessoryRepresentable:(id)a3 valueSource:(id)a4
{
  void *v6;

  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if (HFAccessoryRepresentable.itemClass.getter()
    && objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_itemWithAccessoryRepresentableObject_valueSource_, a3, a4))
  {
    objc_opt_self();
    v6 = (void *)swift_dynamicCastObjCClass();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (!v6)
      swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v6 = 0;
  }
  return v6;
}

+ (id)accessoryRepresentableObjectsFromAccessoryLikeObjects:(id)a3 objectLevel:(unint64_t)a4 accessoryTypeGroups:(id)a5
{
  uint64_t v7;
  void *v8;

  sub_1DD352AB0(0, &qword_1ED3783B8);
  sub_1DD380EF4();
  v7 = sub_1DD63E398();
  if (a5)
  {
    sub_1DD352AB0(0, (unint64_t *)&unk_1ED3783A8);
    a5 = (id)sub_1DD63E1F4();
  }
  sub_1DD3C740C(a4, v7, (unint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3783C8);
  v8 = (void *)sub_1DD63E1DC();
  swift_bridgeObjectRelease();
  return v8;
}

+ (NSArray)sortedAccessoryTypeGroups
{
  void *v2;

  _sSo24HFAccessoryListUtilitiesC4HomeE25sortedAccessoryTypeGroupsSaySo0aG5GroupCGvgZ_0();
  sub_1DD352AB0(0, (unint64_t *)&unk_1ED3783A8);
  v2 = (void *)sub_1DD63E1DC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (HFAccessoryListUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFAccessoryListUtilities;
  return -[HFAccessoryListUtilities init](&v3, sel_init);
}

+ (id)createAccessoryCategorySectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5
{
  void *v6;
  unint64_t v7;
  int ObjCClassMetadata;
  id v9;
  void *v10;

  v6 = _Block_copy(a5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03E4DC8);
  v7 = sub_1DD63E1F4();
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v6);
  v9 = a4;
  sub_1DD402C74(v7, ObjCClassMetadata, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  sub_1DD352AB0(0, (unint64_t *)&unk_1ED378360);
  v10 = (void *)sub_1DD63E1DC();
  swift_bridgeObjectRelease();
  return v10;
}

@end
