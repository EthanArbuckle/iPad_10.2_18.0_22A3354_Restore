@implementation NSDate(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  double v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timeIntervalSince1970");
  v2 = (uint64_t)((v1 - floor(v1)) * 1000000000.0);
  v7[0] = CFSTR("seconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", vcvtmd_s64_f64(v1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("nanos");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("seconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nanos"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    v15 = (double)v12;
    if (v14 >= 1)
      v15 = (double)v14 / 1000000000.0 + v15;
    objc_msgSend(a1, "dateWithTimeIntervalSince1970:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
