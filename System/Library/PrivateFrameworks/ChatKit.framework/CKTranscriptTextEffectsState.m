@implementation CKTranscriptTextEffectsState

- (CKTranscriptTextEffectsState)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_isReady) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranscriptTextEffectsState();
  return -[CKTranscriptTextEffectsState init](&v3, sel_init);
}

- (BOOL)inTransition
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition;
  swift_beginAccess();
  return *v2;
}

- (void)setInTransition:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasAttention
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
  swift_beginAccess();
  return *v2;
}

- (void)setHasAttention:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isPaused
{
  _BYTE *v3;
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v3 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  if (*v3 == 1
    && (v4 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition, swift_beginAccess(), (*v4 & 1) == 0))
  {
    v6 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
    swift_beginAccess();
    v5 = *v6 ^ 1;
  }
  else
  {
    v5 = 1;
  }
  return v5 & 1;
}

@end
