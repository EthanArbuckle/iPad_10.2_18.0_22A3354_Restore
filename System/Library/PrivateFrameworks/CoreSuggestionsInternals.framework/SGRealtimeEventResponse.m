@implementation SGRealtimeEventResponse

- (SGRealtimeEventResponse)initWithEntity:(id)a3 state:(int)a4 duplicateEventKey:(id)a5 templateShortName:(id)a6
{
  id v11;
  id v12;
  id v13;
  SGRealtimeEventResponse *v14;
  SGRealtimeEventResponse *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SGRealtimeEventResponse;
  v14 = -[SGRealtimeEventResponse init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entity, a3);
    v15->_state = a4;
    objc_storeStrong((id *)&v15->_duplicateEventKey, a5);
    objc_storeStrong((id *)&v15->_templateShortName, a6);
  }

  return v15;
}

- (id)initNewEventWithEntity:(id)a3
{
  id v4;
  void *v5;
  SGRealtimeEventResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "templateShortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGRealtimeEventResponse initWithEntity:state:duplicateEventKey:templateShortName:](self, "initWithEntity:state:duplicateEventKey:templateShortName:", v4, 1, 0, v5);

  return v6;
}

- (id)initDuplicateOfCuratedEvent:(id)a3 withEntity:(id)a4
{
  return -[SGRealtimeEventResponse initWithEntity:state:duplicateEventKey:templateShortName:](self, "initWithEntity:state:duplicateEventKey:templateShortName:", a4, 4, a3, 0);
}

- (id)initUpdatedEventWithEntity:(id)a3 curatedEventKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SGRealtimeEventResponse *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "templateShortName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGRealtimeEventResponse initWithEntity:state:duplicateEventKey:templateShortName:](self, "initWithEntity:state:duplicateEventKey:templateShortName:", v7, 2, v6, v8);

  return v9;
}

- (id)initCancellationOfCuratedEvent:(id)a3 templateShortName:(id)a4 entity:(id)a5
{
  return -[SGRealtimeEventResponse initWithEntity:state:duplicateEventKey:templateShortName:](self, "initWithEntity:state:duplicateEventKey:templateShortName:", a5, 3, a3, a4);
}

- (id)initExtractionExceptionWithEntity:(id)a3
{
  id v4;
  void *v5;
  SGRealtimeEventResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "templateShortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGRealtimeEventResponse initWithEntity:state:duplicateEventKey:templateShortName:](self, "initWithEntity:state:duplicateEventKey:templateShortName:", v4, 6, 0, v5);

  return v6;
}

- (int)state
{
  return self->_state;
}

- (SGEntity)entity
{
  return self->_entity;
}

- (SGCuratedEventKey)duplicateEventKey
{
  return self->_duplicateEventKey;
}

- (NSString)templateShortName
{
  return self->_templateShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateShortName, 0);
  objc_storeStrong((id *)&self->_duplicateEventKey, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
