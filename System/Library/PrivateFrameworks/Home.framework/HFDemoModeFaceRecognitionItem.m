@implementation HFDemoModeFaceRecognitionItem

+ (id)dateFormatter
{
  if (qword_1ED378688 != -1)
    dispatch_once(&qword_1ED378688, &__block_literal_global_65);
  return (id)_MergedGlobals_1;
}

uint64_t __46__HFDemoModeFaceRecognitionItem_dateFormatter__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "relativeDateFormatter");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v1;

  return objc_msgSend((id)_MergedGlobals_1, "setTimeStyle:", 0);
}

- (HFDemoModeFaceRecognitionItem)initWithRecentsData:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HFDemoModeFaceRecognitionItem *v9;
  HFDemoModeFaceRecognitionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFDemoModeFaceRecognitionItem;
  v9 = -[HFDemoModeFaceRecognitionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_demoRecentsEntry, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (HFDemoModeFaceRecognitionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRecentsData_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDemoModeFaceRecognitionItem.m"), 50, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDemoModeFaceRecognitionItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFDemoModeFaceRecognitionItem *v4;
  void *v5;
  void *v6;
  HFDemoModeFaceRecognitionItem *v7;

  v4 = [HFDemoModeFaceRecognitionItem alloc];
  -[HFDemoModeFaceRecognitionItem demoRecentsEntry](self, "demoRecentsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeFaceRecognitionItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFDemoModeFaceRecognitionItem initWithRecentsData:home:](v4, "initWithRecentsData:home:", v5, v6);

  -[HFItem copyLatestResultsFromItem:](v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMPerson)person
{
  void *v2;
  void *v3;

  -[HFDemoModeFaceRecognitionItem demoRecentsEntry](self, "demoRecentsEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPerson *)v3;
}

- (HMPersonManager)personManager
{
  void *v3;
  void *v4;

  NSLog(CFSTR("Demo mode shouldn't really need a person manager"), a2);
  -[HFDemoModeFaceRecognitionItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPersonManager *)v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeFaceRecognitionItem demoRecentsEntry](self, "demoRecentsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceCrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(v6, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithData:", v8);

  if (v9)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HFPersonResultFaceCropImageKey"));
    objc_msgSend(v6, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("HFPersonResultFaceCropDateKey"));
      objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("HFResultCameraSignificantEventDateKey"));
      objc_msgSend((id)objc_opt_class(), "dateFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("description"));

    }
    v14 = (void *)MEMORY[0x1E0C99E60];
    -[HFDemoModeFaceRecognitionItem demoRecentsEntry](self, "demoRecentsEntry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "faceCrop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_setWithSafeObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("HFPersonResultFaceCropIdentifiersKey"));

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HFPersonResultIsHomeOriginatedKey"));
  -[HFDemoModeFaceRecognitionItem demoRecentsEntry](self, "demoRecentsEntry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "person");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v21, CFSTR("title"));

    objc_msgSend(v20, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v22, CFSTR("personIdentifier"));

  }
  v23 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "futureWithResult:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (HMHome)home
{
  return self->_home;
}

- (HFDemoModeFaceRecognitionRecentsData)demoRecentsEntry
{
  return self->_demoRecentsEntry;
}

- (void)setDemoRecentsEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoRecentsEntry, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
