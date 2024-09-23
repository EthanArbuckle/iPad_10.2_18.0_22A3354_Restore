@implementation WeakTapUI

- (void)errorInDaemonWithError:(int64_t)a3
{
  sub_22F8A102C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_errorInDaemonWithError_);
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
  sub_22F8A102C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_updateWithTransactionEvent_);
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  sub_22F98EF44();
  v4 = MEMORY[0x2348A68F8](self->ui);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();
    v6 = (void *)sub_22F98EF38();
    objc_msgSend(v5, sel_vasReadSuccessWithMerchantNames_, v6);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)requiresCardPIN:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = MEMORY[0x2348A68F8](self->ui, a2);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a3;
    swift_retain();
    objc_msgSend(v5, sel_requiresCardPIN_, v6);

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)closeUI
{
  sub_22F8A0FB8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_closeUI);
}

- (void)closeUIImmediate
{
  sub_22F8A0FB8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_closeUIImmediate);
}

- (void)closePINUI
{
  sub_22F8A0FB8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_closePINUI);
}

- (void)closePINUIImmediate
{
  sub_22F8A0FB8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_closePINUIImmediate);
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
  sub_22F8A102C((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_updateSessionEventWithSessionEvent_);
}

@end
