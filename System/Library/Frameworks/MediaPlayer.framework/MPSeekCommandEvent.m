@implementation MPSeekCommandEvent

- (MPSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  MPSeekCommandEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSeekCommandEvent;
  result = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v7, sel_initWithCommand_mediaRemoteType_options_, a3, *(_QWORD *)&a4, a5);
  if (result)
  {
    result->_commandType = a4;
    result->_type = (a4 & 0xFFFFFFFD) != 8;
  }
  return result;
}

- (unsigned)mediaRemoteCommandType
{
  return self->_commandType;
}

- (MPSeekCommandEventType)type
{
  return self->_type;
}

@end
