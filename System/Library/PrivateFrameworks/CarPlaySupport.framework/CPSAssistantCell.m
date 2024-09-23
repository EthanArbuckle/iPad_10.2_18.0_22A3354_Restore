@implementation CPSAssistantCell

- (void)configureWithText:(id)a3
{
  id v3;
  id location[2];
  CPSAssistantCell *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BE15360], "configurationWithText:", location[0]);
  -[CPUIAssistantCell applyConfiguration:](v5, "applyConfiguration:", v3);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

@end
