@implementation NTKCompositeComplicationFactory

- (NSMutableDictionary)factoriesBySlot
{
  NSMutableDictionary *factoriesBySlot;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *factories;

  factoriesBySlot = self->_factoriesBySlot;
  if (!factoriesBySlot)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_factoriesBySlot;
    self->_factoriesBySlot = v4;

    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    factories = self->_factories;
    self->_factories = v6;

    factoriesBySlot = self->_factoriesBySlot;
  }
  return factoriesBySlot;
}

- (void)registerFactory:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

      -[NTKCompositeComplicationFactory factories](self, "factories");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v7);

    }
  }
}

- (void)registerFactory:(id)a3 forSlots:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NTKCompositeComplicationFactory_registerFactory_forSlots___block_invoke;
  v8[3] = &unk_1E6BCD908;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __60__NTKCompositeComplicationFactory_registerFactory_forSlots___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerFactory:forSlot:", *(_QWORD *)(a1 + 40), a2);
}

- (void)deregisterFactoryAtSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

    if (v8)
    {
      -[NTKCompositeComplicationFactory factories](self, "factories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);

    }
  }
}

- (void)deregisterFactoryAtSlots:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__NTKCompositeComplicationFactory_deregisterFactoryAtSlots___block_invoke;
  v3[3] = &unk_1E6BCD930;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __60__NTKCompositeComplicationFactory_deregisterFactoryAtSlots___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deregisterFactoryAtSlot:", a2);
}

- (id)factoryAtSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "complicationPickerStyleForSlot:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureComplicationView:forSlot:", v7, v6);

}

- (void)curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a8;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "curvedComplicationCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:", a3, a4, a5, a6, a7, v18);

  }
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keylineViewForComplicationSlot:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a4;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "legacyLayoutOverrideforComplicationType:slot:", a3, v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)loadLayoutRules
{
  id v2;

  -[NTKCompositeComplicationFactory factories](self, "factories");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_2);

}

uint64_t __50__NTKCompositeComplicationFactory_loadLayoutRules__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loadLayoutRules");
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newLegacyViewForComplication:family:slot:", v9, a4, v8);

  return v12;
}

- (unint64_t)layoutStyleForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[NTKCompositeComplicationFactory factoriesBySlot](self, "factoriesBySlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "layoutStyleForSlot:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)setFactoriesBySlot:(id)a3
{
  objc_storeStrong((id *)&self->_factoriesBySlot, a3);
}

- (NSMutableOrderedSet)factories
{
  return self->_factories;
}

- (void)setFactories:(id)a3
{
  objc_storeStrong((id *)&self->_factories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_factoriesBySlot, 0);
}

@end
