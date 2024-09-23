@implementation CSScenarioFactory

+ (id)scenarioForIdentifier:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  CSScenario *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(0, "objectForKey:", v5);
  v7 = (CSScenario *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[CSScenario initWithIdentifier:andCriteria:]([CSScenario alloc], "initWithIdentifier:andCriteria:", v5, v6);
    objc_msgSend(0, "setObject:forKeyedSubscript:", v7, v5);
  }

  return v7;
}

@end
