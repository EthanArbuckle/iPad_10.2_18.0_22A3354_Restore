@implementation SNKShotSegmentationRequest

- (SNKShotSegmentationRequest)init
{
  return (SNKShotSegmentationRequest *)SNKShotSegmentationRequest.init()();
}

- (NSArray)fileURLs
{
  void *v2;

  sub_1D42C3B30();
  sub_1D4519BC4();
  v2 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setFileURLs:(id)a3
{
  sub_1D42C3B68(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

- (float)backgroundEnergyPercentile
{
  SNKShotSegmentationRequest *v2;
  float v3;
  float v4;

  v2 = self;
  sub_1D42C3CA0();
  v4 = v3;

  return v4;
}

- (void)setBackgroundEnergyPercentile:(float)a3
{
  sub_1D42C3CE8(a3);
}

- (float)foregroundEnergyPercentile
{
  SNKShotSegmentationRequest *v2;
  float v3;
  float v4;

  v2 = self;
  sub_1D42C3D90();
  v4 = v3;

  return v4;
}

- (void)setForegroundEnergyPercentile:(float)a3
{
  sub_1D42C3DD8(a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hangoverDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  sub_1D42C3F88(self, (uint64_t (*)(void))sub_1D42C3E54, &retstr->var0);
  return result;
}

- (void)setHangoverDuration:(id *)a3
{
  sub_1D42C3EB4(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSegmentDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  sub_1D42C3F88(self, (uint64_t (*)(void))sub_1D42C3FD8, &retstr->var0);
  return result;
}

- (void)setMinSegmentDuration:(id *)a3
{
  sub_1D42C4038(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- (float)similarityThreshold
{
  SNKShotSegmentationRequest *v2;
  float v3;
  float v4;

  v2 = self;
  sub_1D42C4174();
  v4 = v3;

  return v4;
}

- (void)setSimilarityThreshold:(float)a3
{
  sub_1D42C41BC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
