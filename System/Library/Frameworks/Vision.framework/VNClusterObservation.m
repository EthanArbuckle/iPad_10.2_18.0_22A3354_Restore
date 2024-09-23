@implementation VNClusterObservation

- (VNClusterObservation)initWithCoder:(id)a3
{
  id v4;
  VNClusterObservation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *clusters;
  uint64_t v14;
  NSArray *suggestionsForCluster;
  uint64_t v16;
  NSArray *groupedClusteredFaceIdsForCluster;
  uint64_t v18;
  NSData *clusterState;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSSet *clusteredFaceIds;
  uint64_t v25;
  NSNumber *distance;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSDictionary *distancesById;
  VNClusterObservation *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNClusterObservation;
  v5 = -[VNObservation initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("clusters"));
    v12 = objc_claimAutoreleasedReturnValue();
    clusters = v5->_clusters;
    v5->_clusters = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("suggestions"));
    v14 = objc_claimAutoreleasedReturnValue();
    suggestionsForCluster = v5->_suggestionsForCluster;
    v5->_suggestionsForCluster = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("groupedClusteredFaceIDs"));
    v16 = objc_claimAutoreleasedReturnValue();
    groupedClusteredFaceIdsForCluster = v5->_groupedClusteredFaceIdsForCluster;
    v5->_groupedClusteredFaceIdsForCluster = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterState"));
    v18 = objc_claimAutoreleasedReturnValue();
    clusterState = v5->_clusterState;
    v5->_clusterState = (NSData *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("clusteredFaceIDs"));
    v23 = objc_claimAutoreleasedReturnValue();
    clusteredFaceIds = v5->_clusteredFaceIds;
    v5->_clusteredFaceIds = (NSSet *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("level0Distance"));
    v25 = objc_claimAutoreleasedReturnValue();
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("distancesByID"));
    v30 = objc_claimAutoreleasedReturnValue();
    distancesById = v5->_distancesById;
    v5->_distancesById = (NSDictionary *)v30;

    v32 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNClusterObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusters, CFSTR("clusters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionsForCluster, CFSTR("suggestions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusterState, CFSTR("clusterState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusteredFaceIds, CFSTR("clusteredFaceIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupedClusteredFaceIdsForCluster, CFSTR("groupedClusteredFaceIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_distance, CFSTR("level0Distance"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_distancesById, CFSTR("distancesByID"));

}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VNClusterObservation;
  v3 = -[VNObservation hash](&v19, sel_hash);
  -[VNClusterObservation clusters](self, "clusters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VNClusterObservation suggestionsForCluster](self, "suggestionsForCluster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[VNClusterObservation clusterState](self, "clusterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  -[VNClusterObservation clusteredFaceIds](self, "clusteredFaceIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  -[VNClusterObservation groupedClusteredFaceIdsForCluster](self, "groupedClusteredFaceIdsForCluster");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  -[VNClusterObservation distance](self, "distance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  -[VNClusterObservation distancesById](self, "distancesById");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash") ^ __ROR8__(v15 ^ __ROR8__(v13 ^ __ROR8__(v11 ^ __ROR8__(v9 ^ __ROR8__(v7 ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51);

  return v17;
}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VNClusterObservation;
  -[VNObservation vn_cloneObject](&v19, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSArray copy](self->_clusters, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

    v6 = -[NSArray copy](self->_suggestionsForCluster, "copy");
    v7 = (void *)v3[13];
    v3[13] = v6;

    v8 = -[NSData copy](self->_clusterState, "copy");
    v9 = (void *)v3[14];
    v3[14] = v8;

    v10 = -[NSSet copy](self->_clusteredFaceIds, "copy");
    v11 = (void *)v3[15];
    v3[15] = v10;

    v12 = -[NSArray copy](self->_groupedClusteredFaceIdsForCluster, "copy");
    v13 = (void *)v3[16];
    v3[16] = v12;

    v14 = -[NSNumber copy](self->_distance, "copy");
    v15 = (void *)v3[17];
    v3[17] = v14;

    v16 = -[NSDictionary copy](self->_distancesById, "copy");
    v17 = (void *)v3[18];
    v3[18] = v16;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VNClusterObservation *v4;
  VNClusterObservation *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  objc_super v28;

  v4 = (VNClusterObservation *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VNClusterObservation;
    if (-[VNObservation isEqual:](&v28, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNClusterObservation clusters](self, "clusters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation clusters](v5, "clusters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) == 0)
        goto LABEL_13;
      -[VNClusterObservation suggestionsForCluster](self, "suggestionsForCluster");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation suggestionsForCluster](v5, "suggestionsForCluster");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0)
        goto LABEL_13;
      -[VNClusterObservation clusterState](self, "clusterState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation clusterState](v5, "clusterState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = VisionCoreEqualOrNilObjects();

      if ((v14 & 1) == 0)
        goto LABEL_13;
      -[VNClusterObservation clusteredFaceIds](self, "clusteredFaceIds");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation clusteredFaceIds](v5, "clusteredFaceIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = VisionCoreEqualOrNilObjects();

      if ((v17 & 1) == 0)
        goto LABEL_13;
      -[VNClusterObservation groupedClusteredFaceIdsForCluster](self, "groupedClusteredFaceIdsForCluster");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation groupedClusteredFaceIdsForCluster](v5, "groupedClusteredFaceIdsForCluster");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = VisionCoreEqualOrNilObjects();

      if ((v20 & 1) == 0)
        goto LABEL_13;
      -[VNClusterObservation distance](self, "distance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClusterObservation distance](v5, "distance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = VisionCoreEqualOrNilObjects();

      if ((v23 & 1) != 0)
      {
        -[VNClusterObservation distancesById](self, "distancesById");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNClusterObservation distancesById](v5, "distancesById");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_13:
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (NSArray)clusters
{
  return self->_clusters;
}

- (void)setClusters:(id)a3
{
  objc_storeStrong((id *)&self->_clusters, a3);
}

- (NSArray)suggestionsForCluster
{
  return self->_suggestionsForCluster;
}

- (void)setSuggestionsForCluster:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsForCluster, a3);
}

- (NSData)clusterState
{
  return self->_clusterState;
}

- (void)setClusterState:(id)a3
{
  objc_storeStrong((id *)&self->_clusterState, a3);
}

- (NSSet)clusteredFaceIds
{
  return self->_clusteredFaceIds;
}

- (void)setClusteredFaceIds:(id)a3
{
  objc_storeStrong((id *)&self->_clusteredFaceIds, a3);
}

- (NSArray)groupedClusteredFaceIdsForCluster
{
  return self->_groupedClusteredFaceIdsForCluster;
}

- (void)setGroupedClusteredFaceIdsForCluster:(id)a3
{
  objc_storeStrong((id *)&self->_groupedClusteredFaceIdsForCluster, a3);
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (NSDictionary)distancesById
{
  return self->_distancesById;
}

- (void)setDistancesById:(id)a3
{
  objc_storeStrong((id *)&self->_distancesById, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancesById, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_groupedClusteredFaceIdsForCluster, 0);
  objc_storeStrong((id *)&self->_clusteredFaceIds, 0);
  objc_storeStrong((id *)&self->_clusterState, 0);
  objc_storeStrong((id *)&self->_suggestionsForCluster, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
