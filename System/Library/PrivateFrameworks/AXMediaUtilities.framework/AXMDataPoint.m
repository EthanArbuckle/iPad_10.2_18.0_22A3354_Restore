@implementation AXMDataPoint

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4
{
  return -[AXMDataPoint initWithX:y:additionalValues:label:](self, "initWithX:y:additionalValues:label:", a3, a4, 0, 0);
}

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5
{
  return -[AXMDataPoint initWithX:y:additionalValues:label:](self, "initWithX:y:additionalValues:label:", a3, a4, a5, 0);
}

- (AXMDataPoint)initWithX:(id)a3 y:(id)a4 additionalValues:(id)a5 label:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AXMDataPoint *v15;
  AXMDataPoint *v16;
  uint64_t v17;
  NSArray *additionalValues;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AXMDataPoint;
  v15 = -[AXMDataPoint init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xValue, a3);
    objc_storeStrong((id *)&v16->_yValue, a4);
    v17 = objc_msgSend(v13, "copy");
    additionalValues = v16->_additionalValues;
    v16->_additionalValues = (NSArray *)v17;

    -[AXMDataPoint setLabel:](v16, "setLabel:", v14);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXMDataPoint *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AXMDataPoint *v9;

  v4 = +[AXMDataPoint allocWithZone:](AXMDataPoint, "allocWithZone:", a3);
  -[AXMDataPoint xValue](self, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataPoint yValue](self, "yValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataPoint additionalValues](self, "additionalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataPoint label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXMDataPoint initWithX:y:additionalValues:label:](v4, "initWithX:y:additionalValues:label:", v5, v6, v7, v8);

  return v9;
}

- (void)setLabel:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedLabel;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = v4;
  }
  else
  {
    attributedLabel = self->_attributedLabel;
    self->_attributedLabel = 0;
  }

}

- (AXMDataPointValue)zCategoryAxisValue
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AXMDataPoint additionalValues](self, "additionalValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "category");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (AXMDataPointValue *)v3;
}

- (AXMDataPointValue)zNumericAxisValue
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AXMDataPoint additionalValues](self, "additionalValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "category");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (AXMDataPointValue *)v3;
}

- (NSString)label
{
  void *v2;
  void *v3;

  -[AXMDataPoint attributedLabel](self, "attributedLabel");
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
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  -[AXMDataPoint xValue](self, "xValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXMDataPoint xValue](self, "xValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMDataPoint xValue](self, "xValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "number");
    objc_msgSend(v6, "numberWithDouble:");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDataPoint additionalValues](self, "additionalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v10 = &stru_1E6260C18;
    do
    {
      -[AXMDataPoint additionalValues](self, "additionalValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "category");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[AXMDataPoint additionalValues](self, "additionalValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "category");
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[AXMDataPoint additionalValues](self, "additionalValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "number");
        objc_msgSend(v16, "numberWithDouble:");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@\t"), v10, v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v9;
      -[AXMDataPoint additionalValues](self, "additionalValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v10 = v18;
    }
    while (v9 < v20);
  }
  else
  {
    v18 = &stru_1E6260C18;
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMDataPoint yValue](self, "yValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "number");
  objc_msgSend(v22, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataPoint label](self, "label");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataPoint valueDescription](self, "valueDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("(%@\t%@\t%@\tlabel=%@\tdesc=%@)"), v29, v24, v18, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (AXMDataPointValue)timeEncodingValue
{
  AXMDataPointValue *timeEncodingValue;
  AXMDataPointValue *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  timeEncodingValue = self->_timeEncodingValue;
  if (timeEncodingValue)
  {
    v3 = timeEncodingValue;
  }
  else
  {
    -[AXMDataPoint xValue](self, "xValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataPoint xValue](self, "xValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMDataPointValue valueWithCategory:](AXMDataPointValue, "valueWithCategory:", v9);
      v3 = (AXMDataPointValue *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "number");
      +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
      v3 = (AXMDataPointValue *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (NSNumber)pitchEncodingValue
{
  NSNumber *pitchEncodingValue;
  NSNumber *v3;
  void *v4;
  void *v5;

  pitchEncodingValue = self->_pitchEncodingValue;
  if (pitchEncodingValue)
  {
    v3 = pitchEncodingValue;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMDataPoint yValue](self, "yValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "number");
    objc_msgSend(v4, "numberWithDouble:");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSNumber)durationEncodingValue
{
  NSNumber *durationEncodingValue;
  NSNumber *v3;
  void *v4;
  void *v5;

  durationEncodingValue = self->_durationEncodingValue;
  if (durationEncodingValue)
  {
    v3 = durationEncodingValue;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMDataPoint zNumericAxisValue](self, "zNumericAxisValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "number");
    objc_msgSend(v4, "numberWithDouble:");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSNumber)volumeEncodingValue
{
  NSNumber *volumeEncodingValue;
  NSNumber *v3;
  void *v4;
  void *v5;

  volumeEncodingValue = self->_volumeEncodingValue;
  if (volumeEncodingValue)
  {
    v3 = volumeEncodingValue;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMDataPoint zNumericAxisValue](self, "zNumericAxisValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "number");
    objc_msgSend(v4, "numberWithDouble:");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)timbreEncodingValue
{
  NSString *timbreEncodingValue;
  NSString *v3;
  void *v4;

  timbreEncodingValue = self->_timbreEncodingValue;
  if (timbreEncodingValue)
  {
    v3 = timbreEncodingValue;
  }
  else
  {
    -[AXMDataPoint zCategoryAxisValue](self, "zCategoryAxisValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (AXMDataPointValue)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AXMDataPointValue)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)additionalValues
{
  return self->_additionalValues;
}

- (void)setAdditionalValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (void)setValueDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTimeEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPitchEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setVolumeEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDurationEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setTimbreEncodingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)playbackTimeOffsetMS
{
  return self->_playbackTimeOffsetMS;
}

- (void)setPlaybackTimeOffsetMS:(double)a3
{
  self->_playbackTimeOffsetMS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timbreEncodingValue, 0);
  objc_storeStrong((id *)&self->_durationEncodingValue, 0);
  objc_storeStrong((id *)&self->_volumeEncodingValue, 0);
  objc_storeStrong((id *)&self->_pitchEncodingValue, 0);
  objc_storeStrong((id *)&self->_timeEncodingValue, 0);
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_additionalValues, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
