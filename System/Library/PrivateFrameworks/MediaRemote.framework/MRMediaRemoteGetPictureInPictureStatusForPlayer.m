@implementation MRMediaRemoteGetPictureInPictureStatusForPlayer

uint64_t __MRMediaRemoteGetPictureInPictureStatusForPlayer_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40), 0);
  return result;
}

@end
