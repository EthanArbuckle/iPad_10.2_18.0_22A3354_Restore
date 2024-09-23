@implementation VNFaceAttributeCategory

- (void)_computeLabel
{
  NSArray *v3;
  VNClassificationObservation *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  VNClassificationObservation *v12;
  VNClassificationObservation *mostLikelyLabel;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_allLabelsWithConfidences;
  v4 = 0;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if (!v4
          || (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "confidence", (_QWORD)v14),
              v10 = v9,
              -[VNObservation confidence](v4, "confidence"),
              v10 > v11))
        {
          v12 = v8;

          v4 = v12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  mostLikelyLabel = self->_mostLikelyLabel;
  self->_mostLikelyLabel = v4;

}

- (void)setAllLabelsWithConfidences:(id)a3
{
  NSArray *v4;
  NSArray *allLabelsWithConfidences;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  allLabelsWithConfidences = self->_allLabelsWithConfidences;
  self->_allLabelsWithConfidences = v4;

  -[VNFaceAttributeCategory _computeLabel](self, "_computeLabel");
}

- (VNFaceAttributeCategory)initWithRequestRevision:(unint64_t)a3
{
  VNFaceAttributeCategory *v4;
  VNFaceAttributeCategory *v5;
  VNFaceAttributeCategory *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNFaceAttributeCategory;
  v4 = -[VNFaceAttributeCategory init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_requestRevision = a3;
    v6 = v4;
  }

  return v5;
}

- (VNFaceAttributeCategory)initWithCoder:(id)a3
{
  id v4;
  VNFaceAttributeCategory *v5;
  uint64_t v6;
  uint64_t v7;
  VNClassificationObservation *mostLikelyLabel;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *allLabelsWithConfidences;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VNFaceAttributeCategoryVersion")))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[VNFaceAttributeCategory initWithRequestRevision:](self, "initWithRequestRevision:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("facrRev")));
    if (v5)
    {
      v6 = objc_opt_class();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("FAC_label"));
      v7 = objc_claimAutoreleasedReturnValue();
      mostLikelyLabel = v5->_mostLikelyLabel;
      v5->_mostLikelyLabel = (VNClassificationObservation *)v7;

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), v6, 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("FAC_LAC"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      allLabelsWithConfidences = v5->_allLabelsWithConfidences;
      v5->_allLabelsWithConfidences = (NSArray *)v11;

      self = v5;
      v5 = self;
    }
    else
    {
      self = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 0, CFSTR("VNFaceAttributeCategoryVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requestRevision, CFSTR("facrRev"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mostLikelyLabel, CFSTR("FAC_label"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allLabelsWithConfidences, CFSTR("FAC_LAC"));

}

- (id)vn_cloneObject
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestRevision:", self->_requestRevision);
  v4 = (_QWORD *)v3;
  if (v3)
  {
    objc_storeStrong((id *)(v3 + 8), self->_mostLikelyLabel);
    v5 = -[NSArray copy](self->_allLabelsWithConfidences, "copy");
    v6 = (void *)v4[2];
    v4[2] = v5;

  }
  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNFaceAttributeCategory;
  v3 = -[VNFaceAttributeCategory hash](&v10, sel_hash);
  v4 = -[VNFaceAttributeCategory requestRevision](self, "requestRevision");
  -[VNFaceAttributeCategory label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[VNFaceAttributeCategory allLabelsWithConfidences](self, "allLabelsWithConfidences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ __ROR8__(v6 ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51), 51);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceAttributeCategory *v4;
  VNFaceAttributeCategory *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (VNFaceAttributeCategory *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNFaceAttributeCategory requestRevision](self, "requestRevision");
      if (v6 == -[VNFaceAttributeCategory requestRevision](v5, "requestRevision")
        && (-[VNFaceAttributeCategory label](self, "label"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VNFaceAttributeCategory label](v5, "label"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = VisionCoreEqualOrNilObjects(),
            v8,
            v7,
            (v9 & 1) != 0))
      {
        -[VNFaceAttributeCategory allLabelsWithConfidences](self, "allLabelsWithConfidences");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceAttributeCategory allLabelsWithConfidences](v5, "allLabelsWithConfidences");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = VisionCoreEqualOrNilObjects();

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

- (VNClassificationObservation)label
{
  return self->_mostLikelyLabel;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)allLabelsWithConfidences
{
  return self->_allLabelsWithConfidences;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLabelsWithConfidences, 0);
  objc_storeStrong((id *)&self->_mostLikelyLabel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
