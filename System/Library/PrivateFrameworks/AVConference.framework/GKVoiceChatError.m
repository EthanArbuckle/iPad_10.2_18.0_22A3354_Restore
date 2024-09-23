@implementation GKVoiceChatError

+ (BOOL)getNSError:(id *)a3 code:(int64_t)a4 detailedCode:(int64_t)a5 returnCode:(int64_t)a6 filePath:(id)a7 description:(id)a8 reason:(id)a9
{
  void *v10;

  if (!a3)
    return 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:returnCode:filePath:description:reason:", a4, a5, a6, a7, a8, a9);
  *a3 = v10;
  return v10 == 0;
}

+ (BOOL)getNSError:(id *)a3 code:(int64_t)a4 detailedCode:(int64_t)a5 filePath:(id)a6 description:(id)a7 reason:(id)a8
{
  void *v9;

  if (!a3)
    return 0;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:filePath:description:reason:", a4, a5, a6, a7, a8);
  *a3 = v9;
  return v9 == 0;
}

@end
