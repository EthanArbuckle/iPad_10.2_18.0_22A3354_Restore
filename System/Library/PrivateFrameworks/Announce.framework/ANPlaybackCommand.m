@implementation ANPlaybackCommand

- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 announcementIdentifiers:(id)a5
{
  id v9;
  ANPlaybackCommand *v10;
  ANPlaybackCommand *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ANPlaybackCommand;
  v10 = -[ANPlaybackCommand init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_operation = a3;
    v10->_options = a4;
    objc_storeStrong((id *)&v10->_announcementIdentifiers, a5);
  }

  return v11;
}

- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 forRecipient:(id)a5
{
  ANPlaybackCommand *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ANPlaybackCommand;
  result = -[ANPlaybackCommand init](&v8, sel_init, a3, a4, a5);
  if (result)
  {
    result->_operation = a3;
    result->_options = a4;
  }
  return result;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = CFSTR("Stop");
  switch(-[ANPlaybackCommand operation](self, "operation"))
  {
    case 0uLL:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = -[ANPlaybackCommand options](self, "options");
      -[ANPlaybackCommand announcementIdentifiers](self, "announcementIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      -[ANPlaybackCommand announcementIdentifiers](self, "announcementIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Play [options = %lu, count = %lu, %@]"), v5, v7, v8);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      return v3;
    case 2uLL:
      v3 = CFSTR("Next");
      break;
    case 3uLL:
      v3 = CFSTR("Previous");
      break;
    default:
      v3 = CFSTR("Unknown");
      break;
  }
  return v3;
}

+ (id)playCommandWithOptions:(unint64_t)a3 announcementIdentifiers:(id)a4
{
  id v5;
  ANPlaybackCommand *v6;

  v5 = a4;
  v6 = -[ANPlaybackCommand initWithPlaybackOperation:options:announcementIdentifiers:]([ANPlaybackCommand alloc], "initWithPlaybackOperation:options:announcementIdentifiers:", 0, a3, v5);

  return v6;
}

+ (ANPlaybackCommand)stopCommand
{
  ANPlaybackCommand *v2;

  v2 = [ANPlaybackCommand alloc];
  return -[ANPlaybackCommand initWithPlaybackOperation:options:announcementIdentifiers:](v2, "initWithPlaybackOperation:options:announcementIdentifiers:", 1, 0, MEMORY[0x24BDBD1A8]);
}

+ (ANPlaybackCommand)nextCommand
{
  ANPlaybackCommand *v2;

  v2 = [ANPlaybackCommand alloc];
  return -[ANPlaybackCommand initWithPlaybackOperation:options:announcementIdentifiers:](v2, "initWithPlaybackOperation:options:announcementIdentifiers:", 2, 0, MEMORY[0x24BDBD1A8]);
}

+ (ANPlaybackCommand)previousCommand
{
  ANPlaybackCommand *v2;

  v2 = [ANPlaybackCommand alloc];
  return -[ANPlaybackCommand initWithPlaybackOperation:options:announcementIdentifiers:](v2, "initWithPlaybackOperation:options:announcementIdentifiers:", 3, 0, MEMORY[0x24BDBD1A8]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t operation;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  operation = self->_operation;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", operation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("Command"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_options);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("Options"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_announcementIdentifiers, CFSTR("AnnouncementIdentifiers"));
}

- (ANPlaybackCommand)initWithCoder:(id)a3
{
  id v4;
  ANPlaybackCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *announcementIdentifiers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ANPlaybackCommand;
  v5 = -[ANPlaybackCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Command"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_operation = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v7, "unsignedIntegerValue");
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("AnnouncementIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    announcementIdentifiers = v5->_announcementIdentifiers;
    v5->_announcementIdentifiers = (NSArray *)v11;

  }
  return v5;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)announcementIdentifiers
{
  return self->_announcementIdentifiers;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_announcementIdentifiers, 0);
}

@end
