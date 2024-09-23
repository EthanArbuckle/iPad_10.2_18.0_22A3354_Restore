@implementation HKLensSpecification

- (id)_initWithSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 addPower:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKLensSpecification *v14;
  uint64_t v15;
  HKQuantity *sphere;
  uint64_t v17;
  HKQuantity *cylinder;
  uint64_t v19;
  HKQuantity *axis;
  uint64_t v21;
  HKQuantity *addPower;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKLensSpecification;
  v14 = -[HKLensSpecification init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    sphere = v14->_sphere;
    v14->_sphere = (HKQuantity *)v15;

    v17 = objc_msgSend(v11, "copy");
    cylinder = v14->_cylinder;
    v14->_cylinder = (HKQuantity *)v17;

    v19 = objc_msgSend(v12, "copy");
    axis = v14->_axis;
    v14->_axis = (HKQuantity *)v19;

    v21 = objc_msgSend(v13, "copy");
    addPower = v14->_addPower;
    v14->_addPower = (HKQuantity *)v21;

  }
  return v14;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Sphere=%@, Cylinder=%@, Axis=%@, Power=%@>"), v5, self, self->_sphere, self->_cylinder, self->_axis, self->_addPower);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKLensSpecification *v6;
  HKLensSpecification *v7;
  HKQuantity *sphere;
  HKQuantity *v9;
  uint64_t v10;
  HKQuantity *v11;
  void *v12;
  char v13;
  HKQuantity *cylinder;
  HKQuantity *v15;
  uint64_t v16;
  void *v17;
  HKQuantity *v18;
  HKQuantity *axis;
  HKQuantity *v20;
  uint64_t v21;
  HKQuantity *v22;
  uint64_t v23;
  HKQuantity *v24;
  void *v25;
  HKQuantity *addPower;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HKQuantity *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HKQuantity *v39;
  void *v40;
  HKQuantity *v41;
  void *v42;

  v6 = (HKLensSpecification *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      sphere = self->_sphere;
      -[HKLensSpecification sphere](v7, "sphere");
      v9 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      if (sphere != v9)
      {
        -[HKLensSpecification sphere](v7, "sphere");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
          goto LABEL_39;
        }
        v3 = (void *)v10;
        v11 = self->_sphere;
        -[HKLensSpecification sphere](v7, "sphere");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKQuantity isEqual:](v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_38:

          goto LABEL_39;
        }
        v42 = v12;
      }
      cylinder = self->_cylinder;
      -[HKLensSpecification cylinder](v7, "cylinder");
      v15 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      if (cylinder == v15)
      {
        v41 = cylinder;
      }
      else
      {
        -[HKLensSpecification cylinder](v7, "cylinder");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v13 = 0;
          goto LABEL_36;
        }
        v17 = (void *)v16;
        v41 = cylinder;
        v18 = self->_cylinder;
        -[HKLensSpecification cylinder](v7, "cylinder");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKQuantity isEqual:](v18, "isEqual:", v4))
        {

          v13 = 0;
          goto LABEL_37;
        }
        v37 = v17;
      }
      axis = self->_axis;
      -[HKLensSpecification axis](v7, "axis");
      v20 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      v40 = v4;
      if (axis == v20)
      {
        v38 = v3;
        v39 = axis;
      }
      else
      {
        -[HKLensSpecification axis](v7, "axis");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v13 = 0;
LABEL_33:

LABEL_34:
          if (v41 != v15)
          {
LABEL_35:

          }
LABEL_36:

LABEL_37:
          v12 = v42;
          if (sphere != v9)
            goto LABEL_38;
LABEL_39:

          goto LABEL_40;
        }
        v39 = axis;
        v36 = (void *)v21;
        v22 = self->_axis;
        -[HKLensSpecification axis](v7, "axis");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v25 = (void *)v23;
        if (!-[HKQuantity isEqual:](v24, "isEqual:", v23))
        {

          v13 = 0;
          goto LABEL_34;
        }
        v34 = v25;
        v38 = v3;
      }
      addPower = self->_addPower;
      -[HKLensSpecification addPower](v7, "addPower", v34);
      v27 = objc_claimAutoreleasedReturnValue();
      v13 = addPower == (HKQuantity *)v27;
      if (addPower == (HKQuantity *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[HKLensSpecification addPower](v7, "addPower");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          v31 = self->_addPower;
          -[HKLensSpecification addPower](v7, "addPower");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HKQuantity isEqual:](v31, "isEqual:", v32);

          if (v39 == v20)
          {

LABEL_43:
            v3 = v38;
            if (v41 == v15)
              goto LABEL_36;
            goto LABEL_35;
          }

LABEL_41:
          goto LABEL_43;
        }

      }
      if (v39 == v20)
        goto LABEL_41;

      v3 = v38;
      goto LABEL_33;
    }
    v13 = 0;
  }
LABEL_40:

  return v13;
}

- (HKQuantity)sphere
{
  return self->_sphere;
}

- (HKQuantity)cylinder
{
  return self->_cylinder;
}

- (HKQuantity)axis
{
  return self->_axis;
}

- (HKQuantity)addPower
{
  return self->_addPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPower, 0);
  objc_storeStrong((id *)&self->_axis, 0);
  objc_storeStrong((id *)&self->_cylinder, 0);
  objc_storeStrong((id *)&self->_sphere, 0);
}

@end
