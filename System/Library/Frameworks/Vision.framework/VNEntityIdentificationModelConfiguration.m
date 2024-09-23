@implementation VNEntityIdentificationModelConfiguration

- (VNEntityIdentificationModelConfiguration)initWithEntityPrintOriginatingRequestSpecifier:(id)a3
{
  id v4;
  char *v5;
  VNEntityIdentificationModelConfiguration *v6;
  uint64_t v7;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNEntityIdentificationModelConfiguration;
  v5 = -[VNEntityIdentificationModelConfiguration init](&v10, sel_init);
  v6 = (VNEntityIdentificationModelConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1A15FB520;
    v7 = objc_msgSend(v4, "copy");
    entityPrintOriginatingRequestSpecifier = v6->_entityPrintOriginatingRequestSpecifier;
    v6->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v7;

  }
  return v6;
}

- (id)resolvedAlgorithmAndReturnError:(id *)a3
{
  VNEntityIdentificationModelAlgorithmVIPv2 *v3;

  -[VNEntityIdentificationModelConfiguration algorithm](self, "algorithm", a3);
  v3 = (VNEntityIdentificationModelAlgorithmVIPv2 *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(VNEntityIdentificationModelAlgorithmVIPv2);
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
  -[VNEntityIdentificationModelConfiguration resolvedAlgorithmAndReturnError:](self, "resolvedAlgorithmAndReturnError:", a4);
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

- (NSArray)acceptableEntityPrintOriginatingRequestSpecifiers
{
  void *v2;
  void *v3;

  -[VNEntityIdentificationModelConfiguration entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allModelEquivalents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)maximumEntities
{
  return self->_maximumEntities;
}

- (void)setMaximumEntities:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend((id)objc_opt_class(), "maximumAllowableEntities");
  if (a3 - 1 >= v5)
    v6 = v5;
  else
    v6 = a3;
  self->_maximumEntities = v6;
}

- (unint64_t)maximumTrainingPrintsPerEntity
{
  return self->_maximumTrainingPrintsPerEntity;
}

- (void)setMaximumTrainingPrintsPerEntity:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend((id)objc_opt_class(), "maximumAllowableFaceprintsPerIdentity");
  v6 = 20;
  if (a3)
    v6 = a3;
  if (v6 >= v5)
    v6 = v5;
  self->_maximumTrainingPrintsPerEntity = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (_QWORD *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 8) = self->_maximumEntities;
    *(_QWORD *)(v4 + 16) = self->_maximumTrainingPrintsPerEntity;
    v6 = -[VNRequestSpecifier copy](self->_entityPrintOriginatingRequestSpecifier, "copy");
    v7 = (void *)v5[3];
    v5[3] = v6;

    v8 = -[VNEntityIdentificationModelAlgorithm copy](self->_algorithm, "copy");
    v9 = (void *)v5[4];
    v5[4] = v8;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[VNEntityIdentificationModelConfiguration entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity") ^ __ROR8__(-[VNEntityIdentificationModelConfiguration maximumEntities](self, "maximumEntities") ^ __ROR8__(v4, 51), 51);
  -[VNEntityIdentificationModelConfiguration algorithm](self, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5, 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNEntityIdentificationModelConfiguration *v4;
  VNEntityIdentificationModelConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (VNEntityIdentificationModelConfiguration *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNEntityIdentificationModelConfiguration algorithm](self, "algorithm");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNEntityIdentificationModelConfiguration algorithm](v5, "algorithm");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if (v8
        && (v9 = -[VNEntityIdentificationModelConfiguration maximumEntities](self, "maximumEntities"),
            v9 == -[VNEntityIdentificationModelConfiguration maximumEntities](v5, "maximumEntities"))
        && (v10 = -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity"), v10 == -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](v5, "maximumTrainingPrintsPerEntity")))
      {
        -[VNEntityIdentificationModelConfiguration entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNEntityIdentificationModelConfiguration entityPrintOriginatingRequestSpecifier](v5, "entityPrintOriginatingRequestSpecifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)VNEntityIdentificationModelConfiguration;
  -[VNEntityIdentificationModelConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[VNEntityIdentificationModelConfiguration resolvedAlgorithmAndReturnError:](self, "resolvedAlgorithmAndReturnError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n                        algorithm = %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n                  maximumEntities = %lu"), -[VNEntityIdentificationModelConfiguration maximumEntities](self, "maximumEntities"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n   maximumTrainingPrintsPerEntity = %lu"), -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n    entityPrintOriginatingRequest = %@"), self->_entityPrintOriginatingRequestSpecifier);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t maximumEntities;
  id v5;

  maximumEntities = self->_maximumEntities;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", maximumEntities, CFSTR("maximumEntities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumTrainingPrintsPerEntity, CFSTR("printsPerEntity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityPrintOriginatingRequestSpecifier, CFSTR("printOriginatingRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_algorithm, CFSTR("algorithm"));

}

- (VNEntityIdentificationModelConfiguration)initWithCoder:(id)a3
{
  id v4;
  VNEntityIdentificationModelConfiguration *v5;
  uint64_t v6;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  uint64_t v8;
  VNEntityIdentificationModelAlgorithm *algorithm;

  v4 = a3;
  v5 = -[VNEntityIdentificationModelConfiguration init](self, "init");
  if (v5)
  {
    v5->_maximumEntities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumEntities"));
    v5->_maximumTrainingPrintsPerEntity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("printsPerEntity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("printOriginatingRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
    v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
    v8 = objc_claimAutoreleasedReturnValue();
    algorithm = v5->_algorithm;
    v5->_algorithm = (VNEntityIdentificationModelAlgorithm *)v8;

  }
  return v5;
}

- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);
}

+ (unint64_t)maximumAllowableEntities
{
  return 524272;
}

+ (unint64_t)maximumAllowableFaceprintsPerIdentity
{
  return 10000;
}

+ (id)newConfigurationForEntityPrintsGeneratedByRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  VNEntityUniqueIdentifierSupportedRequestSpecifiers();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
  {
    v9 = objc_alloc((Class)a1);
    objc_msgSend(v6, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithEntityPrintOriginatingRequestSpecifier:", v10);
  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not supported"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, v10, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)faceID3ModelMaximumIDs
{
  unint64_t v2;

  v2 = -[VNEntityIdentificationModelConfiguration maximumEntities](self, "maximumEntities");
  if (v2 >= 0x7FFFFFFF)
    LODWORD(v2) = 0x7FFFFFFF;
  return v2;
}

- (int)faceID3ModelMaximumElementsPerID
{
  unint64_t v2;

  v2 = -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity");
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

  -[VNEntityIdentificationModelConfiguration algorithmOfClass:error:](self, "algorithmOfClass:error:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "indexType") == 1;
  else
    v4 = 0;

  return v4;
}

- (int)faceIDModelMaximumElementsPerID
{
  unint64_t v2;

  v2 = -[VNEntityIdentificationModelConfiguration maximumTrainingPrintsPerEntity](self, "maximumTrainingPrintsPerEntity");
  if (v2 >= 0x7FFFFFFF)
    LODWORD(v2) = 0x7FFFFFFF;
  return v2;
}

@end
