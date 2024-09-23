@implementation ATXModeDimensionSet

- (ATXModeDimensionSet)initWithMode:(id)a3
{
  id v5;
  ATXModeDimensionSet *v6;
  ATXModeDimensionSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeDimensionSet;
  v6 = -[ATXModeDimensionSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mode, a3);

  return v7;
}

- (id)powerset
{
  void *v3;
  ATXModeDimensionSet *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", self);
  v4 = -[ATXModeDimensionSet initWithMode:]([ATXModeDimensionSet alloc], "initWithMode:", self->_mode);
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)coreAnalyticsDictionary
{
  NSString *mode;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("mode");
  mode = self->_mode;
  v3 = mode;
  if (!mode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!mode)

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXModeDimensionSet initWithMode:](+[ATXModeDimensionSet allocWithZone:](ATXModeDimensionSet, "allocWithZone:", a3), "initWithMode:", self->_mode);
}

- (NSString)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
