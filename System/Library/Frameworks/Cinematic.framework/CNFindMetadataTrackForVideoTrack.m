@implementation CNFindMetadataTrackForVideoTrack

void ___CNFindMetadataTrackForVideoTrack_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v4;

  if (!a3)
  {
    v4 = objc_msgSend(a2, "trackID");
    if (v4 == objc_msgSend(*(id *)(a1 + 32), "trackID"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
