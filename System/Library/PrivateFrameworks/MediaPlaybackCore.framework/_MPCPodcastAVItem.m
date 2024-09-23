@implementation _MPCPodcastAVItem

- (id)_contentItemUserInfo
{
  return sub_210CC719C(self);
}

- (NSString)itemDescription
{
  return (NSString *)sub_210CC4704(self, (uint64_t)a2, MEMORY[0x24BE730A8], (void (*)(uint64_t))sub_210CC5CBC);
}

- (NSString)albumArtist
{
  return (NSString *)sub_210CC4704(self, (uint64_t)a2, MEMORY[0x24BE73118], (void (*)(uint64_t))sub_210CC5CBC);
}

- (NSString)album
{
  return (NSString *)sub_210CC476C(self);
}

- (BOOL)prefersSeekOverSkip
{
  return 1;
}

- (BOOL)isExplicitTrack
{
  _MPCPodcastAVItem *v2;
  char v3;

  v2 = self;
  v3 = sub_210CC5E60((uint64_t (*)(uint64_t))MEMORY[0x24BE73070]);

  return v3 & 1;
}

- (id)artworkCatalogBlock
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  sub_210CC481C();
  v5[4] = sub_210CCC9E4;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_210CC58BC;
  v5[3] = &block_descriptor_54_0;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (NSString)mainTitle
{
  return (NSString *)sub_210CC5C78(self);
}

- (unint64_t)mediaType
{
  _MPCPodcastAVItem *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_210CC5940();
  v4 = v3;

  return v4;
}

- (int64_t)storeItemInt64ID
{
  _MPCPodcastAVItem *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_210CC5D70((void (*)(uint64_t))MEMORY[0x24BE73090]);

  return v3;
}

- (NSString)externalContentIdentifier
{
  return (NSString *)sub_210CC5C78(self);
}

- (int64_t)albumStoreID
{
  _MPCPodcastAVItem *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_210CC5D70((void (*)(uint64_t))MEMORY[0x24BE730A0]);

  return v3;
}

- (NSString)artist
{
  return (NSString *)sub_210CC4704(self, (uint64_t)a2, MEMORY[0x24BE73128], (void (*)(uint64_t))sub_210CC5CBC);
}

- (NSString)podcastSubscriptionState
{
  return (NSString *)sub_210CC476C(self);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  _MPCPodcastAVItem *v4;
  CMTimeValue v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  v4 = self;
  v5 = sub_210CC5FD4();
  v7 = v6;
  v9 = v8;

  retstr->var0 = v5;
  *(_QWORD *)&retstr->var1 = v7;
  retstr->var3 = v9;
  return result;
}

- (BOOL)usesBookmarking
{
  _MPCPodcastAVItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_210CC60DC();

  return v3;
}

- (NSString)newsSubscriptionInformation
{
  return (NSString *)sub_210CC4704(self, (uint64_t)a2, MEMORY[0x24BE730F8], (void (*)(uint64_t))sub_210CC6120);
}

- (NSArray)musicSubscriptionInformation
{
  _MPCPodcastAVItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_210CC6200();
  v4 = v3;

  if (v4)
  {
    sub_210C6FBCC(0, (unint64_t *)&qword_253D7B190);
    v5 = (void *)sub_210E92CBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (MPModelGenericObject)modelGenericObject
{
  _MPCPodcastAVItem *v2;
  id v3;

  v2 = self;
  v3 = sub_210CC629C((uint64_t)v2);

  return (MPModelGenericObject *)v3;
}

- (id)_contentItemDeviceSpecificUserInfo
{
  return sub_210CC719C(self);
}

- (double)durationFromExternalMetadata
{
  _MPCPodcastAVItem *v2;
  double v3;

  v2 = self;
  v3 = sub_210CC7238();

  return v3;
}

- (BOOL)isAssetLoaded
{
  _MPCPodcastAVItem *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_210CC7C94();

  return v3 & 1;
}

- (void)_clearAssetNow
{
  _MPCPodcastAVItem *v2;

  v2 = self;
  sub_210CC7CF8();

}

- (void)loadAssetAndPlayerItemWithTask:(MPAVItemAssetTask *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  _MPCPodcastAVItem *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_210C336D8((uint64_t)&unk_254A7EE18, (uint64_t)v7);
}

- (void)_willBecomeActivePlayerItem
{
  _MPCPodcastAVItem *v2;

  v2 = self;
  sub_210CC8718();

}

- (void)_willResignActivePlayerItem
{
  _MPCPodcastAVItem *v2;

  v2 = self;
  sub_210CC9168();

}

- (void)pauseContentKeySession
{
  _MPCPodcastAVItem *v2;

  v2 = self;
  sub_210CC924C();

}

- (void)resumeContentKeySession
{
  _MPCPodcastAVItem *v2;

  v2 = self;
  sub_210CC924C();

}

- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4
{
  _MPCPodcastAVItem *v6;

  v6 = self;
  sub_210CC94E8(a3, a4);

}

- (_MPCPodcastAVItem)initWithPlayerItem:(id)a3
{
  id v3;

  v3 = a3;
  sub_210CC9950();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_9_14();
  OUTLINED_FUNCTION_83_3(v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____MPCPodcastAVItem____lazy_storage___fairPlayKeyLoader));
  swift_bridgeObjectRelease();
  v4 = sub_210E92224();
  OUTLINED_FUNCTION_83_3(v4);
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)rtcReportingServiceIdentifier
{
  _MPCPodcastAVItem *v2;
  void *v3;

  v2 = self;
  sub_210CCBD38();

  v3 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
