@implementation VNFaceAttributes

- (VNFaceAttributes)initWithRequestRevision:(unint64_t)a3
{
  VNFaceAttributes *v4;
  VNFaceAttributes *v5;
  VNFaceAttributes *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNFaceAttributes;
  v4 = -[VNFaceAttributes init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_requestRevision = a3;
    v6 = v4;
  }

  return v5;
}

- (VNFaceAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNFaceAttributes *v7;
  uint64_t v9;
  uint64_t v10;
  VNFaceAttributeCategory *ageCategory;
  uint64_t v12;
  VNFaceAttributeCategory *VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
  uint64_t v14;
  VNFaceAttributeCategory *eyesCategory;
  uint64_t v16;
  VNFaceAttributeCategory *smilingCategory;
  uint64_t v18;
  VNFaceAttributeCategory *faceHairCategory;
  uint64_t v20;
  VNFaceAttributeCategory *hairColorCategory;
  uint64_t v22;
  VNFaceAttributeCategory *baldCategory;
  uint64_t v24;
  VNFaceAttributeCategory *glassesCategory;
  uint64_t v26;
  VNFaceAttributeCategory *facemaskCategory;
  uint64_t v28;
  VNFaceAttributeCategory *makeupCategory;
  uint64_t v30;
  VNFaceAttributeCategory *makeupEyesCategory;
  uint64_t v32;
  uint64_t v33;
  VNFaceAttributeCategory *VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
  uint64_t v35;
  VNFaceAttributeCategory *VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
  uint64_t v37;
  VNFaceAttributeCategory *VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
  uint64_t v39;
  VNFaceAttributeCategory *VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
  uint64_t v41;
  VNFaceAttributeCategory *VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
  uint64_t v43;
  VNFaceAttributeCategory *VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
  uint64_t v45;
  VNFaceAttributeCategory *VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNFaceAttributesVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "unsignedIntValue"))
  {
    v7 = -[VNFaceAttributes initWithRequestRevision:](self, "initWithRequestRevision:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("farRev")));
    if (v7)
    {
      v9 = objc_opt_class();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("age_Cat"));
      v10 = objc_claimAutoreleasedReturnValue();
      ageCategory = v7->_ageCategory;
      v7->_ageCategory = (VNFaceAttributeCategory *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("gender_Cat"));
      v12 = objc_claimAutoreleasedReturnValue();
      VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = v7->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
      v7->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = (VNFaceAttributeCategory *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("eyes_Cat"));
      v14 = objc_claimAutoreleasedReturnValue();
      eyesCategory = v7->_eyesCategory;
      v7->_eyesCategory = (VNFaceAttributeCategory *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("smiling_Cat"));
      v16 = objc_claimAutoreleasedReturnValue();
      smilingCategory = v7->_smilingCategory;
      v7->_smilingCategory = (VNFaceAttributeCategory *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("facehair_Cat"));
      v18 = objc_claimAutoreleasedReturnValue();
      faceHairCategory = v7->_faceHairCategory;
      v7->_faceHairCategory = (VNFaceAttributeCategory *)v18;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("haircolor_Cat"));
      v20 = objc_claimAutoreleasedReturnValue();
      hairColorCategory = v7->_hairColorCategory;
      v7->_hairColorCategory = (VNFaceAttributeCategory *)v20;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("bald_Cat"));
      v22 = objc_claimAutoreleasedReturnValue();
      baldCategory = v7->_baldCategory;
      v7->_baldCategory = (VNFaceAttributeCategory *)v22;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("glasses_Cat"));
      v24 = objc_claimAutoreleasedReturnValue();
      glassesCategory = v7->_glassesCategory;
      v7->_glassesCategory = (VNFaceAttributeCategory *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("facemask_Cat"));
      v26 = objc_claimAutoreleasedReturnValue();
      facemaskCategory = v7->_facemaskCategory;
      v7->_facemaskCategory = (VNFaceAttributeCategory *)v26;

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("makeup_Cat")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("makeup_Cat"));
        v28 = objc_claimAutoreleasedReturnValue();
        makeupCategory = v7->_makeupCategory;
        v7->_makeupCategory = (VNFaceAttributeCategory *)v28;
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("makeupEyes_Cat"));
        v30 = objc_claimAutoreleasedReturnValue();
        makeupEyesCategory = v7->_makeupEyesCategory;
        v7->_makeupEyesCategory = (VNFaceAttributeCategory *)v30;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("makeupLips_Cat"));
        v32 = objc_claimAutoreleasedReturnValue();
        makeupCategory = v7->_makeupLipsCategory;
        v7->_makeupLipsCategory = (VNFaceAttributeCategory *)v32;
      }

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("unknown01_Cat")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown01_Cat"));
        v33 = objc_claimAutoreleasedReturnValue();
        VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB = v7->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
        v7->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB = (VNFaceAttributeCategory *)v33;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown02_Cat"));
        v35 = objc_claimAutoreleasedReturnValue();
        VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1 = v7->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
        v7->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1 = (VNFaceAttributeCategory *)v35;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown03_Cat"));
        v37 = objc_claimAutoreleasedReturnValue();
        VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk = v7->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
        v7->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk = (VNFaceAttributeCategory *)v37;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown04_Cat"));
        v39 = objc_claimAutoreleasedReturnValue();
        VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP = v7->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
        v7->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP = (VNFaceAttributeCategory *)v39;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown05_Cat"));
        v41 = objc_claimAutoreleasedReturnValue();
        VN2riiZbQrloRhCzYW56f0rk4N3ROe151S = v7->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
        v7->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S = (VNFaceAttributeCategory *)v41;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown06_Cat"));
        v43 = objc_claimAutoreleasedReturnValue();
        VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk = v7->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
        v7->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk = (VNFaceAttributeCategory *)v43;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unknown07_Cat"));
        v45 = objc_claimAutoreleasedReturnValue();
        VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq = v7->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
        v7->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq = (VNFaceAttributeCategory *)v45;

      }
      self = v7;
      v7 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("VNFaceAttributesVersion"));

  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestRevision, CFSTR("farRev"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ageCategory, CFSTR("age_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE, CFSTR("gender_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eyesCategory, CFSTR("eyes_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_smilingCategory, CFSTR("smiling_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faceHairCategory, CFSTR("facehair_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hairColorCategory, CFSTR("haircolor_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baldCategory, CFSTR("bald_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_glassesCategory, CFSTR("glasses_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_makeupEyesCategory, CFSTR("makeupEyes_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_makeupLipsCategory, CFSTR("makeupLips_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_facemaskCategory, CFSTR("facemask_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB, CFSTR("unknown01_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1, CFSTR("unknown02_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk, CFSTR("unknown03_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP, CFSTR("unknown04_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S, CFSTR("unknown05_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk, CFSTR("unknown06_Cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq, CFSTR("unknown07_Cat"));

}

- (id)vn_cloneObject
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestRevision:", self->_requestRevision);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setAgeCategory:", self->_ageCategory);
    -[VNFaceAttributes setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:]((uint64_t)v4, self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE);
    -[VNFaceAttributes setEyesCategory:]((uint64_t)v4, self->_eyesCategory);
    -[VNFaceAttributes setSmilingCategory:]((uint64_t)v4, self->_smilingCategory);
    -[VNFaceAttributes setFaceHairCategory:]((uint64_t)v4, self->_faceHairCategory);
    -[VNFaceAttributes setHairColorCategory:]((uint64_t)v4, self->_hairColorCategory);
    -[VNFaceAttributes setBaldCategory:]((uint64_t)v4, self->_baldCategory);
    -[VNFaceAttributes setGlassesCategory:]((uint64_t)v4, self->_glassesCategory);
    -[VNFaceAttributes setMakeupEyesCategory:]((uint64_t)v4, self->_makeupEyesCategory);
    -[VNFaceAttributes setMakeupLipsCategory:]((uint64_t)v4, self->_makeupLipsCategory);
    -[VNFaceAttributes setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:]((uint64_t)v4, self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB);
    -[VNFaceAttributes setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:]((uint64_t)v4, self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1);
    -[VNFaceAttributes setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:]((uint64_t)v4, self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk);
    -[VNFaceAttributes setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:]((uint64_t)v4, self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP);
    -[VNFaceAttributes setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:]((uint64_t)v4, self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S);
    -[VNFaceAttributes setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:]((uint64_t)v4, self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk);
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v4, self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq);
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v4, self->_facemaskCategory);
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)VNFaceAttributes;
  v3 = -[VNFaceAttributes hash](&v49, sel_hash);
  v4 = -[VNFaceAttributes requestRevision](self, "requestRevision");
  -[VNFaceAttributes ageCategory](self, "ageCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[VNFaceAttributes VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE](self, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VNFaceAttributes eyesCategory](self, "eyesCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[VNFaceAttributes smilingCategory](self, "smilingCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[VNFaceAttributes faceHairCategory](self, "faceHairCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  -[VNFaceAttributes hairColorCategory](self, "hairColorCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  -[VNFaceAttributes baldCategory](self, "baldCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v17, "hash");

  -[VNFaceAttributes glassesCategory](self, "glassesCategory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v18, "hash");

  -[VNFaceAttributes makeupEyesCategory](self, "makeupEyesCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v19, "hash");

  -[VNFaceAttributes makeupLipsCategory](self, "makeupLipsCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v20, "hash");

  -[VNFaceAttributes VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB](self, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v21, "hash");

  -[VNFaceAttributes VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1](self, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v22, "hash");

  -[VNFaceAttributes VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk](self, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v23, "hash");
  v39 = v16;
  v40 = v14;
  v41 = v12;

  -[VNFaceAttributes VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP](self, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v24, "hash");
  v25 = v10;
  v26 = v8;
  v27 = v6;

  -[VNFaceAttributes VN2riiZbQrloRhCzYW56f0rk4N3ROe151S](self, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash");
  v30 = v4;

  -[VNFaceAttributes VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk](self, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "hash");

  -[VNFaceAttributes VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq](self, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hash");

  -[VNFaceAttributes facemaskCategory](self, "facemaskCategory");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "hash") ^ __ROR8__(v34 ^ __ROR8__(v32 ^ __ROR8__(v29 ^ __ROR8__(v38 ^ __ROR8__(v42 ^ __ROR8__(v43 ^ __ROR8__(v44 ^ __ROR8__(v45 ^ __ROR8__(v46 ^ __ROR8__(v47 ^ __ROR8__(v48 ^ __ROR8__(v39 ^ __ROR8__(v40 ^ __ROR8__(v41 ^ __ROR8__(v25 ^ __ROR8__(v26 ^ __ROR8__(v27 ^ __ROR8__(v30 ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51);

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceAttributes *v4;
  VNFaceAttributes *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  char v60;

  v4 = (VNFaceAttributes *)a3;
  if (self == v4)
  {
    v60 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNFaceAttributes requestRevision](self, "requestRevision");
      if (v6 != -[VNFaceAttributes requestRevision](v5, "requestRevision"))
        goto LABEL_24;
      -[VNFaceAttributes ageCategory](self, "ageCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes ageCategory](v5, "ageCategory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = VisionCoreEqualOrNilObjects();

      if ((v9 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE](self, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE](v5, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes eyesCategory](self, "eyesCategory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes eyesCategory](v5, "eyesCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = VisionCoreEqualOrNilObjects();

      if ((v15 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes smilingCategory](self, "smilingCategory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes smilingCategory](v5, "smilingCategory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = VisionCoreEqualOrNilObjects();

      if ((v18 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes faceHairCategory](self, "faceHairCategory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes faceHairCategory](v5, "faceHairCategory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = VisionCoreEqualOrNilObjects();

      if ((v21 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes hairColorCategory](self, "hairColorCategory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes hairColorCategory](v5, "hairColorCategory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = VisionCoreEqualOrNilObjects();

      if ((v24 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes baldCategory](self, "baldCategory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes baldCategory](v5, "baldCategory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = VisionCoreEqualOrNilObjects();

      if ((v27 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes glassesCategory](self, "glassesCategory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes glassesCategory](v5, "glassesCategory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = VisionCoreEqualOrNilObjects();

      if ((v30 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes makeupEyesCategory](self, "makeupEyesCategory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes makeupEyesCategory](v5, "makeupEyesCategory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = VisionCoreEqualOrNilObjects();

      if ((v33 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes makeupLipsCategory](self, "makeupLipsCategory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes makeupLipsCategory](v5, "makeupLipsCategory");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = VisionCoreEqualOrNilObjects();

      if ((v36 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB](self, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB](v5, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = VisionCoreEqualOrNilObjects();

      if ((v39 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1](self, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1](v5, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = VisionCoreEqualOrNilObjects();

      if ((v42 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk](self, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk](v5, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = VisionCoreEqualOrNilObjects();

      if ((v45 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP](self, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP](v5, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = VisionCoreEqualOrNilObjects();

      if ((v48 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN2riiZbQrloRhCzYW56f0rk4N3ROe151S](self, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN2riiZbQrloRhCzYW56f0rk4N3ROe151S](v5, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = VisionCoreEqualOrNilObjects();

      if ((v51 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk](self, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk](v5, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = VisionCoreEqualOrNilObjects();

      if ((v54 & 1) == 0)
        goto LABEL_24;
      -[VNFaceAttributes VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq](self, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceAttributes VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq](v5, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = VisionCoreEqualOrNilObjects();

      if ((v57 & 1) != 0)
      {
        -[VNFaceAttributes facemaskCategory](self, "facemaskCategory");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceAttributes facemaskCategory](v5, "facemaskCategory");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_24:
        v60 = 0;
      }

    }
    else
    {
      v60 = 0;
    }
  }

  return v60;
}

- (VNFaceAttributeCategory)ageCategory
{
  return self->_ageCategory;
}

- (void)setAgeCategory:(id)a3
{
  VNFaceAttributeCategory *v4;
  VNFaceAttributeCategory *ageCategory;
  id v6;

  v6 = a3;
  v4 = (VNFaceAttributeCategory *)objc_msgSend(v6, "copy");
  ageCategory = self->_ageCategory;
  self->_ageCategory = v4;

}

- (VNFaceAttributeCategory)VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (VNFaceAttributeCategory)eyesCategory
{
  return self->_eyesCategory;
}

- (VNFaceAttributeCategory)smilingCategory
{
  return self->_smilingCategory;
}

- (VNFaceAttributeCategory)faceHairCategory
{
  return self->_faceHairCategory;
}

- (VNFaceAttributeCategory)hairColorCategory
{
  return self->_hairColorCategory;
}

- (VNFaceAttributeCategory)baldCategory
{
  return self->_baldCategory;
}

- (VNFaceAttributeCategory)glassesCategory
{
  return self->_glassesCategory;
}

- (VNFaceAttributeCategory)makeupCategory
{
  return self->_makeupCategory;
}

- (VNFaceAttributeCategory)makeupEyesCategory
{
  return self->_makeupEyesCategory;
}

- (VNFaceAttributeCategory)makeupLipsCategory
{
  return self->_makeupLipsCategory;
}

- (VNFaceAttributeCategory)VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB
{
  return self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
}

- (VNFaceAttributeCategory)VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1
{
  return self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
}

- (VNFaceAttributeCategory)VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk
{
  return self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
}

- (VNFaceAttributeCategory)VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP
{
  return self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
}

- (VNFaceAttributeCategory)VN2riiZbQrloRhCzYW56f0rk4N3ROe151S
{
  return self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
}

- (VNFaceAttributeCategory)VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk
{
  return self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
}

- (VNFaceAttributeCategory)VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq
{
  return self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
}

- (VNFaceAttributeCategory)facemaskCategory
{
  return self->_facemaskCategory;
}

- (void)setVN5ui9WkMeVvCBruHiQE1q2r6E9kO1AyrP:(id)a3
{
  VNFaceAttributeCategory *v4;
  VNFaceAttributeCategory *VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
  id v6;

  v6 = a3;
  v4 = (VNFaceAttributeCategory *)objc_msgSend(v6, "copy");
  VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
  self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = v4;

}

- (VNFaceAttributeCategory)genderCategory
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (VNFaceAttributeCategory)vn7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (VNFaceAttributeCategory)vn1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB
{
  return self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
}

- (VNFaceAttributeCategory)vn4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1
{
  return self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
}

- (VNFaceAttributeCategory)vn7CbCeAogPS2iHE6VQwu6H96xanljtMqk
{
  return self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
}

- (VNFaceAttributeCategory)vn7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP
{
  return self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
}

- (VNFaceAttributeCategory)vn2riiZbQrloRhCzYW56f0rk4N3ROe151S
{
  return self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
}

- (VNFaceAttributeCategory)vNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk
{
  return self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
}

- (VNFaceAttributeCategory)vn3iT1YRjjnIuELobV1olJiO1vvItN6Kdq
{
  return self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facemaskCategory, 0);
  objc_storeStrong((id *)&self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq, 0);
  objc_storeStrong((id *)&self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk, 0);
  objc_storeStrong((id *)&self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S, 0);
  objc_storeStrong((id *)&self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP, 0);
  objc_storeStrong((id *)&self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk, 0);
  objc_storeStrong((id *)&self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1, 0);
  objc_storeStrong((id *)&self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB, 0);
  objc_storeStrong((id *)&self->_makeupLipsCategory, 0);
  objc_storeStrong((id *)&self->_makeupEyesCategory, 0);
  objc_storeStrong((id *)&self->_makeupCategory, 0);
  objc_storeStrong((id *)&self->_glassesCategory, 0);
  objc_storeStrong((id *)&self->_baldCategory, 0);
  objc_storeStrong((id *)&self->_hairColorCategory, 0);
  objc_storeStrong((id *)&self->_faceHairCategory, 0);
  objc_storeStrong((id *)&self->_smilingCategory, 0);
  objc_storeStrong((id *)&self->_eyesCategory, 0);
  objc_storeStrong((id *)&self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE, 0);
  objc_storeStrong((id *)&self->_ageCategory, 0);
}

- (void)setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;

    v3 = v6;
  }

}

- (void)setEyesCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v4;

    v3 = v6;
  }

}

- (void)setSmilingCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v4;

    v3 = v6;
  }

}

- (void)setFaceHairCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

    v3 = v6;
  }

}

- (void)setHairColorCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v4;

    v3 = v6;
  }

}

- (void)setBaldCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v4;

    v3 = v6;
  }

}

- (void)setGlassesCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v4;

    v3 = v6;
  }

}

- (void)setMakeupEyesCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v4;

    v3 = v6;
  }

}

- (void)setMakeupLipsCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;

    v3 = v6;
  }

}

- (void)setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v4;

    v3 = v6;
  }

}

- (void)setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v4;

    v3 = v6;
  }

}

- (void)setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v4;

    v3 = v6;
  }

}

- (void)setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v4;

    v3 = v6;
  }

}

- (void)setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v4;

    v3 = v6;
  }

}

- (void)setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v4;

    v3 = v6;
  }

}

- (void)setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v4;

    v3 = v6;
  }

}

- (void)setFacemaskCategory:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "copy");
    v5 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = v4;

    v3 = v6;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
