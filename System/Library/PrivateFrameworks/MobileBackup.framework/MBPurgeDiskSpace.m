@implementation MBPurgeDiskSpace

void __MBPurgeDiskSpace_block_invoke(uint64_t a1, CFTypeRef cf)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)(id)CFMakeCollectable(cf), "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT")), "unsignedLongLongValue");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
