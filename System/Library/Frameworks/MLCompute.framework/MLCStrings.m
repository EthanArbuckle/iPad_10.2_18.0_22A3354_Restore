@implementation MLCStrings

+ (id)errorDomainGeneric
{
  return CFSTR("com.apple.coreml.foundation");
}

+ (id)tempDirectoryForANEModels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@models/"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sortedSequenceLengths
{
  return CFSTR("sortedSequenceLengths");
}

+ (id)testing_ResourcePath
{
  return CFSTR("/AppleInternal/Tests/MLCompute/MLCompute_tests.xctest/");
}

+ (id)unitTestOutputDirectoryPath
{
  return CFSTR("/tmp/");
}

@end
