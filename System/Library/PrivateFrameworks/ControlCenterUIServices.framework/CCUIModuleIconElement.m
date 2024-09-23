@implementation CCUIModuleIconElement

- (NSString)moduleIdentifier
{
  return (NSString *)sub_2384F37D4();
}

- (NSString)containerBundleIdentifier
{
  return (NSString *)sub_2384F37D4();
}

- (SBHIconGridSizeClassSet)standardSupportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses));
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility);
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses));
}

- (NSString)uniqueIdentifier
{
  return (NSString *)sub_2384F37D4();
}

- (NSString)displayName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___CCUIModuleIconElement_displayName;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)preferredGallerySizeClass
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredGallerySizeClass:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  *v4 = a3;
}

- (void)updateSupportedGridSizeClassesForAccessibilityContentSizeCategory:(BOOL)a3
{
  CCUIModuleIconElement *v4;

  v4 = self;
  sub_2384F3BCC(a3);

}

- (CCUIModuleIconElement)initWithModuleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 standardSupportedGridSizeClasses:(id)a5 expandsGridSizeClassesForAccessibility:(BOOL)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CCUIModuleIconElement *v15;
  CCUIModuleIconElement *v17;
  _BOOL4 v18;

  v18 = a6;
  v17 = self;
  v7 = sub_238506AA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238506B6C();
  sub_238506B6C();
  v11 = a5;
  sub_238506A94();
  sub_238506A88();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v15 = -[CCUIModuleIconElement initWithUniqueIdentifier:moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:](v17, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v12, v13, v14, v11, v18);

  return v15;
}

- (CCUIModuleIconElement)initWithUniqueIdentifier:(id)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 standardSupportedGridSizeClasses:(id)a6 expandsGridSizeClassesForAccessibility:(BOOL)a7
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
  id v18;
  CCUIModuleIconElement *v19;

  v9 = sub_238506B6C();
  v11 = v10;
  v12 = sub_238506B6C();
  v14 = v13;
  v15 = sub_238506B6C();
  v17 = v16;
  v18 = a6;
  v19 = (CCUIModuleIconElement *)sub_2384F5A34(v9, v11, v12, v14, v15, v17, v18, a7);

  return v19;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  id v6;
  id v7;
  CCUIModuleIconElement *v8;
  NSString *v9;
  NSString *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[CCUIModuleIconElement displayName](v8, sel_displayName);
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
  return -[CCUIModuleIconElement supportedGridSizeClasses](self, sel_supportedGridSizeClasses, a3);
}

- (id)copyWithUniqueIdentifier
{
  CCUIModuleIconElement *v2;
  char *v3;

  v2 = self;
  v3 = CCUIModuleIconElement.copyWithUniqueIdentifier()();

  return v3;
}

- (int64_t)hash
{
  CCUIModuleIconElement *v2;
  unint64_t v3;

  v2 = self;
  v3 = CCUIModuleIconElement.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CCUIModuleIconElement *v4;
  CCUIModuleIconElement *v5;
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
  v6 = CCUIModuleIconElement.isEqual(_:)((uint64_t)v8);

  sub_2384F5D0C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  void *v3;
  CCUIModuleIconElement *v4;
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
  CCUIModuleIconElement *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2384F4C34(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_238506E0C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  CCUIModuleIconElement *v5;

  v4 = a3;
  v5 = self;
  CCUIModuleIconElement.appendDescription(to:)(v4);

}

- (CCUIModuleIconElement)init
{
  CCUIModuleIconElement *result;

  result = (CCUIModuleIconElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (NSString)sbh_galleryItemIdentifier
{
  CCUIModuleIconElement *v2;
  void *v3;

  v2 = self;
  CCUIModuleIconElement.sbh_galleryItemIdentifier.getter();

  v3 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)sbh_appName
{
  CCUIModuleIconElement *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CCUIModuleIconElement.sbh_appName.getter();
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
  CCUIModuleIconElement *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[CCUIModuleIconElement displayName](v2, sel_displayName);
  if (!v3)
    v3 = -[CCUIModuleIconElement moduleIdentifier](v2, sel_moduleIdentifier);
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
