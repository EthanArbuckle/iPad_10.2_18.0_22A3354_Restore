@implementation HAWristTemperatureEnumerator

- (HAWristTemperatureEnumerator)initWithData:(id)a3 withSessionStartDate:(id)a4 numWristTemperatures:(unint64_t)a5 firstSampleOffset:(unint64_t)a6
{
  id v11;
  id v12;
  HAWristTemperatureEnumerator *v13;
  HAWristTemperatureEnumerator *v14;
  HAWristTemperatureEnumerator *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAWristTemperatureEnumerator;
  v13 = -[HAWristTemperatureEnumerator init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    objc_storeStrong((id *)&v14->_sessionStartDate, a4);
    v14->_numWristTemperatures = a5;
    v14->_firstSampleOffset = a6;
    v15 = v14;
  }

  return v14;
}

- (id)convertPackedTemperatureSubsample
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  float v8;
  void *v9;
  void *v10;
  id v11;
  float v12;
  void *v13;
  void *v14;
  id v15;
  float v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  float v21;
  void *v22;
  void *v23;
  HAWristTemperature *v24;
  _DWORD v26[5];
  char v27;

  -[HAWristTemperatureEnumerator data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBytes:range:", v26, -[HAWristTemperatureEnumerator firstSampleOffset](self, "firstSampleOffset")+ 21 * -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex"), 21);

  -[HAWristTemperatureEnumerator sessionStartDate](self, "sessionStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v26[0];
  objc_msgSend(v4, "dateByAddingTimeInterval:", (double)v5 / 1000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAWristTemperatureEnumerator setEnumerationIndex:](self, "setEnumerationIndex:", -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex") + 1);
  v7 = objc_alloc(MEMORY[0x24BDD1660]);
  v8 = *(float *)&v26[1];
  objc_msgSend(MEMORY[0x24BDD1950], "celsius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithDoubleValue:unit:", v9, v8);

  v11 = objc_alloc(MEMORY[0x24BDD1660]);
  v12 = *(float *)&v26[2];
  objc_msgSend(MEMORY[0x24BDD1950], "celsius");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithDoubleValue:unit:", v13, v12);

  v15 = objc_alloc(MEMORY[0x24BDD1660]);
  v16 = *(float *)&v26[3];
  objc_msgSend(MEMORY[0x24BDD1950], "celsius");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithDoubleValue:unit:", v17, v16);

  v19 = v27;
  v20 = objc_alloc(MEMORY[0x24BDD1660]);
  v21 = *(float *)&v26[4];
  objc_msgSend(MEMORY[0x24BDD1950], "celsius");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithDoubleValue:unit:", v22, v21);

  v24 = -[HAWristTemperature initWithComputedTemperatureErrorEstimate:computedTemperature:sensor1Temperature:sensor2Temperature:dataValidity:timestamp:]([HAWristTemperature alloc], "initWithComputedTemperatureErrorEstimate:computedTemperature:sensor1Temperature:sensor2Temperature:dataValidity:timestamp:", v23, v10, v14, v18, v19 & 7, v6);
  return v24;
}

- (id)nextObject
{
  unint64_t v3;
  void *v4;

  v3 = -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex");
  if (v3 >= -[HAWristTemperatureEnumerator numWristTemperatures](self, "numWristTemperatures"))
  {
    v4 = 0;
  }
  else
  {
    -[HAWristTemperatureEnumerator convertPackedTemperatureSubsample](self, "convertPackedTemperatureSubsample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)allObjects
{
  void *v3;
  unint64_t v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[HAWristTemperatureEnumerator numWristTemperatures](self, "numWristTemperatures")- -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex"));
  while (1)
  {
    v4 = -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex");
    if (v4 >= -[HAWristTemperatureEnumerator numWristTemperatures](self, "numWristTemperatures"))
      break;
    -[HAWristTemperatureEnumerator convertPackedTemperatureSubsample](self, "convertPackedTemperatureSubsample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (unint64_t)enumerationIndex
{
  return self->_enumerationIndex;
}

- (void)setEnumerationIndex:(unint64_t)a3
{
  self->_enumerationIndex = a3;
}

- (unint64_t)numWristTemperatures
{
  return self->_numWristTemperatures;
}

- (unint64_t)firstSampleOffset
{
  return self->_firstSampleOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
