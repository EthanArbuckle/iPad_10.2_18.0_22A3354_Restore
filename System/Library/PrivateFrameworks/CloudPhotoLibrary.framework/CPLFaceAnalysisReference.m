@implementation CPLFaceAnalysisReference

- (void)setFaces:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_6206);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_32_6207);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "count");
  if (v11)
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
  else
    v12 = 0;
  v19.receiver = self;
  v19.super_class = (Class)CPLFaceAnalysisReference;
  -[CPLFaceAnalysis setFaceInstances:](&v19, sel_setFaceInstances_, v12);
  if (v11)

  v13 = objc_msgSend(v8, "count");
  if (v13)
    v14 = (void *)objc_msgSend(v8, "mutableCopy");
  else
    v14 = 0;
  v18.receiver = self;
  v18.super_class = (Class)CPLFaceAnalysisReference;
  -[CPLFaceAnalysis setPetFaceInstances:](&v18, sel_setPetFaceInstances_, v14);
  if (v13)

  v15 = objc_msgSend(v10, "count");
  if (v15)
    v16 = (void *)objc_msgSend(v10, "mutableCopy");
  else
    v16 = 0;
  v17.receiver = self;
  v17.super_class = (Class)CPLFaceAnalysisReference;
  -[CPLFaceAnalysis setTorsoFaceInstances:](&v17, sel_setTorsoFaceInstances_, v16);
  if (v15)

}

- (void)addFace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isPetDetectionType"))
    {
      -[CPLFaceAnalysis petFaceInstances](self, "petFaceInstances");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v5, "isTorsoOnly"))
        -[CPLFaceAnalysis torsoFaceInstances](self, "torsoFaceInstances");
      else
        -[CPLFaceAnalysis faceInstances](self, "faceInstances");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "insertObject:atIndex:", v5, objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_46));
    }
    else if (objc_msgSend(v5, "isPetDetectionType"))
    {
      -[CPLFaceAnalysis addPetFaceInstances:](&v10, sel_addPetFaceInstances_, v5, v8.receiver, v8.super_class, v9.receiver, v9.super_class, self, CPLFaceAnalysisReference);
    }
    else if (objc_msgSend(v5, "isTorsoOnly"))
    {
      -[CPLFaceAnalysis addTorsoFaceInstances:](&v9, sel_addTorsoFaceInstances_, v5, v8.receiver, v8.super_class, self, CPLFaceAnalysisReference, v10.receiver, v10.super_class);
    }
    else
    {
      -[CPLFaceAnalysis addFaceInstances:](&v8, sel_addFaceInstances_, v5, self, CPLFaceAnalysisReference, v9.receiver, v9.super_class, v10.receiver, v10.super_class);
    }

  }
}

- (NSArray)faces
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CPLFaceAnalysis faceInstances](self, "faceInstances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CPLFaceAnalysis faceInstances](self, "faceInstances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[CPLFaceAnalysis petFaceInstances](self, "petFaceInstances");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[CPLFaceAnalysis petFaceInstances](self, "petFaceInstances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  -[CPLFaceAnalysis torsoFaceInstances](self, "torsoFaceInstances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[CPLFaceAnalysis torsoFaceInstances](self, "torsoFaceInstances");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v13;
}

uint64_t __36__CPLFaceAnalysisReference_addFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isPetDetectionType") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isTorsoOnly");

  return v3;
}

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPetDetectionType");
}

uint64_t __37__CPLFaceAnalysisReference_setFaces___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isPetDetectionType") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isTorsoOnly") ^ 1;

  return v3;
}

@end
