@implementation HKDisplayTypeValueFormatter

- (HKDisplayTypeValueFormatter)initWithNumberFormatter:(id)a3
{
  id v5;
  HKDisplayTypeValueFormatter *v6;
  HKDisplayTypeValueFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDisplayTypeValueFormatter;
  v6 = -[HKDisplayTypeValueFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_numberFormatter, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "systemFontOfSize:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:", v11, v10, v9, v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
