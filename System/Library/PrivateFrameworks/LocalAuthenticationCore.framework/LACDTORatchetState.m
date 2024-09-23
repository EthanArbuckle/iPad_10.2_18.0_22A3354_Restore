@implementation LACDTORatchetState

- (LACDTORatchetState)initWithRawValue:(int64_t)a3 duration:(double)a4 resetDuration:(double)a5 uuid:(id)a6
{
  id v11;
  LACDTORatchetState *v12;
  LACDTORatchetState *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetState;
  v12 = -[LACDTORatchetState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_rawValue = a3;
    v12->_duration = a4;
    v12->_resetDuration = a5;
    objc_storeStrong((id *)&v12->_uuid, a6);
  }

  return v13;
}

+ (id)nullInstance
{
  return -[LACDTORatchetState initWithRawValue:duration:resetDuration:uuid:]([LACDTORatchetState alloc], "initWithRawValue:duration:resetDuration:uuid:", 0, 0, -1.0, -1.0);
}

- (double)effectiveDuration
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[LACDTORatchetState duration](self, "duration");
  v3 = 3600.0;
  if (v4 != -1.0)
  {
    -[LACDTORatchetState duration](self, "duration");
    if (v5 > 0.0)
    {
      -[LACDTORatchetState duration](self, "duration");
      v3 = fmin(v6, 3600.0);
    }
  }
  return fmax(v3, 1.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rawValue;
  id v5;
  void *v6;
  double duration;
  void *v8;
  double resetDuration;
  void *v10;
  NSString *uuid;
  id v12;

  rawValue = self->_rawValue;
  v5 = a3;
  NSStringFromSelector(sel_rawValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", rawValue, v6);

  duration = self->_duration;
  NSStringFromSelector(sel_duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v8, duration);

  resetDuration = self->_resetDuration;
  NSStringFromSelector(sel_resetDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v10, resetDuration);

  uuid = self->_uuid;
  NSStringFromSelector(sel_uuid);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v12);

}

- (LACDTORatchetState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  LACDTORatchetState *v16;

  v4 = a3;
  NSStringFromSelector(sel_rawValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v7);
  v9 = v8;

  NSStringFromSelector(sel_resetDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v10);
  v12 = v11;

  v13 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[LACDTORatchetState initWithRawValue:duration:resetDuration:uuid:](self, "initWithRawValue:duration:resetDuration:uuid:", v6, v15, v9, v12);
  return v16;
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x24BDAC8D0];
  v23 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = self->_rawValue - 1;
  if (v4 > 3)
    v5 = CFSTR("LACDTORatchetStateRawValueNotStarted");
  else
    v5 = off_2510C1740[v4];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rawValue: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetState duration](self, "duration");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("duration: %.2f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetState resetDuration](self, "resetDuration");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("resetDuration: %.2f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetState effectiveDuration](self, "effectiveDuration");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("effectiveDuration: %.2f"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v16 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetState uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("uuid: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("; "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACDTORatchetState rawValue](self, "rawValue");
    if (v6 != objc_msgSend(v5, "rawValue"))
      goto LABEL_6;
    -[LACDTORatchetState duration](self, "duration");
    v8 = v7;
    objc_msgSend(v5, "duration");
    if (v8 != v9)
      goto LABEL_6;
    -[LACDTORatchetState resetDuration](self, "resetDuration");
    v11 = v10;
    objc_msgSend(v5, "resetDuration");
    if (v11 == v12
      && (-[LACDTORatchetState effectiveDuration](self, "effectiveDuration"),
          v14 = v13,
          objc_msgSend(v5, "effectiveDuration"),
          v14 == v15))
    {
      -[LACDTORatchetState uuid](self, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {
        v16 = 1;
        v20 = v18;
      }
      else
      {
        v20 = (void *)v19;
        -[LACDTORatchetState uuid](self, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v21, "isEqualToString:", v22);

      }
    }
    else
    {
LABEL_6:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (double)duration
{
  return self->_duration;
}

- (double)resetDuration
{
  return self->_resetDuration;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
