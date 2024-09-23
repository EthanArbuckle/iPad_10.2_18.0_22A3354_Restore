@implementation PBAHIDEventController

+ (id)sharedController
{
  if (qword_100021C58 != -1)
    dispatch_once(&qword_100021C58, &stru_100018648);
  return (id)qword_100021C50;
}

- (PBAHIDEventController)init
{
  PBAHIDEventController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *dispatchingRules;
  objc_super v11;
  _QWORD v12[2];

  v11.receiver = self;
  v11.super_class = (Class)PBAHIDEventController;
  v2 = -[PBAHIDEventController init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDispatchingTarget systemTarget](BKSHIDEventDispatchingTarget, "systemTarget"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate](BKSMutableHIDEventDiscreteDispatchingPredicate, "defaultSystemPredicate"));
    objc_msgSend(v4, "setSenderDescriptors:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v4, v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate](BKSMutableHIDEventDiscreteDispatchingPredicate, "defaultFocusPredicate"));
    objc_msgSend(v6, "setSenderDescriptors:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v6, v3));
    v12[0] = v5;
    v12[1] = v7;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    dispatchingRules = v2->_dispatchingRules;
    v2->_dispatchingRules = (NSArray *)v8;

  }
  return v2;
}

- (void)startReceivingEvents
{
  BSInvalidatable *v3;
  BSInvalidatable *eventDispatchAssertion;
  void *v6;
  id v7;

  if (self->_eventDispatchAssertion)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBAHIDEventController.m"), 63, CFSTR("%s called when we're already receiving events"), "-[PBAHIDEventController startReceivingEvents]");

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDeliveryManager sharedInstance](BKSHIDEventDeliveryManager, "sharedInstance"));
  v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dispatchDiscreteEventsForReason:withRules:", CFSTR("PreBoard in the house"), self->_dispatchingRules));
  eventDispatchAssertion = self->_eventDispatchAssertion;
  self->_eventDispatchAssertion = v3;

}

- (void)stopReceivingEvents
{
  BSInvalidatable *eventDispatchAssertion;

  -[BSInvalidatable invalidate](self->_eventDispatchAssertion, "invalidate");
  eventDispatchAssertion = self->_eventDispatchAssertion;
  self->_eventDispatchAssertion = 0;

}

- (BSInvalidatable)eventDispatchAssertion
{
  return self->_eventDispatchAssertion;
}

- (void)setEventDispatchAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatchAssertion, a3);
}

- (NSArray)dispatchingRules
{
  return self->_dispatchingRules;
}

- (void)setDispatchingRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchingRules, 0);
  objc_storeStrong((id *)&self->_eventDispatchAssertion, 0);
}

@end
