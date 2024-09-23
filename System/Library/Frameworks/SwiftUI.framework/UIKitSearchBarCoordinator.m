@implementation UIKitSearchBarCoordinator

- (void)primaryActionTriggered:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v6;

  v4 = a3;
  v6 = self;
  specialized UIKitSearchBarCoordinator.primaryActionTriggered(_:)((uint64_t)v6, v5);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_isViewUpdating) != 1)
  {
    MEMORY[0x1E0C80A78](v6, v7);
    MEMORY[0x1E0C80A78](v8, v9);
    v10 = a3;
    v11 = self;
    static Update.dispatchImmediately<A>(_:)();

  }
  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  UISearchBar *v4;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v5;

  v4 = (UISearchBar *)a3;
  v5 = self;
  UIKitSearchBarCoordinator.searchBarTextDidBeginEditing(_:)(v4);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v5;

  v4 = a3;
  v5 = self;
  specialized UIKitSearchBarCoordinator.searchBarTextDidEndEditing(_:)();

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v5;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v6;

  swift_allocObject();
  swift_unknownObjectWeakInit();
  v5 = a3;
  v6 = self;
  swift_retain();
  static Update.enqueueAction(_:)();

  swift_release_n();
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v6;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v7;

  v6 = a3;
  v7 = self;
  specialized UIKitSearchScopeCoordinating<>.onChange(selectedScope:)(a4);

}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4;
  _TtC7SwiftUI25UIKitSearchBarCoordinator *v5;

  v4 = a3;
  v5 = self;
  specialized UIKitSearchBarCoordinator.textFieldDidChangeSelection(_:)();

}

- (_TtC7SwiftUI25UIKitSearchBarCoordinator)init
{
  return (_TtC7SwiftUI25UIKitSearchBarCoordinator *)UIKitSearchBarCoordinator.init()();
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_triggerSubmission));
  outlined destroy of TableRowList?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_configuration, (uint64_t)&lazy cache variable for type metadata for SearchFieldConfiguration?, (uint64_t)type metadata accessor for SearchFieldConfiguration, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar), *(_QWORD *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar], *(_QWORD *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar + 8], *(_QWORD *)&self->scopes[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar], *(void **)&self->tokenScopes[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar]);
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Text.Suffix.Storage(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix), *(_QWORD *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix], *(_QWORD *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix + 8]);
}

@end
