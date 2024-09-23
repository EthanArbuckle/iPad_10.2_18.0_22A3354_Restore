@implementation SendLaterRootViewModel

- (void)pluginInfoSelectedDateDidChange:(id)a3
{
  id v4;
  _TtC7ChatKit22SendLaterRootViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_18E747230(v4);

}

- (void)pluginInfoShowingDatePickerDidChange:(id)a3
{
  id v4;
  _TtC7ChatKit22SendLaterRootViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_18E747704(v4);

}

- (_TtC7ChatKit22SendLaterRootViewModel)init
{
  _TtC7ChatKit22SendLaterRootViewModel *result;

  result = (_TtC7ChatKit22SendLaterRootViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_18E011A40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation));

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__scheduledDate;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10FBF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__state;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112A90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__isForcedPressed;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F4CC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
