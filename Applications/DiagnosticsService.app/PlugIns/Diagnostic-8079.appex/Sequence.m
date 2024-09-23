@implementation Sequence

- (NSMutableArray)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_outputs, a3);
}

- (NSNumber)completedResultCount
{
  return self->_completedResultCount;
}

- (void)setCompletedResultCount:(id)a3
{
  objc_storeStrong((id *)&self->_completedResultCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedResultCount, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
}

@end
