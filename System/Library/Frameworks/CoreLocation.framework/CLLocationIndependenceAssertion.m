@implementation CLLocationIndependenceAssertion

+ (id)newAssertionWithReason:(id)a3
{
  uint64_t v3;
  CLLocationIndependenceAssertion *v4;
  const char *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = CFSTR("kCLConnectionMessagePurposeKey");
  v8[0] = a3;
  v3 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v8, (uint64_t)&v7, 1);
  v4 = [CLLocationIndependenceAssertion alloc];
  return (id)objc_msgSend_initWithRegistrationMessageName_messageDictionary_(v4, v5, (uint64_t)"LocationIndependenceAssertion/kCLConnectionMessage", v3);
}

@end
