@implementation SwiftUISearchController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23SwiftUISearchController)init
{
  return (_TtC7SwiftUI23SwiftUISearchController *)SwiftUISearchController.init()();
}

- (void)viewDidAppear:(BOOL)a3
{
  @objc SwiftUISearchController.viewDidAppear(_:)(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))SwiftUISearchController.updateCustomAccessory());
}

- (void)viewDidDisappear:(BOOL)a3
{
  @objc SwiftUISearchController.viewDidAppear(_:)(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(id))SwiftUISearchController.updateCustomAccessory());
}

- (void)handleCustomAccessoryRecoveryGesture
{
  _TtC7SwiftUI23SwiftUISearchController *v2;

  v2 = self;
  SwiftUISearchController.handleCustomAccessoryRecoveryGesture()();

}

- (void)viewIsAppearing:(BOOL)a3
{
  @objc SwiftUISearchController.viewDidAppear(_:)(self, (uint64_t)a2, a3, (const char **)&selRef_viewIsAppearing_, (void (*)(id))SwiftUISearchController.flushPendingIsActive());
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftUISearchController(0);
  v2 = v3.receiver;
  -[SwiftUISearchController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  SwiftUISearchController.flushPendingIsActiveAnimated()();

}

- (void)searchController:(id)a3 willChangeToSearchBarPlacement:(int64_t)a4
{
  id v6;
  _TtC7SwiftUI23SwiftUISearchController *v7;

  v6 = a3;
  v7 = self;
  specialized SwiftUISearchController.searchController(_:willChangeTo:)(a4);

}

- (void)willPresentSearchController:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_pendingIsActiveAnimated) = 1;
}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC7SwiftUI23SwiftUISearchController *v5;

  v4 = a3;
  v5 = self;
  specialized SwiftUISearchController.willDismissSearchController(_:)();

}

- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  void (*v6)(uint64_t);
  id v7;
  uint64_t v8;
  _TtC7SwiftUI23SwiftUISearchController *v9;

  type metadata accessor for UIKitSearchSuggestion(0);
  v6 = *(void (**)(uint64_t))(swift_dynamicCastClassUnconditional()
                                      + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem
                                      + 408);
  if (v6)
  {
    if (v6 != (void (*)(uint64_t))1)
    {
      v7 = a3;
      swift_unknownObjectRetain();
      v9 = self;
      v8 = outlined copy of AppIntentExecutor?((uint64_t)v6);
      v6(v8);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);

      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SwiftUISearchController.init(coder:)();
}

- (UISearchBar)searchBar
{
  _TtC7SwiftUI23SwiftUISearchController *v2;
  id v3;

  v2 = self;
  v3 = SwiftUISearchController._searchBar.getter();

  return (UISearchBar *)v3;
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithSearchResultsController:(id)a3
{
  id v3;
  _TtC7SwiftUI23SwiftUISearchController *result;

  v3 = a3;
  result = (_TtC7SwiftUI23SwiftUISearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7SwiftUI23SwiftUISearchController *result;

  v4 = a4;
  result = (_TtC7SwiftUI23SwiftUISearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t (*v3)(void);

  v3 = MEMORY[0x1E0DEB940];
  outlined destroy of TableRowList?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_searchItem, (uint64_t)&lazy cache variable for type metadata for ToolbarStorage.SearchItem?, (uint64_t)type metadata accessor for ToolbarStorage.SearchItem, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController____lazy_storage____searchBar));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_coordinator));
  outlined consume of PlatformItemCollection?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_suggestions), *((_BYTE *)&self->super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_suggestions));
  outlined destroy of TableRowList?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_configuration, (uint64_t)&lazy cache variable for type metadata for SearchFieldConfiguration?, (uint64_t)type metadata accessor for SearchFieldConfiguration, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryRecoveryGesture));
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(void **)((char *)&self->super.super._view+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC7SwiftUI23SwiftUISearchController *v5;

  v4 = a3;
  v5 = self;
  SwiftUISearchController.presentationControllerWillDismiss(_:)((UIPresentationController)v4);

}

@end
