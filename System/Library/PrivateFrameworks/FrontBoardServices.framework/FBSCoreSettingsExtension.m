@implementation FBSCoreSettingsExtension

+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  Class v15;
  Class v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "descriptionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v10, "keyForSetting:", a6);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = NSClassFromString(v13);
        if (v15)
        {
          v16 = v15;
          if (-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", objc_opt_class()))
            objc_msgSend(v11, "setDescriptionProvider:", v16);
        }
      }

    }
  }
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___FBSCoreSettingsExtension;
  objc_msgSendSuper2(&v19, sel_settings_valueDescriptionForFlag_object_ofSetting_, v10, a4, v11, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
