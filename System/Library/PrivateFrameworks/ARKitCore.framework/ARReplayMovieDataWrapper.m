@implementation ARReplayMovieDataWrapper

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong(&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
}

@end
