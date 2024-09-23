@implementation ATXPOICategoryVisitDuetEvent

- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6
{
  id v11;
  ATXPOICategoryVisitDuetEvent *v12;
  ATXPOICategoryVisitDuetEvent *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXPOICategoryVisitDuetEvent;
  v12 = -[ATXDuetEvent initWithStartDate:endDate:](&v15, sel_initWithStartDate_endDate_, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_possibleCategoryNames, a3);
    v13->_hasExited = a6;
  }

  return v13;
}

- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return -[ATXPOICategoryVisitDuetEvent initWithPossibleCategoryNames:startDate:endDate:hasExited:](self, "initWithPossibleCategoryNames:startDate:endDate:hasExited:", a3, a4, a5, 1);
}

- (ATXPOICategoryVisitDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  ATXPOICategoryVisitDuetEvent *v4;

  +[ATXPOICategoryVisitDuetDataProvider sharedInstance](ATXPOICategoryVisitDuetDataProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCurrentVisit");
  v4 = (ATXPOICategoryVisitDuetEvent *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXPOICategoryVisitDuetEvent *v4;
  ATXPOICategoryVisitDuetEvent *v5;
  BOOL v6;

  v4 = (ATXPOICategoryVisitDuetEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPOICategoryVisitDuetEvent isEqualToATXPOICategoryVisitDuetEvent:](self, "isEqualToATXPOICategoryVisitDuetEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXPOICategoryVisitDuetEvent:(id)a3
{
  id *v4;
  NSOrderedSet *possibleCategoryNames;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (id *)a3;
  possibleCategoryNames = self->_possibleCategoryNames;
  v6 = (NSOrderedSet *)v4[5];
  if (possibleCategoryNames == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = possibleCategoryNames;
    v9 = -[NSOrderedSet isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  -[ATXDuetEvent startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToDate:", v12))
  {
    -[ATXDuetEvent endDate](self, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "isEqualToDate:", v14);

  }
  else
  {
    v10 = 0;
  }

LABEL_9:
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPOICategoryVisitDuetEvent possibleCategoryNames](self, "possibleCategoryNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXPOICategoryVisitDuetEvent categories: %@, startDate: %@, endDate: %@ hasExited: %d"), v4, v5, v6, -[ATXPOICategoryVisitDuetEvent hasExited](self, "hasExited"));

  return v7;
}

- (id)identifier
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[ATXPOICategoryVisitDuetEvent possibleCategoryNames](self, "possibleCategoryNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[ATXPOICategoryVisitDuetEvent possibleCategoryNames](self, "possibleCategoryNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v7);

  }
  else
  {
    v8 = CFSTR("unknown");
  }
  return v8;
}

- (NSOrderedSet)possibleCategoryNames
{
  return self->_possibleCategoryNames;
}

- (BOOL)hasExited
{
  return self->_hasExited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleCategoryNames, 0);
}

@end
