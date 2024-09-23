@implementation LNISIconImage

- (LNISIconImage)initWithUTType:(id)a3
{
  return -[LNISIconImage initWithIconType:identifier:](self, "initWithIconType:identifier:", 1, a3);
}

- (LNISIconImage)initWithAppBundleIdentifier:(id)a3
{
  return -[LNISIconImage initWithIconType:identifier:](self, "initWithIconType:identifier:", 0, a3);
}

- (LNISIconImage)initWithIconType:(int64_t)a3 identifier:(id)a4
{
  id v8;
  LNISIconImage *v9;
  LNISIconImage *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNISIconImage.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)LNISIconImage;
  v9 = -[LNImage initWithSystemImageNamed:](&v13, sel_initWithSystemImageNamed_, &stru_1E39A2988);
  v10 = v9;
  if (v9)
  {
    v9->_iconType = a3;
    objc_storeStrong((id *)&v9->_identifier, a4);
  }

  return v10;
}

- (LNISIconImage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  LNISIconImage *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("iconType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[LNISIconImage initWithIconType:identifier:](self, "initWithIconType:identifier:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNISIconImage;
  v4 = a3;
  -[LNImage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNISIconImage iconType](self, "iconType", v6.receiver, v6.super_class), CFSTR("iconType"));
  -[LNISIconImage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (int64_t)iconType
{
  return self->_iconType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
