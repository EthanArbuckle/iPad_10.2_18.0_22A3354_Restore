@implementation APMediaSenderGetTypeID

uint64_t __APMediaSenderGetTypeID_block_invoke()
{
  uint64_t result;

  APMediaSenderGetTypeID_frameSenderClass = 0;
  unk_25639C060 = "APMediaSender";
  qword_25639C068 = 0;
  unk_25639C070 = 0;
  qword_25639C078 = (uint64_t)sender_finalize;
  unk_25639C080 = 0;
  qword_25639C088 = 0;
  unk_25639C090 = 0;
  qword_25639C098 = (uint64_t)sender_copyDebugDescription;
  result = _CFRuntimeRegisterClass();
  APMediaSenderGetTypeID_typeID = result;
  return result;
}

@end
