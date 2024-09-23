@implementation CAMOverlayDiscreteFloatRange

- (CAMOverlayDiscreteFloatRange)initWithValues:(id)a3
{
  id v4;
  CAMOverlayDiscreteFloatRange *v5;
  void *v6;
  uint64_t v7;
  NSArray *explicitStorage;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CAMOverlayDiscreteFloatRange *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMOverlayDiscreteFloatRange;
  v5 = -[CAMOverlayDiscreteFloatRange init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global);
    v7 = objc_claimAutoreleasedReturnValue();
    explicitStorage = v5->__explicitStorage;
    v5->__explicitStorage = (NSArray *)v7;

    -[NSArray firstObject](v5->__explicitStorage, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v5->_minimum = v10;

    -[NSArray lastObject](v5->__explicitStorage, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v5->_maximum = v12;

    v5->_count = -[NSArray count](v5->__explicitStorage, "count");
    v13 = v5;
  }

  return v5;
}

uint64_t __47__CAMOverlayDiscreteFloatRange_initWithValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (CAMOverlayDiscreteFloatRange)initWithMinimum:(double)a3 maximum:(double)a4 step:(double)a5
{
  CAMOverlayDiscreteFloatRange *v8;
  CAMOverlayDiscreteFloatRange *v9;
  double v10;
  double v11;
  double v12;
  CAMOverlayDiscreteFloatRange *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMOverlayDiscreteFloatRange;
  v8 = -[CAMOverlayDiscreteFloatRange init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = fmin(a3, a4);
    v11 = fmax(a3, a4);
    v12 = 1.79769313e308;
    if (a5 > 0.0)
      v12 = a5;
    v8->__implicitStep = v12;
    v8->_minimum = v10;
    v8->_maximum = v11;
    v8->_count = vcvtmd_u64_f64((v11 - v10) / v12) + 1;
    v13 = v8;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  NSArray *explicitStorage;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  _QWORD v13[5];
  id v14;

  if (self->__explicitStorage)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    explicitStorage = self->__explicitStorage;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __43__CAMOverlayDiscreteFloatRange_description__block_invoke;
    v13[3] = &unk_2508F8DB0;
    v13[4] = self;
    v14 = v3;
    v5 = v3;
    -[NSArray enumerateObjectsUsingBlock:](explicitStorage, "enumerateObjectsUsingBlock:", v13);
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p; %lu values: %@>"), v8, self, self->_count, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p; %lu values; min: %.3f; max: %.3f; step: %.3f>"),
      v5,
      self,
      self->_count,
      *(_QWORD *)&self->_minimum,
      *(_QWORD *)&self->_maximum,
      *(_QWORD *)&self->__implicitStep);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

void __43__CAMOverlayDiscreteFloatRange_description__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (a3 < 2 || (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") < 4)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v10, "appendFormat:", CFSTR("%.3f"), v11);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") - 1 > a3)
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(", "));
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v7, "appendFormat:", CFSTR(" ... %.3f"), v9);

    *a4 = 1;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayDiscreteFloatRange)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *explicitStorage;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v10, CFSTR("_explicitStorage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v11);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  explicitStorage = self->__explicitStorage;
  self->__explicitStorage = v12;

  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("_implicitStep"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v17);
  self->__implicitStep = v18;

  v19 = (void *)MEMORY[0x24BDD17C8];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@"), v21, CFSTR("minimum"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v22);
  self->_minimum = v23;

  v24 = (void *)MEMORY[0x24BDD17C8];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@"), v26, CFSTR("maximum"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v27);
  v29 = v28;

  self->_maximum = v29;
  if (!self->__explicitStorage)
    return -[CAMOverlayDiscreteFloatRange initWithMinimum:maximum:step:](self, "initWithMinimum:maximum:step:", self->_minimum, self->_maximum, self->__implicitStep);
  if (self->__implicitStep == 0.0 && self->_minimum == 0.0 && self->_maximum == 0.0)
    return -[CAMOverlayDiscreteFloatRange initWithValues:](self, "initWithValues:");

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_class *v25;
  id v26;

  v4 = a3;
  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("_explicitStorage"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v26, v9);

    v4 = (id)v9;
  }
  else
  {
    -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
    v11 = v10;
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@"), v14, CFSTR("_implicitStep"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeDouble:forKey:", v15, v11);

    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    v17 = v16;
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.%@"), v20, CFSTR("minimum"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeDouble:forKey:", v21, v17);

    -[CAMOverlayDiscreteFloatRange maximum](self, "maximum");
    v23 = v22;
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@"), v26, CFSTR("maximum"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeDouble:forKey:", v8, v23);
  }

}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 0;
}

