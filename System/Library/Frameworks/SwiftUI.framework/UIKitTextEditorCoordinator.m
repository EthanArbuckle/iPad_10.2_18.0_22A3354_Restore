@implementation UIKitTextEditorCoordinator

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *v5;

  v4 = a3;
  v5 = self;
  UIKitTextEditorCoordinator.textViewDidChange(_:)(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = UIKitTextEditorCoordinator.textView(_:shouldChangeTextIn:replacementText:)(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  UIMenu *v7;
  id v8;
  _TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *v9;
  void *v10;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIMenuElement);
  v7 = (UIMenu *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = a3;
  v9 = self;
  v10 = (void *)specialized UIKitTextEditorCoordinator.textView(_:editMenuForTextIn:suggestedActions:)(v8, v7);

  swift_bridgeObjectRelease();
  return v10;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *v5;

  v4 = a3;
  v5 = self;
  UIKitTextEditorCoordinator.textViewDidChangeSelection(_:)(v4);

}

- (_TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator)init
{
  _TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *result;

  result = (_TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self+ OBJC_IVAR____TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator_configuration, type metadata accessor for UIKitTextViewAdaptor);
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self+ OBJC_IVAR____TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator_textInputValidation, (uint64_t (*)(_QWORD))type metadata accessor for TextInputValidation?);
}

@end
