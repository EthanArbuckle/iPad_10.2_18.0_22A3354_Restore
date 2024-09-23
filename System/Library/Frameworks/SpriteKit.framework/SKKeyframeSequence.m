@implementation SKKeyframeSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKKeyframeSequence)init
{
  return -[SKKeyframeSequence initWithCapacity:](self, "initWithCapacity:", 0);
}

- (id)copy
{
  return -[SKKeyframeSequence copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SKKeyframeSequence initWithKeyframeValues:times:]([SKKeyframeSequence alloc], "initWithKeyframeValues:times:", self->_values, self->_times);
}

- (SKKeyframeSequence)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SKKeyframeSequence *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *values;
  uint64_t v11;
  NSMutableArray *times;
  uint64_t v13;
  SKKeyframeSequence *v14;
  objc_super v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = aDecoder;
  v16.receiver = self;
  v16.super_class = (Class)SKKeyframeSequence;
  v5 = -[SKKeyframeSequence init](&v16, sel_init);
  if (v5)
  {
    -[SKKeyframeSequence setInterpolationMode:](v5, "setInterpolationMode:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("_interpolationMode")));
    -[SKKeyframeSequence setRepeatMode:](v5, "setRepeatMode:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("_repeatMode")));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    -[NSCoder allowedClasses](v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_values"));
    v9 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSMutableArray *)v9;

    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_times"));
    v11 = objc_claimAutoreleasedReturnValue();
    times = v5->_times;
    v5->_times = (NSMutableArray *)v11;

    v5->_cKeyframeSequence = 0;
    v13 = -[NSMutableArray count](v5->_values, "count");
    if (v13 != -[NSMutableArray count](v5->_times, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("'values' and 'times'  arrays must have equal counts"));

      v14 = 0;
      goto LABEL_6;
    }
    v5->_count = -[NSMutableArray count](v5->_values, "count");

  }
  v14 = v5;
LABEL_6:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKKeyframeSequence interpolationMode](self, "interpolationMode"), CFSTR("_interpolationMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKKeyframeSequence repeatMode](self, "repeatMode"), CFSTR("_repeatMode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_values, CFSTR("_values"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_times, CFSTR("_times"));

}

- (SKKeyframeSequence)initWithCapacity:(NSUInteger)numItems
{
  void *v5;
  void *v6;
  SKKeyframeSequence *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", numItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKKeyframeSequence initWithKeyframeValues:times:](self, "initWithKeyframeValues:times:", v5, v6);

  return v7;
}

