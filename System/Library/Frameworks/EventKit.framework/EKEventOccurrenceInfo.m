@implementation EKEventOccurrenceInfo

- (EKEventOccurrenceInfo)initWithObjectID:(id)a3 date:(double)a4
{
  id v7;
  EKEventOccurrenceInfo *v8;
  EKEventOccurrenceInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKEventOccurrenceInfo;
  v8 = -[EKEventOccurrenceInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_objectID, a3);
    v9->_date = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)EKEventOccurrenceInfo;
  -[EKEventOccurrenceInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] rowID: [%d] date: [%f]"), v4, -[EKObjectID rowID](self->_objectID, "rowID"), *(_QWORD *)&self->_date);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (double)date
{
  return self->_date;
}

- (void)setDate:(double)a3
{
  self->_date = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
