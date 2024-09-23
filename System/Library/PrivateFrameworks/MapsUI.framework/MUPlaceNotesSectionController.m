@implementation MUPlaceNotesSectionController

- (MUUserInformationProvider)userInfoProvider
{
  return (MUUserInformationProvider *)sub_191DD927C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_userInfoProvider);
}

- (void)setUserInfoProvider:(id)a3
{
  sub_191DD92D8();
}

- (_TtP6MapsUI37MUPlaceNotesSectionControllerDelegate_)notesSectionDelegate
{
  return (_TtP6MapsUI37MUPlaceNotesSectionControllerDelegate_ *)sub_191DD927C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_notesSectionDelegate);
}

- (void)setNotesSectionDelegate:(id)a3
{
  sub_191DD92D8();
}

- (MULibraryAccessProviding)libraryAccessProvider
{
  swift_beginAccess();
  return (MULibraryAccessProviding *)(id)swift_unknownObjectRetain();
}

- (void)setLibraryAccessProvider:(id)a3
{
  _TtC6MapsUI29MUPlaceNotesSectionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_191DDBE70(a3);

  swift_unknownObjectRelease();
}

- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3 userInfoProvider:(id)a4 libraryAccessProvider:(id)a5
{
  id v7;

  v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC6MapsUI29MUPlaceNotesSectionController *)MUPlaceNotesSectionController.init(mapItem:userInfoProvider:libraryAccessProvider:)(v7, (uint64_t)a4, a5);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void **v4;
  void *v5;
  _TtC6MapsUI29MUPlaceNotesSectionController *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_libraryAccessProvider);
  swift_beginAccess();
  v5 = *v4;
  if (v5)
    objc_msgSend(v5, sel_unregisterObserver_, self);
  else
    v6 = self;
  v7.receiver = self;
  v7.super_class = ObjectType;
  -[MUPlaceNotesSectionController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_userInfoProvider);
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_notesSectionDelegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSArray)sectionViews
{
  void *v2;

  sub_191DC65A4(0, (unint64_t *)&qword_1ED01B360);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  unint64_t v2;
  uint64_t v3;
  _TtC6MapsUI29MUPlaceNotesSectionController *v5;

  v2 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController__sectionViews);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    v3 = sub_191EEB2D8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (BOOL)hasContent
{
  _TtC6MapsUI29MUPlaceNotesSectionController *v2;
  MUPersonalizedSuggestionSectionArbiterDelegate *v3;
  unsigned __int8 v4;
  unint64_t v6;
  uint64_t v7;

  v2 = self;
  v3 = -[MUPlaceSectionController personalizedSuggestionsArbiterDelegate](v2, sel_personalizedSuggestionsArbiterDelegate);
  if (v3)
  {
    v4 = -[MUPersonalizedSuggestionSectionArbiterDelegate shouldShowPlaceNotesSection](v3, sel_shouldShowPlaceNotesSection);

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {
    v6 = *(unint64_t *)((char *)&v2->super.super.isa
                             + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController__sectionViews);
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_191EEB2D8();

      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    return v7 != 0;
  }
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 45;
}

- (void)libraryAccessProvider:(id)a3 placeNoteDidChange:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC6MapsUI29MUPlaceNotesSectionController *v8;

  if (a4)
  {
    v5 = sub_191EEAFC0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_unknownObjectRetain();
  v8 = self;
  sub_191DDBF10(v5, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  _TtC6MapsUI29MUPlaceNotesSectionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  _s6MapsUI29MUPlaceNotesSectionControllerC21libraryAccessProvider_26savedStateOfPlaceDidChangeySo09MULibraryH9Providing_p_SbtF_0();
  swift_unknownObjectRelease();

}

- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3
{
  sub_191DDA59C((uint64_t)self, (uint64_t)a2, a3);
}

@end
