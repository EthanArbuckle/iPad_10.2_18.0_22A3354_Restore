@implementation AEAccessibilityServerBackedAssessmentStateReader

- (void)dealloc
{
  objc_super v3;

  -[AEAccessibilityServerBackedAssessmentStateReader endObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AEAccessibilityServerBackedAssessmentStateReader;
  -[AEAccessibilityServerBackedAssessmentStateReader dealloc](&v3, sel_dealloc);
}

- (void)endObserving
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v2 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (AEAccessibilityServerBackedAssessmentStateReader)initWithAccessibilityServerPrimitives:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  AEAccessibilityServerBackedAssessmentStateReader *v9;
  AEAccessibilityServerBackedAssessmentStateReader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AEAccessibilityServerBackedAssessmentStateReader;
  v9 = -[AEAccessibilityServerBackedAssessmentStateReader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessibilityServerPrimitives, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }
  -[AEAccessibilityServerBackedAssessmentStateReader beginObserving]((id *)&v10->super.isa);
  -[AEAccessibilityServerBackedAssessmentStateReader updateForLatestAssessmentState]((id *)&v10->super.isa);

  return v10;
}

- (void)beginObserving
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = val[2];
    v3 = val[3];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__AEAccessibilityServerBackedAssessmentStateReader_beginObserving__block_invoke;
    v6[3] = &unk_24FA21A70;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v2, "observeGuidedAccessActiveStateChangeOnQueue:withHandler:", v3, v6);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = val[4];
    val[4] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)updateForLatestAssessmentState
{
  id *v1;
  int v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "isActive");
    result = (id *)objc_msgSend(v1[2], "isRestrictedForAAC");
    if (v2 != (_DWORD)result)
      return (id *)objc_msgSend(v1, "setActive:", result);
  }
  return result;
}

void __66__AEAccessibilityServerBackedAssessmentStateReader_beginObserving__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AEAccessibilityServerBackedAssessmentStateReader updateForLatestAssessmentState](WeakRetained);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidedAccessActiveStateChangeObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityServerPrimitives, 0);
}

@end
