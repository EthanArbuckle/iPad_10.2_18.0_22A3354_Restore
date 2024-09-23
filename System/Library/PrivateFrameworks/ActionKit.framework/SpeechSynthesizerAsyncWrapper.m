@implementation SpeechSynthesizerAsyncWrapper

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper *v12;
  id v13;

  v8 = sub_22D6665A8();
  v10 = v9;
  v11 = a3;
  v12 = self;
  v13 = a5;
  sub_22D3B3CC4((uint64_t)v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper *v13;

  v8 = sub_22D6665A8();
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_22D3B4078((uint64_t)v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (_TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper)init
{
  return (_TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper *)sub_22D3B4248();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper_synthesizer));
  sub_22D36803C((uint64_t)self+ OBJC_IVAR____TtC9ActionKitP33_3FD069E75236963E75C4BE2D87E9ECB629SpeechSynthesizerAsyncWrapper_continuation, (uint64_t *)&unk_255D811A8);
}

@end
