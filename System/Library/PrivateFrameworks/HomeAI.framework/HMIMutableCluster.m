@implementation HMIMutableCluster

- (HMIMutableCluster)initWithFaceprint:(id)a3
{
  id v4;
  HMIMutableCluster *v5;
  HMIMutableFloatArray *v6;
  void *v7;
  uint64_t v8;
  HMIMutableFloatArray *faceCentroid;
  HMIMutableFloatArray *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  HMIMutableFloatArray *torsoCentroid;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *faceprintUUIDs;
  uint64_t v20;
  NSMutableArray *torsoprintUUIDs;
  uint64_t v22;
  NSMutableSet *linkedEntityUUIDs;
  uint64_t v24;
  NSMutableArray *torsoprints;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMIMutableCluster;
  v5 = -[HMIMutableCluster init](&v27, sel_init);
  if (v5)
  {
    v6 = [HMIMutableFloatArray alloc];
    objc_msgSend(v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMIMutableFloatArray initWithData:](v6, "initWithData:", v7);
    faceCentroid = v5->_faceCentroid;
    v5->_faceCentroid = (HMIMutableFloatArray *)v8;

    v10 = [HMIMutableFloatArray alloc];
    -[HMIMutableCluster faceCentroid](v5, "faceCentroid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    LODWORD(v13) = 0;
    v14 = -[HMIMutableFloatArray initWithValue:count:](v10, "initWithValue:count:", v12, v13);
    torsoCentroid = v5->_torsoCentroid;
    v5->_torsoCentroid = (HMIMutableFloatArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v4, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    faceprintUUIDs = v5->_faceprintUUIDs;
    v5->_faceprintUUIDs = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    torsoprintUUIDs = v5->_torsoprintUUIDs;
    v5->_torsoprintUUIDs = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    linkedEntityUUIDs = v5->_linkedEntityUUIDs;
    v5->_linkedEntityUUIDs = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    torsoprints = v5->_torsoprints;
    v5->_torsoprints = (NSMutableArray *)v24;

  }
  return v5;
}

- (HMIMutableCluster)initWithTorsoprint:(id)a3
{
  id v4;
  HMIMutableCluster *v5;
  HMIMutableFloatArray *v6;
  void *v7;
  uint64_t v8;
  HMIMutableFloatArray *torsoCentroid;
  HMIMutableFloatArray *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  HMIMutableFloatArray *faceCentroid;
  uint64_t v16;
  NSMutableArray *faceprintUUIDs;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *torsoprintUUIDs;
  uint64_t v22;
  NSMutableSet *linkedEntityUUIDs;
  uint64_t v24;
  NSMutableArray *torsoprints;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMIMutableCluster;
  v5 = -[HMIMutableCluster init](&v27, sel_init);
  if (v5)
  {
    v6 = [HMIMutableFloatArray alloc];
    objc_msgSend(v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMIMutableFloatArray initWithData:](v6, "initWithData:", v7);
    torsoCentroid = v5->_torsoCentroid;
    v5->_torsoCentroid = (HMIMutableFloatArray *)v8;

    v10 = [HMIMutableFloatArray alloc];
    -[HMIMutableCluster torsoCentroid](v5, "torsoCentroid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    LODWORD(v13) = 0;
    v14 = -[HMIMutableFloatArray initWithValue:count:](v10, "initWithValue:count:", v12, v13);
    faceCentroid = v5->_faceCentroid;
    v5->_faceCentroid = (HMIMutableFloatArray *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    faceprintUUIDs = v5->_faceprintUUIDs;
    v5->_faceprintUUIDs = (NSMutableArray *)v16;

    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v4, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithObject:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    torsoprintUUIDs = v5->_torsoprintUUIDs;
    v5->_torsoprintUUIDs = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    linkedEntityUUIDs = v5->_linkedEntityUUIDs;
    v5->_linkedEntityUUIDs = (NSMutableSet *)v22;

    if ((objc_msgSend(v4, "lowQuality") & 1) != 0 || (objc_msgSend(v4, "unrecognizable") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v4);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    torsoprints = v5->_torsoprints;
    v5->_torsoprints = (NSMutableArray *)v24;

  }
  return v5;
}

- (unint64_t)faceCount
{
  return -[NSMutableArray count](self->_faceprintUUIDs, "count");
}

- (unint64_t)torsoCount
{
  return -[NSMutableArray count](self->_torsoprintUUIDs, "count");
}

- (NSMutableArray)faceprintUUIDs
{
  return (NSMutableArray *)(id)-[NSMutableArray copy](self->_faceprintUUIDs, "copy");
}

- (NSMutableArray)torsoprintUUIDs
{
  return (NSMutableArray *)(id)-[NSMutableArray copy](self->_torsoprintUUIDs, "copy");
}

- (void)addLinkedEntityUUIDs:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_linkedEntityUUIDs, "addObjectsFromArray:", a3);
}

- (NSMutableSet)linkedEntityUUIDs
{
  return (NSMutableSet *)(id)-[NSMutableSet copy](self->_linkedEntityUUIDs, "copy");
}

- (void)addFaceprints:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  HMIMutableFloatArray *v12;
  void *v13;
  HMIMutableFloatArray *v14;
  NSMutableArray *faceprintUUIDs;
  void *v16;
  double v17;
  HMIMutableFloatArray *v18;
  HMIMutableFloatArray *faceCentroid;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[HMIMutableFloatArray copy](self->_faceCentroid, "copy");
  *(float *)&v6 = (float)-[HMIMutableCluster faceCount](self, "faceCount");
  objc_msgSend(v5, "scale:", v6);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = [HMIMutableFloatArray alloc];
        objc_msgSend(v11, "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HMIMutableFloatArray initWithData:](v12, "initWithData:", v13);

        objc_msgSend(v5, "add:", v14);
        faceprintUUIDs = self->_faceprintUUIDs;
        objc_msgSend(v11, "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](faceprintUUIDs, "addObject:", v16);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  *(float *)&v17 = 1.0 / (float)-[HMIMutableCluster faceCount](self, "faceCount");
  objc_msgSend(v5, "floatArrayByScaling:", v17);
  v18 = (HMIMutableFloatArray *)objc_claimAutoreleasedReturnValue();
  faceCentroid = self->_faceCentroid;
  self->_faceCentroid = v18;

}

- (void)addTorsoprints:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  HMIMutableFloatArray *v12;
  void *v13;
  HMIMutableFloatArray *v14;
  NSMutableArray *torsoprintUUIDs;
  void *v16;
  double v17;
  HMIMutableFloatArray *v18;
  HMIMutableFloatArray *torsoCentroid;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[HMIMutableFloatArray copy](self->_torsoCentroid, "copy");
  *(float *)&v6 = (float)-[HMIMutableCluster torsoCount](self, "torsoCount");
  objc_msgSend(v5, "scale:", v6);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = [HMIMutableFloatArray alloc];
        objc_msgSend(v11, "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HMIMutableFloatArray initWithData:](v12, "initWithData:", v13);

        objc_msgSend(v5, "add:", v14);
        torsoprintUUIDs = self->_torsoprintUUIDs;
        objc_msgSend(v11, "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](torsoprintUUIDs, "addObject:", v16);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  *(float *)&v17 = 1.0 / (float)-[HMIMutableCluster torsoCount](self, "torsoCount");
  objc_msgSend(v5, "floatArrayByScaling:", v17);
  v18 = (HMIMutableFloatArray *)objc_claimAutoreleasedReturnValue();
  torsoCentroid = self->_torsoCentroid;
  self->_torsoCentroid = v18;

  objc_msgSend(obj, "na_filter:", &__block_literal_global_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](self->_torsoprints, "addObjectsFromArray:", v20);
  if ((unint64_t)-[NSMutableArray count](self->_torsoprints, "count") >= 0x15)
    -[NSMutableArray removeObjectsInRange:](self->_torsoprints, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_torsoprints, "count") - 20);

}

uint64_t __36__HMIMutableCluster_addTorsoprints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "lowQuality") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "unrecognizable") ^ 1;

  return v3;
}

- (void)flushTorsoprints
{
  NSMutableArray *v3;
  NSMutableArray *torsoprints;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  torsoprints = self->_torsoprints;
  self->_torsoprints = v3;

}

- (HMIMutableFloatArray)faceCentroid
{
  return (HMIMutableFloatArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMIMutableFloatArray)torsoCentroid
{
  return (HMIMutableFloatArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFaceprintUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintUUIDs, a3);
}

- (void)setTorsoprintUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_torsoprintUUIDs, a3);
}

- (void)setLinkedEntityUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_linkedEntityUUIDs, a3);
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFaceRecognition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)torsoprints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTorsoprints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
  objc_storeStrong((id *)&self->_linkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_torsoprintUUIDs, 0);
  objc_storeStrong((id *)&self->_faceprintUUIDs, 0);
  objc_storeStrong((id *)&self->_torsoCentroid, 0);
  objc_storeStrong((id *)&self->_faceCentroid, 0);
}

@end
