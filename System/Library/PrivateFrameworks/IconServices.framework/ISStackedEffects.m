@implementation ISStackedEffects

- (ISStackedEffects)initWithEffects:(id)a3
{
  id v5;
  ISStackedEffects *v6;
  ISStackedEffects *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISStackedEffects;
  v6 = -[ISStackedEffects init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_effects, a3);

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v6 = a3;
  v7 = a4;
  -[ISStackedEffects effects](self, "effects");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ISStackedEffects effects](self, "effects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "count");

    if (v11)
    {
      -[ISStackedEffects effects](self, "effects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filterWithBackgroundImage:inputImage:", v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ISStackedEffects effects](self, "effects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 < 2)
      {
        v11 = v14;
      }
      else
      {
        v17 = 1;
        do
        {
          -[ISStackedEffects effects](self, "effects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "outputImage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "filterWithBackgroundImage:inputImage:", 0, v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          ++v17;
          -[ISStackedEffects effects](self, "effects");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          v14 = v11;
        }
        while (v22 > v17);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ISEffect)effects
{
  return (ISEffect *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEffects:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
}

@end
