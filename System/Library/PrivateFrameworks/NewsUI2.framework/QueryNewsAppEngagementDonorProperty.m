@implementation QueryNewsAppEngagementDonorProperty

- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  char v4;

  if (a4 >= 5)
    v4 = 0;
  else
    v4 = a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7NewsUI235QueryNewsAppEngagementDonorProperty_locationSharingStatus) = v4;
}

@end
