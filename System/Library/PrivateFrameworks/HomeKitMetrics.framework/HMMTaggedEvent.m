@implementation HMMTaggedEvent

- (HMMTaggedEvent)initWithTag:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  HMMTaggedEvent *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HMMTaggedEvent initWithTag:time:data:](self, "initWithTag:time:data:", v7, clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240, v6);

  return v8;
}

- (HMMTaggedEvent)initWithTag:(id)a3 time:(int64_t)a4 data:(id)a5
{
  id v9;
  id v10;
  HMMTaggedEvent *v11;
  HMMTaggedEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMTaggedEvent;
  v11 = -[HMMTaggedEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tagName, a3);
    v12->_tagTime = a4;
    objc_storeStrong((id *)&v12->_tagData, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMMTaggedEvent tagName](self, "tagName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMMTaggedEvent tagTime](self, "tagTime");
  -[HMMTaggedEvent tagData](self, "tagData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%lu/%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (int64_t)tagTime
{
  return self->_tagTime;
}

- (NSDictionary)tagData
{
  return self->_tagData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagData, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
}

@end
