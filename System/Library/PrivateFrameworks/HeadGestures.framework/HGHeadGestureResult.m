@implementation HGHeadGestureResult

- (HGHeadGestureResult)init
{
  HGHeadGestureResult *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HGHeadGestureResult;
  v2 = -[HGHeadGestureResult init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[HGHeadGestureResult setUuid:](v2, "setUuid:", v3);

  }
  return v2;
}

- (unint64_t)headGesture
{
  return self->_headGesture;
}

- (void)setHeadGesture:(unint64_t)a3
{
  self->_headGesture = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)avgConfidence
{
  return self->_avgConfidence;
}

- (void)setAvgConfidence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)headGesturePart
{
  return self->_headGesturePart;
}

- (void)setHeadGesturePart:(unint64_t)a3
{
  self->_headGesturePart = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_avgConfidence, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
