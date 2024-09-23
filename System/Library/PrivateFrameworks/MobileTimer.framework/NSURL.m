@implementation NSURL

uint64_t __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;

  if ((objc_msgSend(a2, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    v3 = CFSTR("clock-timer-running");
  else
    v3 = CFSTR("clock-timer");
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

id __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "mtURLForScheme:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
