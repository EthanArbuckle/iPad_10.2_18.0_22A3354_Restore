@implementation SNMovieRemixFinalResult

- (unsigned)algorithmVersion
{
  return SNMovieRemixFinalResult.algorithmVersion.getter();
}

- (void)setAlgorithmVersion:(unsigned int)a3
{
  SNMovieRemixFinalResult.algorithmVersion.setter(*(uint64_t *)&a3);
}

- (float)dialogueGain
{
  return SNMovieRemixFinalResult.dialogueGain.getter();
}

- (void)setDialogueGain:(float)a3
{
  SNMovieRemixFinalResult.dialogueGain.setter(a3);
}

- (float)ambienceGain
{
  return SNMovieRemixFinalResult.ambienceGain.getter();
}

- (void)setAmbienceGain:(float)a3
{
  SNMovieRemixFinalResult.ambienceGain.setter(a3);
}

- (float)dialogueLoudness
{
  return SNMovieRemixFinalResult.dialogueLoudness.getter();
}

- (void)setDialogueLoudness:(float)a3
{
  SNMovieRemixFinalResult.dialogueLoudness.setter(a3);
}

- (float)ambienceLoudness
{
  return SNMovieRemixFinalResult.ambienceLoudness.getter();
}

- (void)setAmbienceLoudness:(float)a3
{
  SNMovieRemixFinalResult.ambienceLoudness.setter(a3);
}

- (float)recordingLoudness
{
  return SNMovieRemixFinalResult.recordingLoudness.getter();
}

- (void)setRecordingLoudness:(float)a3
{
  SNMovieRemixFinalResult.recordingLoudness.setter(a3);
}

- (NSArray)dspParameters
{
  SNMovieRemixFinalResult *v2;
  void *v3;

  v2 = self;
  SNMovieRemixFinalResult.dspParameters.getter();

  type metadata accessor for SNMovieRemixDSPParameter();
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (SNMovieRemixFinalResult)init
{
  SNMovieRemixFinalResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
