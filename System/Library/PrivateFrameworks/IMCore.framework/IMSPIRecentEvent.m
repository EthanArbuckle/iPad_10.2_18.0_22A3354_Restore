@implementation IMSPIRecentEvent

- (IMSPIRecentEvent)initWithHandle:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  IMSPIRecentEvent *v8;
  uint64_t v9;
  NSString *handle;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSPIRecentEvent;
  v8 = -[IMSPIRecentEvent init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    handle = v8->_handle;
    v8->_handle = (NSString *)v9;

    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v8;
}

- (IMSPIRecentEvent)initWithLabelID:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  IMSPIRecentEvent *v8;
  uint64_t v9;
  NSString *labelID;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSPIRecentEvent;
  v8 = -[IMSPIRecentEvent init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    labelID = v8->_labelID;
    v8->_labelID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSPIRecentEvent handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIRecentEvent labelID](self, "labelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIRecentEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMSPIRecentEvent: %p [Handle: %@  LabelID: %@ Date: %@]"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)labelID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabelID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
