@implementation HUTriggerConditionDetailEditingContext

- (HUTriggerTimeConditionDetailEditorViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (HFItem)optionItem
{
  return self->_optionItem;
}

- (void)setOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_optionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionItem, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
