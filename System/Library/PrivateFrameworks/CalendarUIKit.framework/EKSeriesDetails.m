@implementation EKSeriesDetails

- (EKSeriesDetails)initWithMasterEvent:(id)a3 detachedEvents:(id)a4 exceptionDates:(id)a5
{
  id v9;
  id v10;
  id v11;
  EKSeriesDetails *v12;
  EKSeriesDetails *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKSeriesDetails;
  v12 = -[EKSeriesDetails init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_masterEvent, a3);
    objc_storeStrong((id *)&v13->_detachedEvents, a4);
    objc_storeStrong((id *)&v13->_exceptionDates, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[EKEvent copy](self->_masterEvent, "copy");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_detachedEvents, 1);
  v7 = (void *)objc_msgSend(v4, "initWithMasterEvent:detachedEvents:exceptionDates:", v5, v6, self->_exceptionDates);

  return v7;
}

- (EKSeriesDetails)initWithEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EKSeriesDetails *v8;

  objc_msgSend(a3, "masterEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKSeriesDetails initWithMasterEvent:detachedEvents:exceptionDates:](self, "initWithMasterEvent:detachedEvents:exceptionDates:", v4, v6, v7);

  return v8;
}

- (EKEvent)masterEvent
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMasterEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)detachedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetachedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)exceptionDates
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExceptionDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionDates, 0);
  objc_storeStrong((id *)&self->_detachedEvents, 0);
  objc_storeStrong((id *)&self->_masterEvent, 0);
}

@end
