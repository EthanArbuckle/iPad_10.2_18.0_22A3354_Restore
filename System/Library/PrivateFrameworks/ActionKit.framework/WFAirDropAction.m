@implementation WFAirDropAction

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "airdropLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ with AirDrop?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
