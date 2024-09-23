@implementation NSError(AVConferenceError)

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:filePath:description:reason:
{
  return objc_msgSend(a1, "AVConferenceServiceError:detailedCode:returnCode:filePath:description:reason:", a3, a4, 0, a5, a6, a7);
}

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:returnCode:filePath:description:reason:
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;

  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v16 = (void *)objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("NSErrorUserInfoDetailedError"), v15, CFSTR("NSErrorUserInfoReturnCode"), a7, *MEMORY[0x1E0CB2D50], a8, *MEMORY[0x1E0CB2D68], 0);
  if (VRTraceIsInternalOSInstalled())
  {
    if (a6)
      v17 = a6;
    else
      v17 = CFSTR("...");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2AA0]);
  }
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKVoiceChatServiceErrorDomain"), a3, v16);
}

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailCode:description:
{
  void *v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v10[0] = CFSTR("NSErrorUserInfoDetailedError");
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10[1] = *MEMORY[0x1E0CB2D68];
  v11[0] = v8;
  v11[1] = a5;
  return objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("GKVoiceChatServiceErrorDomain"), a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
}

@end
