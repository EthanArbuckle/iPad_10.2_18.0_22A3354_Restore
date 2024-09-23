@implementation CNFFaceTimeSettingsController

- (CNFFaceTimeSettingsController)init
{
  void *v3;
  CNFFaceTimeSettingsController *v4;
  objc_super v6;

  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connect:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CNFFaceTimeSettingsController;
  v4 = -[CNFRegListController initWithRegController:](&v6, sel_initWithRegController_, v3);

  return v4;
}

@end
