@implementation GDGraphTopicRelationship

- (GDGraphTopicRelationship)initWithTopicIdField:(id)a3 allTopicIdField:(id)a4
{
  id v7;
  id v8;
  GDGraphTopicRelationship *v9;
  GDGraphTopicRelationship *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphTopicRelationship;
  v9 = -[GDGraphTopicRelationship init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_topicId, a3);
    objc_storeStrong((id *)&v10->_allTopicId, a4);
  }

  return v10;
}

- (GDGraphEntityIdentifier)topicId
{
  return self->_topicId;
}

- (NSArray)allTopicId
{
  return self->_allTopicId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTopicId, 0);
  objc_storeStrong((id *)&self->_topicId, 0);
}

@end
