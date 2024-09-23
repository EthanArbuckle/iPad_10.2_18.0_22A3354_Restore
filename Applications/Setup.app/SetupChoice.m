@implementation SetupChoice

- (SetupChoice)initWithChoiceID:(id)a3 title:(id)a4 nextItemClass:(Class)a5
{
  id v7;
  SetupChoice *v8;
  objc_super v10;
  Class v11;
  id v12;
  id location[2];
  id v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v7 = v14;
  v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)SetupChoice;
  v14 = -[SetupChoice init](&v10, "init");
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    objc_msgSend(v14, "setLocalizedTitle:", v12);
    objc_msgSend(v14, "setNextControllerClass:", v11);
    objc_msgSend(v14, "setIdentifier:", location[0]);
  }
  v8 = (SetupChoice *)v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
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
  SetupChoice *v16;
  id v17;
  id v18;
  id from;
  id v20;
  int64_t v21;
  id location[2];
  SetupChoice *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v20 = 0;
  objc_storeStrong(&v20, a5);
  objc_initWeak(&from, v23);
  v7 = location[0];
  v8 = v21;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000B10E0;
  v15 = &unk_100282168;
  v17 = v20;
  objc_copyWeak(&v18, &from);
  v16 = v23;
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, v8, &v11);
  objc_storeStrong((id *)&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
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
  SetupChoice *v16;
  id v17;
  id v18;
  id from;
  id v20;
  int64_t v21;
  id location[2];
  SetupChoice *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v20 = 0;
  objc_storeStrong(&v20, a5);
  objc_initWeak(&from, v23);
  v7 = location[0];
  v8 = v21;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000B12E8;
  v15 = &unk_100282168;
  v17 = v20;
  objc_copyWeak(&v18, &from);
  v16 = v23;
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, v8, &v11);
  objc_storeStrong((id *)&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setConfirmationAlert:(id)a3 condition:(id)a4
{
  id v5;
  id location[2];
  SetupChoice *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SetupChoice setCondition:](v7, "setCondition:", v5);
  -[SetupChoice setAlertController:](v7, "setAlertController:", location[0]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)runConfirmationIfNeeded
{
  UIAlertController *v2;
  char v3;
  SetupChoiceController *v4;
  UIAlertController *v5;
  char v6;
  uint64_t (**v7)(void);
  char v8;
  id v9;

  v2 = -[SetupChoice alertController](self, "alertController");
  v8 = 0;
  v6 = 0;
  v3 = 0;
  if (v2)
  {
    v9 = -[SetupChoice condition](self, "condition");
    v8 = 1;
    v3 = 1;
    if (v9)
    {
      v7 = (uint64_t (**)(void))-[SetupChoice condition](self, "condition");
      v6 = 1;
      v3 = v7[2]();
    }
  }
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  v4 = -[SetupChoice choiceController](self, "choiceController");
  if ((v3 & 1) != 0)
  {
    v5 = -[SetupChoice alertController](self, "alertController");
    -[SetupChoiceController presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    -[SetupChoiceController choiceConfirmed:](v4, "choiceConfirmed:", self);
  }

}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (Class)nextControllerClass
{
  return self->_nextControllerClass;
}

- (void)setNextControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_nextControllerClass, a3);
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong(&self->_identifier, a3);
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (SetupChoiceController)choiceController
{
  return (SetupChoiceController *)objc_loadWeakRetained((id *)&self->_choiceController);
}

- (void)setChoiceController:(id)a3
{
  objc_storeWeak((id *)&self->_choiceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_choiceController);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong((id *)&self->_nextControllerClass, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_nextController, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
