@implementation MADMultiModalInputEntitySegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputEntitySegment)initWithEntityUUID:(id)a3 seed:(id)a4
{
  id v7;
  id v8;
  MADMultiModalInputEntitySegment *v9;
  MADMultiModalInputEntitySegment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInputEntitySegment;
  v9 = -[MADMultiModalInputEntitySegment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityUUID, a3);
    objc_storeStrong((id *)&v10->_seed, a4);
  }

  return v10;
}

- (MADMultiModalInputEntitySegment)initWithCoder:(id)a3
{
  id v4;
  MADMultiModalInputEntitySegment *v5;
  uint64_t v6;
  NSUUID *entityUUID;
  uint64_t v8;
  NSNumber *seed;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputEntitySegment;
  v5 = -[MADMultiModalInputSegment initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntityUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    entityUUID = v5->_entityUUID;
    v5->_entityUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Seed"));
    v8 = objc_claimAutoreleasedReturnValue();
    seed = v5->_seed;
    v5->_seed = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputEntitySegment;
  v4 = a3;
  -[MADMultiModalInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityUUID, CFSTR("EntityUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_seed, CFSTR("Seed"));

}

- (int64_t)type
{
  return 2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("entityUUID: %@"), self->_entityUUID);
  if (self->_seed)
    objc_msgSend(v3, "appendFormat:", CFSTR(", seed: %@"), self->_seed);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSUUID)entityUUID
{
  return self->_entityUUID;
}

- (NSNumber)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_entityUUID, 0);
}

@end
