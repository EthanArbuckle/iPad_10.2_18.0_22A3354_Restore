@implementation DDFlightAction

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  -[UINavigationController setNavigationBarHidden:](self->_viewController, "setNavigationBarHidden:", a3);
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)DDFlightAction;
  v4 = a3;
  -[DDAction prepareViewControllerForActionController:](&v10, sel_prepareViewControllerForActionController_, v4);
  v5 = objc_alloc(MEMORY[0x1E0CEA380]);
  v6 = (void *)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 0, self, sel_closePressed, v10.receiver, v10.super_class);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self->_viewController, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItems:", v7);

  -[DDFlightAction adaptForPresentationInPopover:](self, "adaptForPresentationInPopover:", objc_msgSend(v4, "isPresentingInPopover"));
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 0);

}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Preview Flight"));
}

- (id)iconName
{
  return CFSTR("airplane");
}

- (id)quickActionTitle
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  id v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v3 = -[DDFlightAction extractAirlineCode:flightNumber:](self, "extractAirlineCode:flightNumber:", &v9, &v10);
  v4 = v9;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), v4, v10);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DDFlightAction;
    -[DDAction quickActionTitle](&v8, sel_quickActionTitle);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (int)interactionType
{
  return 1;
}

- (void)closePressed
{
  id v3;

  -[DDAction delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionDidFinish:", self);

}

- (BOOL)extractAirlineCode:(id *)a3 flightNumber:(int64_t *)a4
{
  __DDResult *v6;
  const __CFString *Type;
  uint64_t SubresultWithType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;

  v6 = -[DDAction result](self, "result");
  if (v6)
  {
    Type = (const __CFString *)DDResultGetType();
    if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAB8], 0))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      SubresultWithType = DDResultGetSubresultWithType();
      v9 = DDResultGetSubresultWithType();
      if (SubresultWithType)
        v13 = v9 == 0;
      else
        v13 = 1;
      if (v13)
        DDUILogAssertionFailure((uint64_t)"(airlineCodeSubResult != NULL) && (flightNumberSubResult != NULL)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDFlightAction.m", (uint64_t)"-[DDFlightAction extractAirlineCode:flightNumber:]", 97, CFSTR("Flight information without airline code or flight number"), v10, v11, v12, v15);
      DDResultGetValue();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend((id)DDResultGetValue(), "integerValue");
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (id)viewController
{
  UINavigationController **p_viewController;
  UINavigationController *viewController;
  id v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  DDAutoCloseNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  p_viewController = &self->_viewController;
  viewController = self->_viewController;
  if (!viewController)
  {
    v17 = 0;
    v18 = 0;
    -[DDFlightAction extractAirlineCode:flightNumber:](self, "extractAirlineCode:flightNumber:", &v17, &v18);
    v5 = v17;
    gotLoadHelper_x8__OBJC_CLASS___FUFlightViewController(v6);
    v8 = objc_alloc(*(Class *)(v7 + 656));
    v9 = (void *)objc_msgSend(v8, "initWithFlightCode:airlineCode:", v18, v5);
    v10 = objc_alloc_init(DDAutoCloseNavigationController);
    -[DDAutoCloseNavigationController pushViewController:animated:](v10, "pushViewController:animated:", v9, 0);
    -[DDAutoCloseNavigationController setNavigationBarHidden:](v10, "setNavigationBarHidden:", 0);
    -[DDAutoCloseNavigationController setTarget:](v10, "setTarget:", self);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v10, sel_closePressed);
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItems:", v12);

    objc_storeStrong((id *)p_viewController, v10);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15 <= 6 && ((1 << v15) & 0x62) != 0)
      -[UINavigationController setModalPresentationStyle:](*p_viewController, "setModalPresentationStyle:", 7);

    viewController = *p_viewController;
  }
  return viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
