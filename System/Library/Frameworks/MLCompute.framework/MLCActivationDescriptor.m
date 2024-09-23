@implementation MLCActivationDescriptor

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCActivationDescriptor activationType](self, "activationType");
  -[MLCActivationDescriptor a](self, "a");
  v8 = v7;
  -[MLCActivationDescriptor b](self, "b");
  v10 = v9;
  -[MLCActivationDescriptor c](self, "c");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { activationType=%d : a=%f : b=%f : c=%f}"), v5, v6, *(_QWORD *)&v8, *(_QWORD *)&v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)defaultParametersForType:(int)a3
{
  __asm { FMOV            V0.4S, #1.0 }
  return ((uint64_t (*)(__n128))((char *)nullsub_1 + 4 * byte_1D4AB8900[a3]))(_Q0);
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType
{
  uint64_t v3;
  __int128 v5;
  id v6;
  double v7;
  double v8;
  __int128 v10;

  v3 = *(_QWORD *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  v10 = v5;
  v6 = objc_alloc((Class)a1);
  LODWORD(v8) = DWORD2(v10);
  LODWORD(v7) = DWORD1(v10);
  return (MLCActivationDescriptor *)(id)objc_msgSend(v6, "initWithType:a:b:c:", v3, *(double *)&v10, v7, v8);
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a
{
  uint64_t v5;
  __int128 v7;
  id v8;
  double v9;
  double v10;
  __int128 v12;

  v5 = *(_QWORD *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  v12 = v7;
  v8 = objc_alloc((Class)a1);
  LODWORD(v10) = DWORD2(v12);
  LODWORD(v9) = DWORD1(v12);
  return (MLCActivationDescriptor *)(id)objc_msgSend(v8, "initWithType:a:b:c:", v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(a))), v9, v10);
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b
{
  uint64_t v7;
  __int128 v9;
  id v10;
  double v11;
  double v12;
  __int128 v14;

  v7 = *(_QWORD *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  v14 = v9;
  v10 = objc_alloc((Class)a1);
  LODWORD(v11) = DWORD2(v14);
  *(float *)&v12 = b;
  return (MLCActivationDescriptor *)(id)objc_msgSend(v10, "initWithType:a:b:c:", v7, COERCE_DOUBLE(__PAIR64__(DWORD1(v14), LODWORD(a))), v12, v11);
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b c:(float)c
{
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;

  v9 = *(_QWORD *)&activationType;
  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = a;
  *(float *)&v12 = b;
  *(float *)&v13 = c;
  return (MLCActivationDescriptor *)(id)objc_msgSend(v10, "initWithType:a:b:c:", v9, v11, v12, v13);
}

- (MLCActivationDescriptor)initWithType:(int)a3 a:(float)a4 b:(float)a5 c:(float)a6
{
  MLCActivationDescriptor *v6;
  NSObject *v8;
  MLCActivationDescriptor *v9;
  MLCActivationDescriptor *v14;
  objc_super v16;

  v6 = self;
  if (a3 == 21)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCActivationDescriptor initWithType:a:b:c:].cold.1(a2, v8);

    v9 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MLCActivationDescriptor;
    v14 = -[MLCActivationDescriptor init](&v16, sel_init);
    if (v14)
    {
      v14->_activationType = a3;
      v14->_a = a4;
      v14->_b = a5;
      v14->_c = a6;
    }
    v6 = v14;
    v9 = v6;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "activationType");
    if (v6 == -[MLCActivationDescriptor activationType](self, "activationType")
      && (objc_msgSend(v5, "a"), v8 = v7, -[MLCActivationDescriptor a](self, "a"), v8 == v9)
      && (objc_msgSend(v5, "b"), v11 = v10, -[MLCActivationDescriptor b](self, "b"), v11 == v12))
    {
      objc_msgSend(v5, "c");
      v14 = v13;
      -[MLCActivationDescriptor c](self, "c");
      v16 = v14 == v15;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MLCActivationDescriptor activationType](self, "activationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCActivationDescriptor a](self, "a");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCActivationDescriptor b](self, "b");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hash");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCActivationDescriptor c](self, "c");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  hashCombine(&v19, v11, v12, v13, v14, v15, v16, v17, v4);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCActivationDescriptor activationType](self, "activationType");
  -[MLCActivationDescriptor a](self, "a");
  v7 = v6;
  -[MLCActivationDescriptor b](self, "b");
  v9 = v8;
  -[MLCActivationDescriptor c](self, "c");
  LODWORD(v11) = v10;
  LODWORD(v12) = v7;
  LODWORD(v13) = v9;
  return (id)objc_msgSend(v4, "initWithType:a:b:c:", v5, v12, v13, v11);
}

- (MLCActivationType)activationType
{
  return self->_activationType;
}

- (float)a
{
  return self->_a;
}

- (float)b
{
  return self->_b;
}

- (float)c
{
  return self->_c;
}

- (void)initWithType:(const char *)a1 a:(NSObject *)a2 b:c:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = 21;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Requested activation type: (%d) not supported", (uint8_t *)&v4, 0x12u);

}

@end
