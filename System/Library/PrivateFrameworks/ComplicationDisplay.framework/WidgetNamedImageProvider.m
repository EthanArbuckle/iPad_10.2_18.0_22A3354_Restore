@implementation WidgetNamedImageProvider

- (UIFont)font
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  return (UIFont *)*v2;
}

- (void)setFont:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (int64_t)scale
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  return *v2;
}

- (void)setScale:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithCoder:(id)a3
{
  _QWORD *v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale) = (Class)2;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) = 0;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  type metadata accessor for WidgetNamedImageProvider(0);
  *v3 = 0;
  v3[1] = 0;
  swift_deallocPartialClassInstance();
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  _TtC19ComplicationDisplay24WidgetNamedImageProvider *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_21306470C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_213068C84();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CGSize)maxSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  v3 = *(double *)(&self->super._finalized + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)init
{
  _TtC19ComplicationDisplay24WidgetNamedImageProvider *result;

  result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC19ComplicationDisplay24WidgetNamedImageProvider *result;

  v4 = a4;
  result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initPrivate
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithForegroundAccentImage:(id)a3
{
  id v3;
  _TtC19ComplicationDisplay24WidgetNamedImageProvider *result;

  v3 = a3;
  result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  v4 = sub_21306887C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font));
}

@end
