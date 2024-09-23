@implementation SNKShotFeaturizationResult

- (SNKShotFeaturizationResult)init
{
  SNKShotFeaturizationResult *result;

  SNKShotFeaturizationResult.init()((uint64_t)self);
  return result;
}

- (NSArray)trainingDataEmbeddings
{
  return (NSArray *)sub_1D42C25A4(self, (uint64_t)a2, (void (*)(void))sub_1D42C23C4, (unint64_t *)&unk_1EFE49790);
}

- (void)setTrainingDataEmbeddings:(id)a3
{
  sub_1D42C26C0(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&unk_1EFE49790);
}

- (NSArray)trainingDataLabels
{
  return (NSArray *)sub_1D42C25A4(self, (uint64_t)a2, (void (*)(void))sub_1D42C2604, (unint64_t *)&qword_1EFE404B0);
}

- (void)setTrainingDataLabels:(id)a3
{
  sub_1D42C26C0(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1EFE404B0);
}

- (NSArray)validationDataEmbeddings
{
  return (NSArray *)sub_1D42C25A4(self, (uint64_t)a2, (void (*)(void))sub_1D42C2850, (unint64_t *)&unk_1EFE49790);
}

- (void)setValidationDataEmbeddings:(id)a3
{
  sub_1D42C26C0(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&unk_1EFE49790);
}

- (NSArray)validationDataLabels
{
  return (NSArray *)sub_1D42C25A4(self, (uint64_t)a2, (void (*)(void))sub_1D42C2A34, (unint64_t *)&qword_1EFE404B0);
}

- (void)setValidationDataLabels:(id)a3
{
  sub_1D42C26C0(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1EFE404B0);
}

- (MLMultiArray)exemplar
{
  SNKShotFeaturizationResult *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  v10 = (void *)sub_1D42C2C48((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  return (MLMultiArray *)v10;
}

- (void)setExemplar:(id)a3
{
  id v4;
  SNKShotFeaturizationResult *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C2CDC((uint64_t)v4);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  sub_1D42C3F88(self, (uint64_t (*)(void))sub_1D42C2D60, &retstr->var0);
  return result;
}

- (void)setInferenceWindowSize:(id *)a3
{
  sub_1D42C2DF4(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- (void).cxx_destruct
{

  sub_1D42CB208();
  sub_1D42CB0C4();
  sub_1D42B7204();
  sub_1D42CB514();
}

@end
