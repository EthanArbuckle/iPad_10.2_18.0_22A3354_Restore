@implementation LocationTriggerMap.MapDelegate

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_21559DB88((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)sliderMovedWithSender:(id)a3
{
  id v4;
  _TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_value);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCE6F8);
  sub_21568872C();

}

- (_TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate)init
{
  _TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate *result;

  result = (_TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_slider));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_annotation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_circle));
}

@end
