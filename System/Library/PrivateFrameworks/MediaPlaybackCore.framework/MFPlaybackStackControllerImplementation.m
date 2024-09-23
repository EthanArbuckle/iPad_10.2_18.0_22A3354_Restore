@implementation MFPlaybackStackControllerImplementation

- (double)currentTime
{
  MFPlaybackStackControllerImplementation *v2;
  double v3;
  double v4;

  v2 = self;
  sub_210BE0DC8();
  v4 = v3;

  return v4;
}

- (int64_t)currentItemTransition
{
  int64_t result;

  sub_210BFB018();
  return result;
}

- (MFQueuePlayerItem)currentQueueItem
{
  return (MFQueuePlayerItem *)(id)sub_210BFB998();
}

- (NSArray)nextItems
{
  MFPlaybackStackControllerImplementation *v2;
  void *v3;

  v2 = self;
  sub_210C39640();

  sub_210C3FD68(0, (unint64_t *)&qword_253D7CC90);
  v3 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setDelegate:(id)a3
{
  MFPlaybackStackControllerImplementation *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C396B4();

}

- (void)setSpatializationFormat:(int64_t)a3
{
  MFPlaybackStackControllerImplementation *v4;

  v4 = self;
  sub_210C3993C(a3);

}

- (void)updateAudioSessionWithConfiguration:(id)a3
{
  id v4;
  MFPlaybackStackControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_210C39B10((uint64_t)v4);

}

- (void)setupForNewQueueWithSessionID:(id)a3
{
  sub_210C39B2C(self, (uint64_t)a2, (uint64_t)a3, sub_210C39BB4);
}

- (BOOL)isModeShared
{
  MFPlaybackStackControllerImplementation *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_210C39BF0();

  return v3 & 1;
}

- (int64_t)currentState
{
  MFPlaybackStackControllerImplementation *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_210C39C48();
  v4 = v3;

  return v4;
}

- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4
{
  MFPlaybackStackControllerImplementation *v6;

  v6 = self;
  sub_210C39CB8(a3, a4);

}

- (MFQueuePlayerItem)currentItem
{
  return (MFQueuePlayerItem *)(id)sub_210C39D98();
}

- (BOOL)isModeSolo
{
  MFPlaybackStackControllerImplementation *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_210C39DCC();

  return v3 & 1;
}

- (AVPlayerViewController)videoViewController
{
  id v2;

  sub_210C39E14();
  return (AVPlayerViewController *)v2;
}

- (MFPlaybackStackControllerDelegate)delegate
{
  sub_210C7B64C();
}

- (MFPlaybackStackControllerImplementation)initWithPlayerID:(id)a3 engineID:(id)a4 queueController:(id)a5 assetLoader:(id)a6 errorController:(id)a7 externalPlaybackController:(id)a8 leaseController:(id)a9 defaults:(id)a10 behavior:(int64_t)a11 queue:(id)a12
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v22 = sub_210E92BA8();
  v17 = v16;
  v18 = sub_210E92BA8();
  v20 = v19;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  MFPlaybackStackControllerImplementation.init(playerID:engineID:queueController:assetLoader:errorController:externalPlaybackController:leaseController:defaults:behavior:queue:)(v22, v17, v18, v20, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, a11, a12);
}

- (int64_t)interruptedState
{
  MFPlaybackStackControllerImplementation *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_210C7BB38();
  v4 = v3;

  return v4;
}

- (float)rate
{
  MFPlaybackStackControllerImplementation *v2;
  float v3;
  float v4;

  v2 = self;
  sub_210C7BBB0();
  v4 = v3;

  return v4;
}

- (float)effectiveRate
{
  MFPlaybackStackControllerImplementation *v2;
  float v3;
  float v4;

  v2 = self;
  sub_210C7BC08();
  v4 = v3;

  return v4;
}

- (float)targetRate
{
  MFPlaybackStackControllerImplementation *v2;
  float v3;
  float v4;

  v2 = self;
  sub_210C7BC64();
  v4 = v3;

  return v4;
}

- (NSNumber)targetTime
{
  MFPlaybackStackControllerImplementation *v2;
  id v3;

  v2 = self;
  v3 = sub_210C7BCB8();

  return (NSNumber *)v3;
}

