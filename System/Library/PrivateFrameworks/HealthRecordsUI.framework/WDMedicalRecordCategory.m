@implementation WDMedicalRecordCategory

- (WDMedicalRecordCategory)initWithDictionary:(id)a3
{
  id v4;
  WDMedicalRecordCategory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordCategory;
  v5 = -[WDMedicalRecordCategory init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKMedicalRecordCategoryTypeIdentifer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setCategoryType:](v5, "setCategoryType:", objc_msgSend(v6, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WDMedicalRecordCategoryMetricColors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setCategoryMetricColors:](v5, "setCategoryMetricColors:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WDMedicalRecordCategoryDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setDisplayName:](v5, "setDisplayName:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WDMedicalRecordCategoryDisplayImageName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setDisplayImageName:](v5, "setDisplayImageName:", v9);

    -[WDMedicalRecordCategory displayImageName](v5, "displayImageName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hkui_isRunningInApp");

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0DC3870];
        -[WDMedicalRecordCategory displayImageName](v5, "displayImageName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HKHealthUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDMedicalRecordCategory setDisplayImage:](v5, "setDisplayImage:", v17);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WDMedicalRecordCategorySampleTypes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setSampleTypes:](v5, "setSampleTypes:", v18);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WDMedicalRecordCategoryAdditionalPredicates"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordCategory setAdditionalPredicatesForCategory:](v5, "setAdditionalPredicatesForCategory:", v19);

  }
  return v5;
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (HKUIMetricColors)categoryMetricColors
{
  return self->_categoryMetricColors;
}

- (void)setCategoryMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_categoryMetricColors, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (void)setDisplayImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (void)setDisplayImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayImage, a3);
}

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (void)setSampleTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)additionalPredicatesForCategory
{
  return self->_additionalPredicatesForCategory;
}

- (void)setAdditionalPredicatesForCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicatesForCategory, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_categoryMetricColors, 0);
}

@end