- (SKKeyframeSequence)initWithKeyframeValues:(NSArray *)values times:(NSArray *)times
{
  NSArray *v6;
  NSArray *v7;
  SKKeyframeSequence *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  NSMutableArray *v13;
  SKKeyframeSequence *v14;
  objc_super v16;

  v6 = values;
  v7 = times;
  v16.receiver = self;
  v16.super_class = (Class)SKKeyframeSequence;
  v8 = -[SKKeyframeSequence init](&v16, sel_init);
  if (v8)
  {
    v9 = -[NSArray count](v6, "count");
    if (v9 != -[NSArray count](v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("'values' and 'times'  arrays must have equal counts"));
      v14 = 0;
      goto LABEL_6;
    }
    v8->_count = v9;
    v10 = -[NSArray mutableCopy](v6, "mutableCopy");
    v11 = v8->_values;
    v8->_values = (NSMutableArray *)v10;

    v12 = -[NSArray mutableCopy](v7, "mutableCopy");
    v13 = v8->_times;
    v8->_times = (NSMutableArray *)v12;

    *(int64x2_t *)&v8->_interpolationMode = vdupq_n_s64(1uLL);
    v8->_cKeyframeSequence = 0;
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (NSUInteger)count
{
  return self->_count;
}

- (void)setInterpolationMode:(SKInterpolationMode)interpolationMode
{
  self->_interpolationMode = interpolationMode;
  -[SKKeyframeSequence _dirtySKCKeyframeSequence](self, "_dirtySKCKeyframeSequence");
}

- (SKInterpolationMode)interpolationMode
{
  return self->_interpolationMode;
}

- (void)setRepeatMode:(SKRepeatMode)repeatMode
{
  self->_repeatMode = repeatMode;
  -[SKKeyframeSequence _dirtySKCKeyframeSequence](self, "_dirtySKCKeyframeSequence");
}

- (SKRepeatMode)repeatMode
{
  return self->_repeatMode;
}

- (void)addKeyframeValue:(id)value time:(CGFloat)time
{
  id v6;
  NSMutableArray *times;
  void *v8;
  id v9;

  v6 = value;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  times = self->_times;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", time);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](times, "addObject:", v8);

  self->_count = -[NSMutableArray count](self->_values, "count");
}

- (void)removeLastKeyframe
{
  -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
  -[NSMutableArray removeLastObject](self->_times, "removeLastObject");
  self->_count = -[NSMutableArray count](self->_values, "count");
}

- (void)removeAllKeyframes
{
  -[NSMutableArray removeAllObjects](self->_values, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_times, "removeAllObjects");
  self->_count = -[NSMutableArray count](self->_values, "count");
}

- (void)removeKeyframeAtIndex:(NSUInteger)index
{
  -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:");
  -[NSMutableArray removeObjectAtIndex:](self->_times, "removeObjectAtIndex:", index);
  self->_count = -[NSMutableArray count](self->_values, "count");
}

- (void)setKeyframeValue:(id)value forIndex:(NSUInteger)index
{
  id v6;
  id v7;

  v6 = value;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_values, "replaceObjectAtIndex:withObject:", index, v6);
  -[SKKeyframeSequence _dirtySKCKeyframeSequence](self, "_dirtySKCKeyframeSequence");

}

- (void)setKeyframeTime:(CGFloat)time forIndex:(NSUInteger)index
{
  NSMutableArray *times;
  void *v7;

  times = self->_times;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", time);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](times, "replaceObjectAtIndex:withObject:", index, v7);

  -[SKKeyframeSequence _dirtySKCKeyframeSequence](self, "_dirtySKCKeyframeSequence");
}

- (void)setKeyframeValue:(id)value time:(CGFloat)time forIndex:(NSUInteger)index
{
  id v8;

  v8 = value;
  -[SKKeyframeSequence setKeyframeValue:forIndex:](self, "setKeyframeValue:forIndex:");
  -[SKKeyframeSequence setKeyframeTime:forIndex:](self, "setKeyframeTime:forIndex:", index, time);
  -[SKKeyframeSequence _dirtySKCKeyframeSequence](self, "_dirtySKCKeyframeSequence");

}

- (id)getKeyframeValueForIndex:(NSUInteger)index
{
  void *v3;
  id v4;

  -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", index);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (Class)_valueClass
{
  void *v2;
  void *v3;

  if (self->_count)
  {
    -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

- (SKCKeyframeSequence)_createSKCKeyframeSequence
{
  unint64_t count;
  void *v4;
  char isKindOfClass;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SKCKeyframeSequence *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t k;
  double v16;
  double v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  uint64_t m;
  double v26;
  double v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  float v40[4];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  count = self->_count;
  if ((int)count >= 1)
  {
    -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v6 = self->_values;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v33 != v8)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSLog(CFSTR("All values in a SKKeyframeSequence must be of the same class"), v32);
              goto LABEL_29;
            }
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v7)
            continue;
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(CFSTR("SKKeyframeSequence values must be either SKColors or NSNumbers"));
LABEL_30:
        v10 = 0;
        goto LABEL_31;
      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v6 = self->_values;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v37;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSLog(CFSTR("All values in a SKKeyframeSequence must be of the same class"));
LABEL_29:

              goto LABEL_30;
            }
          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          if (v11)
            continue;
          break;
        }
      }
    }

    v14 = count;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = (SKCKeyframeSequence *)operator new();
      SKCKeyframeSequence::SKCKeyframeSequence(v10, count, 4);
      SKCKeyframeSequence::setInterpMode(v10, -[SKKeyframeSequence interpolationMode](self, "interpolationMode"));
      SKCKeyframeSequence::setRepeatMode(v10, -[SKKeyframeSequence repeatMode](self, "repeatMode"));
      for (k = 0; k != v14; ++k)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](self, "getKeyframeTimeForIndex:", k, v32);
        v17 = v16;
        -[SKKeyframeSequence getKeyframeValueForIndex:](self, "getKeyframeValueForIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentRGBA");
        v19 = v17;
        v40[0] = v20;
        v40[1] = v21;
        v40[2] = v22;
        v40[3] = v23;
        SKCKeyframeSequence::setKeyframe(v10, k, v19, v40);

      }
    }
    else
    {
      v10 = (SKCKeyframeSequence *)operator new();
      SKCKeyframeSequence::SKCKeyframeSequence(v10, count, 1);
      SKCKeyframeSequence::setInterpMode(v10, -[SKKeyframeSequence interpolationMode](self, "interpolationMode"));
      SKCKeyframeSequence::setRepeatMode(v10, -[SKKeyframeSequence repeatMode](self, "repeatMode"));
      for (m = 0; m != v14; ++m)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](self, "getKeyframeTimeForIndex:", m, v32);
        v27 = v26;
        v40[0] = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](self, "getKeyframeValueForIndex:", m);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "floatValue");
        v30 = v29;

        v31 = v27;
        v40[0] = v30;
        SKCKeyframeSequence::setKeyframe(v10, m, v31, v40);
      }
    }
