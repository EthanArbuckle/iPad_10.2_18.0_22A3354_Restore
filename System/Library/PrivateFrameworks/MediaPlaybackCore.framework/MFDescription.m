@implementation MFDescription

+ (id)forItemChangeSource:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C463A0);
}

- (MFDescription)init
{
  return (MFDescription *)sub_210C7AC8C();
}

+ (id)forPlayerState:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7ACDC);
}

+ (id)forBufferState:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7AE08);
}

+ (id)forItemRequestReason:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7AE6C);
}

+ (id)forErrorResolution:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7AF2C);
}

+ (id)forItemTransition:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7AFD8);
}

+ (id)forUserActionType:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B0CC);
}

+ (id)forUserActionSource:(int64_t)a3
{
  return sub_210C7B41C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B200);
}

+ (id)forPlaybackTimeChangeReason:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B264);
}

+ (id)forReloadingReason:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B2D8);
}

+ (id)forPlayerSpatializationFormat:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B348);
}

+ (id)forTimeControlStatus:(int64_t)a3
{
  return sub_210C7B41C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B3BC);
}

+ (id)forPlayerItemTransitionType:(int64_t)a3
{
  return sub_210C463EC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_210C7B450);
}

@end
