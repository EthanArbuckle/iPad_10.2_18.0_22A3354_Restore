@implementation ListTableViewCell

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ListTableViewCell();
  v2 = v3.receiver;
  -[ListTableViewCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  ListTableViewCell.updateSeparatorsFromConfiguration()();

}

- (void)prepareForReuse
{
  _TtC7SwiftUI17ListTableViewCell *v2;

  v2 = self;
  ListTableViewCell.prepareForReuse()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC7SwiftUI17ListTableViewCell *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = ListTableViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ListTableViewCell();
  v6 = a3;
  v7 = a4;
  v8 = (char *)v9.receiver;
  -[ListTableViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v9, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7);
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_host], sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7, v9.receiver, v9.super_class);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7SwiftUI17ListTableViewCell *v9;
  uint64_t v10;

  v4 = type metadata accessor for UICellConfigurationState();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  ListTableViewCell.updateConfiguration(using:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC7SwiftUI17ListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC7SwiftUI17ListTableViewCell *)ListTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC7SwiftUI17ListTableViewCell)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI17ListTableViewCell *)ListTableViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_delegate);
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_cellConfiguration, (uint64_t (*)(_QWORD))type metadata accessor for CellConfiguration);
  outlined consume of ListSeparatorConfiguration?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_separatorConfiguration), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_separatorConfiguration));

  LOBYTE(v3) = *((_BYTE *)&self->super.super._layerRetained
               + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior);
  outlined consume of PlatformItemList.Item.SelectionBehavior?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._animationInfo+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._traitChangeRegistry+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), v3, (void (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?, outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?);
  swift_bridgeObjectRelease();
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_focusItem, (uint64_t (*)(_QWORD))type metadata accessor for FocusItem?);
}

@end
