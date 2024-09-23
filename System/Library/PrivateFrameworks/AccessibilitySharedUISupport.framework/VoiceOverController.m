@implementation VoiceOverController

- (void)keyboardWillShowWithNotification:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)self->_recognizedCommandIdentifier;
  swift_beginAccess();
  *(_BYTE *)(v4 + 40) = 24;
  v5 = a3;
  swift_retain();
  swift_retain();
  sub_21C794B88();

  swift_release();
  swift_release();
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)self->_recognizedCommandIdentifier;
  swift_beginAccess();
  *(_BYTE *)(v4 + 40) = 23;
  v5 = a3;
  swift_retain();
  swift_retain();
  sub_21C794B88();

  swift_release();
  swift_release();
}

- (void)_voiceOverEnabledChangedMacWithNotification:(id)a3
{
  sub_21C779F70((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21C77AA6C);
}

- (void)_votTrainingInfoDidUpdateWithNotification:(id)a3
{
  sub_21C779F70((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21C77AAF4);
}

- (void)_votTrainingSpeakingRateDidUpdateWithNotification:(id)a3
{
  sub_21C779F70((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21C77ABA4);
}

@end
