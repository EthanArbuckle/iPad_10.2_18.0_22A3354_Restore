@implementation HKContactsLensSpecification

- (HKContactsLensSpecification)initWithSphere:(HKQuantity *)sphere cylinder:(HKQuantity *)cylinder axis:(HKQuantity *)axis addPower:(HKQuantity *)addPower baseCurve:(HKQuantity *)baseCurve diameter:(HKQuantity *)diameter
{
  HKQuantity *v14;
  HKQuantity *v15;
  HKContactsLensSpecification *v16;
  uint64_t v17;
  HKQuantity *v18;
  uint64_t v19;
  HKQuantity *v20;
  objc_super v22;

  v14 = baseCurve;
  v15 = diameter;
  v22.receiver = self;
  v22.super_class = (Class)HKContactsLensSpecification;
  v16 = -[HKLensSpecification _initWithSphere:cylinder:axis:addPower:](&v22, sel__initWithSphere_cylinder_axis_addPower_, sphere, cylinder, axis, addPower);
  if (v16)
  {
    v17 = -[HKQuantity copy](v14, "copy");
    v18 = v16->_baseCurve;
    v16->_baseCurve = (HKQuantity *)v17;

    v19 = -[HKQuantity copy](v15, "copy");
    v20 = v16->_diameter;
    v16->_diameter = (HKQuantity *)v19;

  }
  return v16;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p BaseCurve=%@, Diameter=%@>"), v5, self, self->_baseCurve, self->_diameter);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKContactsLensSpecification *v5;
  HKContactsLensSpecification *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *baseCurve;
  void *v28;
  uint64_t v29;
  HKQuantity *v30;
  void *v31;
  void *v32;
  HKQuantity *diameter;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v5 = (HKContactsLensSpecification *)a3;
  if (self == v5)
  {
    LOBYTE(v3) = 1;
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
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v64)
        {
          LOBYTE(v3) = 0;
          goto LABEL_75;
        }
        -[HKLensSpecification sphere](self, "sphere");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification sphere](v6, "sphere");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v9;
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          LOBYTE(v3) = 0;
LABEL_74:

          goto LABEL_75;
        }
        v61 = v10;
      }
      -[HKLensSpecification cylinder](self, "cylinder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification cylinder](v6, "cylinder");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 == (void *)v12)
      {
        v62 = (void *)v12;
      }
      else
      {
        -[HKLensSpecification cylinder](v6, "cylinder");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {

LABEL_72:
          goto LABEL_73;
        }
        v62 = v13;
        -[HKLensSpecification cylinder](self, "cylinder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification cylinder](v6, "cylinder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0)
        {

          goto LABEL_36;
        }
        v57 = v15;
        v59 = v14;
      }
      -[HKLensSpecification axis](self, "axis");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLensSpecification axis](v6, "axis");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v60)
      {
LABEL_21:
        -[HKLensSpecification addPower](self, "addPower");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification addPower](v6, "addPower");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        v58 = v3;
        if (v21 == (void *)v22)
        {
          v54 = (void *)v22;
          v55 = v11;
          v53 = v16;
LABEL_28:
          baseCurve = self->_baseCurve;
          -[HKContactsLensSpecification baseCurve](v6, "baseCurve");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = baseCurve;
          if (baseCurve == v28)
          {
            v47 = v21;
          }
          else
          {
            -[HKContactsLensSpecification baseCurve](v6, "baseCurve");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              LOBYTE(v3) = 0;
              v40 = v59;
              v39 = v53;
              goto LABEL_49;
            }
            v45 = (void *)v29;
            v30 = self->_baseCurve;
            -[HKContactsLensSpecification baseCurve](v6, "baseCurve");
            baseCurve = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[HKQuantity isEqual:](v30, "isEqual:", baseCurve))
            {
              v31 = v53;

              LOBYTE(v3) = 0;
LABEL_65:
              v23 = v54;
              v32 = v59;
              if (v21 == v54)
              {

                v43 = v60;
                v11 = v55;
                if (v31 == v60)
                  goto LABEL_69;
                goto LABEL_68;
              }

              v11 = v55;
LABEL_67:

              v43 = v60;
              if (v31 == v60)
              {
LABEL_69:

                if (v11 != v62)
                {

                }
                goto LABEL_72;
              }
LABEL_68:

              goto LABEL_69;
            }
            v47 = v21;
          }
          diameter = self->_diameter;
          -[HKContactsLensSpecification diameter](v6, "diameter");
          v34 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v3) = diameter == (HKQuantity *)v34;
          if (diameter != (HKQuantity *)v34)
          {
            diameter = (HKQuantity *)v34;
            -[HKContactsLensSpecification diameter](v6, "diameter");
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v3 = self->_diameter;
              v36 = (void *)v35;
              -[HKContactsLensSpecification diameter](v6, "diameter");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v3) = objc_msgSend(v3, "isEqual:", v37);

              v31 = v53;
              if (v49 == v28)
              {

              }
              else
              {

              }
              v21 = v47;
              goto LABEL_65;
            }
          }
          v38 = baseCurve;

          v39 = v53;
          if (v49 == v28)
          {

            v21 = v47;
            v41 = v48;
            v40 = v59;
            if (v47 == v54)
              goto LABEL_51;
            goto LABEL_50;
          }

          v40 = v59;
          v21 = v47;
