@implementation BBAttachments

- (void)addAttachmentOfType:(int64_t)a3
{
  NSCountedSet *additionalAttachments;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  additionalAttachments = self->_additionalAttachments;
  if (!additionalAttachments)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    v7 = self->_additionalAttachments;
    self->_additionalAttachments = v6;

    additionalAttachments = self->_additionalAttachments;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](additionalAttachments, "addObject:", v8);

}

- (unint64_t)numberOfAdditionalAttachments
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[BBAttachments numberOfAdditionalAttachmentsOfType:](self, "numberOfAdditionalAttachmentsOfType:", v3++);
  while (v3 != 7);
  return v4;
}

- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3
{
  NSCountedSet *additionalAttachments;
  void *v4;
  unint64_t v5;

  additionalAttachments = self->_additionalAttachments;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSCountedSet countForObject:](additionalAttachments, "countForObject:", v4);

  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[BBAttachments primaryType](self, "primaryType");
  -[BBAttachments additionalAttachments](self, "additionalAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BBAttachments *v4;
  BOOL v5;

  v4 = (BBAttachments *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[BBAttachments isEqualToAttachments:](self, "isEqualToAttachments:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAttachments:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[BBAttachments primaryType](self, "primaryType");
  if (v5 == objc_msgSend(v4, "primaryType"))
  {
    v6 = 0;
    do
    {
      v7 = -[BBAttachments numberOfAdditionalAttachmentsOfType:](self, "numberOfAdditionalAttachmentsOfType:", v6);
      v8 = v7 == objc_msgSend(v4, "numberOfAdditionalAttachmentsOfType:", v6);
      if (!v8)
        break;
    }
    while (v6++ < 6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPrimaryType:", -[BBAttachments primaryType](self, "primaryType"));
  -[BBAttachments additionalAttachments](self, "additionalAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalAttachments:", v7);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAttachments)initWithCoder:(id)a3
{
  id v4;
  BBAttachments *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBAttachments;
  v5 = -[BBAttachments init](&v11, sel_init);
  if (v5)
  {
    -[BBAttachments setPrimaryType:](v5, "setPrimaryType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("primaryType")));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("additionalAttachments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAttachments setAdditionalAttachments:](v5, "setAdditionalAttachments:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBAttachments primaryType](self, "primaryType"), CFSTR("primaryType"));
  -[BBAttachments additionalAttachments](self, "additionalAttachments");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("additionalAttachments"));

}

- (int64_t)primaryType
{
  return self->primaryType;
}

- (void)setPrimaryType:(int64_t)a3
{
  self->primaryType = a3;
}

- (NSCountedSet)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalAttachments, 0);
}

@end
