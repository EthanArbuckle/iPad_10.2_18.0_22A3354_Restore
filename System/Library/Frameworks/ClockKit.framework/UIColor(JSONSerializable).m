@implementation UIColor(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  uint64_t v15;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("red"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("green"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("alpha"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("red"), v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("green"), v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("blue"), v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("alpha"), v7);
  objc_msgSend(v4, "floatValue");
  v9 = v8;
  objc_msgSend(v5, "floatValue");
  v11 = v10;
  objc_msgSend(v6, "floatValue");
  v13 = v12;
  objc_msgSend(v7, "floatValue");
  v15 = objc_msgSend(a1, "initWithRed:green:blue:alpha:", v9, v11, v13, v14);

  return v15;
}

- (id)JSONObjectRepresentation
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);
  v11[0] = CFSTR("red");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v1;
  v11[1] = CFSTR("green");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v2;
  v11[2] = CFSTR("blue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v3;
  v11[3] = CFSTR("alpha");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
