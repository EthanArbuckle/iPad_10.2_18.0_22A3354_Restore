@implementation FRRingBuffer

- (FRRingBuffer)initWithCapacity:(unint64_t)a3
{
  FRRingBuffer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRRingBuffer;
  v4 = -[FRRingBuffer init](&v6, sel_init);
  if (v4)
  {
    if (!a3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FRRingBuffer initWithCapacity:].cold.1();
    -[FRRingBuffer setCapacity:](v4, "setCapacity:", a3);
  }
  return v4;
}

- (FRRingBuffer)initWithCapacity:(unint64_t)a3 dictionary:(id)a4
{
  id v6;
  FRRingBuffer *v7;
  FRRingBuffer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = -[FRRingBuffer initWithCapacity:](self, "initWithCapacity:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Values"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FRRingBuffer initWithCapacity:dictionary:].cold.4();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[FRRingBuffer setValues:](v8, "setValues:", v11);

    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Position"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FCDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FRRingBuffer initWithCapacity:dictionary:].cold.3();
    -[FRRingBuffer setPosition:](v8, "setPosition:", objc_msgSend(v13, "integerValue"));
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Min"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    FCDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FRRingBuffer initWithCapacity:dictionary:].cold.2();
    objc_msgSend(v15, "doubleValue");
    -[FRRingBuffer setMin:](v8, "setMin:");
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Max"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    FCDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FRRingBuffer initWithCapacity:dictionary:].cold.1();
    objc_msgSend(v17, "doubleValue");
    -[FRRingBuffer setMax:](v8, "setMax:");

  }
  return v8;
}

- (NSMutableArray)values
{
  NSMutableArray *values;
  void *v4;
  unint64_t v5;

  values = self->_values;
  if (!values)
  {
    v4 = (void *)objc_opt_new();
    -[FRRingBuffer setValues:](self, "setValues:", v4);

    if (-[FRRingBuffer capacity](self, "capacity"))
    {
      v5 = 0;
      do
        -[NSMutableArray setObject:atIndexedSubscript:](self->_values, "setObject:atIndexedSubscript:", &unk_24DB6EBA0, v5++);
      while (-[FRRingBuffer capacity](self, "capacity") > v5);
    }
    -[FRRingBuffer setMin:](self, "setMin:", 1.79769313e308);
    -[FRRingBuffer setMax:](self, "setMax:", -1.79769313e308);
    -[FRRingBuffer setPosition:](self, "setPosition:", 0);
    values = self->_values;
  }
  return values;
}

- (void)insertValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[FRRingBuffer values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[FRRingBuffer position](self, "position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRRingBuffer values](self, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, -[FRRingBuffer position](self, "position"));

  v11 = -[FRRingBuffer position](self, "position") + 1;
  v12 = -[FRRingBuffer capacity](self, "capacity");
  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  -[FRRingBuffer setPosition:](self, "setPosition:", v11 % v13);
  -[FRRingBuffer min](self, "min");
  if (v8 == -1.79769313e308)
    goto LABEL_5;
  if (v8 != v14)
  {
    -[FRRingBuffer max](self, "max");
    if (v8 != v16)
    {
      -[FRRingBuffer min](self, "min");
LABEL_5:
      if (v14 > a3)
        -[FRRingBuffer setMin:](self, "setMin:", a3);
      -[FRRingBuffer max](self, "max");
      if (v15 < a3)
        -[FRRingBuffer setMax:](self, "setMax:", a3);
      return;
    }
  }
  *(_OWORD *)&self->_min = xmmword_219821E60;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[FRRingBuffer values](self, "values", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "doubleValue");
        v23 = fmin(self->_min, v22);
        v24 = fmax(self->_max, v22);
        self->_min = v23;
        self->_max = v24;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("Values");
  -[FRRingBuffer values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("Position");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("Min");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[FRRingBuffer min](self, "min");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("Max");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[FRRingBuffer max](self, "max");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FRRingBuffer values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[FRRingBuffer min](self, "min");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[FRRingBuffer max](self, "max");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Ring Buffer with Values : %@\nPosition : %@\nMin : %@\nMax : %@\n"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)initWithCapacity:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Cannot be zero capacity"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)initWithCapacity:dictionary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Initializing FRRingBuffer with a dictionay with no max"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)initWithCapacity:dictionary:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Initializing FRRingBuffer with a dictionay with no min"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)initWithCapacity:dictionary:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Initializing FRRingBuffer with a dictionay with no position"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)initWithCapacity:dictionary:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Initializing FRRingBuffer with a dictionay with no values"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

@end
