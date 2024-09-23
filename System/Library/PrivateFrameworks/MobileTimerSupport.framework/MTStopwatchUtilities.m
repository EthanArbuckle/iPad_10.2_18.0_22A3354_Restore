@implementation MTStopwatchUtilities

+ (id)encodedDictionaryForStopwatches:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("MTStopwatches"));

  objc_msgSend(v4, "encodedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeStopwatchesFromDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4FA90]), "initWithEncodedDictionary:", v7);
    objc_msgSend(v8, "decodeObjectForKey:", CFSTR("MTStopwatches"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MTLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = a1;
      _os_log_impl(&dword_1B8D7F000, v10, OS_LOG_TYPE_INFO, "%{public}@ decoding defaults could not generate dictionary", (uint8_t *)&v12, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (double)_timeAdjustedFor30fpsDisplay:(double)a3
{
  double v3;
  double v4;
  int v5;
  uint32_t v6;
  float v7;

  v3 = a3;
  v4 = a3 * 1000.0;
  if (v4 <= 1.84467441e19)
  {
    v5 = _timeAdjustedFor30fpsDisplay__leastSignificantDigits[(121 * ((unint64_t)v4 % 0x64)) >> 12];
    v6 = arc4random_uniform(3u);
    v7 = v3 * 10.0;
    return (double)((100 * vcvtms_u32_f32(v7) + (int)(10 * (v6 + v5))) | 1) / 1000.0;
  }
  return v3;
}

@end
