@implementation GCDeviceAdaptiveTriggersPayload

- (id)initSlopeFeedbackWithStartPosition:(float)a3 endPosition:(float)a4 startStrength:(float)a5 endStrength:(float)a6
{
  GCDeviceAdaptiveTriggersPayload *v10;
  GCDeviceAdaptiveTriggersPayload *v11;
  NSNumber *mode;
  double v13;
  uint64_t v14;
  NSNumber *startPosition;
  double v16;
  uint64_t v17;
  NSNumber *endPosition;
  double v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  NSArray *strengths;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v10 = -[GCDeviceAdaptiveTriggersPayload init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    mode = v10->_mode;
    v10->_mode = (NSNumber *)&unk_24D30DD68;

    *(float *)&v13 = a3;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    startPosition = v11->_startPosition;
    v11->_startPosition = (NSNumber *)v14;

    *(float *)&v16 = a4;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    endPosition = v11->_endPosition;
    v11->_endPosition = (NSNumber *)v17;

    *(float *)&v19 = a5;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    *(float *)&v21 = a6;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v27, 2);
    v23 = objc_claimAutoreleasedReturnValue();
    strengths = v11->_strengths;
    v11->_strengths = (NSArray *)v23;

  }
  return v11;
}

- (id)initFeedbackWithStartPosition:(float)a3 resistiveStrength:(float)a4
{
  GCDeviceAdaptiveTriggersPayload *v6;
  GCDeviceAdaptiveTriggersPayload *v7;
  NSNumber *mode;
  double v9;
  uint64_t v10;
  NSNumber *startPosition;
  double v12;
  void *v13;
  uint64_t v14;
  NSArray *strengths;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v6 = -[GCDeviceAdaptiveTriggersPayload init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    mode = v6->_mode;
    v6->_mode = (NSNumber *)&unk_24D30DD80;

    *(float *)&v9 = a3;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    startPosition = v7->_startPosition;
    v7->_startPosition = (NSNumber *)v10;

    *(float *)&v12 = a4;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v18, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    strengths = v7->_strengths;
    v7->_strengths = (NSArray *)v14;

  }
  return v7;
}

- (id)initFeedbackWithResistiveStrengths:(id *)a3
{
  GCDeviceAdaptiveTriggersPayload *v4;
  GCDeviceAdaptiveTriggersPayload *v5;
  NSNumber *mode;
  NSArray *v7;
  double v8;
  uint64_t i;
  void *v10;
  NSArray *strengths;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v4 = -[GCDeviceAdaptiveTriggersPayload init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    mode = v4->_mode;
    v4->_mode = (NSNumber *)&unk_24D30DD80;

    v7 = (NSArray *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", 10);
    for (i = 0; i != 10; ++i)
    {
      *(float *)&v8 = a3->var0[i];
      +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v7, "addObject:", v10);

    }
    strengths = v5->_strengths;
    v5->_strengths = v7;

  }
  return v5;
}

- (id)initWeaponWithStartPosition:(float)a3 endPosition:(float)a4 resistiveStrength:(float)a5
{
  GCDeviceAdaptiveTriggersPayload *v8;
  GCDeviceAdaptiveTriggersPayload *v9;
  NSNumber *mode;
  double v11;
  uint64_t v12;
  NSNumber *startPosition;
  double v14;
  uint64_t v15;
  NSNumber *endPosition;
  double v17;
  void *v18;
  uint64_t v19;
  NSArray *strengths;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v8 = -[GCDeviceAdaptiveTriggersPayload init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    mode = v8->_mode;
    v8->_mode = (NSNumber *)&unk_24D30DD98;

    *(float *)&v11 = a3;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    startPosition = v9->_startPosition;
    v9->_startPosition = (NSNumber *)v12;

    *(float *)&v14 = a4;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    endPosition = v9->_endPosition;
    v9->_endPosition = (NSNumber *)v15;

    *(float *)&v17 = a5;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v23, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    strengths = v9->_strengths;
    v9->_strengths = (NSArray *)v19;

  }
  return v9;
}

