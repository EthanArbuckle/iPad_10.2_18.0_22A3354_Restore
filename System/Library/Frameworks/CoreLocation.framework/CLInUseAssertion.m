@implementation CLInUseAssertion

+ (id)newAssertionForBundleIdentifier:(id)a3 bundlePath:(id)a4 reason:(id)a5 level:(int)a6
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  CLInUseAssertion *v11;
  const char *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("kCLConnectionMessageBundleIdentifierKey");
  v14[1] = CFSTR("kCLConnectionMessageBundlePathKey");
  v6 = &stru_1E2993188;
  if (a3)
    v7 = (const __CFString *)a3;
  else
    v7 = &stru_1E2993188;
  if (a4)
    v6 = (const __CFString *)a4;
  v15[0] = v7;
  v15[1] = v6;
  v8 = CFSTR("(Unspecified)");
  if (a5)
    v8 = (const __CFString *)a5;
  v15[2] = v8;
  v14[2] = CFSTR("kCLConnectionMessagePurposeKey");
  v14[3] = CFSTR("kCLConnectionMessageAssertionLevelKey");
  v15[3] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a6, (uint64_t)a4);
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v15, (uint64_t)v14, 4);
  v11 = [CLInUseAssertion alloc];
  return (id)objc_msgSend_initWithRegistrationMessageName_messageDictionary_(v11, v12, (uint64_t)"InUseAssertion/kCLConnectionMessage", v10);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 level:(int)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = (id)objc_msgSend_copy(a4, v8, v9, v10);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_newAssertionForBundleIdentifier_bundlePath_reason_level_, v7, 0);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 level:(int)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = (void *)objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = (id)objc_msgSend_copy(v7, v8, v9, v10);
  v15 = (id)objc_msgSend_copy(a4, v12, v13, v14);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_newAssertionForBundleIdentifier_bundlePath_reason_level_, 0, v11);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_newAssertionForBundleIdentifier_withReason_level_, a3, a4);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_newAssertionForBundle_withReason_level_, a3, a4);
}

@end
