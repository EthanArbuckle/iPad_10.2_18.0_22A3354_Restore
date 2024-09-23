@implementation APReceiverStatsCollectorGetTypeID

uint64_t __APReceiverStatsCollectorGetTypeID_block_invoke()
{
  uint64_t result;

  APReceiverStatsCollectorGetTypeID_statsCollectorClass = 0;
  *(_QWORD *)algn_2553CE6A8 = "APReceiverStatsCollector";
  qword_2553CE6B0 = (uint64_t)aprstats_Init;
  unk_2553CE6B8 = 0;
  qword_2553CE6C0 = (uint64_t)aprstats_Finalize;
  unk_2553CE6C8 = 0;
  qword_2553CE6D0 = 0;
  unk_2553CE6D8 = 0;
  qword_2553CE6E0 = (uint64_t)aprstats_CopyDebugDescription;
  result = _CFRuntimeRegisterClass();
  APReceiverStatsCollectorGetTypeID_typeID = result;
  return result;
}

@end
