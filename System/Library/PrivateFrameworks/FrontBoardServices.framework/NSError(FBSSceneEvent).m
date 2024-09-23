@implementation NSError(FBSSceneEvent)

+ (uint64_t)sceneMessageErrorWithCode:()FBSSceneEvent
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSSceneMessage"), a3, 0);
}

@end
