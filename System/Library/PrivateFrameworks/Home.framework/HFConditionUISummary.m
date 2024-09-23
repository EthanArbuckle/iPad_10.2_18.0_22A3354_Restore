@implementation HFConditionUISummary

- (HFConditionUISummary)initWithCondition:(id)a3 title:(id)a4 description:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFConditionUISummary *v12;
  HFConditionUISummary *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFConditionUISummary;
  v12 = -[HFConditionUISummary init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_condition, a3);
    objc_storeStrong((id *)&v13->_conditionTitle, a4);
    objc_storeStrong((id *)&v13->_conditionDescription, a5);
  }

  return v13;
}

- (NSString)conditionTitle
{
  return self->_conditionTitle;
}

- (NSString)conditionDescription
{
  return self->_conditionDescription;
}

- (HFCondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_conditionDescription, 0);
  objc_storeStrong((id *)&self->_conditionTitle, 0);
}

@end
