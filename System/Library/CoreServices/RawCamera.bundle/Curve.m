@implementation Curve

+ (id)curve
{
  Curve *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = [Curve alloc];
  return (id)objc_msgSend_init(v2, v3, v4, v5, v6);
}

- (Curve)init
{
  char *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)Curve;
  v2 = -[Curve init](&v10, sel_init);
  objc_msgSend_setFunction_(v2, v3, (uint64_t)&unk_1E9991600, v4, v5);
  objc_msgSend_setInverse_(v2, v6, (uint64_t)&unk_1E9991620, v7, v8);
  *(_OWORD *)(v2 + 24) = xmmword_1D544E160;
  *(_OWORD *)(v2 + 40) = xmmword_1D544E160;
  return (Curve *)v2;
}

+ (id)curveWithGamma:(double)a3
{
  void *v3;
  Curve *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    v5 = [Curve alloc];
    v3 = (void *)objc_msgSend_initWithGamma_(v5, v6, v7, v8, v9, a3);
  }
  return v3;
}

- (Curve)initWithGamma:(double)a3
{
  Curve *v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  objc_super v15;

  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)Curve;
    self = -[Curve init](&v15, sel_init);
    v3 = self;
    if (self)
    {
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1D53A00B0;
      v14[3] = &unk_1E9991640;
      *(double *)&v14[4] = a3;
      objc_msgSend_setFunction_(self, v5, (uint64_t)v14, v6, v7);
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = sub_1D53A00E8;
      v13[3] = &unk_1E9991640;
      *(double *)&v13[4] = a3;
      objc_msgSend_setInverse_(v3, v9, (uint64_t)v13, v10, v11);
      self = v3;
      v3 = self;
    }
  }

  return v3;
}

