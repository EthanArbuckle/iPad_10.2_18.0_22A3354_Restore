@implementation NSError(GCIPCErrorDomain)

+ (NSError)gc_IPCError:()GCIPCErrorDomain userInfo:
{
  return +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCIPCError"), a3, a4);
}

@end
