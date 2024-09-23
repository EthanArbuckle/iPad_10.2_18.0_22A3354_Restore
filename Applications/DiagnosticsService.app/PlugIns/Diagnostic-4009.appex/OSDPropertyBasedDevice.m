@implementation OSDPropertyBasedDevice

- (BOOL)setProperty:(__CFString *)a3 value:(void *)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!-[OSDPropertyBasedDevice backingRef](self, "backingRef"))
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a5, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> No backing reference!"), self, v11, v12, v13);
    return 0;
  }
  v9 = -[OSDPropertyBasedDevice backingSetProperty:value:](self, "backingSetProperty:value:", a3, a4);
  if ((_DWORD)v9)
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a5, CFSTR("com.apple.osdiags.OSDCaptureDevice"), v9, CFSTR("%@ >> Error %d (0x%08x) setting property '%@'!"), self, v9, v9, a3);
    return 0;
  }
  return 1;
}

- (BOOL)setProperty:(__CFString *)a3 BOOLean:(BOOL)a4 error:(id *)a5
{
  const CFBooleanRef *v5;

  v5 = &kCFBooleanTrue;
  if (!a4)
    v5 = &kCFBooleanFalse;
  return -[OSDPropertyBasedDevice setProperty:value:error:](self, "setProperty:value:error:", a3, *v5, a5);
}

- (id)copyProperty:(__CFString *)a3 error:(id *)a4
{
  uint64_t v7;
  id result;
  void *v9;

  v9 = 0;
  if (-[OSDPropertyBasedDevice backingRef](self, "backingRef"))
  {
    v7 = -[OSDPropertyBasedDevice backingCopyProperty:dest:](self, "backingCopyProperty:dest:", a3, &v9);
    if ((_DWORD)v7)
    {
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a4, CFSTR("com.apple.osdiags.OSDCaptureDevice"), self, v7, v7, a3);
      result = 0;
      v9 = 0;
    }
    else
    {
      return v9;
    }
  }
  else
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a4, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> No backing ref!"), self);
    return 0;
  }
  return result;
}

- (void)backingRef
{
  NSString *v2;
  void *v3;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Subclasses must override %@"), v3);

  return 0;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  NSString *v4;
  void *v5;

  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Subclasses must override %@"), v5);

  return 1;
}

- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4
{
  NSString *v4;
  void *v5;

  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Subclasses must override %@"), v5);

  return 1;
}

@end
