@implementation DTTapStatusMemo

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4
{
  uint64_t v4;
  id v6;
  DTTapStatusMemo *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[DTTapStatusMemo initWithStatus:notice:info:timestamp:](self, "initWithStatus:notice:info:timestamp:", v4, v6, 0, mach_absolute_time());

  return v7;
}

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  DTTapStatusMemo *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = -[DTTapStatusMemo initWithStatus:notice:info:timestamp:](self, "initWithStatus:notice:info:timestamp:", v6, v9, v8, mach_absolute_time());

  return v10;
}

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5 timestamp:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  DTTapStatusMemo *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DTTapStatusMemo;
  v13 = -[DTTapStatusMemo init](&v16, sel_init);
  v14 = (DTTapStatusMemo *)v13;
  if (v13)
  {
    *((_DWORD *)v13 + 3) = a3;
    objc_storeStrong((id *)v13 + 3, a4);
    objc_storeStrong((id *)&v14->_notice, a5);
    *(_QWORD *)&v14->_status = a6;
  }

  return v14;
}

- (unsigned)status
{
  return *(&self->super._tapVersion + 1);
}

- (void)setStatus:(unsigned int)a3
{
  *(&self->super._tapVersion + 1) = a3;
}

- (unint64_t)timestamp
{
  return *(_QWORD *)&self->_status;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_status = a3;
}

- (NSString)notice
{
  return (NSString *)self->_timestamp;
}

- (void)setNotice:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSDictionary)info
{
  return (NSDictionary *)self->_notice;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_notice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
