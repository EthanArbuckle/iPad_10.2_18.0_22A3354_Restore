@implementation ARObjectDetectionResult

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  char v16;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ARObjectDetectionResult referenceObject](self, "referenceObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "visionTransform");
      v20 = v9;
      v21 = v8;
      v18 = v11;
      v19 = v10;
      -[ARObjectDetectionResult visionTransform](self, "visionTransform");
      v16 = AREqualTransforms(v21, v20, v19, v18, v12, v13, v14, v15);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (__n128)visionTransform
{
  return a1[1];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (ARReferenceObject)referenceObject
{
  return self->_referenceObject;
}

- (void)setReferenceObject:(id)a3
{
  objc_storeStrong((id *)&self->_referenceObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceObject, 0);
}

@end
