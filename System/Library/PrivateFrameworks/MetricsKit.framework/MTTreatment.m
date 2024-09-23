@implementation MTTreatment

+ (MTTreatment)treatmentWithConfigData:(id)a3
{
  id v3;
  id v4;
  id v5;
  MTTreatment *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (treatmentWithConfigData__onceToken != -1)
      dispatch_once(&treatmentWithConfigData__onceToken, &__block_literal_global_8);
    v5 = (id)treatmentWithConfigData__treatmentCache;
    objc_sync_enter(v5);
    objc_msgSend((id)treatmentWithConfigData__treatmentCache, "objectForKeyedSubscript:", v4);
    v6 = (MTTreatment *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[MTTreatment initWithConfigDictionary:]([MTTreatment alloc], "initWithConfigDictionary:", v4);
      objc_msgSend((id)treatmentWithConfigData__treatmentCache, "setObject:forKeyedSubscript:", v6, v4);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __39__MTTreatment_treatmentWithConfigData___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)treatmentWithConfigData__treatmentCache;
  treatmentWithConfigData__treatmentCache = v0;

}

- (MTTreatment)initWithConfigDictionary:(id)a3
{
  id v4;
  MTTreatment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTTreatment;
  v5 = -[MTTreatment init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTMetricsDataPredicate predicateWithConfigData:](MTMetricsDataPredicate, "predicateWithConfigData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTreatment setPredicate:](v5, "setPredicate:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventActions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTTreatmentAction treatmentActionWithField:configData:](MTTreatmentAction, "treatmentActionWithField:configData:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTreatment setEventAction:](v5, "setEventAction:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fieldActions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __40__MTTreatment_initWithConfigDictionary___block_invoke;
      v15[3] = &unk_24C79FEF8;
      v16 = v11;
      v12 = v11;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = (void *)objc_msgSend(v12, "copy");
      -[MTTreatment setFieldActions:](v5, "setFieldActions:", v13);

    }
  }

  return v5;
}

void __40__MTTreatment_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[MTTreatmentAction treatmentActionWithField:configData:](MTTreatmentAction, "treatmentActionWithField:configData:", v5, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)performTreatment:(id)a3
{
  id v4;
  MTTreatmentContext *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MTTreatmentContext *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  MTTreatmentContext *v22;
  _QWORD v23[4];
  MTTreatmentContext *v24;

  v4 = a3;
  v5 = -[MTTreatmentContext initWithTreatment:metrics:]([MTTreatmentContext alloc], "initWithTreatment:metrics:", self, v4);
  -[MTTreatment predicate](self, "predicate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[MTTreatment predicate](self, "predicate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "evaluateWithMetricsData:", v4),
        v8,
        v7,
        v9))
  {
    -[MTTreatment eventAction](self, "eventAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MTTreatment eventAction](self, "eventAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performActionWithContext:", v5);

    }
    -[MTTreatment fieldActions](self, "fieldActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __32__MTTreatment_performTreatment___block_invoke;
    v23[3] = &unk_24C7A0ED0;
    v14 = v5;
    v24 = v14;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v23);

    -[MTTreatment fieldActions](self, "fieldActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    v19 = 3221225472;
    v20 = __32__MTTreatment_performTreatment___block_invoke_2;
    v21 = &unk_24C7A0ED0;
    v22 = v14;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v18);

  }
  -[MTTreatmentContext metrics](v5, "metrics", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __32__MTTreatment_performTreatment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "sourceField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "performActionWithContext:", *(_QWORD *)(a1 + 32));

}

void __32__MTTreatment_performTreatment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "sourceField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v5, "performActionWithContext:", *(_QWORD *)(a1 + 32));

}

- (MTMetricsDataPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (MTTreatmentAction)eventAction
{
  return self->_eventAction;
}

- (void)setEventAction:(id)a3
{
  objc_storeStrong((id *)&self->_eventAction, a3);
}

- (NSDictionary)fieldActions
{
  return self->_fieldActions;
}

- (void)setFieldActions:(id)a3
{
  objc_storeStrong((id *)&self->_fieldActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldActions, 0);
  objc_storeStrong((id *)&self->_eventAction, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
