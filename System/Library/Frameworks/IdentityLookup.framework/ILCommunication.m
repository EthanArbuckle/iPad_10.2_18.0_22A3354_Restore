@implementation ILCommunication

- (ILCommunication)initWithSender:(id)a3 dateReceived:(id)a4
{
  id v7;
  id v8;
  ILCommunication *v9;
  ILCommunication *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ILCommunication;
  v9 = -[ILCommunication init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sender, a3);
    objc_storeStrong((id *)&v10->_dateReceived, a4);
  }

  return v10;
}

- (ILCommunication)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILCommunication sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILCommunication dateReceived](self, "dateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p sender=%@ dateReceived=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILCommunication isEqualToCommunication:](self, "isEqualToCommunication:", v4);

  return v5;
}

- (BOOL)isEqualToCommunication:(ILCommunication *)communication
{
  ILCommunication *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = communication;
  -[ILCommunication dateReceived](self, "dateReceived");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILCommunication dateReceived](v4, "dateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToDate:", v6))
  {
    -[ILCommunication sender](self, "sender");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ILCommunication sender](v4, "sender");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (v7 | v8) == 0;
    if (v8)
      v9 = objc_msgSend((id)v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ILCommunication dateReceived](self, "dateReceived");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ILCommunication sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILCommunication)initWithCoder:(id)a3
{
  id v4;
  ILCommunication *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *sender;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *dateReceived;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ILCommunication;
  v5 = -[ILCommunication init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_sender);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_dateReceived);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ILCommunication sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ILCommunication dateReceived](self, "dateReceived");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateReceived);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSString)sender
{
  return self->_sender;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
