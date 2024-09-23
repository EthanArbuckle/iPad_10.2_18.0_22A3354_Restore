@implementation ProfileCharacteristicsViewControllerWithDoneButton

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  v2 = v6.receiver;
  -[ProfileCharacteristicsViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_allocWithZone(MEMORY[0x24BEBD410]);
  v4 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 0, v2, sel_dismissNavigationViewController, v6.receiver, v6.super_class);
  v5 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v5, sel_setLeftBarButtonItem_, v4);

}

- (void)dismissNavigationViewController
{
  _TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *v2;
  _TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *v3;
  _TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *v4;
  _TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *v5;

  v5 = self;
  v2 = (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *)-[ProfileCharacteristicsViewControllerWithDoneButton navigationController](v5, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    -[ProfileCharacteristicsViewControllerWithDoneButton dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithHealthStore:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  return -[ProfileCharacteristicsViewController initWithHealthStore:](&v5, sel_initWithHealthStore_, a3);
}

- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  return -[ProfileCharacteristicsViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
