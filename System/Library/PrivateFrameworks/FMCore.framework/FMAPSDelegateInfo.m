@implementation FMAPSDelegateInfo

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (FMAPSDelegate)delegate
{
  return (FMAPSDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
