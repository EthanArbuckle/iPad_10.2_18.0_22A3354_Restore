@implementation HKGlassesLensSpecification

- (HKGlassesLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower vertexDistance:(HKQuantity *)vertexDistance prism:(HKVisionPrism *)prism farPupillaryDistance:(HKQuantity *)farPupillaryDistance nearPupillaryDistance:(HKQuantity *)nearPupillaryDistance
{
  HKQuantity *v16;
  HKVisionPrism *v17;
  HKQuantity *v18;
  HKQuantity *v19;
  HKGlassesLensSpecification *v20;
  uint64_t v21;
  HKQuantity *v22;
  uint64_t v23;
  HKVisionPrism *v24;
  uint64_t v25;
  HKQuantity *v26;
  uint64_t v27;
  HKQuantity *v28;
  objc_super v30;

  v16 = vertexDistance;
  v17 = prism;
  v18 = farPupillaryDistance;
  v19 = nearPupillaryDistance;
  v30.receiver = self;
  v30.super_class = (Class)HKGlassesLensSpecification;
  v20 = -[HKLensSpecification _initWithSphere:cylinder:axis:addPower:](&v30, sel__initWithSphere_cylinder_axis_addPower_, sphere, cylinder, axis, addPower);
  if (v20)
  {
    v21 = -[HKQuantity copy](v16, "copy");
    v22 = v20->_vertexDistance;
    v20->_vertexDistance = (HKQuantity *)v21;

    v23 = -[HKVisionPrism copy](v17, "copy");
    v24 = v20->_prism;
    v20->_prism = (HKVisionPrism *)v23;

    v25 = -[HKQuantity copy](v18, "copy");
    v26 = v20->_farPupillaryDistance;
    v20->_farPupillaryDistance = (HKQuantity *)v25;

    v27 = -[HKQuantity copy](v19, "copy");
    v28 = v20->_nearPupillaryDistance;
    v20->_nearPupillaryDistance = (HKQuantity *)v27;

  }
  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Vertex=%@, Prism=%@, FarPupillaryDistance=%@, NearPupillaryDistance=%@>"), v5, self, self->_vertexDistance, self->_prism, self->_farPupillaryDistance, self->_nearPupillaryDistance);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKGlassesLensSpecification *v5;
  HKGlassesLensSpecification *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  HKQuantity *vertexDistance;
  uint64_t v31;
  HKQuantity *v32;
  BOOL v33;
  _BOOL4 v34;
  uint64_t v35;
  HKQuantity *v36;
  _BOOL4 v37;
  HKVisionPrism *prism;
  uint64_t v39;
  HKVisionPrism *v40;
  HKVisionPrism *v41;
  _BOOL4 v42;
  HKQuantity *farPupillaryDistance;
  uint64_t v44;
  HKQuantity *v45;
  void *v46;
  HKQuantity *nearPupillaryDistance;
  uint64_t v48;
  uint64_t v49;
  HKQuantity *v50;
  void *v51;
  HKQuantity *v52;
  HKVisionPrism *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HKQuantity *v59;
  void *v60;
  void *v61;
  HKQuantity *v62;
  HKVisionPrism *v63;
  void *v64;
  void *v65;
  void *v66;
  HKVisionPrism *v67;
  HKQuantity *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  HKQuantity *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;

  v5 = (HKGlassesLensSpecification *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HKLensSpecification sphere](self, "sphere");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification sphere](v6, "sphere");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HKLensSpecification sphere](v6, "sphere");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v11 = 0;
