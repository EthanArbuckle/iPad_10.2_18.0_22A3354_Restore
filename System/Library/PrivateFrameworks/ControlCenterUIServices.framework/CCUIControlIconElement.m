@implementation CCUIControlIconElement

- (NSString)uniqueIdentifier
{
  return (NSString *)sub_2384F37D4();
}

- (NSString)kind
{
  return (NSString *)sub_2384F37D4();
}

- (unint64_t)controlType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CCUIControlIconElement_controlType);
}

- (NSString)extensionBundleIdentifier
{
  return (NSString *)sub_2384F37D4();
}

- (NSString)containerBundleIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->uniqueIdentifier[OBJC_IVAR___CCUIControlIconElement_containerBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)displayName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___CCUIControlIconElement_displayName;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_238506B6C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CCUIControlIconElement_displayName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)preferredGallerySizeClass
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredGallerySizeClass:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  *v4 = a3;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses));
}

- (void)updateSupportedGridSizeClassesForAccessibilityContentSizeCategory:(BOOL)a3
{
  CCUIControlIconElement *v4;

  v4 = self;
  sub_2384FC638(a3);

}

- (CCUIControlIconElement)initWithKind:(id)a3 controlType:(unint64_t)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = sub_238506B6C();
  v10 = v9;
  v11 = sub_238506B6C();
  v13 = v12;
  if (a6)
  {
    v14 = sub_238506B6C();
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  return (CCUIControlIconElement *)CCUIControlIconElement.init(kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(v8, v10, a4, v11, v13, v14, v16);
}

- (CCUIControlIconElement)initWithUniqueIdentifier:(id)a3 kind:(id)a4 controlType:(unint64_t)a5 extensionBundleIdentifier:(id)a6 containerBundleIdentifier:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_238506B6C();
  v11 = v10;
  v12 = sub_238506B6C();
  v14 = v13;
  v15 = sub_238506B6C();
  v17 = v16;
  if (a7)
  {
    v19 = sub_238506B6C();
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  return (CCUIControlIconElement *)CCUIControlIconElement.init(uniqueIdentifier:kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(v9, v11, v12, v14, a5, v15, v17, v19, v18);
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  id v6;
  id v7;
  CCUIControlIconElement *v8;
  NSString *v9;
  NSString *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[CCUIControlIconElement displayName](v8, sel_displayName);
  if (v9)
  {
    v10 = v9;
    sub_238506B6C();

    v11 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {

    v11 = 0;
  }
  return v11;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return -[CCUIControlIconElement supportedGridSizeClasses](self, sel_supportedGridSizeClasses, a3);
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return 1;
}

- (id)copyWithUniqueIdentifier
{
  CCUIControlIconElement *v2;
  char *v3;

  v2 = self;
  v3 = CCUIControlIconElement.copyWithUniqueIdentifier()();

  return v3;
}

- (int64_t)hash
{
  CCUIControlIconElement *v2;
  unint64_t v3;

  v2 = self;
  v3 = CCUIControlIconElement.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CCUIControlIconElement *v4;
  CCUIControlIconElement *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_238506CE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CCUIControlIconElement.isEqual(_:)((uint64_t)v8);

  sub_2384F5D0C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  void *v3;
  CCUIControlIconElement *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_descriptionForRootObject_, v4);
  sub_238506B6C();

  v6 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (id)copyWithZone:(void *)a3
{
  CCUIControlIconElement *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  CCUIControlIconElement.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_238506E0C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  CCUIControlIconElement *v5;

  v4 = a3;
  v5 = self;
  CCUIControlIconElement.appendDescription(to:)(v4);

}

- (CCUIControlIconElement)init
{
  CCUIControlIconElement *result;

  result = (CCUIControlIconElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (NSString)sbh_galleryItemIdentifier
{
  CCUIControlIconElement *v2;
  void *v3;

  v2 = self;
  CCUIControlIconElement.sbh_galleryItemIdentifier.getter();

  v3 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)sbh_appName
{
  CCUIControlIconElement *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CCUIControlIconElement.sbh_appName.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)sbh_widgetName
{
  CCUIControlIconElement *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[CCUIControlIconElement displayName](v2, sel_displayName);
  if (!v3)
    v3 = -[CCUIControlIconElement kind](v2, sel_kind);
  sub_238506B6C();

  v4 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (unint64_t)sbh_supportedSizeClasses
{
  return 0;
}

- (NSString)sbh_widgetDescription
{
  return (NSString *)0;
}

- (BOOL)sbh_canBeAddedToStack
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (UIColor)backgroundColor
{
  return (UIColor *)0;
}

- (UIColor)accentColor
{
  return (UIColor *)0;
}

- (UIColor)mostInterestingColor
{
  return (UIColor *)0;
}

- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3
{
  return 1;
}

@end
