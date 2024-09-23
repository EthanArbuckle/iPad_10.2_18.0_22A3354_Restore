@implementation HFZoneBuilderItem

- (HFZoneBuilderItem)initWithZoneBuilder:(id)a3
{
  id v6;
  HFZoneBuilderItem *v7;
  HFZoneBuilderItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFZoneBuilderItem.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneBuilder"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFZoneBuilderItem;
  v7 = -[HFZoneBuilderItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_zoneBuilder, a3);

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFZoneBuilderItem zoneBuilder](self, "zoneBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFZoneBuilderItem zoneBuilder](self, "zoneBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  if (v6)
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("title"));
  }
  else
  {
    HFLocalizedStringWithFormat(CFSTR("HFZoneSuggestionNameFormat"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  }
  -[HFZoneBuilderItem zoneBuilder](self, "zoneBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("zoneBuilder"));

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, CFSTR("dependentHomeKitClasses"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HFZoneBuilder)zoneBuilder
{
  return self->_zoneBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneBuilder, 0);
}

@end
