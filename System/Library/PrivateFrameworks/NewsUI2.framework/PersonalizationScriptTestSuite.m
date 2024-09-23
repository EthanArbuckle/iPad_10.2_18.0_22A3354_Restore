@implementation PersonalizationScriptTestSuite

- (_TtC7NewsUI230PersonalizationScriptTestSuite)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SNTestSuite init](&v3, sel_init);
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC7NewsUI230PersonalizationScriptTestSuite *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1D67B0700(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

@end
