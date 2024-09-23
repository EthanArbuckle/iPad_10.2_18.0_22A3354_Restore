@implementation HKMCSampleInfo

- (HKMCSampleInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKMCSampleInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[HKMCSampleInfo initWithAnchor:UUID:deleted:](self, "initWithAnchor:UUID:deleted:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Anchor")), v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Deleted")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t anchor;
  id v5;

  anchor = self->_anchor;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", anchor, CFSTR("Anchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("Deleted"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_anchor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_deleted)
    v6 = CFSTR(" (deleted)");
  else
    v6 = &stru_24D99FB00;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v4, self->_UUID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HKMCSampleInfo)initWithAnchor:(int64_t)a3 UUID:(id)a4 deleted:(BOOL)a5
{
  id v8;
  HKMCSampleInfo *v9;
  HKMCSampleInfo *v10;
  uint64_t v11;
  NSUUID *UUID;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMCSampleInfo;
  v9 = -[HKMCSampleInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_anchor = a3;
    v11 = objc_msgSend(v8, "copy");
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;

    v10->_deleted = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HKMCSampleInfo *v4;
  HKMCSampleInfo *v5;
  NSUUID *UUID;
  NSUUID *v7;
  BOOL v8;

  v4 = (HKMCSampleInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = self->_anchor == v5->_anchor
        && ((UUID = self->_UUID, v7 = v5->_UUID, UUID == v7) || v7 && -[NSUUID isEqual:](UUID, "isEqual:"))
        && self->_deleted == v5->_deleted;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t anchor;

  anchor = self->_anchor;
  return -[NSUUID hash](self->_UUID, "hash") ^ anchor ^ self->_deleted;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
