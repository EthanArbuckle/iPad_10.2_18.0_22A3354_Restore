@implementation HKPotentiallyNonConvertibleMassUnit

- (id)_unitByPrefixing:(id)a3 withConversionConstant:(id)a4
{
  id v6;
  id v7;
  HKMassUnit *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = [HKMassUnit alloc];
    -[HKBaseUnit unitString](self, "unitString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKBaseUnit proportionalSize](self, "proportionalSize");
    v11 = v10;
    -[HKUnit scaleOffset](self, "scaleOffset");
    v13 = -[HKBaseUnit _initWithUnitString:proportionalSize:scaleOffset:](v8, "_initWithUnitString:proportionalSize:scaleOffset:", v9, v11, v12);

    objc_msgSend(v13, "_unitByPrefixing:withConversionConstant:", v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HKPotentiallyNonConvertibleMassUnit;
    v15 = a3;
    -[HKBaseUnit _unitByPrefixing:withConversionConstant:](&v17, sel__unitByPrefixing_withConversionConstant_, v15, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

@end
