@implementation RunningBoardAssertion

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  _TtC16MusicRecognition21RunningBoardAssertion *v5;

  v4 = a3;
  v5 = self;
  sub_1000AE6A4(v4);

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC16MusicRecognition21RunningBoardAssertion *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1000AE854(v6, (uint64_t)a4);

}

- (_TtC16MusicRecognition21RunningBoardAssertion)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicRecognition21RunningBoardAssertion_assertion) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[RunningBoardAssertion init](&v5, "init");
}

- (void).cxx_destruct
{

}

@end
