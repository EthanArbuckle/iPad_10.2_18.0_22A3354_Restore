@implementation NSError(CXError)

+ (uint64_t)cx_errorWithCode:()CXError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error"), a3, 0);
}

+ (uint64_t)cx_incomingCallErrorWithCode:()CXError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.incomingcall"), a3, 0);
}

+ (uint64_t)cx_requestTransactionErrorWithCode:()CXError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.requesttransaction"), a3, 0);
}

+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError
{
  return objc_msgSend(a1, "cx_callDirectoryManagerErrorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError userInfo:
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.calldirectorymanager"), a3, a4);
}

+ (uint64_t)cx_callDirectoryStoreErrorWithCode:()CXError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.calldirectorystore"), a3, 0);
}

+ (uint64_t)cx_notificationServiceExtensionErrorWithCode:()CXError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.notificationserviceextension"), a3, 0);
}

@end
