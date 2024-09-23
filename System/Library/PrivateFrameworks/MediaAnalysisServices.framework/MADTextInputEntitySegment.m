@implementation MADTextInputEntitySegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputEntitySegment)initWithEntityUUID:(id)a3
{
  id v5;
  MADTextInputEntitySegment *v6;
  MADTextInputEntitySegment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputEntitySegment;
  v6 = -[MADTextInputEntitySegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entityUUID, a3);

  return v7;
}

- (MADTextInputEntitySegment)initWithCoder:(id)a3
{
  id v4;
  MADTextInputEntitySegment *v5;
  uint64_t v6;
  NSUUID *entityUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputEntitySegment;
  v5 = -[MADTextInputSegment initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntityUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    entityUUID = v5->_entityUUID;
    v5->_entityUUID = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADTextInputEntitySegment;
  v4 = a3;
  -[MADTextInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityUUID, CFSTR("EntityUUID"), v5.receiver, v5.super_class);

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

  objc_msgSend(v3, "appendFormat:", CFSTR("entityUUID: %@>"), self->_entityUUID);
  return v3;
}

- (NSUUID)entityUUID
{
  return self->_entityUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityUUID, 0);
}

@end
