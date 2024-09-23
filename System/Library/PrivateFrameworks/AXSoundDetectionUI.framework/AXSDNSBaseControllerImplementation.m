@implementation AXSDNSBaseControllerImplementation

- (BOOL)isListening
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_isListening);
}

- (BOOL)isSecure
{
  return 0;
}

- (_TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *)AXSDNSBaseControllerImplementation.init()();
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *v2;

  v2 = self;
  sub_21ACF9534();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *v2;

  v2 = self;
  sub_21ACF979C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener));
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSDNSBaseControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);

}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  _TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  AXSDNSBaseControllerImplementation.listenEngineFailedToStartWithError(_:)(v5);

}

@end
