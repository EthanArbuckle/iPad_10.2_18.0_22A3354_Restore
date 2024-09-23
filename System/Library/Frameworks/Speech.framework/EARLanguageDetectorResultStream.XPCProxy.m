@implementation EARLanguageDetectorResultStream.XPCProxy

- (void)languageDetectorDidFinishWithError:(id)a3
{
  _TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1B2586F9C(a3);

}

- (void)languageDetectorDidRecognizeResult:(id)a3 processedAudioDuration:(double)a4
{
  id v6;
  _TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy *v7;

  v6 = a3;
  v7 = self;
  sub_1B2587080(v6, a4);

}

- (_TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy)init
{
  sub_1B2550258();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
