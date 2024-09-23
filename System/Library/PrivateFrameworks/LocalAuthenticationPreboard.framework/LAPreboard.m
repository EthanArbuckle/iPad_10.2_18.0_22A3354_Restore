@implementation LAPreboard

- (LAPreboard)initWithController:(id)a3
{
  id v5;
  LAPreboard *v6;
  LAPreboard *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPreboard;
  v6 = -[LAPreboard init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__preboard;
}

void __28__LAPreboard_sharedInstance__block_invoke()
{
  LAPreboard *v0;
  void *v1;

  v0 = -[LAPreboard initWithDefaults]([LAPreboard alloc], "initWithDefaults");
  v1 = (void *)sharedInstance__preboard;
  sharedInstance__preboard = (uint64_t)v0;

}

- (id)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

- (LAPreboard)initWithDefaults
{
  return (LAPreboard *)LAPreboard.init(defaults:)();
}

- (NSString)iconSystemName
{
  LAPreboard *v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = -[LAPreboard useCase](v2, sel_useCase);
  if (v3 != (id)-1)
  {
    if (v3 == (id)3)
    {
      v4 = 0xE400000000000000;
      v5 = 1918985575;
      goto LABEL_7;
    }
    if (v3 == (id)4)
    {
      v4 = 0x8000000240AF56C0;
      v5 = 0xD000000000000034;
LABEL_7:

      v6 = (void *)MEMORY[0x2426889BC](v5, v4);
      swift_bridgeObjectRelease();
      return (NSString *)v6;
    }
  }

  v6 = 0;
  return (NSString *)v6;
}

- (NSString)title
{
  return (NSString *)@objc LAPreboard.title.getter(self, (uint64_t)a2, static LocalizedStrings.installProfileTitle.getter, static LocalizedStrings.developerModeTitle.getter);
}

- (NSString)message
{
  return (NSString *)@objc LAPreboard.message.getter(self, (uint64_t)a2, LAPreboard.message.getter);
}

- (id)actionTitleWithHomeButton:(BOOL)a3
{
  _BOOL4 v3;
  LAPreboard *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = self;
  -[LAPreboard useCase](v4, sel_useCase);
  if (v3)
    v5 = static LocalizedStrings.pressHomeToContinue.getter();
  else
    v5 = static LocalizedStrings.swipeUpToContinue.getter();
  v7 = v5;
  v8 = v6;

  v9 = (void *)MEMORY[0x2426889BC](v7, v8);
  swift_bridgeObjectRelease();
  return v9;
}

- (NSString)confirmationTitle
{
  return (NSString *)0;
}

- (NSString)confirmationMessage
{
  return (NSString *)@objc LAPreboard.message.getter(self, (uint64_t)a2, LAPreboard.confirmationMessage.getter);
}

- (NSString)confirmationActionTitle
{
  return (NSString *)@objc LAPreboard.title.getter(self, (uint64_t)a2, static LocalizedStrings.confirmationAlertInstall.getter, static LocalizedStrings.confirmationAlertEnable.getter);
}

- (NSString)confirmationCancelTitle
{
  return (NSString *)@objc LAPreboard.title.getter(self, (uint64_t)a2, static LocalizedStrings.confirmationAlertNotInstall.getter, static LocalizedStrings.confirmationAlertNotEnable.getter);
}

- (NSString)passcodeTitle
{
  uint64_t v2;
  void *v3;

  v2 = static LocalizedStrings.enterPasscode.getter();
  v3 = (void *)MEMORY[0x2426889BC](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)passcodeSubtitle
{
  return (NSString *)@objc LAPreboard.title.getter(self, (uint64_t)a2, static LocalizedStrings.passcodeRequiredInstallProfile.getter, static LocalizedStrings.passcodeRequiredDeveloperMode.getter);
}

- (BOOL)isRequired
{
  LAPreboard *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = objc_msgSend(-[LAPreboard controller](v2, sel_controller), sel_isRequired);

  swift_unknownObjectRelease();
  return v3;
}

- (int64_t)useCase
{
  LAPreboard *v2;
  id v3;

  v2 = self;
  v3 = objc_msgSend(-[LAPreboard controller](v2, sel_controller), sel_useCase);

  swift_unknownObjectRelease();
  return (int64_t)v3;
}

- (BOOL)launchPreboardWithError:(id *)a3
{
  LAPreboard *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  LAPreboard.launch()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)_convertErrorToNSError(_:)();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (void)launchPreboardWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  LAPreboard *v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = -[LAPreboard controller](v6, sel_controller);
  v9[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v9[3] = &block_descriptor_33;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_launchPreboardWithCompletion_, v8);
  _Block_release(v8);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)setEnvironmentVariableWithPasscode:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LAPreboard *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = (void *)MEMORY[0x2426889BC](v6, v8);
  v13[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  v13[5] = v9;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v13[3] = &block_descriptor_26;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  -[LAPreboard enableCurrentUseCaseWithPasscode:completion:](v10, sel_enableCurrentUseCaseWithPasscode_completion_, v11, v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
  swift_release();

}

- (void)enableCurrentUseCaseWithPasscode:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LAPreboard *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = -[LAPreboard controller](v10, sel_controller);
  v12 = (void *)MEMORY[0x2426889BC](v6, v8);
  v14[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v14[3] = &block_descriptor_19;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_enableCurrentUseCaseWithPasscode_completion_, v12, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

}

- (void)terminateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  LAPreboard *v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = -[LAPreboard controller](v6, sel_controller);
  v9[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v9[3] = &block_descriptor_12;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_terminateWithCompletion_, v8);
  _Block_release(v8);

  swift_release();
  swift_unknownObjectRelease();
}

@end
