@implementation BBDismissalSyncBulletinMatch

- (BBDismissalSyncBulletinMatch)initWithDismissalID:(id)a3 andItem:(id)a4
{
  id v6;
  id v7;
  BBDismissalSyncBulletinMatch *v8;
  uint64_t v9;
  NSString *dismissalID;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BBDismissalSyncBulletinMatch;
  v8 = -[BBDismissalSyncBulletinMatch init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dismissalID = v8->_dismissalID;
    v8->_dismissalID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_dismissalItem, a4);
  }

  return v8;
}

- (BBDismissalSyncBulletinMatch)initWithDismissalDictionaryItem:(id)a3
{
  id v5;
  BBDismissalSyncBulletinMatch *v6;
  BBDismissalSyncBulletinMatch *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBDismissalSyncBulletinMatch;
  v6 = -[BBDismissalSyncBulletinMatch init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dismissalItem, a3);

  return v7;
}

- (unint64_t)feeds
{
  return -[BBDismissalItem feeds](self->_dismissalItem, "feeds");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; sectionID:%@; dismissalItem:%@; dismissalID:%@>"),
               objc_opt_class(),
               self,
               self->_sectionID,
               self->_dismissalItem,
               self->_dismissalID);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BBDismissalItem)dismissalItem
{
  return self->_dismissalItem;
}

- (void)setDismissalItem:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalItem, a3);
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFeeds:(unint64_t)a3
{
  self->_feeds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_dismissalItem, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
