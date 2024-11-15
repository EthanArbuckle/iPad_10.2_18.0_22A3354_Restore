@implementation AudioFileTestCase

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->_volume, a3);
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
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
