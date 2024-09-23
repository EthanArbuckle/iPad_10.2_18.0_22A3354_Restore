@implementation BKHIDPointerEventRecord

- (void)setTrackingPointerMovement:(BOOL)a3
{
  self->_didTrackPointerMovement |= a3;
  self->_trackingPointerMovement = a3;
}

- (void)setTrackingButtonDown:(BOOL)a3
{
  self->_didTrackButtonDown |= a3;
  self->_trackingButtonDown = a3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[BKHIDPointerEventRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_senderInfo, CFSTR("senderInfo"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_destinations, CFSTR("destinations"));
  v7 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("destinationCaptureTime"), 4, self->_destinationCaptureTime);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_trackingButtonDown, CFSTR("trackingButtonDown"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", self->_trackingPointerMovement, CFSTR("trackingPointerMovement"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKHIDPointerEventRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKHIDPointerEventRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  double v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("trackedTime"), 4, v4 - self->_destinationCaptureTime);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_didTrackButtonDown, CFSTR("didTrackButtonDown"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_didTrackPointerMovement, CFSTR("didTrackPointerMovement"));
  return v3;
}

- (BKHIDEventSenderInfo)senderInfo
{
  return self->_senderInfo;
}

- (void)setSenderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_senderInfo, a3);
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (double)destinationCaptureTime
{
  return self->_destinationCaptureTime;
}

- (void)setDestinationCaptureTime:(double)a3
{
  self->_destinationCaptureTime = a3;
}

- (BOOL)trackingPointerMovement
{
  return self->_trackingPointerMovement;
}

- (BOOL)trackingButtonDown
{
  return self->_trackingButtonDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
}

@end
