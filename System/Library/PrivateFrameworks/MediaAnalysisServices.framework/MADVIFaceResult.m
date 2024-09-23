@implementation MADVIFaceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFaceRectanglesObservations:(id)a3
{
  objc_storeStrong((id *)&self->_faceRectanglesObservations, a3);
}

- (void)setFaceprintObservations:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintObservations, a3);
}

- (void)setFaceAttributesObservations:(id)a3
{
  objc_storeStrong((id *)&self->_faceAttributesObservations, a3);
}

- (void)setFaceExpressionsObservations:(id)a3
{
  objc_storeStrong((id *)&self->_faceExpressionsObservations, a3);
}

- (void)setFaceLandmarksObservations:(id)a3
{
  objc_storeStrong((id *)&self->_faceLandmarksObservations, a3);
}

- (MADVIFaceResult)initWithCoder:(id)a3
{
  id v4;
  MADVIFaceResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *faceRectanglesObservations;
  uint64_t v13;
  NSArray *faceprintObservations;
  uint64_t v15;
  NSArray *faceAttributesObservations;
  uint64_t v17;
  NSArray *faceExpressionsObservations;
  uint64_t v19;
  NSArray *faceLandmarksObservations;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MADVIFaceResult;
  v5 = -[MADResult initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v7 = (void *)getVNFaceObservationClass_softClass;
    v27 = getVNFaceObservationClass_softClass;
    if (!getVNFaceObservationClass_softClass)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __getVNFaceObservationClass_block_invoke;
      v23[3] = &unk_1E97E2300;
      v23[4] = &v24;
      __getVNFaceObservationClass_block_invoke((uint64_t)v23);
      v7 = (void *)v25[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v24, 8);
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FaceRectanglesObservations"));
    v11 = objc_claimAutoreleasedReturnValue();
    faceRectanglesObservations = v5->_faceRectanglesObservations;
    v5->_faceRectanglesObservations = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FaceprintObservations"));
    v13 = objc_claimAutoreleasedReturnValue();
    faceprintObservations = v5->_faceprintObservations;
    v5->_faceprintObservations = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FaceAttributesObservations"));
    v15 = objc_claimAutoreleasedReturnValue();
    faceAttributesObservations = v5->_faceAttributesObservations;
    v5->_faceAttributesObservations = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FaceExpressionsObservations"));
    v17 = objc_claimAutoreleasedReturnValue();
    faceExpressionsObservations = v5->_faceExpressionsObservations;
    v5->_faceExpressionsObservations = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FaceLandmarksObservations"));
    v19 = objc_claimAutoreleasedReturnValue();
    faceLandmarksObservations = v5->_faceLandmarksObservations;
    v5->_faceLandmarksObservations = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIFaceResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceRectanglesObservations, CFSTR("FaceRectanglesObservations"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprintObservations, CFSTR("FaceprintObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceAttributesObservations, CFSTR("FaceAttributesObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceExpressionsObservations, CFSTR("FaceExpressionsObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceLandmarksObservations, CFSTR("FaceLandmarksObservations"));

}

- (unint64_t)executionNanoseconds
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceResult;
  return -[MADResult executionNanoseconds](&v3, sel_executionNanoseconds);
}

- (double)executionTimeInterval
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceResult;
  -[MADResult executionTimeInterval](&v3, sel_executionTimeInterval);
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  void *v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("\nface rectangles observations:\n "));
  if (-[NSArray count](self->_faceRectanglesObservations, "count"))
  {
    v6 = 0;
    do
    {
      if (v6)
        v7 = ",";
      else
        v7 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_faceRectanglesObservations, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ "), v7, v8);

      ++v6;
    }
    while (v6 < -[NSArray count](self->_faceRectanglesObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nfaceprint observations:\n "));
  if (-[NSArray count](self->_faceprintObservations, "count"))
  {
    v9 = 0;
    do
    {
      if (v9)
        v10 = ",";
      else
        v10 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_faceprintObservations, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ "), v10, v11);

      ++v9;
    }
    while (v9 < -[NSArray count](self->_faceprintObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nface attributes observations:\n "));
  if (-[NSArray count](self->_faceAttributesObservations, "count"))
  {
    v12 = 0;
    do
    {
      if (v12)
        v13 = ",";
      else
        v13 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_faceAttributesObservations, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ "), v13, v14);

      ++v12;
    }
    while (v12 < -[NSArray count](self->_faceAttributesObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nface expressions observations:\n "));
  if (-[NSArray count](self->_faceExpressionsObservations, "count"))
  {
    v15 = 0;
    do
    {
      if (v15)
        v16 = ",";
      else
        v16 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_faceExpressionsObservations, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ "), v16, v17);

      ++v15;
    }
    while (v15 < -[NSArray count](self->_faceExpressionsObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nface landmarks observations:\n "));
  if (-[NSArray count](self->_faceLandmarksObservations, "count"))
  {
    v18 = 0;
    do
    {
      if (v18)
        v19 = ",";
      else
        v19 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_faceLandmarksObservations, "objectAtIndexedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ "), v19, v20);

      ++v18;
    }
    while (v18 < -[NSArray count](self->_faceLandmarksObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)faceRectanglesObservations
{
  return self->_faceRectanglesObservations;
}

- (NSArray)faceprintObservations
{
  return self->_faceprintObservations;
}

- (NSArray)faceAttributesObservations
{
  return self->_faceAttributesObservations;
}

- (NSArray)faceExpressionsObservations
{
  return self->_faceExpressionsObservations;
}

- (NSArray)faceLandmarksObservations
{
  return self->_faceLandmarksObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLandmarksObservations, 0);
  objc_storeStrong((id *)&self->_faceExpressionsObservations, 0);
  objc_storeStrong((id *)&self->_faceAttributesObservations, 0);
  objc_storeStrong((id *)&self->_faceprintObservations, 0);
  objc_storeStrong((id *)&self->_faceRectanglesObservations, 0);
}

@end