+ (id)curveWithInverseOf:(id)a3
{
  id v3;
  Curve *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = [Curve alloc];
    v8 = (void *)objc_msgSend_initWithInverseOf_(v4, v5, (uint64_t)v3, v6, v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (Curve)initWithInverseOf:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  Curve *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  objc_super v39;

  v4 = a3;
  if (v4
    && (v39.receiver = self, v39.super_class = (Class)Curve, (self = -[Curve init](&v39, sel_init)) != 0))
  {
    objc_msgSend_rangeMin(v4, v5, v6, v7, v8);
    self->_domainMin = v9;
    objc_msgSend_rangeMax(v4, v10, v11, v12, v13);
    self->_domainMax = v14;
    objc_msgSend_domainMin(v4, v15, v16, v17, v18);
    self->_rangeMin = v19;
    objc_msgSend_domainMax(v4, v20, v21, v22, v23);
    self->_rangeMax = v24;
    v25 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = sub_1D53A02B0;
    v37[3] = &unk_1E9991668;
    v26 = v4;
    v38 = v26;
    objc_msgSend_setFunction_(self, v27, (uint64_t)v37, v28, v29);
    v35[0] = v25;
    v35[1] = 3221225472;
    v35[2] = sub_1D53A02FC;
    v35[3] = &unk_1E9991668;
    v36 = v26;
    objc_msgSend_setInverse_(self, v30, (uint64_t)v35, v31, v32);
    self = self;

    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (id)curveWith:(id)a3 of:(id)a4
{
  void *v4;
  id v6;
  id v7;
  Curve *v8;
  const char *v9;
  uint64_t v10;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = [Curve alloc];
    v4 = (void *)objc_msgSend_initWith_of_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  }
  return v4;
}

- (Curve)initWith:(id)a3 of:(id)a4
{
  id v6;
  id v7;
  void *v8;
  Curve *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  id v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  objc_super v46;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v46.receiver = self;
    v46.super_class = (Class)Curve;
    self = -[Curve init](&v46, sel_init);
    if (self)
    {
      objc_msgSend_domainMin(v8, v10, v11, v12, v13);
      self->_domainMin = v14;
      objc_msgSend_domainMax(v8, v15, v16, v17, v18);
      self->_domainMax = v19;
      objc_msgSend_rangeMin(v6, v20, v21, v22, v23);
      self->_rangeMin = v24;
      objc_msgSend_rangeMax(v6, v25, v26, v27, v28);
      self->_rangeMax = v29;
      v30 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = sub_1D53A0530;
      v43[3] = &unk_1E9991690;
      v31 = v6;
      v44 = v31;
      v32 = v8;
      v45 = v32;
      objc_msgSend_setFunction_(self, v33, (uint64_t)v43, v34, v35);
      v40[0] = v30;
      v40[1] = 3221225472;
      v40[2] = sub_1D53A05A0;
      v40[3] = &unk_1E9991690;
      v41 = v32;
      v42 = v31;
      objc_msgSend_setInverse_(self, v36, (uint64_t)v40, v37, v38);
      self = self;

      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithBlock:(id)a3 andInverse:(id)a4
{
  void *v4;
  id v6;
  id v7;
  Curve *v8;
  const char *v9;
  uint64_t v10;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = [Curve alloc];
    v4 = (void *)objc_msgSend_initWithBlock_andInverse_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  }
  return v4;
}

- (Curve)initWithBlock:(id)a3 andInverse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  Curve *v9;
  Curve *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)Curve;
    v10 = -[Curve init](&v18, sel_init);
    self = v10;
    if (v10)
    {
      objc_msgSend_setFunction_(v10, v11, (uint64_t)v6, v12, v13);
      objc_msgSend_setInverse_(self, v14, (uint64_t)v8, v15, v16);
      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5
{
  id v7;
  void *v8;
  Curve *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = 0;
  if (v7)
  {
    if (fabs(a4) != INFINITY)
    {
      v8 = 0;
      if (a5 > a4 && fabs(a5) != INFINITY)
      {
        v9 = [Curve alloc];
        v8 = (void *)objc_msgSend_initWithBlock_domainMin_domainMax_(v9, v10, (uint64_t)v7, v11, v12, a4, a5);
      }
    }
  }

  return v8;
}

- (Curve)initWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5
{
  id v8;
  Curve *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = 0;
  if (v8 && fabs(a4) != INFINITY && fabs(a5) != INFINITY)
  {
    v19.receiver = self;
    v19.super_class = (Class)Curve;
    v10 = -[Curve init](&v19, sel_init);
    self = (Curve *)v10;
    if (v10)
    {
      *((double *)v10 + 3) = a4;
      *((double *)v10 + 4) = a5;
      *(_OWORD *)(v10 + 40) = xmmword_1D544E160;
      objc_msgSend_setFunction_(v10, v11, (uint64_t)v8, v12, v13);
      sub_1D53A08C0(v8, a4, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInverse_(self, v15, (uint64_t)v14, v16, v17);

      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6
{
  void *v8;
  uint64_t v9;
  Curve *v11;
  const char *v12;
  uint64_t v13;

  v8 = 0;
  if (fabs(a4) != INFINITY)
  {
    v9 = *(_QWORD *)&a3;
    if (a3 >= 2)
    {
      if (a6)
      {
        v8 = 0;
        if (a5 > a4 && fabs(a5) != INFINITY)
        {
          v11 = [Curve alloc];
          v8 = (void *)objc_msgSend_initWithCount_domainMin_domainMax_values_(v11, v12, v9, (uint64_t)a6, v13, a4, a5);
        }
      }
    }
  }
  return v8;
}

- (Curve)initWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6
{
  Curve *v8;
  Curve *v9;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  int v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  double *v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v58[4];
  id v59;
  double v60;
  double v61;
  int v62;
  _QWORD v63[4];
  id v64;
  double v65;
  double v66;
  int v67;
  _QWORD v68[4];
  id v69;
  double v70;
  double v71;
  int v72;
  objc_super v73;

  v8 = self;
  v9 = 0;
  if (fabs(a4) != INFINITY && a3 >= 2)
  {
    if (a6)
    {
      v9 = 0;
      if (a5 > a4 && fabs(a5) != INFINITY)
      {
        v73.receiver = self;
        v73.super_class = (Class)Curve;
        v8 = -[Curve init](&v73, sel_init);
        if (v8)
        {
          v15 = 0;
          v16 = a3 - 1;
          v17 = *a6;
          v18 = 1;
          v19 = a3;
          do
          {
            v20 = a6[v18];
            if (v20 >= v17)
              v21 = 4;
            else
              v21 = 2;
            if (v20 > v17)
              v21 = 1;
            v15 |= v21;
            ++v18;
            v17 = v20;
          }
          while (a3 != v18);
          v22 = 8 * a3;
          objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], v12, v22, v13, v14, v20);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = objc_msgSend_mutableBytes(v23, v24, v25, v26, v27);
          v29 = 0;
          do
          {
            *(double *)(v28 + v29) = a6[v29 / 8];
            v29 += 8;
          }
          while (v22 != v29);
          v8->_domainMin = a4;
          v8->_domainMax = a5;
          v31 = *a6;
          v30 = a6 + 1;
          v32 = v31;
          v8->_rangeMin = v31;
          v8->_rangeMax = v31;
          v33 = v19 - 1;
          v34 = v31;
          do
          {
            v35 = *v30;
            if (v34 <= *v30)
            {
              v36 = *v30;
            }
            else
            {
              v8->_rangeMin = v35;
              v36 = *v30;
              v34 = v35;
            }
            if (v32 < v36)
            {
              v8->_rangeMax = v36;
              v32 = v36;
            }
            ++v30;
            --v33;
          }
          while (v33);
          v37 = MEMORY[0x1E0C809B0];
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = sub_1D53A0CBC;
          v68[3] = &unk_1E99916B8;
          v38 = v23;
          v69 = v38;
          v70 = a4;
          v71 = a5;
          v72 = v16;
          objc_msgSend_setFunction_(v8, v39, (uint64_t)v68, v40, v41);
          if (v15 == 1)
          {
            v63[0] = v37;
            v63[1] = 3221225472;
            v63[2] = sub_1D53A0D50;
            v63[3] = &unk_1E99916B8;
            v64 = v38;
            v67 = v16;
            v65 = a4;
            v66 = a5;
            objc_msgSend_setInverse_(v8, v50, (uint64_t)v63, v51, v52);
            v49 = v64;
          }
          else if (v15 == 2)
          {
            v58[0] = v37;
            v58[1] = 3221225472;
            v58[2] = sub_1D53A0DE4;
            v58[3] = &unk_1E99916B8;
            v59 = v38;
            v62 = v16;
            v60 = a4;
            v61 = a5;
            objc_msgSend_setInverse_(v8, v46, (uint64_t)v58, v47, v48);
            v49 = v59;
          }
          else
          {
            objc_msgSend_function(v8, v42, v43, v44, v45);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1D53A08C0(v49, a4, a5);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setInverse_(v8, v54, (uint64_t)v53, v55, v56);

          }
          v8 = v8;

          v9 = v8;
        }
        else
        {
          v9 = 0;
        }
      }
    }
  }

  return v9;
}

+ (id)curveWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5
{
  uint64_t v7;
  Curve *v8;
  const char *v9;

  v7 = *(_QWORD *)&a3;
  v8 = [Curve alloc];
  return (id)objc_msgSend_initWithCount_xvalues_yvalues_(v8, v9, v7, (uint64_t)a4, (uint64_t)a5);
}

- (Curve)initWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5
{
  Curve *v6;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v6 = 0;
  if (a3 >= 2 && a4 && a5)
  {
    v8 = *(_QWORD *)&a3;
    objc_msgSend_curveWithCount_domainMin_domainMax_values_(Curve, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, 0.0, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_curveWithInverseOf_(Curve, v10, (uint64_t)v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_curveWithCount_domainMin_domainMax_values_(Curve, v14, v8, (uint64_t)a5, v15, 0.0, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_curveWith_of_(Curve, v17, (uint64_t)v13, (uint64_t)v16, v18);
    v6 = (Curve *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)function
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFunction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)inverse
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInverse:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)domainMin
{
  return self->_domainMin;
}

- (double)domainMax
{
  return self->_domainMax;
}

- (double)rangeMin
{
  return self->_rangeMin;
}

- (double)rangeMax
{
  return self->_rangeMax;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inverse, 0);
  objc_storeStrong(&self->_function, 0);
}

@end
