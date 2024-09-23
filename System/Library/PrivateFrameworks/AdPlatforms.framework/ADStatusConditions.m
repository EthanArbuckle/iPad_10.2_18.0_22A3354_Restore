@implementation ADStatusConditions

+ (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, ADStatusConditionsImpl *);
  ADStatusConditionsImpl *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, ADStatusConditionsImpl *))a4;
  if (v7)
  {
    v6 = objc_alloc_init(ADStatusConditionsImpl);
    -[ADStatusConditionsImpl setStatusCondition:completionHandler:](v6, "setStatusCondition:completionHandler:", v7, v5);
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1102, 0);
    v6 = (ADStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, ADStatusConditionsImpl *);
  ADStatusConditionsImpl *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, ADStatusConditionsImpl *))a4;
  if (v7)
  {
    v6 = objc_alloc_init(ADStatusConditionsImpl);
    -[ADStatusConditionsImpl clearStatusCondition:completionHandler:](v6, "clearStatusCondition:completionHandler:", v7, v5);
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1102, 0);
    v6 = (ADStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, ADStatusConditionsImpl *);
  ADStatusConditionsImpl *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, ADStatusConditionsImpl *))a5;
  if (v10 && v7)
  {
    v9 = objc_alloc_init(ADStatusConditionsImpl);
    -[ADStatusConditionsImpl isStatusConditionRegistered:bundleIdentifier:completionHandler:](v9, "isStatusConditionRegistered:bundleIdentifier:completionHandler:", v10, v7, v8);
LABEL_6:

    goto LABEL_7;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1102, 0);
    v9 = (ADStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);
    goto LABEL_6;
  }
LABEL_7:

}

@end
