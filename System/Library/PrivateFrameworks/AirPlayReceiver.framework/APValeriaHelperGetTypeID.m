@implementation APValeriaHelperGetTypeID

uint64_t __APValeriaHelperGetTypeID_block_invoke()
{
  uint64_t result;

  APValeriaHelperGetTypeID_valeriaHelperClass = 0;
  *(_QWORD *)algn_2553CE888 = "APValeriaHelper";
  qword_2553CE890 = 0;
  unk_2553CE898 = 0;
  qword_2553CE8A0 = (uint64_t)vhelper_finalize;
  unk_2553CE8A8 = 0u;
  unk_2553CE8B8 = 0u;
  result = _CFRuntimeRegisterClass();
  APValeriaHelperGetTypeID_typeID = result;
  return result;
}

@end
