@implementation EKUIContextMenuActionInfo

- (EKUIContextMenuActionInfo)initWithAction:(unint64_t)a3 showsInEditMenu:(BOOL)a4 group:(unint64_t)a5 positionInGroup:(unint64_t)a6 shouldShowBlock:(id)a7 configureUIActionBlock:(id)a8 actionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  EKUIContextMenuActionInfo *v18;
  EKUIContextMenuActionInfo *v19;
  void *v20;
  id shouldShowBlock;
  void *v22;
  id configureUIActionBlock;
  void *v24;
  id actionBlock;
  objc_super v27;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)EKUIContextMenuActionInfo;
  v18 = -[EKUIContextMenuActionInfo init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_showsInEditMenu = a4;
    v18->_action = a3;
    v18->_group = a5;
    v18->_positionInGroup = a6;
    v20 = _Block_copy(v15);
    shouldShowBlock = v19->_shouldShowBlock;
    v19->_shouldShowBlock = v20;

    v22 = _Block_copy(v16);
    configureUIActionBlock = v19->_configureUIActionBlock;
    v19->_configureUIActionBlock = v22;

    v24 = _Block_copy(v17);
    actionBlock = v19->_actionBlock;
    v19->_actionBlock = v24;

  }
  return v19;
}

- (id)initCalendarMenuPlaceholderInGroup:(unint64_t)a3 positionInGroup:(unint64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIContextMenuActionInfo;
  result = -[EKUIContextMenuActionInfo init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 3) = 0x20000;
    *((_QWORD *)result + 4) = a3;
    *((_QWORD *)result + 5) = a4;
  }
  return result;
}

- (unint64_t)action
{
  return self->_action;
}

- (BOOL)showsInEditMenu
{
  return self->_showsInEditMenu;
}

- (unint64_t)group
{
  return self->_group;
}

- (unint64_t)positionInGroup
{
  return self->_positionInGroup;
}

- (id)shouldShowBlock
{
  return self->_shouldShowBlock;
}

- (id)configureUIActionBlock
{
  return self->_configureUIActionBlock;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong(&self->_configureUIActionBlock, 0);
  objc_storeStrong(&self->_shouldShowBlock, 0);
  objc_storeStrong(&self->_selectionStateBlock, 0);
}

@end
