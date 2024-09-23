@implementation NTKCuratedColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "curatedColorValuesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKCuratedColorEditOption;
  objc_msgSendSuper2(&v13, sel__orderedValuesForDevice_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "addObjectsFromArray:", v8);
  v9 = (void *)_orderedValuesForDevice____colors_0;
  _orderedValuesForDevice____colors_0 = (uint64_t)v5;
  v10 = v5;

  v11 = (id)_orderedValuesForDevice____colors_0;
  return v11;
}

+ (id)curatedColorValuesForDevice:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color-%lu"), a4, a3);
}

- (id)_valueToFaceBundleStringDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCuratedColorEditOption;
  -[NTKFaceColorEditOption _valueToFaceBundleStringDict](&v12, sel__valueToFaceBundleStringDict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_class();
  -[NTKEditOption device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_curatedColorValuesForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NTKCuratedColorEditOption__valueToFaceBundleStringDict__block_invoke;
  v10[3] = &unk_1E6BD54B0;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

void __57__NTKCuratedColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("color %@"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

@end