- (BOOL)isFloatingPoint
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (BOOL)isEqualToRange:(id)a3
{
  CAMOverlayDiscreteFloatRange *v4;
  CAMOverlayDiscreteFloatRange *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = (CAMOverlayDiscreteFloatRange *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v19 = 1;
    }
    else
    {
      v5 = v4;
      -[CAMOverlayDiscreteFloatRange minimum](v5, "minimum");
      v7 = v6;
      -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
      if (v7 == v8
        && (-[CAMOverlayDiscreteFloatRange maximum](v5, "maximum"),
            v10 = v9,
            -[CAMOverlayDiscreteFloatRange maximum](self, "maximum"),
            v10 == v11)
        && (-[CAMOverlayDiscreteFloatRange _implicitStep](v5, "_implicitStep"),
            v13 = v12,
            -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep"),
            v13 == v14))
      {
        -[CAMOverlayDiscreteFloatRange _explicitStorage](v5, "_explicitStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {
          v19 = 1;
        }
        else
        {
          -[CAMOverlayDiscreteFloatRange _explicitStorage](v5, "_explicitStorage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToArray:", v18);

        }
      }
      else
      {
        v19 = 0;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)containsValue:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v13;
  long double v14;
  long double v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
      if (v9 == 0.0
        || (-[CAMOverlayDiscreteFloatRange minimum](self, "minimum"), v6 < v10)
        || (-[CAMOverlayDiscreteFloatRange maximum](self, "maximum"), v6 > v11))
      {
        v8 = 0;
      }
      else
      {
        -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
        v14 = v6 - v13;
        -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
        v8 = fabs(fmod(v14, v15)) < 0.0001;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)indexOfValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4);

  }
  else if (-[CAMOverlayDiscreteFloatRange containsValue:](self, "containsValue:", v4))
  {
    objc_msgSend(v4, "doubleValue");
    v9 = v8;
    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    v11 = v9 - v10;
    -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
    v7 = vcvtad_u64_f64(v11 / v12);
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)valueAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    v9 = v8;
    -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
    v11 = v9 + (double)a3 * v10;
    v12 = round(v11);
    if (vabdd_f64(v12, v11) < 0.0001)
      v11 = v12;
    if (v11 == 0.0)
      v11 = 0.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (unint64_t)indexOfValueClosestToValue:(double)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[7];
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0x7FEFFFFFFFFFFFFFLL;
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__CAMOverlayDiscreteFloatRange_indexOfValueClosestToValue___block_invoke;
    v16[3] = &unk_2508F8DD8;
    *(double *)&v16[6] = a3;
    v16[4] = v17;
    v16[5] = &v18;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);

    _Block_object_dispose(v17, 8);
    v7 = v19[3];
  }
  else
  {
    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    v9 = v8;
    -[CAMOverlayDiscreteFloatRange maximum](self, "maximum");
    v11 = v10;
    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    v13 = v12;
    -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
    v7 = vcvtad_u64_f64((fmax(v9, fmin(v11, a3)) - v13) / v14);
    v19[3] = v7;
  }
  _Block_object_dispose(&v18, 8);
  return v7;
}

uint64_t __59__CAMOverlayDiscreteFloatRange_indexOfValueClosestToValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  double v9;
  uint64_t v10;

  result = objc_msgSend(a2, "doubleValue");
  v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (unint64_t)indexOfValueGreaterThanValue:(double)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v14[5];

  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__CAMOverlayDiscreteFloatRange_indexOfValueGreaterThanValue___block_invoke;
    v14[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    *(double *)&v14[4] = a3;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v14);

  }
  else
  {
    -[CAMOverlayDiscreteFloatRange maximum](self, "maximum");
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 > a3)
    {
      -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
      v10 = a3 - v9;
      -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
      v12 = floor(v10 / v11) + 1.0;
      if (v12 < (double)-[CAMOverlayDiscreteFloatRange count](self, "count"))
        return (unint64_t)v12;
    }
  }
  return v7;
}

BOOL __61__CAMOverlayDiscreteFloatRange_indexOfValueGreaterThanValue___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "doubleValue");
  return v3 > *(double *)(a1 + 32);
}

- (unint64_t)indexOfValueLessThanValue:(double)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v13[5];

  -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayDiscreteFloatRange _explicitStorage](self, "_explicitStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__CAMOverlayDiscreteFloatRange_indexOfValueLessThanValue___block_invoke;
    v13[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    *(double *)&v13[4] = a3;
    v7 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v13);

  }
  else
  {
    -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
    if (v8 >= a3)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      -[CAMOverlayDiscreteFloatRange minimum](self, "minimum");
      v10 = a3 - v9;
      -[CAMOverlayDiscreteFloatRange _implicitStep](self, "_implicitStep");
      return (unint64_t)(ceil(v10 / v11) + -1.0);
    }
  }
  return v7;
}

BOOL __58__CAMOverlayDiscreteFloatRange_indexOfValueLessThanValue___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "doubleValue");
  return v3 < *(double *)(a1 + 32);
}

- (double)valueClosestToValue:(double)a3
{
  unint64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = -[CAMOverlayDiscreteFloatRange indexOfValueClosestToValue:](self, "indexOfValueClosestToValue:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[CAMOverlayDiscreteFloatRange valueAtIndex:](self, "valueAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (id)indexesOfValuesInRange:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[CAMOverlayDiscreteFloatRange count](self, "count");
  v6 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v4, "valueAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");

      -[CAMOverlayDiscreteFloatRange valueAtIndex:](self, "valueAtIndex:", v9 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");

      if (BSFloatEqualToFloat())
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v8;
      }
      if (v9 >= v5)
        break;
      ++v9;
    }
    while (v8 < v6);
  }

  return v7;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)_explicitStorage
{
  return self->__explicitStorage;
}

- (double)_implicitStep
{
  return self->__implicitStep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__explicitStorage, 0);
}

@end
