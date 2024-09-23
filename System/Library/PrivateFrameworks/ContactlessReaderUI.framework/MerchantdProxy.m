@implementation MerchantdProxy

- (void)tapUIDidLoad
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_tapUIDidLoad);
}

- (void)tapUIRequestingCancel
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_tapUIRequestingCancel);
}

- (void)tapUIRequestingRetry
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_tapUIRequestingRetry);
}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  swift_retain();
  sub_22F8D9894(a3, a4);
  swift_release();
}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  sub_22F8D9A8C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, (SEL *)&selRef_pinDataReceivedWithPinData_isCardRequest_isAccessibilityEnabled_accessibilityEntryType_drawNumberFailures_);
}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  sub_22F8D9A8C((uint64_t)self, (uint64_t)a2, a3, a4, a5, a6, a7, (SEL *)&selRef_reportPINErrorWithError_isCardRequest_isAccessibilityEnabled_accessibilityEntryType_drawNumberFailures_);
}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_22F98EDB8();
  v7 = v6;
  swift_retain();
  sub_22F8D9AA0(a3, v5, v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  swift_retain();
  sub_22F8D9DBC(a3, a4);
  swift_release();
}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
  void *v3;

  v3 = *(void **)self->remoteProxy;
  if (v3)
    objc_msgSend(v3, sel_setVoiceOverWithEnabled_, a3);
}

- (void)pinUIDidLoad
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_pinUIDidLoad);
}

- (void)pinValidateSession
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_pinValidateSession);
}

- (void)pinAuthNeeded
{
  void *v2;

  v2 = *(void **)self->remoteProxy;
  if (v2)
    objc_msgSend(v2, sel_pinAuthNeeded);
}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = sub_22F98EDB8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  sub_22F8DA0FC(v5, v7, a4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
  uint64_t v4;
  void *v5;

  v4 = MEMORY[0x2348A68F8](self->tapUI, a2);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();
    objc_msgSend(v5, sel_updateWithTransactionEvent_, a3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  sub_22F98EF44();
  swift_retain();
  sub_22F8DA270();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)closeUI
{
  sub_22F8DA628((uint64_t)self, (uint64_t)a2, "MerchantdProxy | closeUI", (SEL *)&selRef_closeUI);
}

- (void)closeUIImmediate
{
  sub_22F8DA628((uint64_t)self, (uint64_t)a2, "MerchantdProxy | closeImmediate", (SEL *)&selRef_closeUIImmediate);
}

- (void)requiresCardPIN:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_22F8DA668((uint64_t)v3);

  swift_release();
}

- (void)closePINUI
{
  swift_retain();
  sub_22F8DA838();
  swift_release();
}

- (void)closePINUIImmediate
{
  uint64_t v2;
  void *v3;

  v2 = MEMORY[0x2348A68F8](self->pinUI, a2);
  if (v2)
  {
    v3 = (void *)v2;
    swift_retain();
    objc_msgSend(v3, sel_closePINUIImmediate);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)errorInDaemonWithError:(int64_t)a3
{
  sub_22F870E04((uint64_t)self, (uint64_t)a2, a3, sub_22F8DAA48);
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
  sub_22F870E04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_22F8DAE0C);
}

@end
