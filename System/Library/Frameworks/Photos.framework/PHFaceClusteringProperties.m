@implementation PHFaceClusteringProperties

- (PHFaceClusteringProperties)initWithFetchDictionary:(id)a3 face:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHFaceClusteringProperties *v9;
  PHFaceClusteringProperties *v10;
  uint64_t v11;
  NSString *groupingIdentifier;
  void *v13;
  void *v14;
  void *v15;
  PHFaceprint *v16;
  PHFaceprint *faceprint;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PHFaceClusteringProperties;
  v9 = -[PHFaceClusteringProperties init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._face, v8);
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("groupingIdentifier"));
      v11 = objc_claimAutoreleasedReturnValue();
      groupingIdentifier = v10->_groupingIdentifier;
      v10->_groupingIdentifier = (NSString *)v11;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("faceprint.data"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("faceprint.faceprintVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 && v14)
      {
        v16 = -[PHFaceprint initWithFaceprintData:faceprintVersion:]([PHFaceprint alloc], "initWithFaceprintData:faceprintVersion:", v13, objc_msgSend(v14, "integerValue"));
        faceprint = v10->_faceprint;
        v10->_faceprint = v16;

      }
    }
  }

  return v10;
}

- (PHFaceprint)faceprint
{
  return self->_faceprint;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHFacePropertySetClustering");
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return CFSTR("DetectedFace");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_22;
}

void __47__PHFaceClusteringProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("groupingIdentifier");
  v3[1] = CFSTR("faceprint.data");
  v3[2] = CFSTR("faceprint.faceprintVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_22;
  propertiesToFetch_pl_once_object_22 = v1;

}

@end
