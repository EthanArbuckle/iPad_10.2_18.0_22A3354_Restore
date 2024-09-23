@implementation AVExternalDeviceTurnByTurnToken

- (AVExternalDeviceTurnByTurnToken)initWithExternalDevice:(id)a3
{
  AVExternalDeviceTurnByTurnToken *v4;
  AVExternalDevice *v5;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVExternalDeviceTurnByTurnToken;
  v4 = -[AVExternalDeviceTurnByTurnToken init](&v9, sel_init);
  if (v4)
  {
    v5 = (AVExternalDevice *)a3;
    v4->_externalDevice = v5;
    if (-[AVExternalDevice figEndpoint](v5, "figEndpoint"))
    {
      CMBaseObject = FigEndpointGetCMBaseObject();
      v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v7)
        v7(CMBaseObject, *MEMORY[0x1E0CA44C0], *MEMORY[0x1E0C9AE50]);
    }
  }
  return v4;
}

- (AVExternalDeviceTurnByTurnToken)init
{
  return -[AVExternalDeviceTurnByTurnToken initWithExternalDevice:](self, "initWithExternalDevice:", 0);
}

- (void)dealloc
{
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD);
  objc_super v5;

  if (-[AVExternalDevice figEndpoint](self->_externalDevice, "figEndpoint"))
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA44C0], *MEMORY[0x1E0C9AE40]);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVExternalDeviceTurnByTurnToken;
  -[AVExternalDeviceTurnByTurnToken dealloc](&v5, sel_dealloc);
}

@end
