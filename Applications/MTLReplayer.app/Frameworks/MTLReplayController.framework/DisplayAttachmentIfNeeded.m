@implementation DisplayAttachmentIfNeeded

id __DisplayAttachmentIfNeeded_block_invoke(uint64_t a1)
{
  objc_msgSend((id)g_activityLog, "enterDisplayAttachmentAtIndex:", *(_QWORD *)(a1 + 48));
  GTMTLReplayClient_displayAttachment(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, *(_DWORD *)(a1 + 48), *(unsigned int *)(a1 + 52));
  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

@end
