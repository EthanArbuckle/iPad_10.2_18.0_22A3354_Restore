@implementation BMStreamBase(PeriodicMaintenance)

- (void)_pruneEmptyRemotesNotRecentlyModified
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_18D810000, a4, OS_LOG_TYPE_ERROR, "Unable to find or remove empty remote stream: %@", a1, 0xCu);

}

@end
