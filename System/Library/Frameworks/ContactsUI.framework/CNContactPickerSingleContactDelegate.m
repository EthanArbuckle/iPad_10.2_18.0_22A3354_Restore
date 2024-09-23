@implementation CNContactPickerSingleContactDelegate

- (CNContactPickerSingleContactDelegate)initWithTargetViewController:(id)a3
{
  id v4;
  CNContactPickerSingleContactDelegate *v5;
  CNContactPickerSingleContactDelegate *v6;
  CNContactPickerSingleContactDelegate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactPickerSingleContactDelegate;
  v5 = -[CNContactPickerSingleContactDelegate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetViewController, v4);
    v7 = v6;
  }

  return v6;
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  CNLimitedAccessContactPickerViewController **p_targetViewController;
  id v6;
  id v7;
  id WeakRetained;

  p_targetViewController = &self->_targetViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_targetViewController);
  objc_msgSend(WeakRetained, "contactPicker:didSelectContact:", v7, v6);

}

- (void)contactPickerDidCancel:(id)a3
{
  CNLimitedAccessContactPickerViewController **p_targetViewController;
  id v4;
  id WeakRetained;

  p_targetViewController = &self->_targetViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_targetViewController);
  objc_msgSend(WeakRetained, "contactPickerDidCancel:", v4);

}

- (CNLimitedAccessContactPickerViewController)targetViewController
{
  return (CNLimitedAccessContactPickerViewController *)objc_loadWeakRetained((id *)&self->_targetViewController);
}

- (void)setTargetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_targetViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetViewController);
}

@end
