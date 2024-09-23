@implementation PasteHelper.ConfigurationSupport

- (UIPasteConfiguration)pasteConfiguration
{
  return (UIPasteConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration));
}

- (void)setPasteConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration) = (Class)a3;
  v3 = a3;

}

- (BOOL)canPasteItemProviders:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtCV7SwiftUI11PasteHelper20ConfigurationSupport *v7;
  Swift::Bool v8;
  Swift::OpaquePointer_optional v10;

  type metadata accessor for NSItemProvider();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper);
  if (v5)
  {
    v6 = (void *)v4;
    v7 = self;
    outlined copy of PasteHelper?(v5);
    v10.value._rawValue = v6;
    v10.is_nil = v5;
    v8 = PasteHelper.canPaste(_:)(v10);
    outlined consume of PasteHelper?(v5);

    swift_bridgeObjectRelease();
    LOBYTE(v4) = v8;
  }
  else
  {
    __break(1u);
  }
  return v4;
}

- (void)pasteItemProviders:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _TtCV7SwiftUI11PasteHelper20ConfigurationSupport *v7;
  void (*v8)(uint64_t);
  uint64_t v9;

  type metadata accessor for NSItemProvider();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper))
  {
    v5 = v4;
    v6 = *(uint64_t (**)(uint64_t))&self->pasteConfiguration[OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper];
    v7 = self;
    swift_retain();
    v8 = (void (*)(uint64_t))v6(v5);
    v9 = swift_release();
    if (v8)
    {
      v8(v9);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v8);
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (_TtCV7SwiftUI11PasteHelper20ConfigurationSupport)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[PasteHelper.ConfigurationSupport init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration));
  outlined consume of PasteHelper?(*(uint64_t *)((char *)&self->super.isa
                                              + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper));
}

@end
