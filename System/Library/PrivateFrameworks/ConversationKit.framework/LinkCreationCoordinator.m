@implementation LinkCreationCoordinator

- (_TtC15ConversationKit23LinkCreationCoordinator)init
{
  LinkCreationCoordinator.init()();
}

- (void).cxx_destruct
{
  outlined destroy of unowned CNKCallDetailsDeferredPresentationManager((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_parentViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_shareSheetViewController));
  outlined consume of ConversationLink?(*(void **)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_conversationLink));
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  Class isa;

  _sSo8NSObjectCMaTm_0(0, &lazy cache variable for type metadata for _UIActivityItemCustomizationGroup);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  id v4;
  _TtC15ConversationKit23LinkCreationCoordinator *v5;
  Swift::String v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = LinkCreationCoordinator.customLocalizedActionTitle(for:)((UIActivityViewController *)v5);

  v7 = (void *)MEMORY[0x1C3B72E00](v6._countAndFlagsBits, v6._object);
  swift_bridgeObjectRelease();
  return v7;
}

- (id)customActionViewControllerForActivityViewController:(id)a3
{
  id v4;
  _TtC15ConversationKit23LinkCreationCoordinator *v5;
  UIViewController *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  LinkCreationCoordinator.customActionViewController(for:)(v6, (UIActivityViewController *)v5);
  v8 = v7;

  return v8;
}

@end
