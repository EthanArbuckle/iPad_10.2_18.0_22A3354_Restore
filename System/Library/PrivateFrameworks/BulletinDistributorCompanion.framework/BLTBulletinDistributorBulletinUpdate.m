@implementation BLTBulletinDistributorBulletinUpdate

+ (id)bulletinUpdateWithType:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5
{
  id v7;
  BLTBulletinDistributorBulletinUpdate *v8;

  v7 = a4;
  v8 = objc_alloc_init(BLTBulletinDistributorBulletinUpdate);
  -[BLTBulletinDistributorBulletinUpdate setUpdateType:](v8, "setUpdateType:", a3);
  -[BLTBulletinDistributorBulletinUpdate setBulletin:](v8, "setBulletin:", v7);

  -[BLTBulletinDistributorBulletinUpdate setFeed:](v8, "setFeed:", a5);
  return v8;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
