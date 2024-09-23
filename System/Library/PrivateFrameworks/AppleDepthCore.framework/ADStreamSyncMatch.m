@implementation ADStreamSyncMatch

- (id)matchedObjectsForStream:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_matchedStreams, "objectAtIndexedSubscript:", a3);
}

- (NSMutableArray)matchedStreams
{
  return self->_matchedStreams;
}

- (void)setMatchedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_matchedStreams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedStreams, 0);
}

@end
