@implementation CPPointOfInterestTemplate

- (CPPointOfInterestTemplate)initWithTitle:(NSString *)title pointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex
{
  NSString *v8;
  NSArray *v9;
  CPPointOfInterestTemplate *v10;
  CPPointsOfInterestEntity *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  CPPointsOfInterestEntity *poiEntity;
  objc_super v18;

  v8 = title;
  v9 = pointsOfInterest;
  v18.receiver = self;
  v18.super_class = (Class)CPPointOfInterestTemplate;
  v10 = -[CPTemplate init](&v18, sel_init);
  if (v10)
  {
    v11 = [CPPointsOfInterestEntity alloc];
    v12 = v9;
    if (-[NSArray count](v12, "count") > 0xC)
    {
      -[NSArray subarrayWithRange:](v12, "subarrayWithRange:", 0, 12);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v14 = v13;

    v15 = -[CPPointsOfInterestEntity initWithTitle:pointsOfInterest:](v11, "initWithTitle:pointsOfInterest:", v8, v14);
    poiEntity = v10->_poiEntity;
    v10->_poiEntity = (CPPointsOfInterestEntity *)v15;

    v10->_selectedIndex = selectedIndex;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointOfInterestTemplate)initWithCoder:(id)a3
{
  id v4;
  CPPointOfInterestTemplate *v5;
  uint64_t v6;
  CPPointsOfInterestEntity *poiEntity;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPPointOfInterestTemplate;
  v5 = -[CPTemplate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPEntity"));
    v6 = objc_claimAutoreleasedReturnValue();
    poiEntity = v5->_poiEntity;
    v5->_poiEntity = (CPPointsOfInterestEntity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PointOfInterestTemplateSelectedIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectedIndex = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPPointOfInterestTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPPointOfInterestTemplate poiEntity](self, "poiEntity", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPEntity"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CPPointOfInterestTemplate selectedIndex](self, "selectedIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PointOfInterestTemplateSelectedIndex"));

}

- (void)setTitle:(NSString *)title
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSString *v8;

  v8 = title;
  -[CPPointOfInterestTemplate poiEntity](self, "poiEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    -[CPPointOfInterestTemplate poiEntity](self, "poiEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v8);

    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CPPointOfInterestTemplate poiEntity](self, "poiEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex
{
  NSArray *v6;
  NSArray *v7;
  void *v8;
  char v9;
  NSArray *v10;

  v10 = pointsOfInterest;
  if (-[NSArray count](v10, "count") > 0xC)
  {
    -[NSArray subarrayWithRange:](v10, "subarrayWithRange:", 0, 12);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v10;
  }
  v7 = v6;

  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL && -[NSArray count](v7, "count") <= selectedIndex)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("Selected index %ld is beyond array bounds [0..%ld]"), selectedIndex, -[NSArray count](v7, "count"));
  if (-[CPPointOfInterestTemplate selectedIndex](self, "selectedIndex") != selectedIndex
    || (-[CPPointOfInterestTemplate pointsOfInterest](self, "pointsOfInterest"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = BSEqualArrays(),
        v8,
        (v9 & 1) == 0))
  {
    -[CPPointOfInterestTemplate setPointsOfInterest:](self, "setPointsOfInterest:", v7);
    -[CPPointOfInterestTemplate setSelectedIndex:](self, "setSelectedIndex:", selectedIndex);
    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }

}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
  if (self->_selectedIndex != selectedIndex)
  {
    self->_selectedIndex = selectedIndex;
    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setPointsOfInterest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPPointOfInterestTemplate entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPointsOfInterest:", v4);

  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
}

- (NSArray)pointsOfInterest
{
  void *v2;
  void *v3;

  -[CPPointOfInterestTemplate poiEntity](self, "poiEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointsOfInterest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)performUpdate
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPPointOfInterestTemplate;
  -[CPTemplate performUpdate](&v8, sel_performUpdate);
  objc_initWeak(&location, self);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CPPointOfInterestTemplate_performUpdate__block_invoke;
  v5[3] = &unk_24C77DA98;
  objc_copyWeak(&v6, &location);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__CPPointOfInterestTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "updateEntityTemplate:withProxyDelegate:", WeakRetained, WeakRetained);

}

- (void)handleMapRegionDidChange:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[CPPointOfInterestTemplate pointOfInterestDelegate](self, "pointOfInterestDelegate", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointOfInterestTemplate:didChangeMapRegion:", self, v10, v9, v8, v7);

}

- (void)handleDidSelectPointOfInterestWithIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CPPointOfInterestTemplate pointOfInterestDelegate](self, "pointOfInterestDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v9;
  if ((v5 & 1) != 0)
  {
    -[CPPointOfInterestTemplate _pointOfInterestWithIdentifier:](self, "_pointOfInterestWithIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CPPointOfInterestTemplate pointOfInterestDelegate](self, "pointOfInterestDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pointOfInterestTemplate:didSelectPointOfInterest:", self, v7);

    }
    v6 = v9;
  }

}

- (id)_pointOfInterestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  -[CPPointOfInterestTemplate pointsOfInterest](self, "pointsOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__CPPointOfInterestTemplate__pointOfInterestWithIdentifier___block_invoke;
  v11[3] = &unk_24C77DAC0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v7 = (void *)v15[5];
  if (!v7)
  {
    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_INFO, "Failed to identify a local point of interest for %@", buf, 0xCu);
    }

    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __60__CPPointOfInterestTemplate__pointOfInterestWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CPPointOfInterestTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __62__CPPointOfInterestTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend(v4, "handlePrimaryAction");
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)CPPointOfInterestTemplate;
    objc_msgSendSuper2(&v9, sel_handleActionForControlIdentifier_, v8);
  }

}

- (NSUInteger)selectedIndex
{
  return self->_selectedIndex;
}

- (id)pointOfInterestDelegate
{
  return objc_loadWeakRetained((id *)&self->_pointOfInterestDelegate);
}

- (void)setPointOfInterestDelegate:(id)pointOfInterestDelegate
{
  objc_storeWeak((id *)&self->_pointOfInterestDelegate, pointOfInterestDelegate);
}

- (CPPointsOfInterestEntity)poiEntity
{
  return self->_poiEntity;
}

- (void)setPoiEntity:(id)a3
{
  objc_storeStrong((id *)&self->_poiEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiEntity, 0);
  objc_destroyWeak((id *)&self->_pointOfInterestDelegate);
}

@end