- (void)restoreQueue:(id)a3
{
  void *v4;
  MFPlaybackStackControllerImplementation *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_210C7BD14((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)clearPlaybackQueue
{
  MFPlaybackStackControllerImplementation *v2;

  v2 = self;
  sub_210C7BDFC();

}

- (void)reloadCurrentItemWithReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  MFPlaybackStackControllerImplementation *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_210C80E58;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_210C7BE54(a3, (uint64_t)v6, v7);
  sub_210C4ED40((uint64_t)v6);

}

- (void)resetWithReason:(id)a3
{
  MFPlaybackStackControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_210C7BFA4();

}

- (void)teardownForQueueWithSessionID:(id)a3
{
  sub_210C39B2C(self, (uint64_t)a2, (uint64_t)a3, sub_210C7C034);
}

- (void)setQueueWithInitialItem:(id)a3 andPlay:(BOOL)a4 identifier:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  void *v10;
  uint64_t v11;
  id v12;
  MFPlaybackStackControllerImplementation *v13;

  v7 = a4;
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_210C7C04C((uint64_t)a3, v7, (uint64_t)v12, (uint64_t)sub_210C80EFC, v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C4F0();
}

- (void)pauseWithIdentifier:(id)a3 completion:(id)a4
{
  sub_210C7C3F8();
}

- (void)pauseWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C2FC();
}

- (void)pauseForSleepTimerWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C2FC();
}

- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4
{
  sub_210C7C3F8();
}

- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C4F0();
}

- (void)beginScanningWithDirection:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  MFPlaybackStackControllerImplementation *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a4;
  v11 = self;
  sub_210C7C550(a3, (uint64_t)v10, (uint64_t)sub_210C80EFC, v9);

  swift_release();
}

- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4
{
  sub_210C7C3F8();
}

- (void)beginSeekingWithIdentifier:(id)a3 completion:(id)a4
{
  sub_210C7C3F8();
}

- (void)seekTo:(double)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C2FC();
}

- (void)endSeekingWithIdentifier:(id)a3 completion:(id)a4
{
  sub_210C7C3F8();
}

- (void)jumpTo:(double)a3 identifier:(id)a4 completion:(id)a5
{
  sub_210C7C2FC();
}

- (BOOL)shouldSkipJumpToItemStart:(int64_t)a3
{
  MFPlaybackStackControllerImplementation *v4;

  v4 = self;
  LOBYTE(a3) = sub_210C7C908(a3);

  return a3 & 1;
}

- (int64_t)timeControlStatus
{
  MFPlaybackStackControllerImplementation *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_210C7C9A0();
  v4 = v3;

  return v4;
}

- (NSDictionary)stateDictionary
{
  MFPlaybackStackControllerImplementation *v2;

  v2 = self;
  sub_210C7CA24();
}

- (int64_t)renderingMode
{
  MFPlaybackStackControllerImplementation *v2;
  id v3;

  v2 = self;
  v3 = sub_210C7CCB4();

  return (int64_t)v3;
}

- (void)activateAudioSessionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  MFPlaybackStackControllerImplementation *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_210C7CCCC((uint64_t)sub_210C80E18, v5);

  swift_release();
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  MFPlaybackStackControllerImplementation *v4;

  v4 = self;
  sub_210C7CE34(a3);

}

- (void)setInhibitSpeechDetection:(BOOL)a3
{
  MFPlaybackStackControllerImplementation *v4;

  v4 = self;
  sub_210C7CE90(a3);

}

- (NSString)modeDescription
{
  MFPlaybackStackControllerImplementation *v2;
  void *v3;

  v2 = self;
  sub_210C7CF44();

  v3 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isModeManagedSession
{
  MFPlaybackStackControllerImplementation *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_210C7CFC8();

  return v3 & 1;
}

- (void)setupForSolo
{
  MFPlaybackStackControllerImplementation *v2;

  v2 = self;
  sub_210C7CFF0();

}

- (void)setupForShared
{
  MFPlaybackStackControllerImplementation *v2;

  v2 = self;
  sub_210C7D03C();

}

- (void)setupForManagedSessionWithAudioSession:(id)a3
{
  id v4;
  MFPlaybackStackControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_210C7D088((uint64_t)v4);

}

- (float)relativeVolume
{
  MFPlaybackStackControllerImplementation *v2;
  float v3;
  float v4;

  v2 = self;
  sub_210C7D130();
  v4 = v3;

  return v4;
}

- (void)setRelativeVolume:(float)a3
{
  MFPlaybackStackControllerImplementation *v3;

  v3 = self;
  sub_210C7D18C();

}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
  MFPlaybackStackControllerImplementation *v5;

  v5 = self;
  sub_210C7D200(a3);

}

- (MFPlaybackStackControllerImplementation)init
{
  MFPlaybackStackControllerImplementation.init()();
}

- (void).cxx_destruct
{
  sub_210C3BEB4((uint64_t)self + OBJC_IVAR___MFPlaybackStackControllerImplementation_delegate);
  swift_release();
  swift_release();
}

@end
