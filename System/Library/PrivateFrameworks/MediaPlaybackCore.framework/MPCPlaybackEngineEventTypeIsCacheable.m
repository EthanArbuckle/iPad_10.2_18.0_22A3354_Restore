@implementation MPCPlaybackEngineEventTypeIsCacheable

uint64_t ___MPCPlaybackEngineEventTypeIsCacheable_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 512, 30);
  v1 = (void *)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes;
  _MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes = v0;

  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("session-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("session-restore-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("session-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("remote-control-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("remote-control-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("queue-load-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("queue-add"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("queue-load-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("container-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("container-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("asset-load-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("asset-load-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("playback-behavior-changed"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-hls-stream-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-hls-stream-end"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("device-changed"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("network-type-changed"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("network-reachability-changed"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("account-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("account-update"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-update"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-key-request-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("item-configuration-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("time-control-status-changed"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("player-operation-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("reload-current-item-begin"));
  objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("session-activation-begin"));
  return objc_msgSend((id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes, "addObject:", CFSTR("session-activation-end"));
}

@end
