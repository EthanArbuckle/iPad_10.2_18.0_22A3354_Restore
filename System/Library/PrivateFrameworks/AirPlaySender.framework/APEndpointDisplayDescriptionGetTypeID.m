@implementation APEndpointDisplayDescriptionGetTypeID

uint64_t __APEndpointDisplayDescriptionGetTypeID_block_invoke()
{
  uint64_t result;

  sAPEndpointDisplayDescriptionClass = 0;
  unk_1EF91DB50 = "APEndpointDisplayDescription";
  qword_1EF91DB58 = 0;
  unk_1EF91DB60 = 0;
  qword_1EF91DB68 = (uint64_t)bonjourDisplayDescription_Finalize;
  unk_1EF91DB70 = 0;
  qword_1EF91DB78 = 0;
  unk_1EF91DB80 = bonjourDisplayDescription_CopyFormattingDesc;
  qword_1EF91DB88 = (uint64_t)bonjourDisplayDescription_CopyDebugDescription;
  result = _CFRuntimeRegisterClass();
  sAPEndpointDisplayDescriptionTypeID = result;
  return result;
}

@end
