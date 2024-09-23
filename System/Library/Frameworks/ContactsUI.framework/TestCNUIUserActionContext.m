@implementation TestCNUIUserActionContext

- (id)nilValue
{
  return 0;
}

- (CNUIUserActionURLOpener)urlOpener
{
  -[TestCNUIUserActionContext setActionExecutionWasAttemted:](self, "setActionExecutionWasAttemted:", 1);
  return (CNUIUserActionURLOpener *)-[TestCNUIUserActionContext nilValue](self, "nilValue");
}

- (CNUIUserActionUserActivityOpener)userActivityOpener
{
  -[TestCNUIUserActionContext setActionExecutionWasAttemted:](self, "setActionExecutionWasAttemted:", 1);
  return (CNUIUserActionUserActivityOpener *)-[TestCNUIUserActionContext nilValue](self, "nilValue");
}

- (CNUIUserActionDialRequestOpener)dialRequestOpener
{
  -[TestCNUIUserActionContext setActionExecutionWasAttemted:](self, "setActionExecutionWasAttemted:", 1);
  return (CNUIUserActionDialRequestOpener *)-[TestCNUIUserActionContext nilValue](self, "nilValue");
}

- (CNUIUserActionRecorder)actionRecorder
{
  -[TestCNUIUserActionContext setActionExecutionWasAttemted:](self, "setActionExecutionWasAttemted:", 1);
  return (CNUIUserActionRecorder *)-[TestCNUIUserActionContext nilValue](self, "nilValue");
}

- (CNUIUserActionCurator)actionCurator
{
  -[TestCNUIUserActionContext setActionExecutionWasAttemted:](self, "setActionExecutionWasAttemted:", 1);
  return (CNUIUserActionCurator *)-[TestCNUIUserActionContext nilValue](self, "nilValue");
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)actionExecutionWasAttemted
{
  return self->_actionExecutionWasAttemted;
}

- (void)setActionExecutionWasAttemted:(BOOL)a3
{
  self->_actionExecutionWasAttemted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
