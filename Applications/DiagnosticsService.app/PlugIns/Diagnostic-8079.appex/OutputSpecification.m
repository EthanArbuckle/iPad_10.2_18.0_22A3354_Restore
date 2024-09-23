@implementation OutputSpecification

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
