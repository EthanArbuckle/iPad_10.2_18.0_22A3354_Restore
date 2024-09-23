@implementation FCHandlePushNotificationResult

- (id)copyWithZone:(_NSZone *)a3
{
  FCHandlePushNotificationResult *v4;
  BOOL v5;
  void *v6;

  v4 = -[FCHandlePushNotificationResult init](+[FCHandlePushNotificationResult allocWithZone:](FCHandlePushNotificationResult, "allocWithZone:", a3), "init");
  v5 = -[FCHandlePushNotificationResult wasHandled](self, "wasHandled");
  if (v4)
    v4->_handled = v5;
  -[FCHandlePushNotificationResult recordZoneIDs](self, "recordZoneIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v6);

  return v4;
}

- (void)setRecordZoneIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (BOOL)wasHandled
{
  return self->_handled;
}

- (NSSet)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
