@implementation GDGraphTopic

- (GDGraphTopic)initWithEntityIdentifierField:(id)a3 qidField:(id)a4 allQidField:(id)a5
{
  id v9;
  id v10;
  id v11;
  GDGraphTopic *v12;
  GDGraphTopic *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDGraphTopic;
  v12 = -[GDGraphTopic init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_qid, a4);
    objc_storeStrong((id *)&v13->_allQid, a5);
  }

  return v13;
}

- (GDGraphTopicEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSArray)allQid
{
  return self->_allQid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQid, 0);
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
