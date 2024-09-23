@implementation BBBulletinUpdate

- (BBBulletinUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6;
  BBBulletinUpdate *v7;
  uint64_t v8;
  BBBulletin *bulletin;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBBulletinUpdate;
  v7 = -[BBBulletinUpdate init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bulletin = v7->_bulletin;
    v7->_bulletin = (BBBulletin *)v8;

    v7->_feeds = a4;
  }

  return v7;
}

- (id)typeDescription
{
  -[BBBulletinUpdate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[BBBulletinUpdate bulletin](self, "bulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[BBBulletinUpdate feeds](self, "feeds") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BBBulletinUpdate *v4;
  BBBulletinUpdate *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = (BBBulletinUpdate *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBBulletinUpdate bulletin](self, "bulletin");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletinUpdate bulletin](v5, "bulletin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        v8 = -[BBBulletinUpdate feeds](self, "feeds");
        v9 = v8 == -[BBBulletinUpdate feeds](v5, "feeds");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletinUpdate bulletin](self, "bulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Bulletin"));

  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBBulletinUpdate feeds](self, "feeds"), CFSTR("Feeds"));
  -[BBBulletinUpdate typeDescription](self, "typeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("Type"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[BBBulletinUpdate bulletin](self, "bulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("bulletin"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBBulletinUpdate feeds](self, "feeds"), CFSTR("feeds"));
}

- (BBBulletinUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BBBulletinUpdate *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feeds"));

  v7 = -[BBBulletinUpdate initWithBulletin:feeds:](self, "initWithBulletin:feeds:", v5, v6);
  return v7;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
