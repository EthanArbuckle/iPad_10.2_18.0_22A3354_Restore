@implementation DAUserInterruptAlert

- (DAUserInterruptAlert)initWithSuiteName:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  DAUserInterruptAlert *v9;
  id v10;
  id handler;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DAUserInterruptAlert;
  v9 = -[DAUserInterruptAlert init](&v13, "init");
  if (v9)
  {
    v10 = objc_retainBlock(v8);
    handler = v9->_handler;
    v9->_handler = v10;

    objc_storeStrong((id *)&v9->_suiteName, a3);
  }

  return v9;
}

- (void)activate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlert suiteName](self, "suiteName"));
  v10 = sub_100012AD4(CFSTR("SKIP_SUITE"), CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v17 = (id)objc_claimAutoreleasedReturnValue(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DAPlatform currentPlatform](DAPlatform, "currentPlatform"));
  v12 = sub_1000129FC(CFSTR("SKIP"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = sub_1000129FC(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlert handler](self, "handler"));
  objc_msgSend(v11, "activateSimpleAlertWithTitle:message:defaultButtonName:cancelButtonName:handler:", v17, 0, v13, v15, v16);

}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
  objc_storeStrong((id *)&self->_suiteName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
