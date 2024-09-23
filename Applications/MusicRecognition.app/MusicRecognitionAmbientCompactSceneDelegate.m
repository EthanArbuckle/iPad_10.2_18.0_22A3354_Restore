@implementation MusicRecognitionAmbientCompactSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000675F8(v8);

}

- (_TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[MusicRecognitionAmbientCompactSceneDelegate init](&v5, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window));
}

@end
