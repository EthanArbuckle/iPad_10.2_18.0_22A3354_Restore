@implementation _NUIFlowArrangementDummyItem

+ (uint64_t)sharedDummyItem
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___NUIFlowArrangementDummyItem_sharedDummyItem__block_invoke;
  block[3] = &unk_1E57C68C8;
  block[4] = v0;
  if (+[_NUIFlowArrangementDummyItem sharedDummyItem]::onceToken != -1)
    dispatch_once(&+[_NUIFlowArrangementDummyItem sharedDummyItem]::onceToken, block);
  return +[_NUIFlowArrangementDummyItem sharedDummyItem]::sharedDummyItem;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  return 50.0;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  return 50.0;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  return 0.0;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  return 0.0;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 0;
}

@end