LABEL_49:
          v41 = v48;

          if (v21 == v54)
          {
LABEL_51:

            v42 = v60;
            if (v39 != v60)
            {

              v42 = v60;
            }

            if (v55 != v62)
            {

            }
LABEL_73:
            v10 = v61;
            if (v7 != v8)
              goto LABEL_74;
LABEL_75:

            goto LABEL_76;
          }
LABEL_50:

          goto LABEL_51;
        }
        -[HKLensSpecification addPower](v6, "addPower");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          v31 = v16;
          LOBYTE(v3) = 0;
          v32 = v59;
          goto LABEL_67;
        }
        v55 = v11;
        v50 = (void *)v24;
        -[HKLensSpecification addPower](self, "addPower");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification addPower](v6, "addPower");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
        {
          v46 = v26;
          v48 = v25;
          v53 = v16;
          v54 = v23;
          goto LABEL_28;
        }

        if (v16 == v60)
        {

        }
        else
        {

        }
        if (v55 != v62)
        {

        }
LABEL_37:
        LOBYTE(v3) = 0;
        goto LABEL_73;
      }
      -[HKLensSpecification axis](v6, "axis");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v16;
        v56 = (void *)v17;
        -[HKLensSpecification axis](self, "axis");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLensSpecification axis](v6, "axis");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
        {
          v51 = v20;
          v52 = v19;
          v16 = v18;
          goto LABEL_21;
        }

      }
      else
      {

      }
      if (v11 == v62)
      {

      }
      else
      {

      }
LABEL_36:

      goto LABEL_37;
    }
    LOBYTE(v3) = 0;
  }
LABEL_76:

  return (char)v3;
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

  objc_msgSend(v8, "encodeObject:forKey:", self->_baseCurve, CFSTR("BaseCurve"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_diameter, CFSTR("Diameter"));

}

- (HKContactsLensSpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKContactsLensSpecification *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sphere"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Cyclinder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Axis"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AddPower"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BaseCurve"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Diameter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKContactsLensSpecification initWithSphere:cylinder:axis:addPower:baseCurve:diameter:](self, "initWithSphere:cylinder:axis:addPower:baseCurve:diameter:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (HKQuantity)baseCurve
{
  return self->_baseCurve;
}

- (HKQuantity)diameter
{
  return self->_diameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diameter, 0);
  objc_storeStrong((id *)&self->_baseCurve, 0);
}

@end
