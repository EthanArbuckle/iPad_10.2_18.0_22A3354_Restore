@implementation APReceiverSessionManagerGetTypeID

uint64_t __APReceiverSessionManagerGetTypeID_block_invoke()
{
  uint64_t result;

  APReceiverSessionManagerGetTypeID_SessionManagerClass = 0;
  unk_2553CEA20 = "APReceiverSessionManager";
  qword_2553CEA28 = 0;
  unk_2553CEA30 = 0;
  qword_2553CEA38 = (uint64_t)sessionManager_Finalize;
  unk_2553CEA40 = 0u;
  unk_2553CEA50 = 0u;
  result = _CFRuntimeRegisterClass();
  APReceiverSessionManagerGetTypeID_typeID = result;
  return result;
}

@end
