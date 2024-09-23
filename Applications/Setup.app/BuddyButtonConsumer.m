@implementation BuddyButtonConsumer

- (BuddyButtonConsumer)initWithButtonKind:(int64_t)a3 handler:(id)a4
{
  id v4;
  BuddyButtonConsumer *v5;
  SBSHardwareButtonService *v6;
  id v7;
  BuddyButtonConsumer *v8;
  objc_super v10;
  id location;
  int64_t v12;
  SEL v13;
  id v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v14;
  v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyButtonConsumer;
  v5 = -[BuddyButtonConsumer init](&v10, "init");
  v14 = v5;
  objc_storeStrong(&v14, v5);
  if (v5)
  {
    v6 = +[SBSHardwareButtonService sharedInstance](SBSHardwareButtonService, "sharedInstance");
    v7 = -[SBSHardwareButtonService beginConsumingPressesForButtonKind:eventConsumer:priority:](v6, "beginConsumingPressesForButtonKind:eventConsumer:priority:", v12, v14, 0);
    objc_msgSend(v14, "setButtonConsumer:", v7);

    objc_msgSend(v14, "setMenuHandler:", location);
  }
  v8 = (BuddyButtonConsumer *)v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BuddyButtonConsumer *v4;

  v4 = self;
  v3 = a2;
  -[BSInvalidatable invalidate](self->_buttonConsumer, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)BuddyButtonConsumer;
  -[BuddyButtonConsumer dealloc](&v2, "dealloc");
}

- (id)menuHandler
{
  return self->_menuHandler;
}

- (void)setMenuHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BSInvalidatable)buttonConsumer
{
  return self->_buttonConsumer;
}

- (void)setButtonConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConsumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConsumer, 0);
  objc_storeStrong(&self->_menuHandler, 0);
}

@end
