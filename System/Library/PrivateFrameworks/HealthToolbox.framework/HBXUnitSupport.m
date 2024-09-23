@implementation HBXUnitSupport

- (id)localizedDisplayNameForUnit:(id)a3 nameContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HBXUnitSupport unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDisplayNameForUnit:value:nameContext:", v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HBXUnitSupport)initWithUnitPreferenceController:(id)a3 displayTypeController:(id)a4
{
  id v7;
  id v8;
  HBXUnitSupport *v9;
  HBXUnitSupport *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HBXUnitSupport;
  v9 = -[HBXUnitSupport init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unitPreferenceController, a3);
    objc_storeStrong((id *)&v10->_displayTypeController, a4);
  }

  return v10;
}

- (id)preferredUnitForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HBXUnitSupport displayTypeController](self, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HBXUnitSupport unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitForDisplayType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (id)localizedPreferredUnitDisplayNameForType:(id)a3 nameContext:(int64_t)a4
{
  void *v6;
  void *v7;

  -[HBXUnitSupport preferredUnitForType:](self, "preferredUnitForType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HBXUnitSupport localizedDisplayNameForUnit:nameContext:](self, "localizedDisplayNameForUnit:nameContext:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updatePreferredUnit:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HBXUnitSupport displayTypeController](self, "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeForObjectType:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HBXUnitSupport unitPreferenceController](self, "unitPreferenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatePreferredUnit:forDisplayType:", v7, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
}

@end
