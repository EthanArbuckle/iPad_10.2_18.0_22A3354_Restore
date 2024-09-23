@implementation InteractiveGenerationListener

- (void)dealloc
{
  _TtC18HealthExperienceUI29InteractiveGenerationListener *v2;
  id v3;
  objc_super v4;

  v2 = self;
  sub_1A98F39E8();
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v3, sel_removeObserver_, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for InteractiveGenerationListener();
  -[InteractiveGenerationListener dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener____lazy_storage___queue));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener_applicationStateProvider);
}

- (void)didBecomeActiveWithNotification:(id)a3
{
  sub_1A9825930(self, (uint64_t)a2, (uint64_t)a3, sub_1A98F3310);
}

- (void)didEnterBackgroundWithNotification:(id)a3
{
  sub_1A9825930(self, (uint64_t)a2, (uint64_t)a3, sub_1A98F39E8);
}

- (void)generationRequestNotificationWithNotification:(id)a3
{
  sub_1A9825930(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A98F3C24);
}

- (void)cancelInteractiveGenerationRequestNotificationWithNotification:(id)a3
{
  sub_1A9825930(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A98F3C44);
}

- (_TtC18HealthExperienceUI29InteractiveGenerationListener)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener____lazy_storage___queue) = 0;
  *(_QWORD *)&self->$__lazy_storage_$_queue[OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener_applicationStateProvider] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveGenerationListener();
  return -[InteractiveGenerationListener init](&v4, sel_init);
}

@end
