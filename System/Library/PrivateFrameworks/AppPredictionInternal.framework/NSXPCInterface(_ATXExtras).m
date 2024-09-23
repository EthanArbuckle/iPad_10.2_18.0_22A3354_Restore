@implementation NSXPCInterface(_ATXExtras)

- (void)atx_addClass:()_ATXExtras forSelector:argumentIndex:ofReply:
{
  void *v11;
  id v12;

  objc_msgSend(a1, "classesForSelector:argumentIndex:ofReply:", a4, a5, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObject:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v11, a4, a5, a6);

}

@end
