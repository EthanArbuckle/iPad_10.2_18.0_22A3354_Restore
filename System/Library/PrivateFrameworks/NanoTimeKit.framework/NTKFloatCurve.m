@implementation NTKFloatCurve

- (NTKFloatCurve)initWithFloatCurveElements:(id)a3
{
  id v4;
  NTKFloatCurve *v5;
  uint64_t v6;
  NSArray *valueCurveElements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKFloatCurve;
  v5 = -[NTKFloatCurve init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_105);
    v6 = objc_claimAutoreleasedReturnValue();
    valueCurveElements = v5->_valueCurveElements;
    v5->_valueCurveElements = (NSArray *)v6;

  }
  return v5;
}

uint64_t __44__NTKFloatCurve_initWithFloatCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "fraction");
  v7 = v6;
  objc_msgSend(v5, "fraction");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "fraction");
    v11 = v10;
    objc_msgSend(v5, "fraction");
    if (v11 >= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (double)floatValueForFraction:(double)a3
{
  NSUInteger v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSArray *valueCurveElements;
  void *v11;
  double v12;
  double v13;
  NSArray *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;

  if (-[NSArray count](self->_valueCurveElements, "count"))
  {
    v5 = -[NSArray count](self->_valueCurveElements, "count");
    -[NSArray firstObject](self->_valueCurveElements, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 != 1)
    {
      objc_msgSend(v6, "fraction");
      v9 = v8;

      valueCurveElements = self->_valueCurveElements;
      if (v9 >= a3)
      {
        -[NSArray firstObject](valueCurveElements, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSArray lastObject](valueCurveElements, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fraction");
        v13 = v12;

        v14 = self->_valueCurveElements;
        if (v13 > a3)
        {
          -[NSArray objectAtIndex:](v14, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_valueCurveElements, "objectAtIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray count](self->_valueCurveElements, "count") < 2)
          {
LABEL_10:
            v18 = v16;
            v7 = v15;
          }
          else
          {
            v17 = 1;
            while (1)
            {
              -[NSArray objectAtIndexedSubscript:](self->_valueCurveElements, "objectAtIndexedSubscript:", v17 - 1);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray objectAtIndexedSubscript:](self->_valueCurveElements, "objectAtIndexedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "fraction");
              if (v19 <= a3)
              {
                objc_msgSend(v18, "fraction");
                if (v20 >= a3)
                  break;
              }

              if (++v17 >= -[NSArray count](self->_valueCurveElements, "count"))
                goto LABEL_10;
            }

          }
          objc_msgSend(v7, "fraction");
          v22 = a3 - v21;
          objc_msgSend(v18, "fraction");
          v24 = v23;
          objc_msgSend(v7, "fraction");
          *(float *)&v25 = v24 - v25;
          *(float *)&v24 = v22 / *(float *)&v25;
          objc_msgSend(v18, "timingFunction");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v27) = LODWORD(v24);
          objc_msgSend(v26, "_solveForInput:", v27);

          objc_msgSend(v7, "floatValue");
          objc_msgSend(v18, "floatValue");
          CLKInterpolateBetweenFloatsClipped();
          v29 = v28;

          goto LABEL_17;
        }
        -[NSArray lastObject](v14, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
    }
    objc_msgSend(v6, "floatValue");
    v29 = v30;
LABEL_17:

    return v29;
  }
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueCurveElements, 0);
}

@end
