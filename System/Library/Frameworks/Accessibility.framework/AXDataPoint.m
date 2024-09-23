@implementation AXDataPoint

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue
{
  return -[AXDataPoint initWithX:y:additionalValues:label:](self, "initWithX:y:additionalValues:label:", xValue, yValue, 0, 0);
}

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues
{
  return -[AXDataPoint initWithX:y:additionalValues:label:](self, "initWithX:y:additionalValues:label:", xValue, yValue, additionalValues, 0);
}

- (AXDataPoint)initWithX:(AXDataPointValue *)xValue y:(AXDataPointValue *)yValue additionalValues:(NSArray *)additionalValues label:(NSString *)label
{
  AXDataPointValue *v11;
  AXDataPointValue *v12;
  NSArray *v13;
  NSString *v14;
  AXDataPoint *v15;
  AXDataPoint *v16;
  uint64_t v17;
  NSArray *v18;
  objc_super v20;

  v11 = xValue;
  v12 = yValue;
  v13 = additionalValues;
  v14 = label;
  v20.receiver = self;
  v20.super_class = (Class)AXDataPoint;
  v15 = -[AXDataPoint init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xValue, xValue);
    objc_storeStrong((id *)&v16->_yValue, yValue);
    v17 = -[NSArray copy](v13, "copy");
    v18 = v16->_additionalValues;
    v16->_additionalValues = (NSArray *)v17;

    -[AXDataPoint setLabel:](v16, "setLabel:", v14);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXDataPoint *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AXDataPoint *v9;

  v4 = +[AXDataPoint allocWithZone:](AXDataPoint, "allocWithZone:", a3);
  -[AXDataPoint xValue](self, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataPoint yValue](self, "yValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataPoint additionalValues](self, "additionalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataPoint label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXDataPoint initWithX:y:additionalValues:label:](v4, "initWithX:y:additionalValues:label:", v5, v6, v7, v8);

  return v9;
}

- (void)setLabel:(NSString *)label
{
  NSAttributedString *v4;
  NSAttributedString *attributedLabel;
  NSString *v6;

  v6 = label;
  if (v6)
  {
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v6);
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = v4;
  }
  else
  {
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = 0;
  }

}

- (NSString)label
{
  void *v2;
  void *v3;

  -[AXDataPoint attributedLabel](self, "attributedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  -[AXDataPoint xValue](self, "xValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXDataPoint xValue](self, "xValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[AXDataPoint xValue](self, "xValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "number");
    objc_msgSend(v6, "numberWithDouble:");
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXDataPoint additionalValues](self, "additionalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      -[AXDataPoint additionalValues](self, "additionalValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "category");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[AXDataPoint additionalValues](self, "additionalValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "category");
        v17 = v10;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        v19 = (void *)MEMORY[0x24BDD16E0];
        -[AXDataPoint additionalValues](self, "additionalValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "number");
        objc_msgSend(v19, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v17);
        v20 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v20;
      }

      ++v9;
      -[AXDataPoint additionalValues](self, "additionalValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v9 < v22);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v23 = (void *)MEMORY[0x24BDD17C8];
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[AXDataPoint yValue](self, "yValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "number");
  objc_msgSend(v24, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataPoint label](self, "label");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("(x=%@\ty=%@\tz=%@\tcategory=%@\tlabel=%@)"), v30, v26, v11, v10, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_additionalCategoricalValue
{
  id v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[AXDataPoint additionalValues](self, "additionalValues");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "category", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");

        if (v8)
        {
          objc_msgSend(v6, "category");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_additionalNumericValue
{
  id v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[AXDataPoint additionalValues](self, "additionalValues");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "category", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");

        if (!v8)
        {
          v9 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v6, "number");
          objc_msgSend(v9, "numberWithDouble:");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (AXDataPointValue)xValue
{
  return self->_xValue;
}

- (void)setXValue:(AXDataPointValue *)xValue
{
  objc_setProperty_nonatomic_copy(self, a2, xValue, 8);
}

- (AXDataPointValue)yValue
{
  return self->_yValue;
}

- (void)setYValue:(AXDataPointValue *)yValue
{
  objc_setProperty_nonatomic_copy(self, a2, yValue, 16);
}

- (NSArray)additionalValues
{
  return self->_additionalValues;
}

- (void)setAdditionalValues:(NSArray *)additionalValues
{
  objc_setProperty_nonatomic_copy(self, a2, additionalValues, 24);
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(NSAttributedString *)attributedLabel
{
  objc_setProperty_nonatomic_copy(self, a2, attributedLabel, 32);
}

- (NSNumber)timeEncodingValue
{
  return self->_timeEncodingValue;
}

- (void)setTimeEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)pitchEncodingValue
{
  return self->_pitchEncodingValue;
}

- (void)setPitchEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)volumeEncodingValue
{
  return self->_volumeEncodingValue;
}

- (void)setVolumeEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)durationEncodingValue
{
  return self->_durationEncodingValue;
}

- (void)setDurationEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)categoryEncodingValue
{
  return self->_categoryEncodingValue;
}

- (void)setCategoryEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (void)setValueDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_categoryEncodingValue, 0);
  objc_storeStrong((id *)&self->_durationEncodingValue, 0);
  objc_storeStrong((id *)&self->_volumeEncodingValue, 0);
  objc_storeStrong((id *)&self->_pitchEncodingValue, 0);
  objc_storeStrong((id *)&self->_timeEncodingValue, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_additionalValues, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
