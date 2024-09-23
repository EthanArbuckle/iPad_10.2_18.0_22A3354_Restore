@implementation MNNavigationServiceCallback_DidUpdateStepIndex

- (unint64_t)type
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateStepIndex;
  v4 = a3;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_segmentIndex, CFSTR("_segmentIndex"));

}

- (MNNavigationServiceCallback_DidUpdateStepIndex)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateStepIndex *v5;
  MNNavigationServiceCallback_DidUpdateStepIndex *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_DidUpdateStepIndex;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_stepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    v5->_segmentIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_segmentIndex"));
    v6 = v5;
  }

  return v5;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

@end
