@implementation VTFigAudioSessionInitialize

uint64_t __VTFigAudioSessionInitialize_block_invoke(uint64_t result)
{
  _QWORD *v1;
  __int128 v2;
  __int128 v3;

  v1 = *(_QWORD **)(result + 32);
  if (!*v1 || !v1[1] || !v1[2] || !v1[3] || !v1[4])
    return FigSignalErrorAt();
  v2 = *(_OWORD *)v1;
  v3 = *((_OWORD *)v1 + 1);
  qword_1EE285358 = v1[4];
  *(_OWORD *)&sFigAudioSessionFunctions = v2;
  *(_OWORD *)&off_1EE285348 = v3;
  kVTFigAudioSessionNotification_ApplicationStateDidChange = *((_QWORD *)&v3 + 1);
  kVTFigAudioSessionNotification_Interruption = qword_1EE285358;
  sFigAudioSessionFunctionsHasBeenSet = 1;
  return result;
}

@end
