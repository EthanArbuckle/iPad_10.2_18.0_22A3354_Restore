@implementation SFDialogAction

+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:activatingKeyboardShortcut:type:isPreferredAction:", v8, a4, a5, 0);

  return v9;
}

+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;

  v6 = a6;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:activatingKeyboardShortcut:type:isPreferredAction:", v10, a4, a5, v6);

  return v11;
}

- (SFDialogAction)initWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6
{
  id v11;
  SFDialogAction *v12;
  SFDialogAction *v13;
  SFDialogAction *v14;
  objc_super v16;

  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFDialogAction;
  v12 = -[SFDialogAction init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_activatingKeyboardShortcut = a4;
    v12->_actionType = a5;
    objc_storeStrong((id *)&v12->_title, a3);
    v13->_isPreferredAction = a6;
    v14 = v13;
  }

  return v13;
}

- (BOOL)hasCustomAction
{
  return self->_customAction != 0;
}

- (void)setCustomAction:(id)a3
{
  void *v4;
  id customAction;

  v4 = _Block_copy(a3);
  customAction = self->_customAction;
  self->_customAction = v4;

}

- (void)triggerCustomAction
{
  (*((void (**)(void))self->_customAction + 2))();
}

- (int64_t)activatingKeyboardShortcut
{
  return self->_activatingKeyboardShortcut;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPreferredAction
{
  return self->_isPreferredAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_customAction, 0);
}

@end
