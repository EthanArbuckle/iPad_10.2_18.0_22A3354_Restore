@implementation MBSizeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBSizeInfo)initWithCoder:(id)a3
{
  id v4;
  MBSizeInfo *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBSizeInfo;
  v5 = -[MBSizeInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBSizeInfo setSize:](v5, "setSize:", objc_msgSend(v6, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBSizeInfo setState:](v5, "setState:", objc_msgSend(v7, "unsignedLongLongValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[MBSizeInfo size](self, "size"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MBSizeInfo state](self, "state"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("state"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MBSizeInfo *v4;

  v4 = objc_alloc_init(MBSizeInfo);
  -[MBSizeInfo setSize:](v4, "setSize:", -[MBSizeInfo size](self, "size"));
  -[MBSizeInfo setState:](v4, "setState:", -[MBSizeInfo state](self, "state"));
  return v4;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end
