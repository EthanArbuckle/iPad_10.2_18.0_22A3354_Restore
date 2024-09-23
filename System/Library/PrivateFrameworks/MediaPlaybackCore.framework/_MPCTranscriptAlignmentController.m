@implementation _MPCTranscriptAlignmentController

- (MPCPlaybackEngineEventConsumer)eventConsumer
{
  return (MPCPlaybackEngineEventConsumer *)(id)sub_210D2B9D0();
}

- (NSArray)transcriptAlignments
{
  _MPCTranscriptAlignmentController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_210D2BA3C();
  v4 = v3;

  if (v4)
  {
    sub_210D2C6D0();
    v5 = (void *)sub_210E92CBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (BOOL)isEnabled
{
  _MPCTranscriptAlignmentController *v2;
  char v3;

  v2 = self;
  v3 = sub_210D2BACC();

  return v3 & 1;
}

- (_MPCTranscriptAlignmentController)initWithPlaybackEngine:(id)a3
{
  return (_MPCTranscriptAlignmentController *)TranscriptAlignmentController.init(playbackEngine:)(a3);
}

- (void)startProcessing
{
  _MPCTranscriptAlignmentController *v2;

  v2 = self;
  sub_210D2BC08();

}

- (void)resolveWith:(double)a3 referenceTime:(double)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  _MPCTranscriptAlignmentController *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(double *)(v9 + 16) = a3;
  *(double *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = self;
  sub_210C336D8((uint64_t)&unk_254A80B08, v9);
}

- (_MPCTranscriptAlignmentController)init
{
  TranscriptAlignmentController.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
