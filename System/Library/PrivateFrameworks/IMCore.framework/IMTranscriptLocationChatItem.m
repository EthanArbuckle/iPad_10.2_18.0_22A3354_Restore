@implementation IMTranscriptLocationChatItem

- (IMMapURLLocationInfo)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_locationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end
