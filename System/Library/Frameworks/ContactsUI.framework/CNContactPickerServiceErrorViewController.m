@implementation CNContactPickerServiceErrorViewController

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (CNContactPickerContentDelegate)delegate
{
  return (CNContactPickerContentDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UINavigationController)navigationController
{
  return self->navigationController;
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return self->addContactBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->addContactBarButtonItem, 0);
  objc_storeStrong((id *)&self->navigationController, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
