@implementation TextActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v7;
  _TtC20ProductPageExtension24TextActivityItemProvider *v8;
  id v9;
  id v11;
  _TtC20ProductPageExtension24TextActivityItemProvider *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char *v19;
  void *v20;
  _QWORD v21[4];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = a4;
    if ((sub_1005763B8() & 1) != 0)
    {

      return 0;
    }
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  v14 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text);
  v13 = *(_QWORD *)&self->text[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text];
  v21[3] = &type metadata for String;
  v21[0] = v14;
  v21[1] = v13;
  swift_bridgeObjectRetain(v13);

  v15 = sub_100010F08(v21, (uint64_t)&type metadata for String);
  v16 = *(&type metadata for String - 1);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v16 + 16))(v19, v17);
  v20 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v19, &type metadata for String);
  (*(void (**)(char *, _QWORD *))(v16 + 8))(v19, &type metadata for String);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v21);
  return v20;
}

- (id)item
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text);
  v2 = *(_QWORD *)&self->text[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text];
  v5[0] = v3;
  v5[1] = v2;
  swift_bridgeObjectRetain(v2);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v5, &type metadata for String);
}

- (_TtC20ProductPageExtension24TextActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC20ProductPageExtension24TextActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC20ProductPageExtension24TextActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.TextActivityItemProvider", 45, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_excludedActivityTypes));
}

@end
