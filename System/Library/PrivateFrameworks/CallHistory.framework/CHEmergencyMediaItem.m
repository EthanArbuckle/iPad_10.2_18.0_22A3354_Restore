@implementation CHEmergencyMediaItem

- (CHEmergencyMediaItem)initWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CHEmergencyMediaItem *v7;

  v4 = a3;
  objc_msgSend(v4, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "emergencyMediaType");

  v7 = -[CHEmergencyMediaItem initWithAssetId:mediaType:](self, "initWithAssetId:mediaType:", v5, v6);
  return v7;
}

- (CHEmergencyMediaItem)initWithAssetId:(id)a3
{
  return -[CHEmergencyMediaItem initWithAssetId:mediaType:](self, "initWithAssetId:mediaType:", a3, 0);
}

- (CHEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4
{
  id v6;
  CHEmergencyMediaItem *v7;
  uint64_t v8;
  NSString *assetId;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHEmergencyMediaItem;
  v7 = -[CHEmergencyMediaItem init](&v11, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CHEmergencyMediaItem initWithAssetId:mediaType:]", CFSTR("assetId"));
    v8 = objc_msgSend(v6, "copy");
    assetId = v7->_assetId;
    v7->_assetId = (NSString *)v8;

    v7->_emergencyMediaType = a4;
  }

  return v7;
}

- (CHEmergencyMediaItem)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CHEmergencyMediaItem *v10;

  v4 = a3;
  NSStringFromSelector(sel_assetId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_emergencyMediaType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  v10 = -[CHEmergencyMediaItem initWithAssetId:mediaType:](self, "initWithAssetId:mediaType:", v6, v9);

  return v10;
}

- (id)getDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHEmergencyMediaItem assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_emergencyMediaType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, v7);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHEmergencyMediaItem initWithMediaItem:](+[CHEmergencyMediaItem allocWithZone:](CHEmergencyMediaItem, "allocWithZone:", a3), "initWithMediaItem:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetId;
  id v5;
  void *v6;
  int64_t emergencyMediaType;
  id v8;

  assetId = self->_assetId;
  v5 = a3;
  NSStringFromSelector(sel_assetId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", assetId, v6);

  emergencyMediaType = self->_emergencyMediaType;
  NSStringFromSelector(sel_emergencyMediaType);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", emergencyMediaType, v8);

}

- (CHEmergencyMediaItem)initWithCoder:(id)a3
{
  id v4;
  CHEmergencyMediaItem *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *assetId;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHEmergencyMediaItem;
  v5 = -[CHEmergencyMediaItem init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_assetId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v8;

    NSStringFromSelector(sel_emergencyMediaType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emergencyMediaType = objc_msgSend(v4, "decodeIntegerForKey:", v10);

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_assetId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHEmergencyMediaItem assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  NSStringFromSelector(sel_emergencyMediaType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v6, -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  -[CHEmergencyMediaItem assetId](self, "assetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType");
  v13 = CHHash(2uLL, v6, v7, v8, v9, v10, v11, v12, v4, v5);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CHEmergencyMediaItem *v4;
  BOOL v5;

  v4 = (CHEmergencyMediaItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CHEmergencyMediaItem isEqualToMediaItem:](self, "isEqualToMediaItem:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  int64_t v11;
  BOOL v12;

  v4 = a3;
  -[CHEmergencyMediaItem assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
    goto LABEL_4;
  if (!v8)
  {

    goto LABEL_6;
  }
  v10 = objc_msgSend((id)v7, "isEqual:", v8);

  if (!v10)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v11 = -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType");
  v12 = v11 == objc_msgSend(v4, "emergencyMediaType");
LABEL_7:

  return v12;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)emergencyMediaType
{
  return self->_emergencyMediaType;
}

- (void)setEmergencyMediaType:(int64_t)a3
{
  self->_emergencyMediaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end
