@implementation _PADClassifier

- (_PADClassifier)init
{
  _PADClassifier *v2;
  _TtC10CoreIDVPAD21PADInternalClassifier *v3;
  _TtC10CoreIDVPAD21PADInternalClassifier *classifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PADClassifier;
  v2 = -[_PADClassifier init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10CoreIDVPAD21PADInternalClassifier);
    classifier = v2->_classifier;
    v2->_classifier = v3;

  }
  return v2;
}

- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6
{
  -[PADInternalClassifier startLiveness:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:](self->_classifier, "startLiveness:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:", a3, a4, a5, a6);
}

- (void)startLivenessVideoProcessing:(id)a3 onGestureStart:(id)a4 onGesturesFinished:(id)a5
{
  -[PADInternalClassifier startLiveness:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:](self->_classifier, "startLiveness:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:", a3, a4, &__block_literal_global, a5);
}

- (void)skipLivenessGesture
{
  -[PADInternalClassifier skipLivenessGesture](self->_classifier, "skipLivenessGesture");
}

- (void)skipRecordedLivenessGesture
{
  -[PADInternalClassifier skipLivenessGesture](self->_classifier, "skipLivenessGesture");
}

- (void)restartLivenessGesture
{
  -[PADInternalClassifier restartLivenessGesture](self->_classifier, "restartLivenessGesture");
}

- (void)pauseLiveness
{
  -[PADInternalClassifier pauseLiveness](self->_classifier, "pauseLiveness");
}

- (void)prepareToResumeLiveness
{
  -[PADInternalClassifier prepareToResumeLiveness](self->_classifier, "prepareToResumeLiveness");
}

- (void)resumeLiveness
{
  -[PADInternalClassifier resumeLiveness](self->_classifier, "resumeLiveness");
}

- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5
{
  -[PADInternalClassifier processLivenessFrame:withOptions:taOptions:](self->_classifier, "processLivenessFrame:withOptions:taOptions:", a3, *(_QWORD *)&a4.var0 & 0xFFFFFFLL, a5);
}

- (void)processRecordedLivenessFrame:(id)a3 withPRD:(BOOL)a4 FAC:(BOOL)a5
{
  _TtC10CoreIDVPAD21PADInternalClassifier *classifier;
  uint64_t v6;
  uint64_t v7;

  classifier = self->_classifier;
  v6 = 0x10000;
  if (!a4)
    v6 = 0;
  v7 = 257;
  if (!a5)
    v7 = 1;
  -[PADInternalClassifier processLivenessFrame:withOptions:taOptions:](classifier, "processLivenessFrame:withOptions:taOptions:", a3, v7 | v6, 1);
}

- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5
{
  -[PADInternalClassifier finishLivenessWithSelfie:performIDMatching:completion:](self->_classifier, "finishLivenessWithSelfie:performIDMatching:completion:", a3, a4, a5);
}

- (void)finishLivenessWithSelfie:(id)a3 idMatchingFaceprints:(id)a4 completion:(id)a5
{
  -[PADInternalClassifier finishLivenessWithSelfie:performIDMatching:completion:](self->_classifier, "finishLivenessWithSelfie:performIDMatching:completion:", a3, 1, a5);
}

- (void)finishLivenessStepUp:(id)a3
{
  -[PADInternalClassifier finishLivenessStepUp:](self->_classifier, "finishLivenessStepUp:", a3);
}

- (void)cancelWithCompletion:(id)a3
{
  -[PADInternalClassifier cancelWithCompletion:](self->_classifier, "cancelWithCompletion:", a3);
}

- (void)enableAccessibilityOptions
{
  -[PADInternalClassifier enableAccessibilityOptions](self->_classifier, "enableAccessibilityOptions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
}

@end
