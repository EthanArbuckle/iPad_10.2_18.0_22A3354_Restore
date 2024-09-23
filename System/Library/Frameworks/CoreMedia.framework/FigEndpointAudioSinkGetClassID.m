@implementation FigEndpointAudioSinkGetClassID

uint64_t __FigEndpointAudioSinkGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = CMBaseGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigEndpointAudioSinkGetClassID_sClassDesc, ClassID, 1, &FigEndpointAudioSinkGetClassID_sClassID);
}

@end
