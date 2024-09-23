@implementation ANAnnouncementRequest

- (ANAnnouncementRequest)initWithContent:(id)a3 destination:(id)a4
{
  id v7;
  id v8;
  ANAnnouncementRequest *v9;
  ANAnnouncementRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ANAnnouncementRequest;
  v9 = -[ANAnnouncementRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

+ (id)requestWithContent:(id)a3 destination:(id)a4
{
  id v5;
  id v6;
  ANAnnouncementRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ANAnnouncementRequest initWithContent:destination:]([ANAnnouncementRequest alloc], "initWithContent:destination:", v6, v5);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANAnnouncementRequest content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementRequest destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Content = %@, Destination = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ANAnnouncementContent *content;
  id v5;

  content = self->_content;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", content, CFSTR("Content"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("Destination"));

}

- (ANAnnouncementRequest)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementRequest *v5;
  uint64_t v6;
  ANAnnouncementContent *content;
  uint64_t v8;
  ANAnnouncementDestination *destination;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANAnnouncementRequest;
  v5 = -[ANAnnouncementRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (ANAnnouncementContent *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (ANAnnouncementDestination *)v8;

  }
  return v5;
}

- (ANAnnouncementContent)content
{
  return self->_content;
}

- (ANAnnouncementDestination)destination
{
  return self->_destination;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
