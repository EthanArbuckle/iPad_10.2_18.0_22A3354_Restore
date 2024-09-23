@implementation FigHALAudioPluginGetClassID

uint64_t __FigHALAudioPluginGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = (_QWORD *)FigHALAudioObjectGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&FigHALAudioPluginGetClassID_sFigHALAudioPluginClassDesc, ClassID, 0, &FigHALAudioPluginGetClassID_sFigHALAudioPluginClassID);
}

@end
