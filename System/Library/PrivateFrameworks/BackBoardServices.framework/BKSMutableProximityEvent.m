@implementation BKSMutableProximityEvent

- (void)setTimestamp:(unint64_t)a3
{
  self->super._timestamp = a3;
}

- (void)setMode:(int)a3
{
  self->super._mode = a3;
}

- (void)setDetectionMask:(unsigned int)a3
{
  self->super._detectionMask = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSProximityDetectionMaskChangeEvent _initWithCopyOf:]([BKSProximityDetectionMaskChangeEvent alloc], self);
}

@end
