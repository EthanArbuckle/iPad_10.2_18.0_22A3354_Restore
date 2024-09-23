@implementation VNPersonsModelConfiguration

- (int)faceID2ModelMaximumElementsPerID
{
  unint64_t v2;

  v2 = -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](self, "maximumTrainingFaceprintsPerIdentity");
  if (v2 >= 0x7FFFFFFF)
    LODWORD(v2) = 0x7FFFFFFF;
  return v2;
}

- (VNPersonsModelConfiguration)init
{
  VNPersonsModelConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNPersonsModelConfiguration;
  result = -[VNPersonsModelConfiguration init](&v3, sel_init);
  if (result)
    result->_faceprintRequestRevision = 0;
  return result;
}

- (unint64_t)maximumIdentities
{
  NSNumber *explicitlySetMaximumIdentities;

  explicitlySetMaximumIdentities = self->_explicitlySetMaximumIdentities;
  if (explicitlySetMaximumIdentities)
    return -[NSNumber unsignedIntegerValue](explicitlySetMaximumIdentities, "unsignedIntegerValue");
  else
    return 10000;
}

- (void)setMaximumIdentities:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *explicitlySetMaximumIdentities;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  explicitlySetMaximumIdentities = self->_explicitlySetMaximumIdentities;
  self->_explicitlySetMaximumIdentities = v4;

}

- (unint64_t)maximumTrainingFaceprintsPerIdentity
{
  NSNumber *explicitlySetMaximumTrainingFaceprintsPerIdentity;

  explicitlySetMaximumTrainingFaceprintsPerIdentity = self->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
  if (explicitlySetMaximumTrainingFaceprintsPerIdentity)
    return -[NSNumber unsignedIntegerValue](explicitlySetMaximumTrainingFaceprintsPerIdentity, "unsignedIntegerValue");
  else
    return 20;
}

- (void)setMaximumTrainingFaceprintsPerIdentity:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *explicitlySetMaximumTrainingFaceprintsPerIdentity;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  explicitlySetMaximumTrainingFaceprintsPerIdentity = self->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
  self->_explicitlySetMaximumTrainingFaceprintsPerIdentity = v4;

}

