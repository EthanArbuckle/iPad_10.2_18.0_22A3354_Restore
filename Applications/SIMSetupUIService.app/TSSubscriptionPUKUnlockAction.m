@implementation TSSubscriptionPUKUnlockAction

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSSubscriptionPUKUnlockAction;
  v5 = -[TSSubscriptionAction copyWithZone:](&v11, "copyWithZone:");
  v6 = -[NSString copyWithZone:](self->_puk, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_pin1, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  return v5;
}

- (id)copyByApplyingPUK:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = -[TSSubscriptionPUKUnlockAction copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)copyByApplyingPIN1:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = -[TSSubscriptionPUKUnlockAction copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (int64_t)actionType
{
  return 3;
}

- (int64_t)actionSubtype
{
  void *v3;
  id v4;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSSubscriptionPUKUnlockAction pin1](self, "pin1"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSSubscriptionPUKUnlockAction puk](self, "puk"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
    return 2;
  else
    return 1;
}

- (NSString)puk
{
  return self->_puk;
}

- (NSString)pin1
{
  return self->_pin1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin1, 0);
  objc_storeStrong((id *)&self->_puk, 0);
}

@end
