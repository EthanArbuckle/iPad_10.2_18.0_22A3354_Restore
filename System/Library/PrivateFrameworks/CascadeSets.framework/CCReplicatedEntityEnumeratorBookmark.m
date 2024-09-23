@implementation CCReplicatedEntityEnumeratorBookmark

- (CCReplicatedEntityEnumeratorBookmark)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4
{
  id v6;
  id v7;
  CCReplicatedEntityEnumeratorBookmark *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CCReplicatedEntityEnumeratorBookmark initWithContentVector:metaContentVector:version:](self, "initWithContentVector:metaContentVector:version:", v7, v6, objc_msgSend((id)objc_opt_class(), "currentVersion"));

  return v8;
}

- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 version:(unint64_t)a5
{
  id v9;
  id v10;
  CCReplicatedEntityEnumeratorBookmark *v11;
  CCReplicatedEntityEnumeratorBookmark *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCReplicatedEntityEnumeratorBookmark;
  v11 = -[CCReplicatedEntityEnumeratorBookmark init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentVector, a3);
    objc_storeStrong((id *)&v12->_metaContentVector, a4);
    v12->_version = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "contentVector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", self->_contentVector))
    {
      objc_msgSend(v5, "metaContentVector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", self->_metaContentVector))
        v8 = objc_msgSend(v5, "version") == self->_version;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int64_t)currentVersion
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CKDistributedTimestampStateVector *contentVector;
  id v5;

  contentVector = self->_contentVector;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contentVector, CFSTR("contentVector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metaContentVector, CFSTR("metaContentVector"));
  objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend((id)objc_opt_class(), "currentVersion"), CFSTR("bookmarkVersion"));

}

- (CCReplicatedEntityEnumeratorBookmark)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CCReplicatedEntityEnumeratorBookmark *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKDistributedTimestampStateVectorClass_0(), CFSTR("contentVector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKDistributedTimestampStateVectorClass_0(), CFSTR("metaContentVector"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[CCReplicatedEntityEnumeratorBookmark initWithContentVector:metaContentVector:version:](self, "initWithContentVector:metaContentVector:version:", v5, v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bookmarkVersion")));
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CKDistributedTimestampStateVector)contentVector
{
  return self->_contentVector;
}

- (CKDistributedTimestampStateVector)metaContentVector
{
  return self->_metaContentVector;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentVector, 0);
  objc_storeStrong((id *)&self->_contentVector, 0);
}

@end
