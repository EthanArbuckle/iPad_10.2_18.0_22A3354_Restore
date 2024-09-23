@implementation FigHALAudioStreamGetClassID

uint64_t __FigHALAudioStreamGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = (_QWORD *)FigHALAudioDeviceGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigHALAudioStreamGetClassID_sFigHALAudioStreamClassDesc, ClassID, 0, &FigHALAudioStreamGetClassID_sFigHALAudioStreamClassID);
}

@end
