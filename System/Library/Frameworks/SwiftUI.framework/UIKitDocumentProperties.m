@implementation UIKitDocumentProperties

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23UIKitDocumentProperties)initWithURL:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSURL *v10;
  void *v11;
  void *v12;
  _TtC7SwiftUI23UIKitDocumentProperties *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL._bridgeToObjectiveC()(v10);
  v12 = v11;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[UIKitDocumentProperties initWithURL:](&v15, sel_initWithURL_, v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v13;
}

- (_TtC7SwiftUI23UIKitDocumentProperties)initWithTitle:(id)a3 iconProvider:(id)a4 imageProvider:(id)a5
{
  objc_class *ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _TtC7SwiftUI23UIKitDocumentProperties *v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    v13 = a4;
    v14 = a5;
    a3 = (id)MEMORY[0x18D75CC88](v10, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = a4;
    v16 = a5;
  }
  v19.receiver = self;
  v19.super_class = ObjectType;
  v17 = -[UIDocumentProperties initWithTitle:iconProvider:imageProvider:](&v19, sel_initWithTitle_iconProvider_imageProvider_, a3, a4, a5);

  return v17;
}

@end
