@implementation IntentHandler

- (void)provideUserOptionsCollectionForSelectUser:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC25ScreenTimeWidgetExtension13IntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10001BDC4(v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (id)defaultUserForSelectUser:(id)a3
{
  return sub_10001BF7C();
}

- (_TtC25ScreenTimeWidgetExtension13IntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v3, "init");
}

@end
