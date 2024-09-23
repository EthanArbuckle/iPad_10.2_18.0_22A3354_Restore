@implementation FigHALAudioDeviceBrokerGetClassID

uint64_t __FigHALAudioDeviceBrokerGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = CMBaseGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigHALAudioDeviceBrokerGetClassID_sFigHALAudioDeviceBrokerClassDesc, ClassID, 1, &FigHALAudioDeviceBrokerGetClassID_sFigHALAudioDeviceBrokerClassID);
}

@end
