@implementation HUDashboardContext

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___HUDashboardContext_home));
}

- (HMRoom)room
{
  return (HMRoom *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___HUDashboardContext_room));
}

- (BOOL)allowsEnergyIndicator
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEnergyIndicator;
  swift_beginAccess();
  return *v2;
}

- (BOOL)allowsHomeNavigation
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsHomeNavigation;
  swift_beginAccess();
  return *v2;
}

- (BOOL)allowsAdding
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAdding;
  swift_beginAccess();
  return *v2;
}

- (BOOL)allowsAnnounce
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAnnounce;
  swift_beginAccess();
  return *v2;
}

- (BOOL)shouldHideInRoomSectionForAccessoryRepresentableItem:(id)a3
{
  return sub_1B8E307CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1B8E30830);
}

- (BOOL)shouldHideSectionWithIdentifier:(id)a3
{
  return sub_1B8E32130(self, (uint64_t)a2, (uint64_t)a3, sub_1B8E2B708);
}

- (int64_t)cameraPresentationStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_cameraPresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (int64_t)accessoryGroupingStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryGroupingStyle);
  swift_beginAccess();
  return *v2;
}

- (BOOL)includePredictedScenes
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_includePredictedScenes;
  swift_beginAccess();
  return *v2;
}

- (NSString)overrideDashboardTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HUDashboardContext_overrideDashboardTitle;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)shouldHideEmptySections
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideEmptySections;
  swift_beginAccess();
  return *v2;
}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  id v2;

  if (self->home[OBJC_IVAR___HUDashboardContext_type])
    v2 = 0;
  else
    v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type);
  return (HFAccessoryTypeGroup *)v2;
}

- (BOOL)shouldHidePlaceholderService
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHidePlaceholderService;
  swift_beginAccess();
  return *v2;
}

- (BOOL)shouldHideAccessoryRepresentable:(id)a3
{
  HUDashboardContext *v5;
  char v6;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1B8E308FC(a3, v5);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)accessoryRepresentableHasStandardTileRepresentation:(id)a3
{
  return sub_1B8E307CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1B8E3552C);
}

- (BOOL)canPresentDetailsViewControllerForSectionWithIdentifier:(id)a3
{
  return sub_1B8E32130(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1B8E36134);
}

- (BOOL)shouldHideStatusItemClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  HUDashboardContext *v5;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  LOBYTE(ObjCClassMetadata) = sub_1B8E52A0C(ObjCClassMetadata);

  return ObjCClassMetadata & 1;
}

- (BOOL)shouldDelayItemUpdatesForViewVisibility
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldDelayItemUpdatesForViewVisibility;
  swift_beginAccess();
  return *v2;
}

- (unint64_t)accessoryLikeItemObjectLevel
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryLikeItemObjectLevel);
  swift_beginAccess();
  return *v2;
}

- (int64_t)filterPresentationStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_filterPresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (BOOL)shouldCreateModule:(Class)a3
{
  swift_getObjCClassMetadata();
  sub_1B8E23A60(0, &qword_1ED57E990);
  if (!swift_dynamicCastMetatype())
    return 1;
  if (self->home[OBJC_IVAR___HUDashboardContext_type] == 2
    && *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type) == 0)
  {
    return objc_msgSend((id)objc_opt_self(), sel_isHomeControlService) ^ 1;
  }
  else
  {
    return 0;
  }
}

- (int64_t)backgroundStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_backgroundStyle);
  swift_beginAccess();
  return *v2;
}

- (BOOL)allowsEditing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEditing;
  swift_beginAccess();
  return *v2;
}

- (BOOL)shouldHideHomeKitObject:(id)a3
{
  HUDashboardContext *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1B8F5CF88((uint64_t)a3, v5);
  swift_unknownObjectRelease();

  return v6 & 1;
}

+ (id)homeDashboardForHome:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  v4 = sub_1B8E72BD4(v3);

  return v4;
}

+ (id)roomDashboardForRoom:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  char *v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_1B8F5DD54(v5, v6);

  return v7;
}

