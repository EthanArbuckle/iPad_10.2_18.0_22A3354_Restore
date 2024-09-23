@implementation MPSpecialSeekCommandEvent

- (MPSpecialSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  MPSpecialSeekCommandEvent *result;
  unint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPSpecialSeekCommandEvent;
  result = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v8, sel_initWithCommand_mediaRemoteType_options_, a3, *(_QWORD *)&a4, a5);
  if (result)
  {
    if (a4 - 100 > 5)
      v7 = 0;
    else
      v7 = qword_193F09A40[a4 - 100];
    result->_type = v7;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

@end
