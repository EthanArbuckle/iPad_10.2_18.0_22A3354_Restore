@implementation BuddyChoice

- (BuddyChoice)initWithTitle:(id)a3 nextItemClass:(Class)a4
{
  id v5;
  BuddyChoice *v6;
  objc_super v8;
  Class v9;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyChoice;
  v11 = -[BuddyChoice init](&v8, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_msgSend(v11, "setTitle:", location[0]);
    objc_msgSend(v11, "setNextControllerClass:", v9);
  }
  v6 = (BuddyChoice *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (id)confirmationAcceptActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v7;
  int64_t v8;
  UIAlertAction *v9;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id from;
  id v19;
  int64_t v20;
  id location[2];
  BuddyChoice *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&from, v22);
  v7 = location[0];
  v8 = v20;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000D2300;
  v15 = &unk_100282650;
  v16 = v19;
  objc_copyWeak(&v17, &from);
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, v8, &v11);
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)confirmationCancelActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v7;
  int64_t v8;
  UIAlertAction *v9;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id from;
  id v19;
  int64_t v20;
  id location[2];
  BuddyChoice *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&from, v22);
  v7 = location[0];
  v8 = v20;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000D24CC;
  v15 = &unk_100282650;
  v16 = v19;
  objc_copyWeak(&v17, &from);
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, v8, &v11);
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setConfirmationAlert:(id)a3 condition:(id)a4
{
  id v5;
  id location[2];
  BuddyChoice *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyChoice setCondition:](v7, "setCondition:", v5);
  -[BuddyChoice setAlertController:](v7, "setAlertController:", location[0]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)runConfirmationIfNeededCompletion:(id)a3
{
  UIAlertController *v3;
  char v4;
  UIViewController *v5;
  UIAlertController *v6;
  char v7;
  uint64_t (**v8)(void);
  char v9;
  id v10;
  id location[2];
  BuddyChoice *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyChoice alertController](v12, "alertController");
  v9 = 0;
  v7 = 0;
  v4 = 0;
  if (v3)
  {
    v10 = -[BuddyChoice condition](v12, "condition");
    v9 = 1;
    v4 = 1;
    if (v10)
    {
      v8 = (uint64_t (**)(void))-[BuddyChoice condition](v12, "condition");
      v7 = 1;
      v4 = v8[2]();
    }
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v4 & 1) != 0)
  {
    -[BuddyChoice setConfirmationCompletion:](v12, "setConfirmationCompletion:", location[0]);
    v5 = -[BuddyChoice choiceController](v12, "choiceController");
    v6 = -[BuddyChoice alertController](v12, "alertController");
    -[UIViewController presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)_choiceConfirmed:(BOOL)a3
{
  id v3;
  void (**v4)(id, BOOL);

  v3 = -[BuddyChoice confirmationCompletion](self, "confirmationCompletion");

  if (v3)
  {
    v4 = (void (**)(id, BOOL))-[BuddyChoice confirmationCompletion](self, "confirmationCompletion");
    v4[2](v4, a3);

    -[BuddyChoice setConfirmationCompletion:](self, "setConfirmationCompletion:", 0);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (Class)nextControllerClass
{
  return self->_nextControllerClass;
}

- (void)setNextControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_nextControllerClass, a3);
}

- (UIViewController)choiceController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_choiceController);
}

- (void)setChoiceController:(id)a3
{
  objc_storeWeak((id *)&self->_choiceController, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (id)confirmationCompletion
{
  return self->_confirmationCompletion;
}

- (void)setConfirmationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmationCompletion, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_choiceController);
  objc_storeStrong((id *)&self->_nextControllerClass, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_nextController, 0);
}

@end
