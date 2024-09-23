@implementation MOEffectivePublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

- (MOEffectivePublisher)initWithInterestedGroups:(id)a3
{
  id v4;
  MOEffectivePublisher *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  MOSettingsPublisherBase *v11;
  MOSettingsPublisherBase *base;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MOEffectivePublisher;
  v5 = -[MOPublisher initPublisher](&v16, sel_initPublisher);
  if (objc_msgSend(v4, "count"))
  {
    +[MOSubscriptionCenter sharedCenter](MOSubscriptionCenter, "sharedCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveSubject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v4, "copy");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke;
    v14[3] = &unk_1E675E218;
    v15 = v8;
    v9 = v8;
    v10 = (void *)MEMORY[0x1B5E3442C](v14);
    v11 = -[MOSettingsPublisherBase initWithUpstream:interestedGroups:startBlock:stopBlock:]([MOSettingsPublisherBase alloc], "initWithUpstream:interestedGroups:startBlock:stopBlock:", v7, v9, v10, &__block_literal_global);
    base = v5->_base;
    v5->_base = v11;

  }
  return v5;
}

void __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  +[MOSubscriptionCenter sharedCenter](MOSubscriptionCenter, "sharedCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribeForEffectiveChanges:identifier:", *(_QWORD *)(a1 + 32), v3);

}

- (id)sinkWithReceiveInput:(id)a3
{
  id v4;
  MOSink *v5;

  v4 = a3;
  v5 = -[MOSink initWithCompletion:receiveInput:]([MOSink alloc], "initWithCompletion:receiveInput:", &__block_literal_global_86, v4);

  -[MOEffectivePublisher subscribe:](self, "subscribe:", v5);
  return v5;
}

- (void)subscribe:(id)a3
{
  -[MOSettingsPublisherBase subscribe:](self->_base, "subscribe:", a3);
}

void __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[MOSubscriptionCenter sharedCenter](MOSubscriptionCenter, "sharedCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsubscribeFromEffectiveChanges:", v2);

}

- (MOSettingsPublisherBase)base
{
  return self->_base;
}

@end
