@implementation CRKSetClassroomBadgeCountRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetClassroomBadgeCountRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetClassroomBadgeCountRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKSetClassroomBadgeCountRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_badgeCount = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKSetClassroomBadgeCountRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKSetClassroomBadgeCountRequest badgeCount](self, "badgeCount", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("badgeCount"));

}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

@end
