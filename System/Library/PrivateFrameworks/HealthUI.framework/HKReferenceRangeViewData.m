@implementation HKReferenceRangeViewData

+ (id)referenceRangeViewDataFromInspectableValueInRange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "currentValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v4, "currentValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_codedQuantityForValueCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:", v8);

    objc_msgSend(v4, "currentValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValueString:", v10);

    objc_msgSend(v4, "lowValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v4, "highValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_18;
    }
    objc_msgSend(v4, "highValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_codedQuantityForValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lowValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_codedQuantityForValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0.0;
    v18 = 0.0;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v18 = v19;
    }
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      v17 = v20;
    }
    if (vabdd_f64(v18, v17) > 2.22044605e-16)
    {
      objc_msgSend(v4, "unitString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUnitString:", v21);

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setRangeLow:", v22);

      }
      else
      {
        objc_msgSend(v5, "setRangeLow:", 0);
      }
      objc_msgSend(v4, "lowValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "displayString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRangeLowString:", v24);

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setRangeHigh:", v25);

      }
      else
      {
        objc_msgSend(v5, "setRangeHigh:", 0);
      }
      objc_msgSend(v4, "highValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "displayString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRangeHighString:", v27);

    }
  }
LABEL_18:

  return v5;
}

+ (id)_codedQuantityForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueType");
  if ((unint64_t)(v4 - 5) >= 2)
  {
    if (v4 == 1)
    {
      objc_msgSend(v3, "ratioValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "codedQuantityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_codedQuantityForValueCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "collectionType");
  if ((unint64_t)(v5 - 2) < 2)
  {
    objc_msgSend(v4, "inspectableValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_codedQuantityForValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "min");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
        v9 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v4, "inspectableValue");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    objc_msgSend(a1, "_codedQuantityForValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_valueString, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_unitString, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_rangeLowString, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_rangeHighString, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_value, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_rangeLow, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_rangeHigh, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  *((_BYTE *)v4 + 8) = self->_useOutOfRangeValueColor;
  return v4;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)rangeLowString
{
  return self->_rangeLowString;
}

- (void)setRangeLowString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)rangeHighString
{
  return self->_rangeHighString;
}

- (void)setRangeHighString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)rangeLow
{
  return self->_rangeLow;
}

- (void)setRangeLow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)rangeHigh
{
  return self->_rangeHigh;
}

- (void)setRangeHigh:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)useOutOfRangeValueColor
{
  return self->_useOutOfRangeValueColor;
}

- (void)setUseOutOfRangeValueColor:(BOOL)a3
{
  self->_useOutOfRangeValueColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeHigh, 0);
  objc_storeStrong((id *)&self->_rangeLow, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_rangeHighString, 0);
  objc_storeStrong((id *)&self->_rangeLowString, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

@end
