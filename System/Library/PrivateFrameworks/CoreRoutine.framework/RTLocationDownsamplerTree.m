@implementation RTLocationDownsamplerTree

- (RTLocationDownsamplerTree)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocations_errorFunction_);
}

- (RTLocationDownsamplerTree)initWithLocations:(id)a3 errorFunction:(id)a4
{
  id v7;
  id v8;
  RTLocationDownsamplerTree *v9;
  RTLocationDownsamplerTree *v10;
  double v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RTLocationDownsamplerTree;
  v9 = -[RTLocationDownsamplerTree init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locations, a3);
    -[RTLocationDownsamplerTree evaluateLocationsWithErrorFunction:](v10, "evaluateLocationsWithErrorFunction:", v8);
    v10->_maximumError = v11;
  }

  return v10;
}

- (double)evaluateLocationsWithErrorFunction:(id)a3
{
  double (**v4)(id, void *, void *);
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  unint64_t v15;

  v4 = (double (**)(id, void *, void *))a3;
  -[RTLocationDownsamplerTree locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") & 0xFFFFFFFFFFFFFFFELL;

  if (v6 == 2)
  {
    v7 = 0;
    v8 = 0.0;
  }
  else
  {
    v7 = 0;
    v8 = 0.0;
    v9 = 1;
    do
    {
      -[RTLocationDownsamplerTree locations](self, "locations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[RTLocationDownsamplerTree locations](self, "locations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4[2](v4, v11, v12);

      if (v13 > v8)
      {
        v7 = v9;
        v8 = v13;
      }

      ++v9;
      -[RTLocationDownsamplerTree locations](self, "locations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count") - 2;

    }
    while (v9 < v15);
  }
  -[RTLocationDownsamplerTree setMaximumError:](self, "setMaximumError:", v8);
  -[RTLocationDownsamplerTree setMaximumErrorIndex:](self, "setMaximumErrorIndex:", v7);

  return v8;
}

- (void)splitLocationsWithErrorFunction:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  RTLocationDownsamplerTree *v13;
  RTLocationDownsamplerTree *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;

  v28 = a3;
  -[RTLocationDownsamplerTree locations](self, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTLocationDownsamplerTree locations](self, "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 < 3)
      goto LABEL_11;
    -[RTLocationDownsamplerTree locations](self, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subarrayWithRange:", 0, -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationDownsamplerTree locations](self, "locations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex");
    -[RTLocationDownsamplerTree locations](self, "locations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subarrayWithRange:", v10, objc_msgSend(v11, "count") - -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[RTLocationDownsamplerTree initWithLocations:errorFunction:]([RTLocationDownsamplerTree alloc], "initWithLocations:errorFunction:", v8, v28);
    v14 = -[RTLocationDownsamplerTree initWithLocations:errorFunction:]([RTLocationDownsamplerTree alloc], "initWithLocations:errorFunction:", v12, v28);
    -[RTLocationDownsamplerTree setLeft:](self, "setLeft:", v13);
    -[RTLocationDownsamplerTree setRight:](self, "setRight:", v14);
    -[RTLocationDownsamplerTree setLocations:](self, "setLocations:", 0);

  }
  else
  {
    -[RTLocationDownsamplerTree left](self, "left");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex"))
    {
      -[RTLocationDownsamplerTree right](self, "right");
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
    objc_msgSend(v8, "splitLocationsWithErrorFunction:", v28);
  }

  -[RTLocationDownsamplerTree left](self, "left");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maximumError");
  v18 = v17;

  -[RTLocationDownsamplerTree right](self, "right");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "maximumError");
  v21 = v20;

  if (v18 >= v21)
    v22 = v18;
  else
    v22 = v21;
  -[RTLocationDownsamplerTree setMaximumError:](self, "setMaximumError:", v22);
  -[RTLocationDownsamplerTree left](self, "left");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "maximumError");
  v25 = v24;
  -[RTLocationDownsamplerTree right](self, "right");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "maximumError");
  -[RTLocationDownsamplerTree setMaximumErrorIndex:](self, "setMaximumErrorIndex:", v25 <= v27);

LABEL_11:
}

- (id)allLocations
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[RTLocationDownsamplerTree left](self, "left");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[RTLocationDownsamplerTree right](self, "right"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_opt_new();
    -[RTLocationDownsamplerTree left](self, "left");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationDownsamplerTree right](self, "right");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allLocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

    objc_msgSend(v6, "addObjectsFromArray:", v10);
  }
  else
  {
    -[RTLocationDownsamplerTree locations](self, "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)sampledLocations
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[RTLocationDownsamplerTree left](self, "left");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[RTLocationDownsamplerTree right](self, "right"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_opt_new();
    -[RTLocationDownsamplerTree left](self, "left");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sampledLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationDownsamplerTree right](self, "right");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sampledLocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

    objc_msgSend(v6, "addObjectsFromArray:", v10);
  }
  else
  {
    -[RTLocationDownsamplerTree locations](self, "locations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    -[RTLocationDownsamplerTree locations](self, "locations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[RTLocationDownsamplerTree left](self, "left");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[RTLocationDownsamplerTree right](self, "right"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[RTLocationDownsamplerTree maximumError](self, "maximumError");
    v8 = v7;
    v9 = -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex");
    -[RTLocationDownsamplerTree left](self, "left");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationDownsamplerTree right](self, "right");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("{ME:%f,MI:%lu,left:[%@],right:[%@]}"), v8, v9, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RTLocationDownsamplerTree locations](self, "locations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("description"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("),("));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    -[RTLocationDownsamplerTree maximumError](self, "maximumError");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("{ME:%f,MI:%lu,locs:(%@)}"), v18, -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (RTLocationDownsamplerTree)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (RTLocationDownsamplerTree)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
  objc_storeStrong((id *)&self->_right, a3);
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (double)maximumError
{
  return self->_maximumError;
}

- (void)setMaximumError:(double)a3
{
  self->_maximumError = a3;
}

- (unint64_t)maximumErrorIndex
{
  return self->_maximumErrorIndex;
}

- (void)setMaximumErrorIndex:(unint64_t)a3
{
  self->_maximumErrorIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end
