@implementation HMUserNumberSetting

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMSetting settingManager](self, "settingManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateValueForSetting:value:completionHandler:", self, v7, v6);

}

- (BOOL)doesValueConformToConstraints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMNumberSetting minimumValue](self, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(v6, "intValue");
      -[HMNumberSetting minimumValue](self, "minimumValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 >= (int)objc_msgSend(v9, "intValue"))
      {
        -[HMNumberSetting maximumValue](self, "maximumValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = objc_msgSend(v6, "intValue");
          -[HMNumberSetting maximumValue](self, "maximumValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v12 <= (int)objc_msgSend(v13, "intValue");

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
