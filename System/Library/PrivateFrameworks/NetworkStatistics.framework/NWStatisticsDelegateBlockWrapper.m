@implementation NWStatisticsDelegateBlockWrapper

- (void)sourceDidReceiveCounts:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v5)[2](v5, v10, 0);
LABEL_5:

    v7 = v10;
    goto LABEL_6;
  }
  -[NWStatisticsDelegateBlockWrapper countsBlock](self, "countsBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v6)
  {
    objc_msgSend(v10, "currentSnapshot");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traditionalDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsDelegateBlockWrapper countsBlock](self, "countsBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v8);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)sourceDidReceiveDescription:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v5)[2](v5, v10, 1);
LABEL_5:

    v7 = v10;
    goto LABEL_6;
  }
  -[NWStatisticsDelegateBlockWrapper descriptionBlock](self, "descriptionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v6)
  {
    objc_msgSend(v10, "currentSnapshot");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traditionalDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsDelegateBlockWrapper descriptionBlock](self, "descriptionBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v8);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)eventsBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)statisticsManager:(id)a3 didAddSource:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[NWStatisticsDelegateBlockWrapper addedBlock](self, "addedBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NWStatisticsDelegateBlockWrapper addedBlock](self, "addedBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)statisticsManager:(id)a3 didRemoveSource:(id)a4
{
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventsBlock");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v11, 2);
    }
    else
    {
      objc_msgSend(v6, "removedBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        (*(void (**)(uint64_t))(v9 + 16))(v9);

    }
    objc_msgSend(v11, "setDelegate:", 0);

  }
}

- (id)addedBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAddedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)countsBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCountsBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)descriptionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDescriptionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)removedBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRemovedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setEventsBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventsBlock, 0);
  objc_storeStrong(&self->_removedBlock, 0);
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_countsBlock, 0);
  objc_storeStrong(&self->_addedBlock, 0);
}

@end
