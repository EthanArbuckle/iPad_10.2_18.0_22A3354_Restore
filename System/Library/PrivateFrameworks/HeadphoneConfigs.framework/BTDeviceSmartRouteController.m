@implementation BTDeviceSmartRouteController

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v8;
    objc_msgSend(v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineBreakMode:", 0);

    objc_msgSend(v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setNumberOfLines:", 0);
  }

}

@end
