@implementation ANAnalyticsGroup

- (ANAnalyticsGroup)init
{
  ANAnalyticsGroup *v2;
  uint64_t v3;
  NSMutableArray *announcements;
  uint64_t v5;
  NSMutableArray *metadata;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ANAnalyticsGroup;
  v2 = -[ANAnalyticsGroup init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    announcements = v2->_announcements;
    v2->_announcements = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    metadata = v2->_metadata;
    v2->_metadata = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)addAnnouncement:(id)a3 metadata:(id)a4
{
  NSMutableArray *announcements;
  id v7;

  announcements = self->_announcements;
  v7 = a4;
  -[NSMutableArray addObject:](announcements, "addObject:", a3);
  -[NSMutableArray addObject:](self->_metadata, "addObject:", v7);

}

- (NSArray)announcements
{
  return &self->_announcements->super;
}

- (NSArray)metadata
{
  return &self->_metadata->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_announcements, 0);
}

@end
