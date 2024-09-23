@implementation MLException

- (void)raise
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (__exceptionsEnabled)
  {
    v5.receiver = self;
    v5.super_class = (Class)MLException;
    -[MLException raise](&v5, sel_raise);
  }
  else
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      -[MLException description](self, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "!!! ML3 raised exception while exceptions were disabled: %{public}@", buf, 0xCu);

    }
  }
}

@end
