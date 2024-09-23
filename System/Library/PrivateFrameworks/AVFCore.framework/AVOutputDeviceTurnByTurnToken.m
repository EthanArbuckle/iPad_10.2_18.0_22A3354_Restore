@implementation AVOutputDeviceTurnByTurnToken

- (AVOutputDeviceTurnByTurnToken)initWithEndpoint:(OpaqueFigEndpoint *)a3
{
  AVOutputDeviceTurnByTurnToken *v4;
  AVOutputDeviceTurnByTurnToken *v5;
  OpaqueFigEndpoint *v6;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD);
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVOutputDeviceTurnByTurnToken;
  v4 = -[AVOutputDeviceTurnByTurnToken init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = (OpaqueFigEndpoint *)CFRetain(a3);
      v5->_endpoint = v6;
      if (v6)
      {
        CMBaseObject = FigEndpointGetCMBaseObject();
        v8 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v8)
          v8(CMBaseObject, *MEMORY[0x1E0CA44C0], *MEMORY[0x1E0C9AE50]);
      }
    }
    else
    {
      v4->_endpoint = 0;
    }
  }
  return v5;
}

- (AVOutputDeviceTurnByTurnToken)init
{
  return -[AVOutputDeviceTurnByTurnToken initWithEndpoint:](self, "initWithEndpoint:", 0);
}

- (void)dealloc
{
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD);
  OpaqueFigEndpoint *endpoint;
  objc_super v6;

  if (self->_endpoint)
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA44C0], *MEMORY[0x1E0C9AE40]);
    endpoint = self->_endpoint;
    if (endpoint)
      CFRelease(endpoint);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVOutputDeviceTurnByTurnToken;
  -[AVOutputDeviceTurnByTurnToken dealloc](&v6, sel_dealloc);
}

@end
