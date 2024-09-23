@implementation IRCandicateClassificationEligibilityStateMachine

- (void)runWithEventType:(int64_t)a3 smSettings:(id)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IRCandicateClassificationEligibilityStateMachine *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v6 = -[IRCandicateClassificationEligibilityStateMachine eligibilityState](self, "eligibilityState");
  switch(v6)
  {
    case 2:
      if ((unint64_t)(a3 - 2) < 2)
        goto LABEL_9;
      if (a3 == 4)
      {
        -[IRCandicateClassificationEligibilityStateMachine _downrankCounterReset](self, "_downrankCounterReset");
        break;
      }
      if (a3 == 5)
      {
LABEL_9:
        objc_msgSend(v12, "downrankToOneTapThr");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRCandicateClassificationEligibilityStateMachine _downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 1, objc_msgSend(v7, "unsignedIntValue"));
LABEL_18:

      }
      break;
    case 1:
      switch(a3)
      {
        case 1:
          -[IRCandicateClassificationEligibilityStateMachine _downrankCounterReset](self, "_downrankCounterReset");
          -[IRCandicateClassificationEligibilityStateMachine _downRankDismissAndRejectRankCounterReset](self, "_downRankDismissAndRejectRankCounterReset");
          goto LABEL_19;
        case 2:
          objc_msgSend(v12, "downrankToNoneThr");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRCandicateClassificationEligibilityStateMachine _downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 0, objc_msgSend(v8, "unsignedIntValue"));

          goto LABEL_14;
        case 4:
          objc_msgSend(v12, "uprankToAutorouteThr");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "unsignedIntValue");
          v10 = self;
          v11 = 2;
LABEL_17:
          -[IRCandicateClassificationEligibilityStateMachine _uprankCounterIncrementAndTransitionToState:ifThresholdCrossed:](v10, "_uprankCounterIncrementAndTransitionToState:ifThresholdCrossed:", v11, v9);
          goto LABEL_18;
        case 5:
LABEL_14:
          objc_msgSend(v12, "downrankToNoneWithIgnoringThr");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRCandicateClassificationEligibilityStateMachine _downRankDismissAndRejectRankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downRankDismissAndRejectRankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 0, objc_msgSend(v7, "unsignedIntValue"));
          goto LABEL_18;
        default:
          goto LABEL_19;
      }
    case 0:
      switch(a3)
      {
        case 1:
          objc_msgSend(v12, "upRankToOneTapThr");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "unsignedIntValue");
          v10 = self;
          v11 = 1;
          goto LABEL_17;
        case 2:
        case 3:
          -[IRCandicateClassificationEligibilityStateMachine _uprankCounterReset](self, "_uprankCounterReset");
          goto LABEL_19;
        case 6:
          if (objc_msgSend(v12, "useBrokeredScanForMain"))
            goto LABEL_23;
          goto LABEL_19;
        case 7:
          if (objc_msgSend(v12, "useBrokeredScanForSecondary"))
LABEL_23:
            -[IRCandicateClassificationEligibilityStateMachine _transitionToState:](self, "_transitionToState:", 1);
          break;
        default:
          goto LABEL_19;
      }
      break;
  }
LABEL_19:

}

- (void)_transitionToState:(int64_t)a3
{
  -[IRCandicateClassificationEligibilityStateMachine _downrankCounterReset](self, "_downrankCounterReset");
  -[IRCandicateClassificationEligibilityStateMachine _uprankCounterReset](self, "_uprankCounterReset");
  -[IRCandicateClassificationEligibilityStateMachine _downRankDismissAndRejectRankCounterReset](self, "_downRankDismissAndRejectRankCounterReset");
  -[IRCandicateClassificationEligibilityStateMachine setEligibilityState:](self, "setEligibilityState:", a3);
}

- (void)_uprankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  -[IRCandicateClassificationEligibilityStateMachine setUpRankCounter:](self, "setUpRankCounter:", -[IRCandicateClassificationEligibilityStateMachine upRankCounter](self, "upRankCounter") + 1);
  -[IRCandicateClassificationEligibilityStateMachine _downrankCounterReset](self, "_downrankCounterReset");
  -[IRCandicateClassificationEligibilityStateMachine _downRankDismissAndRejectRankCounterReset](self, "_downRankDismissAndRejectRankCounterReset");
  if (-[IRCandicateClassificationEligibilityStateMachine upRankCounter](self, "upRankCounter") >= a4)
    -[IRCandicateClassificationEligibilityStateMachine _transitionToState:](self, "_transitionToState:", a3);
}

- (void)_downrankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  -[IRCandicateClassificationEligibilityStateMachine setDownRankCounter:](self, "setDownRankCounter:", -[IRCandicateClassificationEligibilityStateMachine downRankCounter](self, "downRankCounter") + 1);
  -[IRCandicateClassificationEligibilityStateMachine _uprankCounterReset](self, "_uprankCounterReset");
  if (-[IRCandicateClassificationEligibilityStateMachine downRankCounter](self, "downRankCounter") >= a4)
    -[IRCandicateClassificationEligibilityStateMachine _transitionToState:](self, "_transitionToState:", a3);
}

- (void)_downRankDismissAndRejectRankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  -[IRCandicateClassificationEligibilityStateMachine setDownRankDismissAndRejectRankCounter:](self, "setDownRankDismissAndRejectRankCounter:", -[IRCandicateClassificationEligibilityStateMachine downRankDismissAndRejectRankCounter](self, "downRankDismissAndRejectRankCounter")+ 1);
  -[IRCandicateClassificationEligibilityStateMachine _uprankCounterReset](self, "_uprankCounterReset");
  if (-[IRCandicateClassificationEligibilityStateMachine downRankDismissAndRejectRankCounter](self, "downRankDismissAndRejectRankCounter") >= a4)-[IRCandicateClassificationEligibilityStateMachine _transitionToState:](self, "_transitionToState:", a3);
}

- (void)_downrankCounterReset
{
  -[IRCandicateClassificationEligibilityStateMachine setDownRankCounter:](self, "setDownRankCounter:", 0);
}

- (void)_uprankCounterReset
{
  -[IRCandicateClassificationEligibilityStateMachine setUpRankCounter:](self, "setUpRankCounter:", 0);
}

- (void)_downRankDismissAndRejectRankCounterReset
{
  -[IRCandicateClassificationEligibilityStateMachine setDownRankDismissAndRejectRankCounter:](self, "setDownRankDismissAndRejectRankCounter:", 0);
}

+ (int64_t)_classificationFromEligibility:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    return a3 + 2;
  else
    return 2;
}

- (int64_t)eligibilityState
{
  return self->_eligibilityState;
}

- (void)setEligibilityState:(int64_t)a3
{
  self->_eligibilityState = a3;
}

- (unint64_t)upRankCounter
{
  return self->_upRankCounter;
}

- (void)setUpRankCounter:(unint64_t)a3
{
  self->_upRankCounter = a3;
}

- (unint64_t)downRankCounter
{
  return self->_downRankCounter;
}

- (void)setDownRankCounter:(unint64_t)a3
{
  self->_downRankCounter = a3;
}

- (unint64_t)downRankDismissAndRejectRankCounter
{
  return self->_downRankDismissAndRejectRankCounter;
}

- (void)setDownRankDismissAndRejectRankCounter:(unint64_t)a3
{
  self->_downRankDismissAndRejectRankCounter = a3;
}

@end
