@implementation VNCluster

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("{\n"));
  v4 = -[VNCluster clusterId](self, "clusterId");
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("  clusterId = %lu;\n"), v4);
  v5 = -[VNCluster totalObjectCount](self, "totalObjectCount");
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR("  totalObjCount = %lu;\n"), v5);
  -[VNCluster objects](self, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("  objects = %@;\n"), v6);
  v7 = -[VNCluster shouldUpdateRepresentative](self, "shouldUpdateRepresentative");
  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldUpdateRep = %d;\n"), v7);
  if (v7)
  {
    -[VNCluster suggestedIdsForRepresentative](self, "suggestedIdsForRepresentative");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  suggestedIdsForRep = %@;\n"), v8);

  }
  -[VNCluster representativenessById](self, "representativenessById");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("  representativenessById = %@;\n"), v9);
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v3 = -[VNCluster clusterId](self, "clusterId");
  v4 = -[VNCluster totalObjectCount](self, "totalObjectCount");
  -[VNCluster objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v7 = -[VNCluster shouldUpdateRepresentative](self, "shouldUpdateRepresentative");
  -[VNCluster suggestedIdsForRepresentative](self, "suggestedIdsForRepresentative");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  -[VNCluster representativenessById](self, "representativenessById");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = 21845;
  if (v7)
    v12 = 43690;
  v13 = v11 ^ __ROR8__(v9 ^ __ROR8__(v12 ^ __ROR8__(v6 ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51), 51), 51), 51);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  VNCluster *v4;
  VNCluster *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (VNCluster *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNCluster clusterId](self, "clusterId");
      if (v6 != -[VNCluster clusterId](v5, "clusterId"))
        goto LABEL_11;
      v7 = -[VNCluster totalObjectCount](self, "totalObjectCount");
      if (v7 != -[VNCluster totalObjectCount](v5, "totalObjectCount"))
        goto LABEL_11;
      -[VNCluster objects](self, "objects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCluster objects](v5, "objects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = VisionCoreEqualOrNilObjects();

      if ((v10 & 1) == 0)
        goto LABEL_11;
      v11 = -[VNCluster shouldUpdateRepresentative](self, "shouldUpdateRepresentative");
      if (v11 != -[VNCluster shouldUpdateRepresentative](v5, "shouldUpdateRepresentative"))
        goto LABEL_11;
      -[VNCluster suggestedIdsForRepresentative](self, "suggestedIdsForRepresentative");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCluster suggestedIdsForRepresentative](v5, "suggestedIdsForRepresentative");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = VisionCoreEqualOrNilObjects();

      if ((v14 & 1) != 0)
      {
        -[VNCluster representativenessById](self, "representativenessById");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCluster representativenessById](v5, "representativenessById");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_11:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[VNCluster objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setObjects:", v6);

    objc_msgSend(v4, "setClusterId:", -[VNCluster clusterId](self, "clusterId"));
    objc_msgSend(v4, "setTotalObjectCount:", -[VNCluster totalObjectCount](self, "totalObjectCount"));
    objc_msgSend(v4, "setShouldUpdateRepresentative:", -[VNCluster shouldUpdateRepresentative](self, "shouldUpdateRepresentative"));
    -[VNCluster suggestedIdsForRepresentative](self, "suggestedIdsForRepresentative");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setSuggestedIdsForRepresentative:", v8);

    -[VNCluster representativenessById](self, "representativenessById");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setRepresentativenessById:", v10);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 0, CFSTR("vncluster"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objects, CFSTR("vncObjects"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_clusterId, CFSTR("vncCId"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_totalObjectCount, CFSTR("vncTotObjCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_shouldUpdateRepresentative, CFSTR("vncRepUpdate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestedIdsForRepresentative, CFSTR("vncRepIds"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_representativenessById, CFSTR("vncRepnessById"));

}

- (VNCluster)initWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *objects;
  unint64_t v7;
  void *v8;
  void *v9;
  VNCluster *v10;
  NSArray *v12;
  NSArray *suggestedIdsForRepresentative;
  NSDictionary *v14;
  NSDictionary *representativenessById;

  v4 = a3;
  if (!objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vncluster")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vncObjects"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objects = self->_objects;
    self->_objects = v5;

    self->_clusterId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vncCId"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vncTotObjCount"));
    self->_totalObjectCount = v7;
    if (v7 >= -[NSArray count](self->_objects, "count"))
    {
      self->_shouldUpdateRepresentative = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vncRepUpdate")) != 0;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vncRepIds"));
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      suggestedIdsForRepresentative = self->_suggestedIdsForRepresentative;
      self->_suggestedIdsForRepresentative = v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vncRepnessById"));
      v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      representativenessById = self->_representativenessById;
      self->_representativenessById = v14;

      v10 = self;
      goto LABEL_5;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when unarchiving an object of type: %@"), objc_opt_class());
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v9);

  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (unint64_t)clusterId
{
  return self->_clusterId;
}

- (void)setClusterId:(unint64_t)a3
{
  self->_clusterId = a3;
}

- (unint64_t)totalObjectCount
{
  return self->_totalObjectCount;
}

- (void)setTotalObjectCount:(unint64_t)a3
{
  self->_totalObjectCount = a3;
}

- (BOOL)shouldUpdateRepresentative
{
  return self->_shouldUpdateRepresentative;
}

- (void)setShouldUpdateRepresentative:(BOOL)a3
{
  self->_shouldUpdateRepresentative = a3;
}

- (NSArray)suggestedIdsForRepresentative
{
  return self->_suggestedIdsForRepresentative;
}

- (void)setSuggestedIdsForRepresentative:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedIdsForRepresentative, a3);
}

- (NSDictionary)representativenessById
{
  return self->_representativenessById;
}

- (void)setRepresentativenessById:(id)a3
{
  objc_storeStrong((id *)&self->_representativenessById, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativenessById, 0);
  objc_storeStrong((id *)&self->_suggestedIdsForRepresentative, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
