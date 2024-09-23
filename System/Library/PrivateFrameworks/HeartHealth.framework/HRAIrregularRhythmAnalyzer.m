@implementation HRAIrregularRhythmAnalyzer

- (HRAIrregularRhythmAnalyzer)initWithIrregularRhythmVersion:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HRAIrregularRhythmAnalyzer;
  return -[HRAIrregularRhythmAnalyzer init](&v4, sel_init, a3);
}

- (id)processTachograms:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHRMockHeartRhythmAlgorithms.m"), 25, CFSTR("This stub implementation should never be called"));

  return 0;
}

@end
