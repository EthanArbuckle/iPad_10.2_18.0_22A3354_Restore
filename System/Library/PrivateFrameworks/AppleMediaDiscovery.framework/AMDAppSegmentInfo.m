@implementation AMDAppSegmentInfo

- (AMDAppSegmentInfo)initWithAppIdentifier:(id)a3 andSegments:(id)a4
{
  AMDAppSegmentInfo *v4;
  AMDAppSegmentInfo *v7;
  objc_super v8;
  id v9;
  id location[2];
  AMDAppSegmentInfo *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDAppSegmentInfo;
  v11 = -[AMDAppSegmentInfo init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  -[AMDAppSegmentInfo setAppIdentifier:](v11, "setAppIdentifier:", location[0]);
  -[AMDAppSegmentInfo setSegments:](v11, "setSegments:", v9);
  v7 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isEqualToApp:(id)a3
{
  NSString *v4;
  id v5;
  char v6;
  char v7;
  id v8;
  char v9;
  NSSet *v10;
  id location[2];
  AMDAppSegmentInfo *v12;
  char v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDAppSegmentInfo appIdentifier](v12, "appIdentifier");
  v5 = (id)objc_msgSend(location[0], "appIdentifier");
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if ((-[NSString isEqual:](v4, "isEqual:") & 1) != 0)
  {
    v10 = -[AMDAppSegmentInfo segments](v12, "segments");
    v9 = 1;
    v8 = (id)objc_msgSend(location[0], "segments");
    v7 = 1;
    v6 = -[NSSet isEqual:](v10, "isEqual:");
  }
  v13 = v6 & 1;
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)segments
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end