LABEL_31:

    return v10;
  }
  return 0;
}

- (void)_dirtySKCKeyframeSequence
{
  SKCKeyframeSequence *cKeyframeSequence;

  cKeyframeSequence = self->_cKeyframeSequence;
  if (cKeyframeSequence)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(cKeyframeSequence);
    MEMORY[0x1DF0CF560]();
    self->_cKeyframeSequence = 0;
  }
}

- (id)sampleAtTime:(CGFloat)time
{
  objc_class *v5;
  objc_class *v6;
  float v7;
  float v8;
  float v10[4];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_cKeyframeSequence)
    self->_cKeyframeSequence = -[SKKeyframeSequence _createSKCKeyframeSequence](self, "_createSKCKeyframeSequence");
  v5 = -[SKKeyframeSequence _valueClass](self, "_valueClass");
  if (v5)
  {
    v6 = v5;
    if (v5 == (objc_class *)objc_opt_class())
    {
      v7 = time;
      SKCKeyframeSequence::sample(self->_cKeyframeSequence, v7, v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10[0]);
      v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else if (v6 == (objc_class *)objc_opt_class())
    {
      v8 = time;
      SKCKeyframeSequence::sample(self->_cKeyframeSequence, v8, v10);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v10[0], v10[1], v10[2], v10[3]);
      v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (CGFloat)getKeyframeTimeForIndex:(NSUInteger)index
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray objectAtIndex:](self->_times, "objectAtIndex:", index);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_times, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (SKKeyframeSequence)initWithCount:(unint64_t)a3
{
  void *v5;
  void *i;
  void *v7;
  void *v8;
  SKKeyframeSequence *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v8);

  }
  v9 = -[SKKeyframeSequence initWithKeyframeValues:times:](self, "initWithKeyframeValues:times:", v5, i);

  return v9;
}

- (BOOL)isEqualToSequence:(id)a3
{
  SKKeyframeSequence *v4;
  SKInterpolationMode v5;
  SKRepeatMode v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (SKKeyframeSequence *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = -[SKKeyframeSequence interpolationMode](self, "interpolationMode");
    if (v5 == -[SKKeyframeSequence interpolationMode](v4, "interpolationMode")
      && (v6 = -[SKKeyframeSequence repeatMode](self, "repeatMode"),
          v6 == -[SKKeyframeSequence repeatMode](v4, "repeatMode")))
    {
      v7 = 0;
      while (-[NSMutableArray count](self->_values, "count") > v7)
      {
        if (-[NSMutableArray count](v4->_values, "count") > v7)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](v4->_values, "objectAtIndexedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqual:", v9);

          ++v7;
          if ((v10 & 1) != 0)
            continue;
        }
        goto LABEL_8;
      }
      v13 = 0;
      do
      {
        v14 = -[NSMutableArray count](self->_times, "count");
        v11 = v14 <= v13;
        if (v14 <= v13)
          break;
        if (-[NSMutableArray count](v4->_times, "count") <= v13)
          break;
        -[NSMutableArray objectAtIndexedSubscript:](self->_times, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](v4->_times, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToNumber:", v16);

        ++v13;
      }
      while ((v17 & 1) != 0);
    }
    else
    {
LABEL_8:
      v11 = 0;
    }
  }

  return v11;
}

@end
