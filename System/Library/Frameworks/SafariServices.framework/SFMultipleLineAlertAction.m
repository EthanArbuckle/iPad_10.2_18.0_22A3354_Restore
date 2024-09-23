@implementation SFMultipleLineAlertAction

+ (id)actionWithTitle:(id)a3 detail:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(a1, "actionWithTitle:detail:style:handler:", a3, a4, 0, a5);
}

+ (id)actionWithTitle:(id)a3 detail:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _SFMultipleLineAlertActionViewController *v13;
  void *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[_SFMultipleLineAlertActionViewController initWithTitle:detail:style:]([_SFMultipleLineAlertActionViewController alloc], "initWithTitle:detail:style:", v12, v11, a5);

  objc_msgSend(a1, "_actionWithContentViewController:style:handler:", v13, a5, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