- (id)resolvedAlgorithmAndReturnError:(id *)a3
{
  VNPersonsModelAlgorithmVIPv2 *v3;

  -[VNPersonsModelConfiguration algorithm](self, "algorithm", a3);
  v3 = (VNPersonsModelAlgorithmVIPv2 *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(VNPersonsModelAlgorithmVIPv2);
  return v3;
}

- (id)algorithmOfClass:(Class)a3 error:(id *)a4
{
  id *v4;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  -[VNPersonsModelConfiguration resolvedAlgorithmAndReturnError:](self, "resolvedAlgorithmAndReturnError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4)
      goto LABEL_7;
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("configuration %@ cannot provide a %@"), v9, v10);

    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v11);
    *v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = v6;
LABEL_7:

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[VNPersonsModelAlgorithm copy](self->_algorithm, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->_faceprintRequestRevision;
    v7 = -[NSNumber copy](self->_explicitlySetMaximumIdentities, "copy");
    v8 = (void *)v4[3];
    v4[3] = v7;

    v9 = -[NSNumber copy](self->_explicitlySetMaximumTrainingFaceprintsPerIdentity, "copy");
    v10 = (void *)v4[4];
    v4[4] = v9;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelConfiguration *v4;
  VNPersonsModelConfiguration *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;

  v4 = (VNPersonsModelConfiguration *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNPersonsModelConfiguration algorithm](self, "algorithm");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNPersonsModelConfiguration algorithm](v5, "algorithm");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0
        && (v9 = -[VNPersonsModelConfiguration maximumIdentities](self, "maximumIdentities"),
            v9 == -[VNPersonsModelConfiguration maximumIdentities](v5, "maximumIdentities"))
        && (v10 = -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](self, "maximumTrainingFaceprintsPerIdentity"), v10 == -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](v5, "maximumTrainingFaceprintsPerIdentity")))
      {
        v11 = -[VNPersonsModelConfiguration faceprintRequestRevision](self, "faceprintRequestRevision");
        v12 = v11 == -[VNPersonsModelConfiguration faceprintRequestRevision](v5, "faceprintRequestRevision");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)VNPersonsModelConfiguration;
  -[VNPersonsModelConfiguration description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[VNPersonsModelConfiguration resolvedAlgorithmAndReturnError:](self, "resolvedAlgorithmAndReturnError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n                              algorithm = %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n                      maximumIdentities = %lu"), -[VNPersonsModelConfiguration maximumIdentities](self, "maximumIdentities"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n   maximumTrainingFaceprintsPerIdentity = %lu"), -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](self, "maximumTrainingFaceprintsPerIdentity"));
  v6 = (objc_class *)objc_opt_class();
  VNRequestRevisionString(v6, -[VNPersonsModelConfiguration faceprintRequestRevision](self, "faceprintRequestRevision"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n               faceprintRequestRevision = %@"), v7);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *explicitlySetMaximumIdentities;
  NSNumber *explicitlySetMaximumTrainingFaceprintsPerIdentity;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_algorithm, CFSTR("algorithm"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_faceprintRequestRevision, CFSTR("faceprintRequestRevision"));
  explicitlySetMaximumIdentities = self->_explicitlySetMaximumIdentities;
  if (explicitlySetMaximumIdentities)
    objc_msgSend(v6, "encodeInteger:forKey:", -[NSNumber integerValue](explicitlySetMaximumIdentities, "integerValue"), CFSTR("maxIdentities"));
  explicitlySetMaximumTrainingFaceprintsPerIdentity = self->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
  if (explicitlySetMaximumTrainingFaceprintsPerIdentity)
    objc_msgSend(v6, "encodeInteger:forKey:", -[NSNumber integerValue](explicitlySetMaximumTrainingFaceprintsPerIdentity, "integerValue"), CFSTR("faceprintsPerIdentity"));

}

- (VNPersonsModelConfiguration)initWithCoder:(id)a3
{
  id v4;
  VNPersonsModelConfiguration *v5;
  uint64_t v6;
  VNPersonsModelAlgorithm *algorithm;
  uint64_t v8;
  NSNumber *explicitlySetMaximumIdentities;
  uint64_t v10;
  NSNumber *explicitlySetMaximumTrainingFaceprintsPerIdentity;
  VNPersonsModelConfiguration *v12;

  v4 = a3;
  v5 = -[VNPersonsModelConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
    v6 = objc_claimAutoreleasedReturnValue();
    algorithm = v5->_algorithm;
    v5->_algorithm = (VNPersonsModelAlgorithm *)v6;

    v5->_faceprintRequestRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceprintRequestRevision"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("maxIdentities")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxIdentities")));
      v8 = objc_claimAutoreleasedReturnValue();
      explicitlySetMaximumIdentities = v5->_explicitlySetMaximumIdentities;
      v5->_explicitlySetMaximumIdentities = (NSNumber *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("faceprintsPerIdentity")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceprintsPerIdentity")));
      v10 = objc_claimAutoreleasedReturnValue();
      explicitlySetMaximumTrainingFaceprintsPerIdentity = v5->_explicitlySetMaximumTrainingFaceprintsPerIdentity;
      v5->_explicitlySetMaximumTrainingFaceprintsPerIdentity = (NSNumber *)v10;

    }
    v12 = v5;
  }

  return v5;
}

- (VNPersonsModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)faceprintRequestRevision
{
  return self->_faceprintRequestRevision;
}

- (void)setFaceprintRequestRevision:(unint64_t)a3
{
  self->_faceprintRequestRevision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitlySetMaximumTrainingFaceprintsPerIdentity, 0);
  objc_storeStrong((id *)&self->_explicitlySetMaximumIdentities, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

+ (unint64_t)maximumAllowableIdentities
{
  return 0x3FFFFFFFLL;
}

+ (unint64_t)maximumAllowableFaceprintsPerIdentity
{
  return 10000;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)faceID3ModelMaximumIDs
{
  unint64_t v2;

  v2 = -[VNPersonsModelConfiguration maximumIdentities](self, "maximumIdentities");
  if (v2 >= 0x7FFFFFFF)
    LODWORD(v2) = 0x7FFFFFFF;
  return v2;
}

- (int)faceID3ModelMaximumElementsPerID
{
  unint64_t v2;

  v2 = -[VNPersonsModelConfiguration maximumTrainingFaceprintsPerIdentity](self, "maximumTrainingFaceprintsPerIdentity");
  if (v2 >= 0x7FFFFFFF)
    LODWORD(v2) = 0x7FFFFFFF;
  return v2;
}

- (int)faceID3ModelSeed
{
  return 1;
}

- (int)faceID3IndexMode
{
  void *v2;
  void *v3;
  _BOOL4 v4;

  -[VNPersonsModelConfiguration algorithmOfClass:error:](self, "algorithmOfClass:error:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "indexType") == 1;
  else
    v4 = 0;

  return v4;
}

@end
