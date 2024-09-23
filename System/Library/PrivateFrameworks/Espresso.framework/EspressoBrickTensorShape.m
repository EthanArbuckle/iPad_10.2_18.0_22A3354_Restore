@implementation EspressoBrickTensorShape

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)channels
{
  return self->_channels;
}

- (void)setChannels:(int)a3
{
  self->_channels = a3;
}

- (int)batch
{
  return self->_batch;
}

- (void)setBatch:(int)a3
{
  self->_batch = a3;
}

- (int)sequence
{
  return self->_sequence;
}

- (void)setSequence:(int)a3
{
  self->_sequence = a3;
}

- (int)rank
{
  return self->_rank;
}

- (void)setRank:(int)a3
{
  self->_rank = a3;
}

@end
