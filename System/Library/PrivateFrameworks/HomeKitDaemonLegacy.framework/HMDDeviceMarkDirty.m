@implementation HMDDeviceMarkDirty

void ____HMDDeviceMarkDirty_block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isDirty"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDirty:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("HMDDeviceUpdatedNotification"), *(_QWORD *)(a1 + 32));

  }
}

@end