- (id)initVibrationWithStartPosition:(float)a3 amplitude:(float)a4 frequency:(float)a5
{
  GCDeviceAdaptiveTriggersPayload *v8;
  GCDeviceAdaptiveTriggersPayload *v9;
  NSNumber *mode;
  double v11;
  uint64_t v12;
  NSNumber *startPosition;
  double v14;
  void *v15;
  uint64_t v16;
  NSArray *amplitudes;
  double v18;
  uint64_t v19;
  NSNumber *frequency;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v8 = -[GCDeviceAdaptiveTriggersPayload init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    mode = v8->_mode;
    v8->_mode = (NSNumber *)&unk_24D30DDB0;

    *(float *)&v11 = a3;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    startPosition = v9->_startPosition;
    v9->_startPosition = (NSNumber *)v12;

    *(float *)&v14 = a4;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v23, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    amplitudes = v9->_amplitudes;
    v9->_amplitudes = (NSArray *)v16;

    *(float *)&v18 = a5;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    frequency = v9->_frequency;
    v9->_frequency = (NSNumber *)v19;

  }
  return v9;
}

- (id)initVibrationWithAmplitudes:(id *)a3 frequency:(float)a4
{
  GCDeviceAdaptiveTriggersPayload *v6;
  GCDeviceAdaptiveTriggersPayload *v7;
  NSNumber *mode;
  double v9;
  uint64_t v10;
  NSNumber *frequency;
  NSArray *v12;
  double v13;
  uint64_t i;
  void *v15;
  NSArray *amplitudes;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v6 = -[GCDeviceAdaptiveTriggersPayload init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    mode = v6->_mode;
    v6->_mode = (NSNumber *)&unk_24D30DDB0;

    *(float *)&v9 = a4;
    +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    frequency = v7->_frequency;
    v7->_frequency = (NSNumber *)v10;

    v12 = (NSArray *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", 10);
    for (i = 0; i != 10; ++i)
    {
      *(float *)&v13 = a3->var0[i];
      +[NSNumber numberWithFloat:](&off_254DED908, "numberWithFloat:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v12, "addObject:", v15);

    }
    amplitudes = v7->_amplitudes;
    v7->_amplitudes = v12;

  }
  return v7;
}

- (id)initOff
{
  GCDeviceAdaptiveTriggersPayload *v2;
  GCDeviceAdaptiveTriggersPayload *v3;
  NSNumber *mode;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v2 = -[GCDeviceAdaptiveTriggersPayload init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mode = v2->_mode;
    v2->_mode = (NSNumber *)&unk_24D30DDC8;

  }
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ - mode=%@> %@ %@ %@ %@ %@"), objc_opt_class(), self->_mode, self->_startPosition, self->_endPosition, self->_strengths, self->_amplitudes, self->_frequency);
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ - mode=%@>"), objc_opt_class(), self->_mode);
}

- (BOOL)hasEqualStrengths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  unint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "strengths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[NSArray count](self->_strengths, "count");

  if (v6 == v7)
  {
    objc_msgSend(v4, "strengths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      v11 = 1;
      do
      {
        objc_msgSend(v4, "strengths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;
        -[NSArray objectAtIndexedSubscript:](self->_strengths, "objectAtIndexedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v11 &= vabds_f32(v15, v17) < 0.0001;

        ++v10;
        objc_msgSend(v4, "strengths");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v19 > v10);
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasEqualAmplitudes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  unint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "amplitudes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[NSArray count](self->_amplitudes, "count");

  if (v6 == v7)
  {
    objc_msgSend(v4, "amplitudes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      v11 = 1;
      do
      {
        objc_msgSend(v4, "amplitudes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;
        -[NSArray objectAtIndexedSubscript:](self->_amplitudes, "objectAtIndexedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v11 &= vabds_f32(v15, v17) < 0.0001;

        ++v10;
        objc_msgSend(v4, "amplitudes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v19 > v10);
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  GCDeviceAdaptiveTriggersPayload *v4;
  GCDeviceAdaptiveTriggersPayload *v5;
  NSNumber *v6;
  NSNumber *mode;
  BOOL v8;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  NSNumber *endPosition;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  v4 = (GCDeviceAdaptiveTriggersPayload *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[GCDeviceAdaptiveTriggersPayload mode](v5, "mode");
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      mode = self->_mode;

      if (v6 == mode)
      {
        switch(-[NSNumber integerValue](self->_mode, "integerValue"))
        {
          case 1:
            if (!-[GCDeviceAdaptiveTriggersPayload hasEqualStrengths:](self, "hasEqualStrengths:", v5))
              goto LABEL_4;
            -[GCDeviceAdaptiveTriggersPayload startPosition](v5, "startPosition");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "floatValue");
            v19 = v18;
            -[NSNumber floatValue](self->_startPosition, "floatValue");
            v8 = vabds_f32(v19, v20) < 0.0001;
            goto LABEL_21;
          case 2:
          case 4:
            if (!-[GCDeviceAdaptiveTriggersPayload hasEqualStrengths:](self, "hasEqualStrengths:", v5))
              goto LABEL_4;
            -[GCDeviceAdaptiveTriggersPayload startPosition](v5, "startPosition");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "floatValue");
            v12 = v11;
            -[NSNumber floatValue](self->_startPosition, "floatValue");
            if (vabds_f32(v12, v13) >= 0.0001)
              goto LABEL_20;
            -[GCDeviceAdaptiveTriggersPayload endPosition](v5, "endPosition");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;
            endPosition = self->_endPosition;
            goto LABEL_19;
          case 3:
            if (!-[GCDeviceAdaptiveTriggersPayload hasEqualAmplitudes:](self, "hasEqualAmplitudes:", v5))
              goto LABEL_4;
            -[GCDeviceAdaptiveTriggersPayload frequency](v5, "frequency");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "floatValue");
            v22 = v21;
            -[NSNumber floatValue](self->_frequency, "floatValue");
            if (vabds_f32(v22, v23) >= 0.0001)
            {
LABEL_20:
              v8 = 0;
            }
            else
            {
              -[GCDeviceAdaptiveTriggersPayload startPosition](v5, "startPosition");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "floatValue");
              v16 = v24;
              endPosition = self->_startPosition;
LABEL_19:
              -[NSNumber floatValue](endPosition, "floatValue");
              v8 = vabds_f32(v16, v25) < 0.0001;

            }
LABEL_21:

            break;
          default:
            v8 = 1;
            break;
        }
      }
      else
      {
LABEL_4:
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSNumber)mode
{
  return self->_mode;
}

- (NSNumber)startPosition
{
  return self->_startPosition;
}

- (NSNumber)endPosition
{
  return self->_endPosition;
}

- (NSArray)strengths
{
  return self->_strengths;
}

- (NSArray)amplitudes
{
  return self->_amplitudes;
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_amplitudes, 0);
  objc_storeStrong((id *)&self->_strengths, 0);
  objc_storeStrong((id *)&self->_endPosition, 0);
  objc_storeStrong((id *)&self->_startPosition, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceAdaptiveTriggersPayload)initWithCoder:(id)a3
{
  id v4;
  GCDeviceAdaptiveTriggersPayload *v5;
  uint64_t v6;
  NSNumber *mode;
  uint64_t v8;
  NSNumber *startPosition;
  uint64_t v10;
  NSNumber *endPosition;
  uint64_t v12;
  NSArray *strengths;
  uint64_t v14;
  NSArray *amplitudes;
  uint64_t v16;
  NSNumber *frequency;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCDeviceAdaptiveTriggersPayload;
  v5 = -[GCDeviceAdaptiveTriggersPayload init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mode"));
    v6 = objc_claimAutoreleasedReturnValue();
    mode = v5->_mode;
    v5->_mode = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startPosition"));
    v8 = objc_claimAutoreleasedReturnValue();
    startPosition = v5->_startPosition;
    v5->_startPosition = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endPosition"));
    v10 = objc_claimAutoreleasedReturnValue();
    endPosition = v5->_endPosition;
    v5->_endPosition = (NSNumber *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_strengths"));
    v12 = objc_claimAutoreleasedReturnValue();
    strengths = v5->_strengths;
    v5->_strengths = (NSArray *)v12;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_amplitudes"));
    v14 = objc_claimAutoreleasedReturnValue();
    amplitudes = v5->_amplitudes;
    v5->_amplitudes = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_frequency"));
    v16 = objc_claimAutoreleasedReturnValue();
    frequency = v5->_frequency;
    v5->_frequency = (NSNumber *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *mode;
  id v5;

  mode = self->_mode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mode, CFSTR("_mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startPosition, CFSTR("_startPosition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endPosition, CFSTR("_endPosition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_strengths, CFSTR("_strengths"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amplitudes, CFSTR("_amplitudes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_frequency, CFSTR("_frequency"));

}

@end
