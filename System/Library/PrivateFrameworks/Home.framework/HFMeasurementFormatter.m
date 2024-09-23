@implementation HFMeasurementFormatter

- (HFMeasurementFormatter)initWithMeasurementBlock:(id)a3
{
  id v5;
  HFMeasurementFormatter *v6;
  HFMeasurementFormatter *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMeasurementFormatter.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("measurementBlock"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HFMeasurementFormatter;
  v6 = -[NSMeasurementFormatter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NSMeasurementFormatter setUnitStyle:](v6, "setUnitStyle:", 1);
    -[HFMeasurementFormatter setMeasurementBlock:](v7, "setMeasurementBlock:", v5);
  }

  return v7;
}

- (HFMeasurementFormatter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMeasurementFormatter.m"), 32, CFSTR("Use -initWithMeasurementBlock:"));

  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFMeasurementFormatter measurementBlock](self, "measurementBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurementFormatter stringFromMeasurement:](self, "stringFromMeasurement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HFMeasurementFormatter;
    -[NSMeasurementFormatter stringForObjectValue:](&v9, sel_stringForObjectValue_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)unitDescription
{
  return 0;
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFMeasurementFormatter measurementBlock](self, "measurementBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
    {
      if (qword_1ED378DC0 != -1)
        dispatch_once(&qword_1ED378DC0, &__block_literal_global_30);
      v9 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v8, "doubleValue");
      v10 = objc_msgSend(v9, "initWithDoubleValue:unit:", _MergedGlobals_222);

      v8 = (void *)v10;
    }
    -[NSMeasurementFormatter stringFromMeasurement:](self, "stringFromMeasurement:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFMeasurementFormatter;
    -[NSMeasurementFormatter stringForObjectValue:](&v13, sel_stringForObjectValue_, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __56__HFMeasurementFormatter_stringForObjectValue_withUnit___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A50]), "initWithSymbol:", &stru_1EA741FF8);
  v1 = (void *)_MergedGlobals_222;
  _MergedGlobals_222 = v0;

}

- (id)measurementBlock
{
  return self->_measurementBlock;
}

- (void)setMeasurementBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_measurementBlock, 0);
}

@end
