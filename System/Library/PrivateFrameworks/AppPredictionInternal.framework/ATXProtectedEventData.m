@implementation ATXProtectedEventData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventData, 0);
}

@end
