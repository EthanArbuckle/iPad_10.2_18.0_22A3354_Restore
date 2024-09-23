@implementation CCUIOverlayTransitionState

+ (BOOL)isSignificantStatusBarTransitionFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isSignificantTransitionFrom:to:", v6, v7) & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_msgSend(v6, "snappedStatusBarPresentationProgress");
    objc_msgSend(v7, "snappedStatusBarPresentationProgress");
    v8 = BSFloatEqualToFloat() ^ 1;
  }

  return v8;
}

- (double)snappedStatusBarPresentationProgress
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[CCUIOverlayTransitionState clampedPresentationProgress](self, "clampedPresentationProgress");
  v3 = v2;
  v4 = CCUIPortraitHeaderHeight();
  v5 = v4 - CCUIStatusBarHeight();
  return fmax(fmin(floor(v3 * (v5 / (CCUIStatusBarHeight() * 0.75))), 1.0), 0.0);
}

+ (BOOL)isSignificantTransitionFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a3;
  v6 = a4;
  if (v5
    && (v7 = objc_msgSend(v5, "isInteractive"), v7 == objc_msgSend(v6, "isInteractive"))
    && (v8 = objc_msgSend(v5, "type"), v8 == objc_msgSend(v6, "type")))
  {
    objc_msgSend(v5, "snappedPresentationProgress");
    objc_msgSend(v6, "snappedPresentationProgress");
    v9 = BSFloatEqualToFloat() ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

+ (id)fullyDismissedState
{
  if (fullyDismissedState_onceToken != -1)
    dispatch_once(&fullyDismissedState_onceToken, &__block_literal_global_10);
  return (id)fullyDismissedState_transitionState;
}

void __49__CCUIOverlayTransitionState_fullyDismissedState__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CCUIOverlayTransitionState stateWithType:interactive:progress:](CCUIOverlayTransitionState, "stateWithType:interactive:progress:", 2, 0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fullyDismissedState_transitionState;
  fullyDismissedState_transitionState = v0;

}

+ (id)fullyPresentedState
{
  if (fullyPresentedState_onceToken != -1)
    dispatch_once(&fullyPresentedState_onceToken, &__block_literal_global_9_0);
  return (id)fullyPresentedState_transitionState;
}

void __49__CCUIOverlayTransitionState_fullyPresentedState__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CCUIOverlayTransitionState stateWithType:interactive:progress:](CCUIOverlayTransitionState, "stateWithType:interactive:progress:", 1, 0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fullyPresentedState_transitionState;
  fullyPresentedState_transitionState = v0;

}

+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5
{
  return (CCUIOverlayTransitionState *)objc_msgSend(a1, "stateWithType:interactive:progress:pagingProgress:", a3, a4, a5, 0.0);
}

+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6
{
  return (CCUIOverlayTransitionState *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithType:interactive:progress:pagingProgress:", a3, a4, a5, a6);
}

- (id)_initWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6
{
  id result;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CCUIOverlayTransitionState;
  result = -[CCUIOverlayTransitionState init](&v13, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = a3;
    *((_BYTE *)result + 8) = a4;
    *((double *)result + 3) = a5;
    *((double *)result + 4) = a6;
    v11 = 1.0 - a5;
    if (a3 != 2)
      v11 = a5;
    v12 = fmax(fmin(v11, 1.0), 0.0);
    *((double *)result + 5) = v11;
    *((double *)result + 6) = v12;
    *((double *)result + 7) = fmax(v11, 0.0);
    *((double *)result + 8) = floor(v12);
  }
  return result;
}

- (NSString)description
{
  return (NSString *)-[CCUIOverlayTransitionState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CCUIOverlayTransitionState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CCUIOverlayTransitionState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CCUIOverlayTransitionState *v11;

  v4 = a3;
  -[CCUIOverlayTransitionState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__CCUIOverlayTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8CFC540;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __68__CCUIOverlayTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  NSStringFromCCUIOverlayTransitionType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("type"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("progress"), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("pagingProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 32));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("interactive"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("presentationProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 40));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("clampedPresentationProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 48));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("nonZeroPresentationProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 56));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("snappedPresentationProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 64));
}

- (unint64_t)type
{
  return self->_type;
}

- (double)progress
{
  return self->_progress;
}

- (double)pagingProgress
{
  return self->_pagingProgress;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (double)clampedPresentationProgress
{
  return self->_clampedPresentationProgress;
}

- (double)nonZeroPresentationProgress
{
  return self->_nonZeroPresentationProgress;
}

- (double)snappedPresentationProgress
{
  return self->_snappedPresentationProgress;
}

@end
