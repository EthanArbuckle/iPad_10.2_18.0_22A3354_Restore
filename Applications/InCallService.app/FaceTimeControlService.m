@implementation FaceTimeControlService

- (void)callStatusDidChange:(id)a3
{
  sub_100151E4C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, sub_100151D34);
}

- (void)faceTimeIDStatusDidChange:(id)a3
{
  sub_100151E4C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, sub_100151D88);
}

@end
