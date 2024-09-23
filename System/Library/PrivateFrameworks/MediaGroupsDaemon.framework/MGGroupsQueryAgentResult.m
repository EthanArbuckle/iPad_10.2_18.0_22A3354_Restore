@implementation MGGroupsQueryAgentResult

- (MGGroupsQueryAgentResult)initWithGroup:(id)a3 mediator:(id)a4
{
  id v7;
  MGGroupsQueryAgentResult *v8;
  MGGroupsQueryAgentResult *v9;
  id v10;
  objc_super v12;
  id location;

  v7 = a3;
  objc_initWeak(&location, a4);
  v12.receiver = self;
  v12.super_class = (Class)MGGroupsQueryAgentResult;
  v8 = -[MGGroupsQueryAgentResult init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a3);
    v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v9->_mediator, v10);

  }
  objc_destroyWeak(&location);

  return v9;
}

- (MGGroup)group
{
  return self->_group;
}

- (MGGroupsMediator)mediator
{
  return (MGGroupsMediator *)objc_loadWeakRetained((id *)&self->_mediator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediator);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
