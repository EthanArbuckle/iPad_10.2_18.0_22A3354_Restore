@implementation HUQuickControlContentCharacteristicWritingUpdateAdapter

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)initWithItemManager:(id)a3
{
  id v5;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *v6;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlContentCharacteristicWritingUpdateAdapter;
  v6 = -[HUQuickControlContentCharacteristicWritingUpdateAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemManager, a3);
    v7->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges = 1;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUQuickControlContentCharacteristicWritingUpdateAdapter queuedUpdate](self, "queuedUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancellationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContentCharacteristicWritingUpdateAdapter;
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter dealloc](&v5, sel_dealloc);
}

- (void)_executeQueuedUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUQuickControlContentCharacteristicWritingUpdateAdapter itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter queuedUpdate](self, "queuedUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "affectedCharacteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_itemsToUpdateForModifiedCharacteristics:includeSuppressedCharacteristics:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "updateResultsForItems:senderSelector:", v8, a2);

  -[HUQuickControlContentCharacteristicWritingUpdateAdapter setQueuedUpdate:](self, "setQueuedUpdate:", 0);
}

- (void)quickControlContentDidUpdateCharacteristicValueOverrides:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _HUQuickControlContentCharacteristicWriteQueuedUpdate *v9;
  _HUQuickControlContentCharacteristicWriteQueuedUpdate *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v4 = a3;
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter forwardingCharacteristicWritingDelegate](self, "forwardingCharacteristicWritingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickControlContentDidUpdateCharacteristicValueOverrides:", v4);

  if (-[HUQuickControlContentCharacteristicWritingUpdateAdapter shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges](self, "shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges"))
  {
    -[HUQuickControlContentCharacteristicWritingUpdateAdapter queuedUpdate](self, "queuedUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __116__HUQuickControlContentCharacteristicWritingUpdateAdapter_quickControlContentDidUpdateCharacteristicValueOverrides___block_invoke;
      v17 = &unk_1E6F4DD08;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "afterDelay:performBlock:", &v14, 0.05);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [_HUQuickControlContentCharacteristicWriteQueuedUpdate alloc];
      v10 = -[_HUQuickControlContentCharacteristicWriteQueuedUpdate initWithCancellationToken:](v9, "initWithCancellationToken:", v8, v14, v15, v16, v17);
      -[HUQuickControlContentCharacteristicWritingUpdateAdapter setQueuedUpdate:](self, "setQueuedUpdate:", v10);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    -[HUQuickControlContentCharacteristicWritingUpdateAdapter queuedUpdate](self, "queuedUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "affectedCharacteristics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "affectedCharacteristics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionSet:", v13);

  }
}

void __116__HUQuickControlContentCharacteristicWritingUpdateAdapter_quickControlContentDidUpdateCharacteristicValueOverrides___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_executeQueuedUpdate");

}

- (void)quickControlContent:(id)a3 willBeginPossibleWritesForCharacteristics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter forwardingCharacteristicWritingDelegate](self, "forwardingCharacteristicWritingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickControlContent:willBeginPossibleWritesForCharacteristics:", v7, v6);

  -[HUQuickControlContentCharacteristicWritingUpdateAdapter itemManager](self, "itemManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter _characteristicUpdateSuppressionReasonForContent:](self, "_characteristicUpdateSuppressionReasonForContent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "beginSuppressingUpdatesForCharacteristics:withReason:", v6, v9);
}

- (void)quickControlContent:(id)a3 didEndPossibleWritesForCharacteristics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter forwardingCharacteristicWritingDelegate](self, "forwardingCharacteristicWritingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickControlContent:didEndPossibleWritesForCharacteristics:", v7, v6);

  -[HUQuickControlContentCharacteristicWritingUpdateAdapter itemManager](self, "itemManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContentCharacteristicWritingUpdateAdapter _characteristicUpdateSuppressionReasonForContent:](self, "_characteristicUpdateSuppressionReasonForContent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "endSuppressingUpdatesForCharacteristicsWithReason:updateAffectedItems:", v9, 0);
}

- (id)_characteristicUpdateSuppressionReasonForContent:(id)a3
{
  return (id)objc_msgSend(CFSTR("QuickControlUserInteraction"), "stringByAppendingFormat:", CFSTR("-%p"), a3);
}

- (HUQuickControlContentCharacteristicWritingDelegate)forwardingCharacteristicWritingDelegate
{
  return (HUQuickControlContentCharacteristicWritingDelegate *)objc_loadWeakRetained((id *)&self->_forwardingCharacteristicWritingDelegate);
}

- (void)setForwardingCharacteristicWritingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forwardingCharacteristicWritingDelegate, a3);
}

- (BOOL)shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges
{
  return self->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges;
}

- (void)setShouldIssueItemUpdatesOnCharacteristicOverrideValueChanges:(BOOL)a3
{
  self->_shouldIssueItemUpdatesOnCharacteristicOverrideValueChanges = a3;
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (_HUQuickControlContentCharacteristicWriteQueuedUpdate)queuedUpdate
{
  return self->_queuedUpdate;
}

- (void)setQueuedUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_queuedUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedUpdate, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_destroyWeak((id *)&self->_forwardingCharacteristicWritingDelegate);
}

@end
