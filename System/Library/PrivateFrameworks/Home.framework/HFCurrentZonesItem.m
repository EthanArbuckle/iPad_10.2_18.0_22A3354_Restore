@implementation HFCurrentZonesItem

- (HFCurrentZonesItem)initWithRoom:(id)a3
{
  id v5;
  HFCurrentZonesItem *v6;
  HFCurrentZonesItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCurrentZonesItem;
  v6 = -[HFCurrentZonesItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_room, a3);

  return v7;
}

- (HFCurrentZonesItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoom_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCurrentZonesItem.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCurrentZonesItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCurrentZonesItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_allZones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_74);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneModuleCurrentZonesSingularTitle"), CFSTR("HFZoneModuleCurrentZonesSingularTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("title"));

    v15 = CFSTR("HFZoneModuleCurrentZonesNone");
LABEL_9:
    _HFLocalizedStringWithDefaultValue(v15, v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("description"));
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneModuleCurrentZonesPluralTitle"), CFSTR("HFZoneModuleCurrentZonesPluralTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

    v15 = CFSTR("HFZoneModuleCurrentZonesMultipleZonesDescription");
    goto LABEL_9;
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneModuleCurrentZonesSingularTitle"), CFSTR("HFZoneModuleCurrentZonesSingularTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("title"));

  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1EA741FF8;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("description"));

LABEL_10:
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("dependentHomeKitClasses"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("HFCurrentZonesResultKey"));
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v18);

  return v4;
}

uint64_t __50__HFCurrentZonesItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
}

@end
