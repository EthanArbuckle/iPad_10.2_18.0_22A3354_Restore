@implementation NSURLSessionConfiguration

AMSPromise *__85__NSURLSessionConfiguration_AppleMediaServices__ams_configurationWithClientInfo_bag___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

void __61__NSURLSessionConfiguration_AppleMediaServices___URLBagCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_162;
  _MergedGlobals_162 = v2;

  if (os_variant_has_internal_content())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleClearCachesNotification_0, CFSTR("com.apple.AMS.ClearNSURLCache"), 0, CFNotificationSuspensionBehaviorDrop);
  }
}

uint64_t __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "set_allowsTCPFastOpen:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
}

uint64_t __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "set_allowsTLSSessionTickets:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
}

@end
