@implementation EKUILogInitIfNeeded

void __EKUILogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create(EKUILogSubsystem, "EventKitUI");
  v1 = (void *)kEKUILogHandle;
  kEKUILogHandle = (uint64_t)v0;

  v2 = os_log_create(EKUILogSubsystem, "EventEditor");
  v3 = (void *)kEKUILogEventEditorHandle;
  kEKUILogEventEditorHandle = (uint64_t)v2;

  v4 = os_log_create(EKUILogSubsystem, "LocationSearch");
  v5 = (void *)kEKUILogLocationSearchHandle;
  kEKUILogLocationSearchHandle = (uint64_t)v4;

  v6 = os_log_create(EKUILogSubsystem, "Invitees");
  v7 = (void *)kEKUILogInviteesHandle;
  kEKUILogInviteesHandle = (uint64_t)v6;

}

@end
