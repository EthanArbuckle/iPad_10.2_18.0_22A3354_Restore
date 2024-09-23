@implementation Family_MSMessagesAppViewController

- (void)family_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  if ((objc_opt_respondsToSelector(self, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:") & 1) != 0)
    -[Family_MSMessagesAppViewController _presentAlertSheetWithTitle:message:buttonTitles:styles:completion:](self, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v16, v12, v15, v14, v13);
  else
    -[Family_MSMessagesAppViewController _presentAlertSheetWith:styles:completion:](self, "_presentAlertSheetWith:styles:completion:", v15, v14, v13);

}

@end
