@implementation FASwiftUIHostingControllerProvider

+ (id)getFamilySettingsViewControllerWithViewModel:(id)a3 locationModel:(id)a4 pictureStore:(id)a5 appleAccount:(id)a6 accountManager:(id)a7 delegate:(id)a8 appleCardFamilySettingsViewModel:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  swift_getObjectType();
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  swift_unknownObjectRetain();
  v20 = a9;
  v21 = sub_20E053D08(v15, v16, v17, v19, (uint64_t)a8, v20);

  swift_unknownObjectRelease();
  return v21;
}

+ (id)getLocationViewControllerWithViewModel:(id)a3 pictureStore:(id)a4 hackfromObjC:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _BYTE v14[104];

  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v8;
  sub_20E05B6B0(v9, v10, a5, (uint64_t)v14);
  v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A03DF0));
  v12 = sub_20E053E48((uint64_t)v14);
  sub_20E053F64((uint64_t)v14);

  return v12;
}

+ (id)familyMemberAccountChangePasswordControllerWithMainAccount:(id)a3 memberToShow:(id)a4 familyCircle:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _s14FamilyCircleUI34FASwiftUIHostingControllerProviderC033familyMemberAccountChangePasswordF004mainJ012memberToShow0hB0So06UIViewF0CSo08FAFamilyI0C_AKSo0rB0CtFZ_0(v7, v8, v9);

  return v10;
}

+ (id)getFamilyChecklistHeaderView
{
  id v2;

  type metadata accessor for FamilyNetworkMonitor();
  sub_20DF0517C();
  sub_20E07C6E0();
  v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254A03E00));
  return (id)sub_20E07C9F8();
}

+ (id)getCheckListControllerWithSpecifiers:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A01CD0);
  sub_20E07D73C();
  v3 = objc_allocWithZone((Class)type metadata accessor for CheckListHostController());
  v4 = swift_bridgeObjectRetain();
  v5 = sub_20E00B378(v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)getLoadingControllerWithCancelAction:(id)a3
{
  void *v3;
  id v4;

  v3 = _Block_copy(a3);
  if (v3)
    *(_QWORD *)(swift_allocObject() + 16) = v3;
  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254A03E08));
  return (id)sub_20E07C9F8();
}

+ (id)getSettingsViewControllerWithResourceDictionary:(id)a3
{
  return (id)_s14FamilyCircleUI34FASwiftUIHostingControllerProviderC015getSettingsViewF018resourceDictionarySo06UIViewF0CSDys11AnyHashableVypG_tFZ_0();
}

- (_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FASwiftUIHostingControllerProvider();
  return -[FASwiftUIHostingControllerProvider init](&v3, sel_init);
}

@end
