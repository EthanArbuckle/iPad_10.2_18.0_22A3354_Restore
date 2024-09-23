@implementation ICActionSheetAlertAction

+ (id)actionWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:iconImage:style:handler:", v12, v11, a5, v10);

  return v13;
}

- (ICActionSheetAlertAction)initWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICActionSheetAlertAction *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICActionSheetAlertAction;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[ICActionSheetAlertAction class](&v16, sel_class);
  objc_msgSend(v13, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v12, v11, a5, v10, 0, v16.receiver, v16.super_class);
  v14 = (ICActionSheetAlertAction *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
