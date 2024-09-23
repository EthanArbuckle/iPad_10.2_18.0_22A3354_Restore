@implementation ARCoachingQuaternionSpring

- (NSArray)springs
{
  return self->_springs;
}

- (void)value
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v15 = v4;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v14 = v6;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v13 = v8;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  *(_QWORD *)&v10 = v13;
  *((_QWORD *)&v10 + 1) = v11;
  *(_QWORD *)&v12 = v15;
  *((_QWORD *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;

}

- (void)setValue:(double *)a3
{
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v5 = *a3;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

  v7 = a3[1];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v7);

  v9 = a3[2];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:", v9);

  v11 = a3[3];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:", v11);

}

- (void)target
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "target");
  v15 = v4;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v14 = v6;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v13 = v8;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "target");
  *(_QWORD *)&v10 = v13;
  *((_QWORD *)&v10 + 1) = v11;
  *(_QWORD *)&v12 = v15;
  *((_QWORD *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;

}

- (void)setTarget:(double *)a3
{
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v5 = *a3;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTarget:", v5);

  v7 = a3[1];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTarget:", v7);

  v9 = a3[2];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTarget:", v9);

  v11 = a3[3];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTarget:", v11);

}

- (void)velocity
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "velocity");
  v15 = v4;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "velocity");
  v14 = v6;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "velocity");
  v13 = v8;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "velocity");
  *(_QWORD *)&v10 = v13;
  *((_QWORD *)&v10 + 1) = v11;
  *(_QWORD *)&v12 = v15;
  *((_QWORD *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;

}

- (void)setVelocity:(double *)a3
{
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v5 = *a3;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVelocity:", v5);

  v7 = a3[1];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVelocity:", v7);

  v9 = a3[2];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVelocity:", v9);

  v11 = a3[3];
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", 3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVelocity:", v11);

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
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  id v64;

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
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "parameters");
  v37 = v36;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "parameters");
  v40 = v39;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = ARFLSpringParametersMake(objc_msgSend(v41, "parameters"), v37, v40, a3);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setParameters:", v42, v44, v46, v48);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "parameters");
  v51 = v50;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "parameters");
  v54 = v53;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = ARFLSpringParametersMake(objc_msgSend(v55, "parameters"), v51, v54, a3);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setParameters:", v56, v58, v60, v62);

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
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  id v64;

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
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "parameters");
  v37 = v36;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "parameters");
  v40 = v39;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = ARFLSpringParametersMake(objc_msgSend(v41, "parameters"), a3, v37, v40);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setParameters:", v42, v44, v46, v48);

  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "parameters");
  v51 = v50;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "parameters");
  v54 = v53;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = ARFLSpringParametersMake(objc_msgSend(v55, "parameters"), a3, v51, v54);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  -[NSArray objectAtIndexedSubscript:](self->_springs, "objectAtIndexedSubscript:", 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setParameters:", v56, v58, v60, v62);

}

- (ARCoachingQuaternionSpring)init
{
  ARCoachingQuaternionSpring *v2;
  ARCoachingStateSpring *v3;
  ARCoachingStateSpring *v4;
  ARCoachingStateSpring *v5;
  ARCoachingStateSpring *v6;
  uint64_t v7;
  NSArray *springs;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)ARCoachingQuaternionSpring;
  v2 = -[ARCoachingQuaternionSpring init](&v14, sel_init);
  if (v2)
  {
    v3 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v15[0] = v3;
    v4 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v15[1] = v4;
    v5 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v15[2] = v5;
    v6 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 1.0);
    v15[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    springs = v2->_springs;
    v2->_springs = (NSArray *)v7;

    *(_OWORD *)&v2->_response = xmmword_1DCCA13A0;
    if (-[NSArray count](v2->_springs, "count"))
    {
      v9 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTarget:", 1.0);

        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:", 1.0);

        -[NSArray objectAtIndexedSubscript:](v2->_springs, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setVelocity:", 0.0);

        ++v9;
      }
      while (-[NSArray count](v2->_springs, "count") > v9);
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