LABEL_86:

          goto LABEL_87;
        }
        -[HKLensSpecification sphere](self, "sphere");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification sphere](v6, "sphere");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_46:

          goto LABEL_86;
        }
        v83 = v10;
        v84 = v9;
      }
      -[HKLensSpecification cylinder](self, "cylinder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification cylinder](v6, "cylinder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v12 != v13;
      if (v12 != v13)
      {
        -[HKLensSpecification cylinder](v6, "cylinder");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          v11 = 0;
          goto LABEL_84;
        }
        v80 = (void *)v14;
        -[HKLensSpecification cylinder](self, "cylinder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification cylinder](v6, "cylinder");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v15;
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_44;
        }
      }
      -[HKLensSpecification axis](self, "axis");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification axis](v6, "axis");
      v17 = objc_claimAutoreleasedReturnValue();
      v85 = v16;
      v18 = v16 != (void *)v17;
      v88 = (void *)v17;
      if (v16 == (void *)v17)
      {
        v77 = 0;
      }
      else
      {
        -[HKLensSpecification axis](v6, "axis");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          v11 = 0;
          if (v12 != v13)
          {
            LOBYTE(v29) = 1;
            goto LABEL_81;
          }
          v29 = 0;
LABEL_89:
          if (!v29)
            goto LABEL_83;
          goto LABEL_82;
        }
        v77 = v18;
        v73 = (void *)v19;
        -[HKLensSpecification axis](self, "axis");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification axis](v6, "axis");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          v11 = 0;
          v21 = v85;
          goto LABEL_43;
        }
      }
      -[HKLensSpecification addPower](self, "addPower");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification addPower](v6, "addPower");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v22 != (void *)v23;
      v79 = (void *)v23;
      if (v22 == (void *)v23)
      {
        v71 = 0;
        v74 = v12;
        v26 = v3;
        v78 = v22;
      }
      else
      {
        -[HKLensSpecification addPower](v6, "addPower");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {

          v11 = 0;
          v21 = v85;
          if (v85 != v88)
          {
            LOBYTE(v37) = 1;
            goto LABEL_78;
          }
          v37 = 0;
          goto LABEL_91;
        }
        v71 = v24;
        v74 = v12;
        v26 = v3;
        v69 = (void *)v25;
        -[HKLensSpecification addPower](self, "addPower");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification addPower](v6, "addPower");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v27;
        v78 = v22;
        if (!objc_msgSend(v27, "isEqual:", v28))
        {
          v11 = 0;
          v21 = v85;
          v3 = v26;
          v12 = v74;
          goto LABEL_42;
        }
        v66 = v28;
      }
      vertexDistance = self->_vertexDistance;
      -[HKGlassesLensSpecification vertexDistance](v6, "vertexDistance");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (HKQuantity *)v31;
      v68 = vertexDistance;
      v33 = vertexDistance == (HKQuantity *)v31;
      v34 = vertexDistance != (HKQuantity *)v31;
      if (v33)
      {
        v72 = (HKQuantity *)v31;
        v3 = v26;
      }
      else
      {
        -[HKGlassesLensSpecification vertexDistance](v6, "vertexDistance");
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
        {

          v11 = 0;
          v21 = v85;
          v3 = v26;
          if (v78 != v79)
          {
            LOBYTE(v42) = 1;
            v12 = v74;
            goto LABEL_75;
          }
          v42 = 0;
          v12 = v74;
LABEL_93:
          if (!v42)
          {
LABEL_77:

            v37 = v77;
            if (v21 != v88)
            {
LABEL_78:

              if (!v37)
                goto LABEL_80;
              goto LABEL_79;
            }
LABEL_91:
            if (v37)
LABEL_79:

LABEL_80:
            v29 = v86;
            if (v12 != v13)
            {
LABEL_81:

              if (!v29)
              {
LABEL_83:

LABEL_84:
                if (v7 != v8)
                {

                  goto LABEL_86;
                }
                goto LABEL_87;
              }
LABEL_82:

              goto LABEL_83;
            }
            goto LABEL_89;
          }
LABEL_76:

          goto LABEL_77;
        }
        v64 = (void *)v35;
        v72 = v32;
        v36 = self->_vertexDistance;
        -[HKGlassesLensSpecification vertexDistance](v6, "vertexDistance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v26;
        if (!-[HKQuantity isEqual:](v36, "isEqual:"))
        {
          v11 = 0;
          v21 = v85;
          v12 = v74;
          goto LABEL_32;
        }
      }
      prism = self->_prism;
      -[HKGlassesLensSpecification prism](v6, "prism");
      v67 = (HKVisionPrism *)objc_claimAutoreleasedReturnValue();
      v63 = prism;
      if (prism != v67)
      {
        -[HKGlassesLensSpecification prism](v6, "prism");
        v39 = objc_claimAutoreleasedReturnValue();
        v12 = v74;
        if (!v39)
        {

          v11 = 0;
          v21 = v85;
          if (v68 != v72)
            goto LABEL_69;
          goto LABEL_72;
        }
        v61 = (void *)v39;
        v40 = self->_prism;
        -[HKGlassesLensSpecification prism](v6, "prism");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKVisionPrism isEqual:](v40, "isEqual:", v60))
        {
          v11 = 0;
          v21 = v85;
          v41 = v67;
LABEL_67:

          if (v68 != v72)
          {
            LOBYTE(v34) = 1;
LABEL_69:

            if (!v34)
              goto LABEL_74;
LABEL_73:

            goto LABEL_74;
          }
          v34 = 0;
LABEL_72:
          if (!v34)
            goto LABEL_74;
          goto LABEL_73;
        }
      }
      farPupillaryDistance = self->_farPupillaryDistance;
      -[HKGlassesLensSpecification farPupillaryDistance](v6, "farPupillaryDistance");
      v62 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      v59 = farPupillaryDistance;
      if (farPupillaryDistance == v62)
      {
        v12 = v74;
      }
      else
      {
        -[HKGlassesLensSpecification farPupillaryDistance](v6, "farPupillaryDistance");
        v44 = objc_claimAutoreleasedReturnValue();
        v12 = v74;
        if (!v44)
        {
          v11 = 0;
          v21 = v85;
          v52 = v62;
          goto LABEL_66;
        }
        v58 = (void *)v44;
        v45 = self->_farPupillaryDistance;
        -[HKGlassesLensSpecification farPupillaryDistance](v6, "farPupillaryDistance");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKQuantity isEqual:](v45, "isEqual:", v46))
        {

          v11 = 0;
          goto LABEL_100;
        }
        v56 = v46;
      }
      nearPupillaryDistance = self->_nearPupillaryDistance;
      -[HKGlassesLensSpecification nearPupillaryDistance](v6, "nearPupillaryDistance", v56);
      v48 = objc_claimAutoreleasedReturnValue();
      v11 = nearPupillaryDistance == (HKQuantity *)v48;
      if (nearPupillaryDistance != (HKQuantity *)v48)
      {
        nearPupillaryDistance = (HKQuantity *)v48;
        -[HKGlassesLensSpecification nearPupillaryDistance](v6, "nearPupillaryDistance");
        v49 = objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v50 = self->_nearPupillaryDistance;
          v87 = (void *)v49;
          -[HKGlassesLensSpecification nearPupillaryDistance](v6, "nearPupillaryDistance");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[HKQuantity isEqual:](v50, "isEqual:", v51);

          if (v59 == v62)
          {

          }
          else
          {

          }
LABEL_100:
          if (v63 != v67)
          {

          }
          if (v68 != v72)
          {

          }
          v55 = v79;
          if (v78 != v79)
          {

            v55 = v79;
          }

          if (v85 != v88)
          {

          }
          if (v12 == v13)
          {
LABEL_45:

            v10 = v83;
            v9 = v84;
            if (v7 != v8)
              goto LABEL_46;
LABEL_87:

            goto LABEL_88;
          }
LABEL_44:

          goto LABEL_45;
        }
      }

      v52 = v62;
      if (v59 == v62)
      {

        v41 = v67;
        v53 = v63;
        v21 = v85;
        if (v63 != v67)
          goto LABEL_67;
        goto LABEL_97;
      }

      v21 = v85;
