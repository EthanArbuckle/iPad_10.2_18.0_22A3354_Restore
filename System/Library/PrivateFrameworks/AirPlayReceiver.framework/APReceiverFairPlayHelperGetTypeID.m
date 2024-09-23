@implementation APReceiverFairPlayHelperGetTypeID

uint64_t __APReceiverFairPlayHelperGetTypeID_block_invoke()
{
  uint64_t result;

  APReceiverFairPlayHelperGetTypeID_fairPlayHelperClass = 0;
  *(_QWORD *)algn_2553CE498 = "APReceiverFairPlayHelper";
  qword_2553CE4A0 = 0;
  unk_2553CE4A8 = 0;
  qword_2553CE4B0 = (uint64_t)apReceiverFairPlayHelper_Finalize;
  unk_2553CE4B8 = 0;
  qword_2553CE4C0 = 0;
  unk_2553CE4C8 = 0;
  qword_2553CE4D0 = (uint64_t)apReceiverFairPlayHelper_CopyDebugDescription;
  result = _CFRuntimeRegisterClass();
  APReceiverFairPlayHelperGetTypeID_typeID = result;
  return result;
}

@end
