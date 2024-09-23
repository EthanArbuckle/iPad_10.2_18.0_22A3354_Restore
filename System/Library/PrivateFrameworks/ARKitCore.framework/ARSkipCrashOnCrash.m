@implementation ARSkipCrashOnCrash

BOOL __ARSkipCrashOnCrash_block_invoke()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.skipCrashOnARCrash"));
  ARSkipCrashOnCrash_skipCrashOnCrash = result;
  return result;
}

BOOL __ARSkipCrashOnCrash_block_invoke_0()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.skipCrashOnARCrash"));
  ARSkipCrashOnCrash_skipCrashOnCrash_0 = result;
  return result;
}

BOOL __ARSkipCrashOnCrash_block_invoke_1()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.skipCrashOnARCrash"));
  ARSkipCrashOnCrash_skipCrashOnCrash_1 = result;
  return result;
}

@end
