@implementation IDSServer

uint64_t __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke()
{
  uint64_t result;

  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("MediaPlayback"));
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("Default"));
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", "Default", 1);
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName = result;
  return result;
}

void __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke_124(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage_block_invoke(uint64_t a1)
{
  CMSM_IDSConnection_SetMessageReplyComplete(*(const void **)(a1 + 32));
}

void __cmsm_IDSServer_ProcessRemotePlayingInfoReplyMessage_block_invoke(uint64_t a1)
{
  const void *v2;

  CMSM_IDSConnection_SetRemotePlayingInfo(*(const __CFArray **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __cmsm_IDSServer_ProcessUpdateSharedAudioRouteMacAddress_block_invoke(uint64_t a1)
{
  const void *v2;

  CMSM_IDSConnection_UpdateSharedAudioRouteMacAddressOnLocal(*(const __CFString **)(a1 + 32), *(_QWORD *)(a1 + 40) == *MEMORY[0x1E0C9AE50]);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
