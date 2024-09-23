@implementation AXSASecureControllerImplementation

- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isListening
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask) != 0;
}

- (BOOL)isSecure
{
  return 1;
}

- (_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *)AXSASecureControllerImplementation.init()();
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *v2;

  v2 = self;
  sub_21AD08A90();

}

- (void)startListeningOnQueue:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21AD08A90();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *v2;

  v2 = self;
  sub_21AD06A00();

}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