+ (id)categoryDashboardForAccessoryTypeGroup:(id)a3 home:(id)a4 room:(id)a5
{
  id v7;
  id v8;
  id v9;
  char *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1B8F5DF5C(v7, v8, a5);

  return v10;
}

+ (id)camerasDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1B8F5B3BC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1B8F5E1B4);
}

+ (id)scenesDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1B8F5B3BC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1B8F5E358);
}

+ (id)speakersAndTVsDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1B8F5B3BC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1B8F5E4B0);
}

- (HUDashboardContext)init
{
  sub_1B8F5B430();
}

- (NSString)description
{
  HUDashboardContext *v2;
  void *v3;

  v2 = self;
  sub_1B8F5B530();

  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  HUDashboardContext *v4;
  HUDashboardContext *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B93EE69C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1B8F5B77C((uint64_t)v8);

  sub_1B8E26870((uint64_t)v8, (uint64_t *)&unk_1ED57EC00);
  return v6 & 1;
}

- (NSString)typeDescriptionForAnalytics
{
  return (NSString *)sub_1B8F5BDB8(self, (uint64_t)a2, (void (*)(void))sub_1B8E724D8);
}

- (NSString)menuEditActionTitle
{
  HUDashboardContext *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v2 = self;
  sub_1B8F5BE20();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    v6 = HULocalizedString(v5);

    sub_1B93EDDB4();
    v4 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return (NSString *)v4;
}

- (NSString)menuEditActionTitleLocalizationKey
{
  return (NSString *)sub_1B8F5BDB8(self, (uint64_t)a2, (void (*)(void))sub_1B8F5BE20);
}

- (void)setAccessoryGroupingStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryGroupingStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAccessoryLikeItemObjectLevel:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryLikeItemObjectLevel);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAllowsAdding:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAdding;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAllowsAnnounce:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAnnounce;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEditing;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAllowsEnergyIndicator:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEnergyIndicator;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setAllowsHomeNavigation:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsHomeNavigation;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setIncludePredictedScenes:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_includePredictedScenes;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_backgroundStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)scenePresentationStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_scenePresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setScenePresentationStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_scenePresentationStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setCameraPresentationStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_cameraPresentationStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setFilterPresentationStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_filterPresentationStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setOverrideDashboardTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B93EDDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_overrideDashboardTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)setShouldDelayItemUpdatesForViewVisibility:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldDelayItemUpdatesForViewVisibility;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setShouldHideEmptySections:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideEmptySections;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setShouldHidePlaceholderService:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHidePlaceholderService;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldHideForGuests
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideForGuests;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldHideForGuests:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideForGuests;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldIncludeRoomInAccessoryNames
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldIncludeRoomInAccessoryNames;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeRoomInAccessoryNames:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldIncludeRoomInAccessoryNames;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)canShowHeaderForSectionWithIdentifier:(id)a3
{
  return sub_1B8E32130(self, (uint64_t)a2, (uint64_t)a3, sub_1B8F5CC28);
}

- (int64_t)maximumNumberOfItemsInSectionWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  HUDashboardContext *v10;
  HUDashboardContext *v12;
  uint64_t v13;
  int v14;
  BOOL v15;

  v4 = sub_1B93EDDB4();
  v6 = v5;
  if (sub_1B93EDDB4() == v4 && v7 == v6)
  {
    v12 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1B93EEB10();
    v10 = self;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type);
  v14 = self->home[OBJC_IVAR___HUDashboardContext_type];

  swift_bridgeObjectRelease();
  if (v13)
    v15 = 0;
  else
    v15 = v14 == 2;
  if (v15)
    return 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)canShowNoHomeAccessView
{
  return !*(Class *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type)
      && self->home[OBJC_IVAR___HUDashboardContext_type] == 2;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1B8F5E60C(*(id *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type), self->home[OBJC_IVAR___HUDashboardContext_type]);
}

@end
