@implementation SFPrivacyReportItem

- (SFPrivacyReportItem)initWithType:(int64_t)a3
{
  return -[SFPrivacyReportItem initWithType:userInfo:](self, "initWithType:userInfo:", a3, 0);
}

- (SFPrivacyReportItem)initWithType:(int64_t)a3 userInfo:(id)a4
{
  id v7;
  SFPrivacyReportItem *v8;
  SFPrivacyReportItem *v9;
  SFPrivacyReportItem *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportItem;
  v8 = -[SFPrivacyReportItem init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_userInfo, a4);
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  id userInfo;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    type = self->_type;
    if (type == objc_msgSend(v5, "type"))
    {
      userInfo = self->_userInfo;
      objc_msgSend(v5, "userInfo");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (userInfo == v8)
      {
        v11 = 1;
      }
      else
      {
        v9 = self->_userInfo;
        objc_msgSend(v5, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t type;

  type = self->_type;
  return objc_msgSend(self->_userInfo, "hash") ^ type;
}

- (int64_t)type
{
  return self->_type;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
}

@end
