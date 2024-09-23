@implementation HIDEvent(HIDForceStageEventPrivate)

- (uint64_t)forceStageNextThreshold
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStageNextThreshold:()HIDForceStageEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStageNormalizedForce
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStageNormalizedForce:()HIDForceStageEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStageNormalizedForceVelocity
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStageNormalizedForceVelocity:()HIDForceStageEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStagePressedThreshold
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStagePressedThreshold:()HIDForceStageEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStageReleasedThreshold
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStageReleasedThreshold:()HIDForceStageEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStageStage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStageStage:()HIDForceStageEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)forceStageTransition
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStageTransition:()HIDForceStageEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end
