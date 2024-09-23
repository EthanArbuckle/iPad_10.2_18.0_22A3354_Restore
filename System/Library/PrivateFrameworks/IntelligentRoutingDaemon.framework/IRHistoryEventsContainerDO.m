@implementation IRHistoryEventsContainerDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyEvents, 0);
}

- (IRHistoryEventsContainerDO)initWithHistoryEvents:(id)a3
{
  id v5;
  IRHistoryEventsContainerDO *v6;
  IRHistoryEventsContainerDO *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRHistoryEventsContainerDO;
  v6 = -[IRHistoryEventsContainerDO init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_historyEvents, a3);

  return v7;
}

- (NSArray)historyEvents
{
  return self->_historyEvents;
}

+ (IRHistoryEventsContainerDO)historyEventsContainerDOWithHistoryEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHistoryEvents:", v4);

  return (IRHistoryEventsContainerDO *)v5;
}

- (id)copyWithReplacementHistoryEvents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHistoryEvents:", v3);

  return v4;
}

- (BOOL)isEqualToHistoryEventsContainerDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSArray *historyEvents;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = self->_historyEvents != 0,
        objc_msgSend(v4, "historyEvents"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    v11 = 0;
  }
  else
  {
    historyEvents = self->_historyEvents;
    if (historyEvents)
    {
      objc_msgSend(v5, "historyEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSArray isEqual:](historyEvents, "isEqual:", v10);

    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  IRHistoryEventsContainerDO *v4;
  IRHistoryEventsContainerDO *v5;
  BOOL v6;

  v4 = (IRHistoryEventsContainerDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRHistoryEventsContainerDO isEqualToHistoryEventsContainerDO:](self, "isEqualToHistoryEventsContainerDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_historyEvents, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRHistoryEventsContainerDO)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IRHistoryEventsContainerDO *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("historyEvents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_5;
LABEL_6:
    self = -[IRHistoryEventsContainerDO initWithHistoryEvents:](self, "initWithHistoryEvents:", v8);
    v17 = self;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRHistoryEventsContainerDO key \"historyEvents\" (expected %@, decoded %@)"), v10, v12, 0);
  v19 = *MEMORY[0x24BDD0FC8];
  v20[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRHistoryEventsContainerDOOCNTErrorDomain"), 3, v14);
  objc_msgSend(v4, "failWithError:", v15);

LABEL_5:
  v17 = 0;
LABEL_7:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *historyEvents;

  historyEvents = self->_historyEvents;
  if (historyEvents)
    objc_msgSend(a3, "encodeObject:forKey:", historyEvents, CFSTR("historyEvents"));
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRHistoryEventsContainerDO | historyEvents:%@>"), self->_historyEvents);
}

@end
