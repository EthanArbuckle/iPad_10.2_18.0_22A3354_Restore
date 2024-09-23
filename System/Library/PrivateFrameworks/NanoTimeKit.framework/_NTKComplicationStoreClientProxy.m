@implementation _NTKComplicationStoreClientProxy

- (_NTKComplicationStoreClientProxy)initWithWeakProxy:(id)a3
{
  id v4;
  _NTKComplicationStoreClientProxy *v5;
  _NTKComplicationStoreClientProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKComplicationStoreClientProxy;
  v5 = -[_NTKComplicationStoreClientProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxy, v4);

  return v6;
}

- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5
{
  NTKComplicationStoreClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "loadFullCollectionWithLocalizableSampleTemplates:complicationDescriptors:seqId:", v10, v9, v8);

}

- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7
{
  NTKComplicationStoreClient **p_proxy;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "updateSampleTemplateReference:forClientIdentifier:descriptor:family:seqId:", v15, v14, v13, a6, v12);

}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5
{
  NTKComplicationStoreClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "updateComplicationDescriptors:forClientIdentifier:seqId:", v10, v9, v8);

}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5
{
  NTKComplicationStoreClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "removeComplicationSampleTemplatesForClientIdentifier:descriptor:seqId:", v10, v9, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
}

@end
