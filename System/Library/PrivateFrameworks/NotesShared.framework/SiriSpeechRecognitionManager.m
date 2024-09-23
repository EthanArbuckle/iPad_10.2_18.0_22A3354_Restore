@implementation SiriSpeechRecognitionManager

- (_TtC11NotesShared28SiriSpeechRecognitionManager)init
{
  return (_TtC11NotesShared28SiriSpeechRecognitionManager *)SiriSpeechRecognitionManager.init()();
}

- (void).cxx_destruct
{
  sub_1BDAC350C((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_audioTaskContinuation, &qword_1EF50F208);
  sub_1BDAC350C((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_inputSequence, &qword_1EF50F198);
  sub_1BDAC350C((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_inputBuilder, &qword_1EF50F190);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_analyzerFormat));
}

@end
