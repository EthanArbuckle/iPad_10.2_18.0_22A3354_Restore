@implementation NTKComplicationPlaceholderController

+ (id)templateForFamily:(int64_t)a3 complication:(id)a4 variant:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;

  v7 = (void *)MEMORY[0x1E0C944D8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "fullColorImageProviderWithImageViewClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("NTKComplicationPlaceholderComplicationVariantKey"));

  objc_msgSend(v9, "appIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("NTKComplicationPlaceholderAppIdentifierKey"));
  objc_msgSend(v10, "setMetadata:", v11);
  switch(a3)
  {
    case 8:
      v13 = (id *)0x1E0C942C0;
      break;
    case 11:
      v13 = (id *)0x1E0C94398;
      break;
    case 10:
      v13 = (id *)0x1E0C94260;
      break;
    default:
      v14 = 0;
      goto LABEL_11;
  }
  objc_msgSend(*v13, "templateWithImageProvider:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

@end
