@implementation TableGlobalHeader

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7SwiftUI17TableGlobalHeader *v9;
  uint64_t v10;

  v4 = type metadata accessor for UICellConfigurationState();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  TableGlobalHeader.updateConfiguration(using:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC7SwiftUI17TableGlobalHeader)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_globalHeader;
  *(_OWORD *)v9 = xmmword_187BF9840;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *(_DWORD *)(v9 + 63) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_headerLeadingMargin) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[TableGlobalHeader initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI17TableGlobalHeader)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_globalHeader;
  *(_OWORD *)v6 = xmmword_187BF9840;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_DWORD *)(v6 + 63) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_headerLeadingMargin) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[TableGlobalHeader initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined destroy of TableRowID?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_globalHeader, (uint64_t)&lazy cache variable for type metadata for TableHeaderView?, (uint64_t)&type metadata for TableHeaderView, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))type metadata accessor for _EnvironmentKeyWritingModifier<Bool>);
}

@end
