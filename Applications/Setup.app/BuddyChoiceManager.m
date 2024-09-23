@implementation BuddyChoiceManager

- (BuddyChoiceManager)initWithFlowItem:(id)a3
{
  id v3;
  BuddyChoiceManager *v4;
  BuddyChoiceManager *v5;
  objc_super v7;
  id location[2];
  id v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)BuddyChoiceManager;
  v4 = -[BuddyChoiceManager init](&v7, "init");
  v9 = v4;
  objc_storeStrong(&v9, v4);
  if (v4)
    objc_storeWeak((id *)v9 + 3, location[0]);
  v5 = (BuddyChoiceManager *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v5;
}

- (void)setChoices:(id)a3
{
  id location[2];
  BuddyChoiceManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_choices != location[0])
  {
    -[NSArray makeObjectsPerformSelector:withObject:](v4->_choices, "makeObjectsPerformSelector:withObject:", "setChoiceController:", 0);
    objc_storeStrong((id *)&v4->_choices, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_tappedChoice:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  id *(*v7)(id *, char);
  void *v8;
  BuddyChoiceManager *v9;
  id v10;
  id location[2];
  BuddyChoiceManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100179EA4;
  v8 = &unk_100281AF8;
  v9 = v12;
  v10 = location[0];
  objc_msgSend(v3, "runConfirmationIfNeededCompletion:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)selectChoice:(id)a3
{
  BuddyChooseable *v3;
  BOOL v4;
  BFFFlowItemDelegate *v5;
  BuddyChooseable *v6;
  id location[2];
  BuddyChoiceManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyChoiceManager chooseableDelegate](v8, "chooseableDelegate");
  v4 = v3 == 0;

  if (v4)
  {
    v5 = -[BuddyChoiceManager delegate](v8, "delegate");
    v6 = -[BuddyChoiceManager chooseableDelegate](v8, "chooseableDelegate");
    -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v5, "flowItemDone:nextItemClass:", v6, objc_msgSend(location[0], "nextControllerClass"));

  }
  else
  {
    v5 = -[BuddyChoiceManager chooseableDelegate](v8, "chooseableDelegate");
    -[BFFFlowItemDelegate didSelectChoice:](v5, "didSelectChoice:", location[0]);
  }

  objc_storeStrong(location, 0);
}

- (BuddyChooseable)chooseableDelegate
{
  return (BuddyChooseable *)objc_loadWeakRetained((id *)&self->_chooseableDelegate);
}

- (void)setChooseableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chooseableDelegate, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_chooseableDelegate);
  objc_storeStrong((id *)&self->_choices, 0);
}

@end
