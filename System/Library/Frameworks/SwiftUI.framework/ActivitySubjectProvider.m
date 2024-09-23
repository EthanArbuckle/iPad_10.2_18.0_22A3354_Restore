@implementation ActivitySubjectProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item), *(_QWORD *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item+ 16]);
  return (id)_bridgeAnythingToObjectiveC<A>(_:)();
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item), *(_QWORD *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item+ 16]);
  return (id)_bridgeAnythingToObjectiveC<A>(_:)();
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_subject);
  v5 = *(_QWORD *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_subject];
  swift_bridgeObjectRetain();
  v6 = (void *)MEMORY[0x18D75CC88](v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider)init
{
  _TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider *result;

  result = (_TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item);
  swift_bridgeObjectRelease();
}

@end
