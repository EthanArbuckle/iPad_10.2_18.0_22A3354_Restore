@implementation FPDDeadEndExtensionSession

- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5
{
  return -[FPDDeadEndExtensionSession newFileProviderProxyWithTimeout:pid:](self, "newFileProviderProxyWithTimeout:pid:", *(_QWORD *)&a5, a3);
}

- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CAACE8]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB48], -1004, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBB940, v5, CFSTR("dead-end"), 0);

  return v6;
}

- (BOOL)hasFileProviderAttributionMDMAccess
{
  return self->hasFileProviderAttributionMDMAccess;
}

@end
