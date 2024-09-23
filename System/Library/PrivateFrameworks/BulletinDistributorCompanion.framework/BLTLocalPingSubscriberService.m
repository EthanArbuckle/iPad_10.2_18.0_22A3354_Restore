@implementation BLTLocalPingSubscriberService

- (void)unsubscribeFromSectionID:(id)a3
{
  -[BLTBulletinDistributorSubscriber unsubscribeFromSectionID:](self->_subscriber, "unsubscribeFromSectionID:", a3);
}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
  -[BLTBulletinDistributorSubscriber subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:](self->_subscriber, "subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:", a3, a4, a5, a6);
}

- (void)sendBulletinSummary:(id)a3
{
  -[BLTBulletinDistributorSubscriber sendBulletinSummary:](self->_subscriber, "sendBulletinSummary:", a3);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  -[BLTBulletinDistributorSubscriber getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:](self->_subscriber, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", a3, a4, a5);
}

- (BLTBulletinDistributorSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
}

@end
