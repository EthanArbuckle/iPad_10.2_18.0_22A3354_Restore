@implementation FigHALAudioDeviceGetClassID

uint64_t __FigHALAudioDeviceGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = (_QWORD *)FigHALAudioObjectGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigHALAudioDeviceGetClassID_sFigHALAudioDeviceClassDesc, ClassID, 0, &FigHALAudioDeviceGetClassID_sFigHALAudioDeviceClassID);
}

@end
