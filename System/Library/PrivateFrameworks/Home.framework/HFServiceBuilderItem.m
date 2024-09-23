@implementation HFServiceBuilderItem

- (HFServiceBuilderItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceBuilder_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceBuilderItem.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceBuilderItem init]",
    v5);

  return 0;
}

- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFServiceBuilderItem *v7;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceBuilderItem initWithServiceBuilder:valueSource:](self, "initWithServiceBuilder:valueSource:", v4, v6);

  return v7;
}

- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFServiceBuilderItem *v9;
  void *v10;
  uint64_t v11;
  HFServiceItem *serviceItem;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceBuilderItem;
  v9 = -[HFServiceBuilderItem init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    serviceItem = v9->_serviceItem;
    v9->_serviceItem = (HFServiceItem *)v11;

    objc_storeStrong((id *)&v9->_serviceBuilder, a3);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFServiceBuilderItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFServiceBuilderItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFServiceBuilderItem serviceBuilder](self, "serviceBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithServiceBuilder:valueSource:", v6, v4);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HFServiceBuilderItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA7289C8;
  v9[4] = self;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __52__HFServiceBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HFServiceNameComponents *v7;
  void *v8;
  void *v9;
  void *v10;
  HFServiceNameComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFMutableItemUpdateOutcome, "outcomeWithResults:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "serviceBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HFServiceNameComponents alloc];
  objc_msgSend(*(id *)(a1 + 32), "serviceBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v7, "initWithRawServiceName:rawRoomName:", v9, v10);

  if (v11)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("serviceNameComponents"));
    -[HFServiceNameComponents composedString](v11, "composedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceBuilder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("icon"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v2;
  void *v3;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFCharacteristicValueSource *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;
  void *v4;

  -[HFServiceBuilderItem serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromHomeKitObject:](HFNamingComponents, "namingComponentFromHomeKitObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFServiceBuilder)serviceBuilder
{
  return self->_serviceBuilder;
}

- (HFServiceItem)serviceItem
{
  return self->_serviceItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceItem, 0);
  objc_storeStrong((id *)&self->_serviceBuilder, 0);
}

@end
