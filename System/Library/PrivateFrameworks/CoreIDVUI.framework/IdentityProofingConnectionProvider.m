@implementation IdentityProofingConnectionProvider

- (void)didChangeProofingStatus
{
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_213FEB458();
    swift_release();
    swift_release();
  }
}

- (void)didShowExtendedReviewNotification
{
  swift_retain();
  sub_213F4D684();
  swift_release();
}

@end
