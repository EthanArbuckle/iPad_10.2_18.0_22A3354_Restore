@implementation _FBSTestExitAction

- (_FBSTestExitAction)init
{
  void *v3;
  void *v4;
  _FBSTestExitAction *v5;
  objc_super v7;

  objc_msgSend(off_1E38E9DB8, "responderWithHandler:", &__block_literal_global_22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueue:", MEMORY[0x1E0C80D38]);
  v4 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)_FBSTestExitAction;
  v5 = -[_FBSTestExitAction initWithInfo:responder:](&v7, sel_initWithInfo_responder_, v4, v3);

  return v5;
}

- (_FBSTestExitAction)initWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  exit(-9);
}

- (_FBSTestExitAction)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  exit(-9);
}

@end
