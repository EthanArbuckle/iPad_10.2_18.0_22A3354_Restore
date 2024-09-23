@implementation APSStatsHistogramGetTypeID

uint64_t __APSStatsHistogramGetTypeID_block_invoke()
{
  uint64_t result;

  APSStatsHistogramGetTypeID_histogramClass = 0;
  *(_QWORD *)algn_1ED52E458 = "APSStatsHistogram";
  qword_1ED52E460 = 0;
  unk_1ED52E468 = 0;
  qword_1ED52E470 = (uint64_t)hist_finalize;
  unk_1ED52E478 = 0;
  qword_1ED52E480 = 0;
  unk_1ED52E488 = 0;
  qword_1ED52E490 = (uint64_t)hist_copyDebugDescription;
  result = _CFRuntimeRegisterClass();
  APSStatsHistogramGetTypeID_typeID = result;
  return result;
}

@end
