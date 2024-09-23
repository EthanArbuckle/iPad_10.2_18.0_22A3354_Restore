@implementation _APSTopicMove

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setToListID:(unint64_t)a3
{
  self->_toListID = a3;
}

- (void)setFromListID:(unint64_t)a3
{
  self->_fromListID = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)toListID
{
  return self->_toListID;
}

- (unint64_t)fromListID
{
  return self->_fromListID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
