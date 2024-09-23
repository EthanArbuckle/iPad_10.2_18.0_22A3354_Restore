@implementation _CDEventIndexerBookmark

- (id)initWithEarliestCreationDate:(void *)a3 latestCreationDate:(void *)a4 latestTombstoneDate:(void *)a5 version:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  objc_super v15;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)_CDEventIndexerBookmark;
    v13 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      a1[4] = a5;
    }
  }

  return a1;
}

+ (id)baseBookmarkWithVersion:(uint64_t)a1
{
  objc_class *v3;
  void *v4;
  id *v5;

  v3 = (objc_class *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:]((id *)[v3 alloc], v4, v4, v4, a2);

  return v5;
}

- (id)updatedBookmarkWithEarliestCreationDate:(id *)a1
{
  id *v2;
  id v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    v5 = v2[2];
    v6 = v2[3];
    v7 = v2[4];
    v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v3, v8, v6, v7);

  }
  return v2;
}

- (id)updatedBookmarkWithLatestCreationDate:(id *)a1
{
  id *v2;
  id v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    v5 = v2[1];
    v7 = v2[3];
    v6 = v2[4];
    v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v8, v3, v7, v6);

  }
  return v2;
}

- (id)updatedBookmarkWithLatestTombstoneDate:(id *)a1
{
  id *v2;
  id v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    v5 = v2[1];
    v6 = v2[2];
    v7 = v2[4];
    v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v8, v6, v3, v7);

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDEventIndexerBookmark)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _CDEventIndexerBookmark *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestCreationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestCreationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestTombstoneDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));

  v9 = (_CDEventIndexerBookmark *)-[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:]((id *)&self->super.isa, v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *latestCreationDate;
  int64_t version;
  id v6;

  v6 = a3;
  if (self)
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_earliestCreationDate, CFSTR("earliestCreationDate"));
    latestCreationDate = self->_latestCreationDate;
  }
  else
  {
    objc_msgSend(v6, "encodeObject:forKey:", 0, CFSTR("earliestCreationDate"));
    latestCreationDate = 0;
  }
  objc_msgSend(v6, "encodeObject:forKey:", latestCreationDate, CFSTR("latestCreationDate"));
  if (self)
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_latestTombstoneDate, CFSTR("latestTombstoneDate"));
    version = self->_version;
  }
  else
  {
    objc_msgSend(v6, "encodeObject:forKey:", 0, CFSTR("latestTombstoneDate"));
    version = 0;
  }
  objc_msgSend(v6, "encodeInteger:forKey:", version, CFSTR("version"));

}

- (unint64_t)hash
{
  NSDate *earliestCreationDate;
  NSDate *v4;
  uint64_t v5;
  NSDate *latestCreationDate;
  NSDate *v7;
  uint64_t v8;
  NSDate *latestTombstoneDate;
  uint64_t v10;
  int64_t version;
  unint64_t v12;

  if (self)
    earliestCreationDate = self->_earliestCreationDate;
  else
    earliestCreationDate = 0;
  v4 = earliestCreationDate;
  v5 = -[NSDate hash](v4, "hash");
  if (self)
    latestCreationDate = self->_latestCreationDate;
  else
    latestCreationDate = 0;
  v7 = latestCreationDate;
  v8 = -[NSDate hash](v7, "hash");
  if (self)
    latestTombstoneDate = self->_latestTombstoneDate;
  else
    latestTombstoneDate = 0;
  v10 = -[NSDate hash](latestTombstoneDate, "hash");
  if (self)
    version = self->_version;
  else
    version = 0;
  v12 = v8 ^ v5 ^ v10 ^ version;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _CDEventIndexerBookmark *v4;
  _CDEventIndexerBookmark *v5;
  id *v6;
  NSDate *earliestCreationDate;
  NSDate *v8;
  id v9;
  NSDate *latestCreationDate;
  NSDate *v11;
  id v12;
  NSDate *latestTombstoneDate;
  id v14;
  NSDate *v15;
  int64_t version;
  BOOL v17;
  objc_super v19;

  v4 = (_CDEventIndexerBookmark *)a3;
  v5 = v4;
  if (self == v4)
  {
    v17 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v19.receiver = self,
             v19.super_class = (Class)_CDEventIndexerBookmark,
             -[_CDEventIndexerBookmark isEqual:](&v19, sel_isEqual_, v5)))
  {
    v6 = v5;
    if (self)
      earliestCreationDate = self->_earliestCreationDate;
    else
      earliestCreationDate = 0;
    v8 = earliestCreationDate;
    v9 = v6[1];
    if (-[NSDate isEqualToDate:](v8, "isEqualToDate:", v9))
    {
      if (self)
        latestCreationDate = self->_latestCreationDate;
      else
        latestCreationDate = 0;
      v11 = latestCreationDate;
      v12 = v6[2];
      if (-[NSDate isEqualToDate:](v11, "isEqualToDate:", v12))
      {
        if (self)
          latestTombstoneDate = self->_latestTombstoneDate;
        else
          latestTombstoneDate = 0;
        v14 = v6[3];
        v15 = latestTombstoneDate;
        if (-[NSDate isEqualToDate:](v15, "isEqualToDate:", v14))
        {
          if (self)
            version = self->_version;
          else
            version = 0;
          v17 = version == (_QWORD)v6[4];
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  int64_t version;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self)
  {
    v5 = self->_earliestCreationDate;
    v6 = self->_latestCreationDate;
    v7 = self->_latestTombstoneDate;
    version = self->_version;
  }
  else
  {
    v7 = 0;
    v5 = 0;
    v6 = 0;
    version = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> earliest creation date: %@, latest creation date: %@, latest tombstone date: %@, version: %ld"), v4, self, v5, v6, v7, version);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTombstoneDate, 0);
  objc_storeStrong((id *)&self->_latestCreationDate, 0);
  objc_storeStrong((id *)&self->_earliestCreationDate, 0);
}

@end
