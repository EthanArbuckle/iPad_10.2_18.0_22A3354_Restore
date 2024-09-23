@implementation VNWeakTypeWrapper

- (id)objectAndReturnError:(id *)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Weak VNType object wrapper contains nil object"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (VNWeakTypeWrapper)initWithObject:(id)a3
{
  id v4;
  VNWeakTypeWrapper *v5;
  VNWeakTypeWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapper;
  v5 = -[VNWeakTypeWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_weakObject, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakObject);
}

- (BOOL)isEqual:(id)a3
{
  VNWeakTypeWrapper *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (VNWeakTypeWrapper *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNWeakTypeWrapper objectAndReturnError:](v4, "objectAndReturnError:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNWeakTypeWrapper objectAndReturnError:](self, "objectAndReturnError:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = VisionCoreEqualOrNilObjects();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapper;
  -[VNWeakTypeWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: %@"), v4, WeakRetained);

  return v6;
}

@end