LABEL_66:

      v41 = v67;
      v53 = v63;
      if (v63 != v67)
        goto LABEL_67;
LABEL_97:

      if (v68 != v72)
      {
LABEL_32:

        v28 = v66;
        if (v78 == v79)
          goto LABEL_77;
LABEL_42:

        if (v21 != v88)
        {
LABEL_43:

          if (v12 != v13)
            goto LABEL_44;
          goto LABEL_83;
        }
        goto LABEL_80;
      }
LABEL_74:

      v42 = v71;
      if (v78 != v79)
      {
LABEL_75:

        if (!v42)
          goto LABEL_77;
        goto LABEL_76;
      }
      goto LABEL_93;
    }
    v11 = 0;
  }
LABEL_88:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HKLensSpecification sphere](self, "sphere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("Sphere"));

  -[HKLensSpecification cylinder](self, "cylinder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("Cyclinder"));

  -[HKLensSpecification axis](self, "axis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("Axis"));

  -[HKLensSpecification addPower](self, "addPower");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("AddPower"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_vertexDistance, CFSTR("VertexDistance"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_prism, CFSTR("Prism"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_farPupillaryDistance, CFSTR("FarPupillaryDistance"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_nearPupillaryDistance, CFSTR("NearPupillaryDistance"));

}

- (HKGlassesLensSpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKGlassesLensSpecification *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sphere"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Cyclinder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Axis"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AddPower"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VertexDistance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Prism"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FarPupillaryDistance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NearPupillaryDistance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKGlassesLensSpecification initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:](self, "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (HKQuantity)vertexDistance
{
  return self->_vertexDistance;
}

- (HKVisionPrism)prism
{
  return self->_prism;
}

- (HKQuantity)farPupillaryDistance
{
  return self->_farPupillaryDistance;
}

- (HKQuantity)nearPupillaryDistance
{
  return self->_nearPupillaryDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearPupillaryDistance, 0);
  objc_storeStrong((id *)&self->_farPupillaryDistance, 0);
  objc_storeStrong((id *)&self->_prism, 0);
  objc_storeStrong((id *)&self->_vertexDistance, 0);
}

@end
