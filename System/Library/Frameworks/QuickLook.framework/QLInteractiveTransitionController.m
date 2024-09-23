@implementation QLInteractiveTransitionController

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)startInteractiveTransition:(id)a3
{
  void *v4;
  id v5;
  CGRect v6;

  -[QLTransitionController setUpWithTransitionContext:completionHandler:](self, "setUpWithTransitionContext:completionHandler:", a3, 0);
  -[QLInteractiveTransitionController setCompleteProgress:](self, "setCompleteProgress:", 0.0);
  -[QLTransitionController animatedController](self, "animatedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitioningView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  self->_initialTransitioningViewWidth = CGRectGetWidth(v6);

}

- (void)setCompleteProgress:(double)a3
{
  double v3;
  double v4;
  id v5;

  v3 = fmax(a3, 0.0);
  if (v3 > 1.0)
    v3 = 1.0;
  self->_completeProgress = v3;
  v4 = -(v3 * (v3 + -2.0));
  -[QLTransitionController transitionContext](self, "transitionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateInteractiveTransition:", v4);

}

- (void)updateTransitionWithProgress:(double)a3
{
  -[QLInteractiveTransitionController updateTransitionWithProgress:isFinal:](self, "updateTransitionWithProgress:isFinal:", 0, a3);
}

- (void)updateTransitionWithProgress:(double)a3 isFinal:(BOOL)a4
{
  double v4;
  double v5;
  NSObject **v6;
  NSObject *v7;
  double v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = 0.999;
  if (a4)
    v4 = 1.0;
  if (v4 >= a3)
    v5 = a3;
  else
    v5 = v4;
  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  v8 = fmax(v5, 0.0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_INFO, "[QLInteractiveTransitionController updateTransitionWithProgress:%f isFinal:%@] #AppearanceTransition", buf, 0x16u);

  }
  QLRunInMainThread();
}

id __74__QLInteractiveTransitionController_updateTransitionWithProgress_isFinal___block_invoke(uint64_t a1)
{
  double v2;
  objc_super v4;

  objc_msgSend(*(id *)(a1 + 32), "setCompleteProgress:", *(double *)(a1 + 40));
  v2 = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)QLInteractiveTransitionController;
  return objc_msgSendSuper2(&v4, sel_updateTransitionWithProgress_, v2);
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  QLRunInMainThread();
}

void __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[4];
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasPerformedTransition") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasPerformedTransition:", 1);
    v2 = (NSObject **)MEMORY[0x24BE7BF48];
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      NSStringFromBOOL();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "[QLInteractiveTransitionController completeTransition didComplete:%@] #AppearanceTransition", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setDuration:", *(double *)(a1 + 40));
    v6 = *(double *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_1;
    v12[3] = &unk_24C724CF8;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_BYTE *)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_3;
    v10[3] = &unk_24C725D00;
    v10[4] = v13;
    v11 = v14;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v12, v10, v6);
    v7 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "transitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "finishInteractiveTransition");
    else
      objc_msgSend(v8, "cancelInteractiveTransition");

  }
}

void __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_1(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD v10[5];
  char v11;
  CAFrameRateRange v12;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v9 = 2097154;
  else
    v9 = 2097155;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_2;
  v10[3] = &unk_24C724CF8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 40);
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v9, v10, COERCE_DOUBLE((unint64_t)LODWORD(minimum)), v7, v8);

}

uint64_t __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "updateTransitionWithProgress:isFinal:", 1, v1);
}

uint64_t __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "tearDownTransition:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_performForcedDismissal
{
  __assert_rtn("-[QLInteractiveTransitionController _performForcedDismissal]", "QLInteractiveTransitionController.m", 112, "!self.showing");
}

uint64_t __60__QLInteractiveTransitionController__performForcedDismissal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:withDuration:", 1, 0.4);
}

- (double)completeProgress
{
  return self->_completeProgress;
}

@end
