@implementation ASCompetitionWinCountForParticipant

uint64_t __ASCompetitionWinCountForParticipant_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isParticipantWinning:", *(_QWORD *)(a1 + 32));
}

@end
