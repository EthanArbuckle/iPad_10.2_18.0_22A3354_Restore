@implementation PKStrokeProviderSliceIdentifierConcrete

- (PKStrokeProviderSliceIdentifierConcrete)initWithUUID:(id)a3 version:(_PKStrokeID *)a4 tStart:(double)a5 tEnd:(double)a6
{
  PKStrokeProviderSliceIdentifierConcrete *result;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  result = -[PKStrokeProviderSliceIdentifier initWithUUID:tStart:tEnd:](&v9, sel_initWithUUID_tStart_tEnd_, a3, a5, a6);
  v8 = *(_QWORD *)&a4->replicaUUID[12];
  *(_OWORD *)&result->_version.clock = *(_OWORD *)&a4->clock;
  *(_QWORD *)&result->_version.replicaUUID[12] = v8;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PKStrokeProviderSliceIdentifierConcrete *v4;
  PKStrokeProviderSliceIdentifierConcrete *v5;
  PKStrokeProviderSliceIdentifierConcrete *v6;
  int v7;
  BOOL v8;
  objc_super v10;
  _QWORD v11[2];
  uint64_t v12;
  int v13;
  unsigned __int8 v14[16];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (PKStrokeProviderSliceIdentifierConcrete *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v10.receiver = self;
    v10.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
    if (!-[PKStrokeProviderSliceIdentifier isEqual:](&v10, sel_isEqual_, v6))
      goto LABEL_10;
    -[PKStrokeProviderSliceIdentifierConcrete version](self, "version");
    if (v6)
    {
      -[PKStrokeProviderSliceIdentifierConcrete version](v6, "version");
      v7 = v11[0];
    }
    else
    {
      v7 = 0;
      v11[0] = 0;
      v11[1] = 0;
      v12 = 0;
    }
    if (v13 == v7 && !uuid_compare(v14, (const unsigned __int8 *)v11 + 4))
      v8 = v15 == HIDWORD(v12);
    else
LABEL_10:
      v8 = 0;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  v3 = -[PKStrokeProviderSliceIdentifier hash](&v5, sel_hash);
  return PKHashBytes((uint64_t)&self->_version, 24) ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t clock;
  uint64_t subclock;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_version.replicaUUID);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProviderSliceIdentifier strokeUUID](self, "strokeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PK_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PK_shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clock = self->_version.clock;
  subclock = self->_version.subclock;
  -[PKStrokeProviderSliceIdentifier tStart](self, "tStart");
  v13 = v12;
  -[PKStrokeProviderSliceIdentifier tEnd](self, "tEnd");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p id=%@ v=%@:%d.%d t=%0.2f->%0.2f>"), v6, self, v8, v9, clock, subclock, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PKStrokeID *p_version;
  uint64_t clock;
  uint64_t subclock;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  -[PKStrokeProviderSliceIdentifier encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  p_version = &self->_version;
  clock = self->_version.clock;
  subclock = self->_version.subclock;
  objc_msgSend(v4, "encodeInteger:forKey:", clock, CFSTR("versionClock"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", p_version->replicaUUID);
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("versionReplica"));
  objc_msgSend(v4, "encodeInteger:forKey:", subclock, CFSTR("versionSubclock"));

}

- (PKStrokeProviderSliceIdentifierConcrete)initWithCoder:(id)a3
{
  id v4;
  PKStrokeProviderSliceIdentifierConcrete *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  v5 = -[PKStrokeProviderSliceIdentifier initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("versionClock"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versionReplica"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("versionSubclock"));
    v5->_version.clock = v6;
    objc_msgSend(v7, "getUUIDBytes:", v5->_version.replicaUUID);
    v5->_version.subclock = v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PKStrokeID)version
{
  *retstr = *(_PKStrokeID *)((char *)self + 32);
  return self;
}

@end
