@implementation ARGeoTrackingStatus

+ (id)initialStatus
{
  return -[ARGeoTrackingStatus initWithGeoTrackingState:accuracy:stateReason:failureReasons:]([ARGeoTrackingStatus alloc], "initWithGeoTrackingState:accuracy:stateReason:failureReasons:", 1, 0, 0, 0);
}

- (ARGeoTrackingStatus)initWithGeoTrackingState:(int64_t)a3 accuracy:(int64_t)a4 stateReason:(int64_t)a5 failureReasons:(int64_t)a6
{
  ARGeoTrackingStatus *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARGeoTrackingStatus;
  result = -[ARGeoTrackingStatus init](&v11, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_accuracy = a4;
    result->_stateReason = a5;
    result->_failureReasons = a6;
  }
  return result;
}

- (BOOL)isEqualPrivate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (-[ARGeoTrackingStatus isEqual:](self, "isEqual:", v4))
  {
    v5 = v4;
    v6 = -[ARGeoTrackingStatus failureReasons](self, "failureReasons");
    v7 = objc_msgSend(v5, "failureReasons");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  id v5;
  void *v6;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(v5, "initWithGeoTrackingState:accuracy:stateReason:failureReasons:", -[ARGeoTrackingStatus state](self, "state"), -[ARGeoTrackingStatus accuracy](self, "accuracy"), -[ARGeoTrackingStatus stateReason](self, "stateReason"), -[ARGeoTrackingStatus failureReasons](self, "failureReasons"));

    return v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ARGeoTrackingStatus *v4;
  ARGeoTrackingStatus *v5;
  ARGeoTrackingStatus *v6;
  ARGeoTrackingState v7;
  ARGeoTrackingAccuracy v8;
  ARGeoTrackingStateReason v9;
  BOOL v10;

  v4 = (ARGeoTrackingStatus *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[ARGeoTrackingStatus state](self, "state");
    if (v7 == -[ARGeoTrackingStatus state](v6, "state")
      && (v8 = -[ARGeoTrackingStatus accuracy](self, "accuracy"), v8 == -[ARGeoTrackingStatus accuracy](v6, "accuracy")))
    {
      v9 = -[ARGeoTrackingStatus stateReason](self, "stateReason");
      v10 = v9 == -[ARGeoTrackingStatus stateReason](v6, "stateReason");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
LABEL_7:
    v10 = 0;
  }
LABEL_11:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARGeoTrackingStatus)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  ARGeoTrackingStatus *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ARGeoTrackingStatus_state"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ARGeoTrackingStatus_accuracy"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ARGeoTrackingStatus_stateReason"));
  v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ARGeoTrackingStatus_failureReasons"));

  v9 = -[ARGeoTrackingStatus initWithGeoTrackingState:accuracy:stateReason:failureReasons:]([ARGeoTrackingStatus alloc], "initWithGeoTrackingState:accuracy:stateReason:failureReasons:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus state](self, "state"), CFSTR("ARGeoTrackingStatus_state"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus accuracy](self, "accuracy"), CFSTR("ARGeoTrackingStatus_accuracy"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus stateReason](self, "stateReason"), CFSTR("ARGeoTrackingStatus_stateReason"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus failureReasons](self, "failureReasons"), CFSTR("ARGeoTrackingStatus_failureReasons"));

}

- (ARGeoTrackingState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ARGeoTrackingAccuracy)accuracy
{
  return self->_accuracy;
}

- (ARGeoTrackingStateReason)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(int64_t)a3
{
  self->_stateReason = a3;
}

- (int64_t)failureReasons
{
  return self->_failureReasons;
}

@end
