@implementation SNKShotFeaturizationStreamCompletion

- (SNKShotFeaturizationStreamCompletion)init
{
  SNKShotFeaturizationStreamCompletion *result;

  SNKShotFeaturizationStreamCompletion.init()((uint64_t)self);
  return result;
}

- (MLMultiArray)exemplar
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  sub_1D42C1234((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return (MLMultiArray *)v8;
}

- (void)setExemplar:(id)a3
{
  id v4;
  SNKShotFeaturizationStreamCompletion *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C1298((uint64_t)v4);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  sub_1D42C3F88(self, (uint64_t (*)(void))sub_1D42C1324, &retstr->var0);
  return result;
}

- (void)setInferenceWindowSize:(id *)a3
{
  sub_1D42C1388(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- (void).cxx_destruct
{
  sub_1D42CB61C((uint64_t)self, OBJC_IVAR___SNKShotFeaturizationStreamCompletion_impl);
}

@end
