@implementation FigHALAudioObjectGetClassID

uint64_t __FigHALAudioObjectGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = CMBaseGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigHALAudioObjectGetClassID_sFigHALAudioObjectClassDesc, ClassID, 1, &FigHALAudioObjectGetClassID_sFigHALAudioObjectClassID);
}

@end
