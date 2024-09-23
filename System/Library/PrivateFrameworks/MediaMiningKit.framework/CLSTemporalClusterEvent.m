@implementation CLSTemporalClusterEvent

- (NSString)name
{
  return self->_name;
}

- (unsigned)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (CLSTemporalClusterEvent)initWithName:(id)a3 category:(unsigned __int8)a4
{
  id v7;
  CLSTemporalClusterEvent *v8;
  CLSTemporalClusterEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSTemporalClusterEvent;
  v8 = -[CLSTemporalClusterEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_category = a4;
  }

  return v9;
}

- (CLSTemporalClusterEvent)initWithPortraitEvent:(id)a3
{
  id v4;
  CLSTemporalClusterEvent *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSTemporalClusterEvent;
  v5 = -[CLSTemporalClusterEvent init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_category = objc_msgSend((id)objc_opt_class(), "_categoryFromPortraitEventCategory:", objc_msgSend(v4, "suggestedEventCategory"));
  }

  return v5;
}

+ (unsigned)_categoryFromPortraitEventCategory:(unsigned __int8)a3
{
  if (a3 == 8)
    return 1;
  else
    return 2 * (a3 == 12);
}

@end
