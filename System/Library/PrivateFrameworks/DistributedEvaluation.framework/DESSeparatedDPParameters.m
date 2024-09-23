@implementation DESSeparatedDPParameters

- (DESSeparatedDPParameters)initWithRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  DESSeparatedDPParameters *v9;
  void *v10;
  double v11;
  void *v12;
  DESSeparatedDPParameters *v13;
  objc_super v15;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v4, "maxNorm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v5, "normBinCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)DESSeparatedDPParameters;
  v9 = -[DESSeparatedDPParameters init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(v5, "maxNorm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v9->_maxNorm = v11;

    objc_msgSend(v5, "normBinCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_normBinCount = objc_msgSend(v12, "integerValue");

  }
  self = v9;
  v13 = self;
LABEL_9:

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%f, %ld)"), v5, *(_QWORD *)&self->_maxNorm, self->_normBinCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)normBinCount
{
  return self->_normBinCount;
}

- (double)maxNorm
{
  return self->_maxNorm;
}

@end
