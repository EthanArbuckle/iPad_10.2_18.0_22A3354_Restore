@implementation TextRenderLayer

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized TextRenderLayer.init(coder:)();
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer *)@objc TextLinesLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))TextRenderLayer.init(layer:));
}

- (void)layoutSublayers
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer *v2;

  v2 = self;
  TextRenderLayer.layoutSublayers()();

}

- (void)setNeedsDisplay
{
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer_updateFlags) |= 0x90u;
  -[TextRenderLayer setNeedsLayout](self, sel_setNeedsLayout);
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer)init
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer *result;

  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[18];

  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer_fragment));
  outlined init with take of AccessibilityDataSeriesConfiguration.AxisConfiguration?((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer_layout, (uint64_t)v3, (unint64_t *)&lazy cache variable for type metadata for TextRenderLayer.Layout?, (uint64_t)&unk_25061F948);
  outlined release of TextRenderLayer.Layout?(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of TextRenderLayer.Layout?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
