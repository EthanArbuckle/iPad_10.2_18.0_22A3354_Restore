@implementation CASuspendNotification

- (void)willUnsuspend:(id)a3
{
  atomic_store(0, is_suspended);
}

- (void)willSuspend:(id)a3
{
  atomic_store(1u, is_suspended);
  CA::Render::post_notification(0x32u, 0, 0, 0);
}

@end
