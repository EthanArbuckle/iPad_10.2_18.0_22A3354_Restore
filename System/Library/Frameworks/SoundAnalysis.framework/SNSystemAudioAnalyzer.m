@implementation SNSystemAudioAnalyzer

+ (void)configureNewAnalyzersToComputeInThisProcess:(BOOL)a3
{
  sub_1D43C2490(a3);
}

- (SNSystemAudioAnalyzer)init
{
  return (SNSystemAudioAnalyzer *)SNSystemAudioAnalyzer.init()();
}

- (SNSystemAudioAnalyzer)initWithAudioConfiguration:(id)a3
{
  return (SNSystemAudioAnalyzer *)sub_1D43C2914(a3);
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  SNSystemAudioAnalyzer *v8;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  sub_1D43C2A08(a3, a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return 1;
}

- (void)addRequestInBackground:(id)a3 withObserver:(id)a4
{
  SNSystemAudioAnalyzer *v7;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1D43C2DB4(a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)removeRequest:(id)a3
{
  SNSystemAudioAnalyzer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D43C3104((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)removeAllRequests
{
  SNSystemAudioAnalyzer *v2;

  v2 = self;
  sub_1D43C3348();

}

- (void)start
{
  SNSystemAudioAnalyzer *v2;

  v2 = self;
  sub_1D43C3548("(SNSystemAudioAnalyzer:%s) start");

}

- (void)stop
{
  SNSystemAudioAnalyzer *v2;

  v2 = self;
  sub_1D43C3548("(SNSystemAudioAnalyzer:%s) stop");

}

- (void).cxx_destruct
{
  sub_1D42B5400((uint64_t)self + OBJC_IVAR___SNSystemAudioAnalyzer_impl);
}

@end
