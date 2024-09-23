@implementation HFDataAnalyticsLogItem

- (HFDataAnalyticsLogItem)initWithMediaProfileContainer:(id)a3 name:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HFDataAnalyticsLogItem *v11;
  HFDataAnalyticsLogItem *v12;
  uint64_t v13;
  NSString *name;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItem.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HFDataAnalyticsLogItem;
  v11 = -[HFDataAnalyticsLogItem init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a3);
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

  }
  return v12;
}

- (HFDataAnalyticsLogItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_name_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItem.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDataAnalyticsLogItem init]",
    v5);

  return 0;
}

- (id)fetchLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFDataAnalyticsLogItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDataAnalyticsLogItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_fetchLog:timeout:", v4, *(double *)&kHFDataAnalyticsFetchLogTimeout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flatMap:", &__block_literal_global_230);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __34__HFDataAnalyticsLogItem_fetchLog__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("metriclog")))
  {

LABEL_4:
    setupAWDConnection();
    createDescriptionForMetriclogFile();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    teardownAWDConnection();
    goto LABEL_5;
  }
  objc_msgSend(v2, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("metriclog.anon"));

  if (v5)
    goto LABEL_4;
  objc_msgSend(v2, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("plist"));

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v2, 4, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;
    if (v17)
    {
      v9 = v17;
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_5:
  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v6, v10);
  objc_msgSend(v7, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HFDataAnalyticsLogItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1EA729F60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __54__HFDataAnalyticsLogItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(WeakRetained, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_dependentHomeKitObjectsForDownstreamItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isDisplayDisabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("isDisabled"));

  objc_msgSend(v3, "finishWithResult:", v4);
}

- (BOOL)isDisplayDisabled
{
  void *v2;
  void *v3;
  void *v4;

  -[HFDataAnalyticsLogItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v4, "isControllable") ^ 1;

  }
  return (char)v3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_7 != -1)
    dispatch_once(&_MergedGlobals_2_7, &__block_literal_global_31_11);
  return (NAIdentity *)(id)qword_1ED378A58;
}

void __37__HFDataAnalyticsLogItem_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_34_9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_35_7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378A58;
  qword_1ED378A58 = v2;

}

id __37__HFDataAnalyticsLogItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __37__HFDataAnalyticsLogItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
