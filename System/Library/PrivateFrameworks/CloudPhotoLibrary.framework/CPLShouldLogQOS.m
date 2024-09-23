@implementation CPLShouldLogQOS

void ____CPLShouldLogQOS_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  __CPLShouldLogQOS_debugQOS = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLDebugQOS"));

}

@end
