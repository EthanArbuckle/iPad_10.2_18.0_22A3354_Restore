@implementation ICNAWindowSceneEventReporter

- (ICNAWindowSceneEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4
{
  id v6;
  ICNAWindowSceneEventReporter *v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSString *windowSceneID;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICNAWindowSceneEventReporter;
  v7 = -[ICNAEventReporter initWithSubTrackerName:windowScene:](&v13, sel_initWithSubTrackerName_windowScene_, a3, v6);
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "areaOfWindowScene:", v6);
    v7->_previousArea = v8;
    objc_msgSend(v6, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    windowSceneID = v7->_windowSceneID;
    v7->_windowSceneID = (NSString *)v10;

  }
  return v7;
}

+ (double)areaOfWindowScene:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  return v5 * v7;
}

- (NSString)saltedInstrumentationID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateSessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ICNAWindowSceneEventReporter windowSceneID](self, "windowSceneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saltedID:forClass:", v7, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)startWindowSceneEventDurationTracking
{
  ICASWindowSceneData *v3;
  void *v4;
  ICASWindowSceneData *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  v3 = [ICASWindowSceneData alloc];
  -[ICNAWindowSceneEventReporter saltedInstrumentationID](self, "saltedInstrumentationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICASWindowSceneData initWithWindowSceneID:](v3, "initWithWindowSceneID:", v4);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 0, v8);

}

- (void)submitWindowSceneEvent
{
  ICASWindowSceneData *v3;
  void *v4;
  ICASWindowSceneData *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [ICASWindowSceneData alloc];
  -[ICNAWindowSceneEventReporter saltedInstrumentationID](self, "saltedInstrumentationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICASWindowSceneData initWithWindowSceneID:](v3, "initWithWindowSceneID:", v4);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 1, v8);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)submitWindowSceneResizeEventIfNecessaryWithWindowScene:(id)a3 forceSubmit:(BOOL)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ICASWindowSceneData *v15;
  void *v16;
  ICASWindowSceneData *v17;
  ICASWindowSceneResizeData *v18;
  void *v19;
  ICASWindowSceneResizeData *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "areaOfWindowScene:", v6);
  v8 = v7;
  if (a4 || (-[ICNAWindowSceneEventReporter previousArea](self, "previousArea"), vabdd_f64(v9, v8) > 0.00000011920929))
  {
    objc_msgSend(v6, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    v15 = [ICASWindowSceneData alloc];
    -[ICNAWindowSceneEventReporter saltedInstrumentationID](self, "saltedInstrumentationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ICASWindowSceneData initWithWindowSceneID:](v15, "initWithWindowSceneID:", v16);

    v18 = [ICASWindowSceneResizeData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", vabdd_f64(v12 * v14, v8) > 0.00000011920929);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICASWindowSceneResizeData initWithUsesMultiWindow:](v18, "initWithUsesMultiWindow:", v19);

    +[ICNAController sharedController](ICNAController, "sharedController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v25[0] = v17;
    v25[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter subTracker](self, "subTracker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "submitEventOfType:pushThenPopDataObjects:subTracker:", v22, v23, v24);

    -[ICNAWindowSceneEventReporter setPreviousArea:](self, "setPreviousArea:", v8);
  }

}

- (double)previousArea
{
  return self->_previousArea;
}

- (void)setPreviousArea:(double)a3
{
  self->_previousArea = a3;
}

- (NSString)windowSceneID
{
  return self->_windowSceneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneID, 0);
}

@end
