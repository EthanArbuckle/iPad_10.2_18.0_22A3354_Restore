@implementation CCSetChangeBookmark

- (CCSetChangeBookmark)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSetChangeBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 resourceVersion:(int64_t)a5 lastDeltaDate:(int64_t)a6 set:(id)a7
{
  id v13;
  id v14;
  id v15;
  CCSetChangeBookmark *v16;
  CCSetChangeBookmark *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CCSetChangeBookmark;
  v16 = -[CCSetChangeBookmark init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_contentVector, a3);
    objc_storeStrong((id *)&v17->_metaContentVector, a4);
    v17->_bookmarkVersion = 2;
    v17->_resourceVersion = a5;
    v17->_lastDeltaDate = a6;
    objc_storeStrong((id *)&v17->_set, a7);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CCSetChangeBookmark *v4;
  CCSetChangeBookmark *v5;
  BOOL v6;

  v4 = (CCSetChangeBookmark *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCSetChangeBookmark isEqualToSetChangeBookmark:](self, "isEqualToSetChangeBookmark:", v5);

  return v6;
}

- (BOOL)isEqualToSetChangeBookmark:(id)a3
{
  id v4;
  int64_t resourceVersion;
  int bookmarkVersion;
  int64_t lastDeltaDate;
  CCSet *set;
  void *v9;
  CKDistributedTimestampStateVector *contentVector;
  void *v11;
  CKDistributedTimestampStateVector *metaContentVector;
  void *v13;
  char v14;

  v4 = a3;
  resourceVersion = self->_resourceVersion;
  if (resourceVersion == objc_msgSend(v4, "resourceVersion")
    && (bookmarkVersion = self->_bookmarkVersion, bookmarkVersion == objc_msgSend(v4, "bookmarkVersion"))
    && (lastDeltaDate = self->_lastDeltaDate, lastDeltaDate == objc_msgSend(v4, "lastDeltaDate")))
  {
    set = self->_set;
    objc_msgSend(v4, "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CCSet isEqual:](set, "isEqual:", v9))
    {
      contentVector = self->_contentVector;
      objc_msgSend(v4, "contentVector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CKDistributedTimestampStateVector isEqual:](contentVector, "isEqual:", v11))
      {
        metaContentVector = self->_metaContentVector;
        objc_msgSend(v4, "metaContentVector");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKDistributedTimestampStateVector isEqual:](metaContentVector, "isEqual:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[CKDistributedTimestampStateVector hash](self->_contentVector, "hash");
  v4 = -[CKDistributedTimestampStateVector hash](self->_metaContentVector, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_resourceVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_bookmarkVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastDeltaDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[CCSet hash](self->_set, "hash");

  return v11;
}

- (NSString)description
{
  void *v3;
  CCSet *set;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  set = self->_set;
  CCDateFormattedStringFromTimeMicros(self->_resourceVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CCDateFormattedStringFromTimeMicros(self->_lastDeltaDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Bookmark for Cascade Set: %@ created: %@ lastDelta: %@ <bv:%u> sharedItemCount: %lu localItemInstanceCount: %lu"), set, v5, v6, self->_bookmarkVersion, +[CCDatabaseSetChangeEnumerator sharedItemCountFromBookmark:](CCDatabaseSetChangeEnumerator, "sharedItemCountFromBookmark:", self), +[CCDatabaseSetChangeEnumerator localItemInstanceCountFromBookmark:](CCDatabaseSetChangeEnumerator, "localItemInstanceCountFromBookmark:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (int)currentBookmarkVersion
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CCSet **p_set;
  CCSet *set;
  CCSet *v7;
  CCSet *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentVector, CFSTR("c"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaContentVector, CFSTR("m"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_resourceVersion, CFSTR("r"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_bookmarkVersion, CFSTR("b"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_lastDeltaDate, CFSTR("d"));
  set = self->_set;
  p_set = &self->_set;
  v7 = set;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [CCSet alloc];
    v9 = -[CCSet itemType](*p_set, "itemType");
    -[CCSet descriptors](*p_set, "descriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = -[CCSet initWithItemType:descriptors:error:](v8, "initWithItemType:descriptors:error:", v9, v10, &v14);
    v12 = v14;

    if (!v11)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CCSetChangeBookmark encodeWithCoder:].cold.1((uint64_t *)p_set, (uint64_t)v12, v13);

    }
    v7 = (CCSet *)v11;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("s"));

}

- (CCSetChangeBookmark)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  CCSetChangeBookmark *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("r"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("b"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("d"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKDistributedTimestampStateVectorClass(), CFSTR("c"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKDistributedTimestampStateVectorClass(), CFSTR("m"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        self = -[CCSetChangeBookmark initWithContentVector:metaContentVector:resourceVersion:lastDeltaDate:set:](self, "initWithContentVector:metaContentVector:resourceVersion:lastDeltaDate:set:", v9, v10, v5, v7, v8);
        v11 = self;
LABEL_14:

        goto LABEL_15;
      }
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("versions: {resource: %lld bookmark: %d}"), v5, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v15;
        _os_log_error_impl(&dword_237B25000, v13, OS_LOG_TYPE_ERROR, "Bookmark for set: %@ missing metacontent vector. %@", buf, 0x16u);

      }
    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("versions: {resource: %lld bookmark: %d}"), v5, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v12;
        _os_log_error_impl(&dword_237B25000, v10, OS_LOG_TYPE_ERROR, "Bookmark for set: %@ missing content vector. %@", buf, 0x16u);

      }
    }
    v11 = 0;
    goto LABEL_14;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CCSetChangeBookmark initWithCoder:].cold.1(v5, v6, v9);
  v11 = 0;
LABEL_15:

  return v11;
}

- (CKDistributedTimestampStateVector)contentVector
{
  return self->_contentVector;
}

- (CKDistributedTimestampStateVector)metaContentVector
{
  return self->_metaContentVector;
}

- (int64_t)resourceVersion
{
  return self->_resourceVersion;
}

- (int)bookmarkVersion
{
  return self->_bookmarkVersion;
}

- (int64_t)lastDeltaDate
{
  return self->_lastDeltaDate;
}

- (CCSet)set
{
  return self->_set;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_metaContentVector, 0);
  objc_storeStrong((id *)&self->_contentVector, 0);
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Failed to copy serialized set: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("versions: {resource: %lld bookmark: %d}"), a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_237B25000, a3, OS_LOG_TYPE_ERROR, "Bookmark missing set %@", buf, 0xCu);

}

@end
