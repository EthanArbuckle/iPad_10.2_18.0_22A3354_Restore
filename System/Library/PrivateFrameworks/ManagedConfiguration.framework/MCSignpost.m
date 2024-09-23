@implementation MCSignpost

- (MCSignpost)initWithProcess:(id)a3 type:(unint64_t)a4 feature:(id)a5 timestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  MCSignpost *v13;
  uint64_t v14;
  NSString *process;
  uint64_t v16;
  NSString *feature;
  uint64_t v18;
  NSDate *timestamp;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MCSignpost;
  v13 = -[MCSignpost init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    process = v13->_process;
    v13->_process = (NSString *)v14;

    v13->_type = a4;
    v16 = objc_msgSend(v11, "copy");
    feature = v13->_feature;
    v13->_feature = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v18;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MCSignpost *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  MCSignpost *v9;

  v4 = [MCSignpost alloc];
  -[MCSignpost process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCSignpost type](self, "type");
  -[MCSignpost feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSignpost timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCSignpost initWithProcess:type:feature:timestamp:](v4, "initWithProcess:type:feature:timestamp:", v5, v6, v7, v8);

  return v9;
}

- (NSString)process
{
  return self->_process;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)feature
{
  return self->_feature;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
