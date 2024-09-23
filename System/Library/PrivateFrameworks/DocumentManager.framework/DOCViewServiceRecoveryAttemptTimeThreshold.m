@implementation DOCViewServiceRecoveryAttemptTimeThreshold

void __DOCViewServiceRecoveryAttemptTimeThreshold_block_invoke()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("DOCViewServiceResetRecoveryThreshold"));
  v2 = v1;

  if (v2 > 0.0)
    DOCViewServiceRecoveryAttemptTimeThreshold_interval = *(_QWORD *)&v2;
}

@end
