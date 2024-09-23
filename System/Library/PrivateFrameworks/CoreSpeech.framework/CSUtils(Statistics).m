@implementation CSUtils(Statistics)

+ (id)distributionDictionary:()Statistics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  _QWORD v33[7];
  _QWORD v34[7];
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v33[0] = CFSTR("Max");
    v33[1] = CFSTR("Min");
    v34[0] = &unk_1E7C634B8;
    v34[1] = &unk_1E7C634B8;
    v33[2] = CFSTR("P95");
    v33[3] = CFSTR("Median");
    v34[2] = &unk_1E7C634B8;
    v34[3] = &unk_1E7C634B8;
    v33[4] = CFSTR("Avg");
    v33[5] = CFSTR("Std");
    v34[4] = &unk_1E7C634B8;
    v34[5] = &unk_1E7C634B8;
    v33[6] = CFSTR("Num");
    v34[6] = &unk_1E7C634B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "count");
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("Num"));

      v9 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "expressionForFunction:arguments:", CFSTR("average:"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "expressionValueWithObject:context:", 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("Avg"));

      v14 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expressionForFunction:arguments:", CFSTR("stddev:"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "expressionValueWithObject:context:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("Std"));

      objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v7 >> 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", (v7 >> 1) - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        v21 = (v21 + v24) * 0.5;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("Median"));

      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("Min"));

      objc_msgSend(v3, "objectAtIndexedSubscript:", v7 - 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("Max"));

      objc_msgSend(v3, "objectAtIndexedSubscript:", vcvtmd_u64_f64((double)v7 * 0.95));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("P95"));

      v7 = v6;
    }

  }
  else
  {
    v29 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "+[CSUtils(Statistics) distributionDictionary:]";
      _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s input dictionary is nil", buf, 0xCu);
    }
    v7 = 0;
  }

  return (id)v7;
}

@end
