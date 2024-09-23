@implementation BSGetVersionedPID

void __BSGetVersionedPID_block_invoke()
{
  void *v0;
  void *v1;
  _OWORD v2[2];

  BSAuditTokenForCurrentProcess(v2);
  BSGetVersionedPID___versionedPID = BSVersionedPIDForAuditToken(v2);
  if (getpid() != (_DWORD)BSGetVersionedPID___versionedPID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSVersionedPID BSGetVersionedPID(void)_block_invoke");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BSVersionedPID.m"), 20, CFSTR("Failed to validate current vpid."));

  }
}

@end
