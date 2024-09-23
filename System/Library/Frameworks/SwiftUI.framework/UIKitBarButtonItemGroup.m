@implementation UIKitBarButtonItemGroup

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  objc_class *ObjectType;
  char *v7;
  uint64_t v8;
  id v9;
  Class isa;
  _TtC7SwiftUI23UIKitBarButtonItemGroup *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIBarButtonItem);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (char *)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem;
  v8 = type metadata accessor for ToolbarStorage.GroupItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_edge) = 2;
  swift_unknownObjectWeakInit();
  v9 = a4;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](&v13, sel_initWithBarButtonItems_representativeItem_, isa, v9);

  return v11;
}

- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem;
  v7 = type metadata accessor for ToolbarStorage.GroupItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_edge) = 2;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[UIBarButtonItemGroup initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined destroy of TaskPriority?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem, &lazy cache variable for type metadata for ToolbarStorage.GroupItem?, type metadata accessor for ToolbarStorage.GroupItem);
  swift_unknownObjectWeakDestroy();
}

@end
