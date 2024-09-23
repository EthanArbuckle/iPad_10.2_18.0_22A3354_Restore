@implementation NSCoder(MIORangeExtensions)

- (void)encodeMIORange:()MIORangeExtensions forKey:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v12 = objc_alloc_init(v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("lowerBound"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("upperBound"));

  objc_msgSend(a1, "encodeObject:forKey:", v12, v9);
}

- (uint64_t)decodeMIORangeForKey:()MIORangeExtensions
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lowerBound"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("upperBound"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "integerValue");
  objc_msgSend(v11, "integerValue");

  return v12;
}

@end
