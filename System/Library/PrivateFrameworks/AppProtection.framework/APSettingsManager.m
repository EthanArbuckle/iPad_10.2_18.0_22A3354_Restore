@implementation APSettingsManager

+ (id)sharedManager
{
  if (qword_2563D4270 != -1)
    swift_once();
  return (id)qword_2563DB620;
}

- (BOOL)setSubject:(id)a3 isHidden:(BOOL)a4 error:(id *)a5
{
  return sub_2362B7160(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_2362B8898);
}

- (BOOL)setSubject:(id)a3 isLocked:(BOOL)a4 error:(id *)a5
{
  return sub_2362B7160(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_2362B8BE0);
}

- (void)setSubject:(id)a3 isHidden:(BOOL)a4 completion:(id)a5
{
  sub_2362B73F4(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, void *))sub_2362B8E00);
}

- (void)setSubject:(id)a3 isLocked:(BOOL)a4 completion:(id)a5
{
  sub_2362B73F4(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, void *))sub_2362B9068);
}

- (BOOL)canChangeLockedStatusOfSubject:(id)a3
{
  return sub_2362B7494(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_2362B8AB8);
}

- (BOOL)canChangeHiddenStatusOfSubject:(id)a3
{
  return sub_2362B7494(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_2362B878C);
}

- (APSettingsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APSettingsManager;
  return -[APSettingsManager init](&v3, sel_init);
}

- (void)setSubject:(id)a3 shownInSearchAndSiri:(BOOL)a4 completion:(id)a5
{
  void (**v7)(void *, _QWORD, void *);
  id v8;
  id v9;
  void *v10;
  APSettingsManager *v11;

  v7 = (void (**)(void *, _QWORD, void *))_Block_copy(a5);
  v8 = a3;
  v11 = self;
  v9 = sub_2362B92D0();
  v10 = (void *)sub_2362CB2D8();
  v7[2](v7, 0, v10);

  _Block_release(v7);
}

- (BOOL)canChangeShownInSearchAndSiriForSubject:(id)a3
{
  return 0;
}

@end
