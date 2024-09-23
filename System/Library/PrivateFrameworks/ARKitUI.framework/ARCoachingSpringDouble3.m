@implementation ARCoachingSpringDouble3

- (NSArray)springs
{
  return self->_springs;
}

- (__n128)value
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  __n128 v9;
  __n128 result;
  __n128 v11;
  unint64_t v12;
  unint64_t v13;
  __n128 v14;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v13 = v5;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v12 = v7;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  v14 = v9;

  result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setValue:(ARCoachingSpringDouble3 *)self
{
  uint64_t v2;
  double v4;
  void *v5;
  void *v6;
  id v7[2];

  *(_OWORD *)v7 = *(_OWORD *)v2;
  v4 = *(double *)(v2 + 16);
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", *(double *)v7);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", *(double *)&v7[1]);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v7[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[0], "setValue:", v4);

}

- (__n128)floatValue
{
  void *v2;
  double v3;
  void *v4;
  float64x2_t v5;
  float64_t v6;
  void *v7;
  double v8;
  __n128 result;
  unsigned __int32 v10;
  float64_t v11;
  float32x2_t v12;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v11 = v3;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5.f64[0] = v11;
  v5.f64[1] = v6;
  v12 = vcvt_f32_f64(v5);
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  *(float *)&v8 = v8;
  v10 = LODWORD(v8);

  result.n128_u64[0] = (unint64_t)v12;
  result.n128_u32[2] = v10;
  return result;
}

- (void)setFloatValue:(ARCoachingSpringDouble3 *)self
{
  __int128 v2;
  double v4;
  void *v5;
  void *v6;
  id v7[2];

  *(_OWORD *)v7 = v2;
  v4 = *(float *)&v2;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v4);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", *((float *)v7 + 1));

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v7[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[0], "setValue:", *(float *)&v7[1]);

}

- (__n128)target
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  __n128 v9;
  __n128 result;
  __n128 v11;
  unint64_t v12;
  unint64_t v13;
  __n128 v14;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v13 = v5;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "target");
  v12 = v7;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "target");
  v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  v14 = v9;

  result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setTarget:(ARCoachingSpringDouble3 *)self
{
  uint64_t v2;
  double v4;
  void *v5;
  void *v6;
  id v7[2];

  *(_OWORD *)v7 = *(_OWORD *)v2;
  v4 = *(double *)(v2 + 16);
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", *(double *)v7);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTarget:", *(double *)&v7[1]);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v7[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[0], "setTarget:", v4);

}

- (__n128)velocity
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  __n128 v9;
  __n128 result;
  __n128 v11;
  unint64_t v12;
  unint64_t v13;
  __n128 v14;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocity");
  v13 = v5;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocity");
  v12 = v7;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "velocity");
  v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  v14 = v9;

  result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setVelocity:(ARCoachingSpringDouble3 *)self
{
  uint64_t v2;
  double v4;
  void *v5;
  void *v6;
  id v7[2];

  *(_OWORD *)v7 = *(_OWORD *)v2;
  v4 = *(double *)(v2 + 16);
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVelocity:", *(double *)v7);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVelocity:", *(double *)&v7[1]);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v7[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[0], "setVelocity:", v4);

}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v7 = v6;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameters");
  v10 = v9;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = ARFLSpringParametersMake(objc_msgSend(v11, "parameters"), v7, v10, a3);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setParameters:", v12, v14, v16, v18);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "parameters");
  v22 = v21;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "parameters");
  v25 = v24;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = ARFLSpringParametersMake(objc_msgSend(v26, "parameters"), v22, v25, a3);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setParameters:", v27, v29, v31, v33);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "parameters");
  v36 = v35;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "parameters");
  v39 = v38;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = ARFLSpringParametersMake(objc_msgSend(v40, "parameters"), v36, v39, a3);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setParameters:", v41, v43, v45, v47);

}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v7 = v6;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameters");
  v10 = v9;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = ARFLSpringParametersMake(objc_msgSend(v11, "parameters"), a3, v7, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setParameters:", v12, v14, v16, v18);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "parameters");
  v22 = v21;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "parameters");
  v25 = v24;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = ARFLSpringParametersMake(objc_msgSend(v26, "parameters"), a3, v22, v25);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setParameters:", v27, v29, v31, v33);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "parameters");
  v36 = v35;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "parameters");
  v39 = v38;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = ARFLSpringParametersMake(objc_msgSend(v40, "parameters"), a3, v36, v39);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setParameters:", v41, v43, v45, v47);

}

- (ARCoachingSpringDouble3)init
{
  ARCoachingSpringDouble3 *v2;
  ARCoachingStateSpring *v3;
  ARCoachingStateSpring *v4;
  ARCoachingStateSpring *v5;
  uint64_t v6;
  NSArray *springs;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)ARCoachingSpringDouble3;
  v2 = -[ARCoachingSpringDouble3 init](&v13, sel_init);
  if (v2)
  {
    v3 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v14[0] = v3;
    v4 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v14[1] = v4;
    v5 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v14[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    springs = v2->_springs;
    v2->_springs = (NSArray *)v6;

    *(_OWORD *)&v2->_response = xmmword_1DCCA13A0;
    if (-[NSArray count](v2->_springs, "count"))
    {
      v8 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTarget:", 1.0);

        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:", 1.0);

        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setVelocity:", 0.0);

        ++v8;
      }
      while (-[NSArray count](v2->_springs, "count") > v8);
    }
  }
  return v2;
}

- (void)stepWithDeltaTime:(double)a3
{
  unint64_t v5;
  void *v6;

  if (-[NSArray count](self->_springs, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "step:", a3);

      ++v5;
    }
    while (-[NSArray count](self->_springs, "count") > v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springs, 0);
}

@end
