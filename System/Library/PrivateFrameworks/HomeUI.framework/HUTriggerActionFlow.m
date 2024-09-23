@implementation HUTriggerActionFlow

- (HUTriggerActionFlow)initWithEditorMode:(unint64_t)a3
{
  uint64_t v3;
  HUTriggerActionFlow *v4;

  if (a3)
    v3 = 3;
  else
    v3 = 0;
  v4 = -[HUTriggerActionFlow initWithFlowState:](self, "initWithFlowState:", v3);

  return v4;
}

- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3
{
  return -[HUTriggerActionFlow initWithFlowState:hasChangedState:](self, "initWithFlowState:hasChangedState:", a3, 0);
}

- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3 hasChangedState:(BOOL)a4
{
  HUTriggerActionFlow *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionFlow;
  result = -[HUTriggerActionFlow init](&v7, sel_init);
  if (result)
  {
    result->_flowState = a3;
    result->_hasChangedState = a4;
  }
  return result;
}

+ (id)selectFlowForState:(unint64_t)a3
{
  HUTriggerActionFlow *v4;
  uint64_t v5;

  v4 = [HUTriggerActionFlow alloc];
  if (a3 == 7)
    v5 = 6;
  else
    v5 = 2;
  return -[HUTriggerActionFlow initWithFlowState:](v4, "initWithFlowState:", v5);
}

- (unint64_t)_nextState
{
  unint64_t v3;

  v3 = -[HUTriggerActionFlow flowState](self, "flowState");
  if (v3 >= 8)
    return -[HUTriggerActionFlow flowState](self, "flowState");
  else
    return qword_1B94426E8[v3];
}

- (id)getNextState
{
  return -[HUTriggerActionFlow initWithFlowState:hasChangedState:]([HUTriggerActionFlow alloc], "initWithFlowState:hasChangedState:", -[HUTriggerActionFlow _nextState](self, "_nextState"), 1);
}

- (BOOL)isStandalone
{
  return -[HUTriggerActionFlow flowState](self, "flowState") == 4
      || -[HUTriggerActionFlow flowState](self, "flowState") == 5
      || -[HUTriggerActionFlow flowState](self, "flowState") == 6
      || -[HUTriggerActionFlow flowState](self, "flowState") == 7;
}

- (BOOL)isFinished
{
  return -[HUTriggerActionFlow flowState](self, "flowState") == 8;
}

- (BOOL)isSingleFlow
{
  if (-[HUTriggerActionFlow _nextState](self, "_nextState") == 8)
    return !-[HUTriggerActionFlow hasChangedState](self, "hasChangedState");
  else
    return 0;
}

- (BOOL)isLastState
{
  return -[HUTriggerActionFlow _nextState](self, "_nextState") == 8;
}

- (unint64_t)flowState
{
  return self->_flowState;
}

- (BOOL)hasChangedState
{
  return self->_hasChangedState;
}

@end
