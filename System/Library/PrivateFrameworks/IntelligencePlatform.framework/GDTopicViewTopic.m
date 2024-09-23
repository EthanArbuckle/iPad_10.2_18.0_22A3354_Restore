@implementation GDTopicViewTopic

- (GDTopicViewTopic)initWithTopicIdentifier:(id)a3 topicScore:(double)a4 mostRecentDocumentId:(id)a5
{
  id v9;
  id v10;
  GDTopicViewTopic *v11;
  GDTopicViewTopic *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GDTopicViewTopic;
  v11 = -[GDTopicViewTopic init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topicIdentifier, a3);
    v12->_topicScore = a4;
    objc_storeStrong((id *)&v12->_mostRecentDocumentId, a5);
  }

  return v12;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (double)topicScore
{
  return self->_topicScore;
}

- (NSString)mostRecentDocumentId
{
  return self->_mostRecentDocumentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDocumentId, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
}

@end
