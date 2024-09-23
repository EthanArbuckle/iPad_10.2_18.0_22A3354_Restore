@implementation GDGraphEventRelationship

- (GDGraphEventRelationship)initWithEventIdField:(id)a3 allEventIdField:(id)a4
{
  id v7;
  id v8;
  GDGraphEventRelationship *v9;
  GDGraphEventRelationship *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphEventRelationship;
  v9 = -[GDGraphEventRelationship init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventId, a3);
    objc_storeStrong((id *)&v10->_allEventId, a4);
  }

  return v10;
}

- (GDGraphEntityIdentifier)eventId
{
  return self->_eventId;
}

- (NSArray)allEventId
{
  return self->_allEventId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEventId, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
}

@end
