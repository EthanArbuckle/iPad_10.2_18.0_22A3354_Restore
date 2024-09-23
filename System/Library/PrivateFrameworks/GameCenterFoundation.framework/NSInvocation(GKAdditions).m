@implementation NSInvocation(GKAdditions)

- (uint64_t)_gkHasReplyBlock
{
  return objc_msgSend((id)objc_msgSend(a1, "methodSignature"), "_gkHasReplyBlock");
}

+ (void)_gkInvocationWithBlock:()GKAdditions
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", _Block_signature(aBlock)));
  objc_msgSend(v4, "setTarget:", aBlock);
  return v4;
}

@end
