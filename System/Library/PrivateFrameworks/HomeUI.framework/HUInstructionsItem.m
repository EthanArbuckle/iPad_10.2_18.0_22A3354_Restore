@implementation HUInstructionsItem

- (HUInstructionsItem)initWithStyle:(unint64_t)a3 title:(id)a4 description:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HUInstructionsItem *v14;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v17 = CFSTR("instructionsStyle");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend(v9, "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30D18]);
  if (v8)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30BF8]);
  v16.receiver = self;
  v16.super_class = (Class)HUInstructionsItem;
  v14 = -[HFStaticItem initWithResults:](&v16, sel_initWithResults_, v13);

  return v14;
}

@end
