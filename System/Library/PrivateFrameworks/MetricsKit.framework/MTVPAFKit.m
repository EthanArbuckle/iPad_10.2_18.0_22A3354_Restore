@implementation MTVPAFKit

- (id)trackerWithPlayList:(id)a3
{
  return -[MTVPAFKit trackerWithPlayList:eventData:](self, "trackerWithPlayList:eventData:", a3, 0);
}

- (id)trackerWithPlayList:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;
  MTMediaActivityTracker *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MTMediaActivityTracker initWithVPAFKit:playlist:eventData:]([MTMediaActivityTracker alloc], "initWithVPAFKit:playlist:eventData:", self, v7, v6);

  return v8;
}

@end
