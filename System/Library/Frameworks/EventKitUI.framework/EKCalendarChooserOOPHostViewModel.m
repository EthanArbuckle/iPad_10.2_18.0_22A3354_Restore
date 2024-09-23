@implementation EKCalendarChooserOOPHostViewModel

- (_TtC10EventKitUI33EKCalendarChooserOOPHostViewModel)init
{
  return (_TtC10EventKitUI33EKCalendarChooserOOPHostViewModel *)sub_1AF9F5DDC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel__configuration;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C630);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy));
}

@end
