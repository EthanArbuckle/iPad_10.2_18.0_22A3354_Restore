@implementation EndSharingRelationshipManager

- (void)endSharingRelationshipFailureAcknowledged:(id)a3
{
  sub_231DE1770((uint64_t)self, (uint64_t)a2, a3, "[%{public}s]: Received delete profile acknowledged notification", (void (*)(_QWORD))sub_231DE03C0);
}

- (void)endSharingRelationshipRequested:(id)a3
{
  sub_231DE1770((uint64_t)self, (uint64_t)a2, a3, "[%{public}s]: Received delete profile started notification", (void (*)(_QWORD))sub_231DDEF6C);
}

@end
