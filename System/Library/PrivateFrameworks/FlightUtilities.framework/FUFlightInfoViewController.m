@implementation FUFlightInfoViewController

- (FUFlightInfoViewController)initWithStyle:(unint64_t)a3
{
  FUFlightInfoViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FUFlightInfoViewController;
  result = -[FUFlightInfoViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  if (result)
    result->_style = a3;
  return result;
}

- (void)loadView
{
  id v3;

  +[FUFlightInfoView flightViewForStyle:compact:](FUFlightInfoView, "flightViewForStyle:compact:", self->_style, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoViewController setView:](self, "setView:", v3);

}

- (void)setStyle:(unint64_t)a3
{
  id v4;

  -[FUFlightInfoViewController flightInfoView](self, "flightInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flight, 0);
}

@end
