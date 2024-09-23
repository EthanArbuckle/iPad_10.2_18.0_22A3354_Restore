@implementation IEEvent

- (IEEvent)initWithName:(id)a3
{
  id v5;
  IEEvent *v6;
  IEEvent *v7;
  NSString *eventId;
  NSDictionary *slots;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IEEvent;
  v6 = -[IEEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    eventId = v7->_eventId;
    v7->_eventId = (NSString *)&stru_24F544478;

    slots = v7->_slots;
    v7->_slots = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v7;
}

- (IEEvent)initWithName:(id)a3 withId:(id)a4
{
  id v7;
  id v8;
  IEEvent *v9;
  IEEvent *v10;
  NSDictionary *slots;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEEvent;
  v9 = -[IEEvent init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_eventId, a4);
    slots = v10->_slots;
    v10->_slots = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v10;
}

- (IEEvent)initWithId:(id)a3
{
  id v5;
  IEEvent *v6;
  IEEvent *v7;
  NSString *name;
  NSDictionary *slots;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IEEvent;
  v6 = -[IEEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    name = v6->_name;
    v6->_name = (NSString *)&stru_24F544478;

    objc_storeStrong((id *)&v7->_eventId, a3);
    slots = v7->_slots;
    v7->_slots = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v7;
}

- (IEEvent)initWithId:(id)a3 withName:(id)a4
{
  id v7;
  id v8;
  IEEvent *v9;
  IEEvent *v10;
  NSDictionary *slots;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEEvent;
  v9 = -[IEEvent init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a4);
    objc_storeStrong((id *)&v10->_eventId, a3);
    slots = v10->_slots;
    v10->_slots = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v10;
}

+ (id)normalizeUtterance:(id)a3
{
  id v3;
  void *v4;
  void **v5;
  void *v6;
  void *__p[2];
  char v9;
  std::string v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    siri::intelligence::Utterances::GetNormalizedText(&v10, (uint64_t)__p);
    if (v9 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10.__r_.__value_.__l.__data_);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  IEEvent *v4;
  IEEvent *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;

  v4 = (IEEvent *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      v25 = 1;
    }
    else
    {
      v5 = v4;
      -[IEEvent name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IEEvent name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_14;
      -[IEEvent eventId](self, "eventId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IEEvent eventId](v5, "eventId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_14;
      -[IEEvent slots](self, "slots");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IEEvent slots](v5, "slots");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToDictionary:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_14;
      -[IEEvent producer](self, "producer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IEEvent producer](v5, "producer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
        goto LABEL_14;
      -[IEEvent parsers](self, "parsers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      -[IEEvent parsers](v5, "parsers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v19 == v21)
      {
        v22 = 0;
        do
        {
          -[IEEvent parsers](self, "parsers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

          v25 = v24 <= v22;
          if (v24 <= v22)
            break;
          -[IEEvent parsers](self, "parsers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndex:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[IEEvent parsers](v5, "parsers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndex:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v27, "isEqual:", v29);

          ++v22;
        }
        while ((v30 & 1) != 0);
      }
      else
      {
LABEL_14:
        v25 = 0;
      }

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)slots
{
  return self->_slots;
}

- (void)setSlots:(id)a3
{
  objc_storeStrong((id *)&self->_slots, a3);
}

- (NSArray)parsers
{
  return self->_parsers;
}

- (void)setParsers:(id)a3
{
  objc_storeStrong((id *)&self->_parsers, a3);
}

- (IENLParameters)producer
{
  return self->_producer;
}

- (void)setProducer:(id)a3
{
  objc_storeStrong((id *)&self->_producer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_producer, 0);
  objc_storeStrong((id *)&self->_parsers, 0);
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
}

@end
