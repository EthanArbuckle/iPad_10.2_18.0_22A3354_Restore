@implementation FMFMapCacheImage

- (FMFMapCacheImage)initWithPath:(id)a3
{
  id v5;
  FMFMapCacheImage *v6;
  FMFMapCacheImage *v7;
  uint64_t v8;
  NSDate *timestamp;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMFMapCacheImage;
  v6 = -[FMFMapCacheImage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v7->_timestamp;
    v7->_timestamp = (NSDate *)v8;

    v7->_count = 1;
  }

  return v7;
}

- (FMFMapCacheImage)initWithCoder:(id)a3
{
  id v4;
  FMFMapCacheImage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  FMFMapCacheImage *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFMapCacheImage;
  v5 = -[FMFMapCacheImage init](&v13, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v11 = v8;
    -[FMFMapCacheImage setPath:](v5, "setPath:", v6);
    -[FMFMapCacheImage setTimestamp:](v5, "setTimestamp:", v7);
    -[FMFMapCacheImage setCount:](v5, "setCount:", v11);

LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (void)boostPriority
{
  id v3;

  -[FMFMapCacheImage setCount:](self, "setCount:", -[FMFMapCacheImage count](self, "count") + 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFMapCacheImage setTimestamp:](self, "setTimestamp:", v3);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[FMFMapCacheImage count](self, "count");
  -[FMFMapCacheImage timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapCacheImage path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FMFMapCacheImage(0x%lX, count: %ld, timestamp: %@, path:%@)"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
