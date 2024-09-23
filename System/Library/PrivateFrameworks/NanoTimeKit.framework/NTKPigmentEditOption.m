@implementation NTKPigmentEditOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveCollectionName, 0);
  objc_storeStrong((id *)&self->_effectiveOptionName, 0);
  objc_storeStrong((id *)&self->_fullname, 0);
  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_desiredPosition, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_optionName, 0);
  objc_storeStrong((id *)&self->_localizedCollectionName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (NTKPigmentEditOption)initWithDevice:(id)a3
{

  return 0;
}

+ (id)pigmentNamed:(id)a3
{
  id v3;
  NTKPigmentEditOption *v4;

  v3 = a3;
  v4 = -[NTKPigmentEditOption initWithFullname:]([NTKPigmentEditOption alloc], "initWithFullname:", v3);

  return v4;
}

- (NTKPigmentEditOption)initWithFullname:(id)a3
{
  return -[NTKPigmentEditOption initWithFullname:fraction:](self, "initWithFullname:fraction:", a3, 0.5);
}

- (NTKPigmentEditOption)initWithFullname:(id)a3 fraction:(double)a4
{
  id v5;
  id v6;
  id v7;
  NTKPigmentEditOption *v8;
  id v10;
  id v11;
  double v12;

  v12 = a4;
  v5 = a3;
  v10 = 0;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "parseFullname:collectionName:optionName:fraction:", v5, &v11, &v10, &v12);

  v6 = v11;
  v7 = v10;
  v8 = -[NTKPigmentEditOption initWithOptionName:collectionName:colorFraction:](self, "initWithOptionName:collectionName:colorFraction:", v7, v6, v12);

  return v8;
}

- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4
{
  return -[NTKPigmentEditOption initWithOptionName:collectionName:colorFraction:](self, "initWithOptionName:collectionName:colorFraction:", a3, a4, 0.5);
}

- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4 colorFraction:(double)a5
{
  id v9;
  id v10;
  void *v11;
  NTKPigmentEditOption *v12;
  void *v13;
  void *v14;
  NTKPigmentEditOption *v15;
  NTKPigmentEditOption *v16;
  uint64_t v17;
  NSBundle *mainBundle;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20.receiver = self;
    v20.super_class = (Class)NTKPigmentEditOption;
    v15 = -[NTKEditOption initWithDevice:](&v20, sel_initWithDevice_, v14);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_optionName, a3);
      objc_storeStrong((id *)&v16->_collectionName, a4);
      v16->_colorFraction = a5;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = objc_claimAutoreleasedReturnValue();
      mainBundle = v16->_mainBundle;
      v16->_mainBundle = (NSBundle *)v17;

      -[NTKPigmentEditOption loadEffectiveNames](v16, "loadEffectiveNames");
      v16->_lock._os_unfair_lock_opaque = 0;
    }
    self = v16;

    v12 = self;
  }

  return v12;
}

- (NTKPigmentEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  NTKPigmentEditOption *v8;
  id v10;
  id v11;
  double v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NTKPigmentEditOption json value must be a string - invalid value: %@"), v5);
  v12 = 0.5;
  v10 = 0;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "parseFullname:collectionName:optionName:fraction:", v5, &v11, &v10, &v12);
  v6 = v11;
  v7 = v10;
  v8 = -[NTKPigmentEditOption initWithOptionName:collectionName:colorFraction:](self, "initWithOptionName:collectionName:colorFraction:", v7, v6, v12);

  return v8;
}

- (BOOL)isVisible
{
  void *v3;

  +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isOptionVisible:", self);

  return (char)self;
}

+ (double)defaultFraction
{
  return 0.5;
}

- (BOOL)isRainbowColor
{
  void *v2;
  char v3;

  -[NTKPigmentEditOption fullname](self, "fullname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("special.rainbow"));

  return v3;
}

- (BOOL)isMultiColor
{
  void *v2;
  char v3;

  -[NTKPigmentEditOption fullname](self, "fullname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("special.multicolor"));

  return v3;
}

- (BOOL)isWhiteColor
{
  void *v2;
  char v3;

  -[NTKPigmentEditOption fullname](self, "fullname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("seasons.spring2015.white"));

  return v3;
}

- (id)fullnameIncludingFraction
{
  void *v3;
  void *v4;
  void *v5;

  if (vabdd_f64(0.5, self->_colorFraction) >= 0.00000011920929)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NTKPigmentEditOption fullname](self, "fullname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%0.2f"), v5, CFSTR(":"), *(_QWORD *)&self->_colorFraction);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKPigmentEditOption fullname](self, "fullname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_buildFullname
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  void *v15;

  if (-[NTKPigmentEditOption isMultitoneOption](self, "isMultitoneOption"))
  {
    -[NTKPigmentEditOption collectionName](self, "collectionName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_class();
    -[NTKPigmentEditOption optionName](self, "optionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multitoneColorNames:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__NTKPigmentEditOption__buildFullname__block_invoke;
    v13[3] = &unk_1E6BCD908;
    v8 = v7;
    v14 = v8;
    v15 = v3;
    v9 = v3;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
    v10 = v15;
    v11 = v8;

  }
  else
  {
    -[NTKPigmentEditOption effectiveCollectionName](self, "effectiveCollectionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentEditOption effectiveOptionName](self, "effectiveOptionName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[NTKPigmentEditOption fullnameWithCollectionName:optionName:](NTKPigmentEditOption, "fullnameWithCollectionName:optionName:", v6, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __38__NTKPigmentEditOption__buildFullname__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@ "), CFSTR("&"));
  v3 = objc_msgSend(v6, "containsString:", CFSTR("."));
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  }
  else
  {
    +[NTKPigmentEditOption fullnameWithCollectionName:optionName:](NTKPigmentEditOption, "fullnameWithCollectionName:optionName:", *(_QWORD *)(a1 + 40), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

  }
}

+ (id)multitonePigmentAtIndex:(unint64_t)a3 forColorName:(id)a4 groupName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NTKPigmentEditOption *v13;
  id v15;
  id v16;
  uint64_t v17;

  v7 = a5;
  +[NTKPigmentEditOption multitoneColorNames:](NTKPigmentEditOption, "multitoneColorNames:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2 || objc_msgSend(v8, "count") <= a3)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v17 = 0;
    v15 = 0;
    v10 = v7;
    +[NTKPigmentEditOption parseFullname:collectionName:optionName:fraction:](NTKPigmentEditOption, "parseFullname:collectionName:optionName:fraction:", v9, &v16, &v15, &v17);
    v11 = v16;

    v12 = v15;
    v13 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v12, v11);

  }
  return v13;
}

+ (void)parseFullname:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 fraction:(double *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  float v18;
  id v19;
  void (**v20)(void *, const __CFString *, id *, id *);
  _QWORD aBlock[4];
  id v22;

  v9 = a3;
  if (a6)
    *a6 = 0.5;
  v10 = v9;
  v11 = v10;
  if (objc_msgSend(v10, "containsString:", CFSTR(":")))
  {
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v15, "setLocale:", v16);

    objc_msgSend(v15, "numberFromString:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v17)
    {
      objc_msgSend(v13, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (a6)
      {
        objc_msgSend(v17, "floatValue");
        *a6 = v18;
      }
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__NTKPigmentEditOption_parseFullname_collectionName_optionName_fraction___block_invoke;
  aBlock[3] = &unk_1E6BD8E48;
  v19 = v11;
  v22 = v19;
  v20 = (void (**)(void *, const __CFString *, id *, id *))_Block_copy(aBlock);
  if (objc_msgSend(v19, "containsString:", CFSTR(":")))
  {
    v20[2](v20, CFSTR(":"), a4, a5);
  }
  else if (objc_msgSend(v19, "containsString:", CFSTR(".")))
  {
    v20[2](v20, CFSTR("."), a4, a5);
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v19);
  }

}

void __73__NTKPigmentEditOption_parseFullname_collectionName_optionName_fraction___block_invoke(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByString:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (a4)
  {
    objc_msgSend(v8, "lastObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
  {
    objc_msgSend(v8, "removeLastObject");
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "componentsJoinedByString:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

- (void)loadEffectiveNames
{
  NSString *v3;
  NSString *v4;
  NSString *effectiveOptionName;
  NSString *v6;
  NSString *effectiveCollectionName;
  NSString *v8;
  NSString *v9;
  NSString *fullname;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  -[NTKPigmentEditOption extractEffectiveCollectionName:effectiveOptionName:](self, "extractEffectiveCollectionName:effectiveOptionName:", &v12, &v11);
  v3 = (NSString *)v12;
  v4 = (NSString *)v11;
  effectiveOptionName = self->_effectiveOptionName;
  self->_effectiveOptionName = v4;
  v6 = v4;

  effectiveCollectionName = self->_effectiveCollectionName;
  self->_effectiveCollectionName = v3;
  v8 = v3;

  -[NTKPigmentEditOption _buildFullname](self, "_buildFullname");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullname = self->_fullname;
  self->_fullname = v9;

}

+ (void)parserIdentifier:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 colorFraction:(double *)a6 separator:(id)a7
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  objc_msgSend(a3, "componentsSeparatedByString:", a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = 0.5;
  v21 = v10;
  if (objc_msgSend(v10, "count") != 3)
  {
    if (objc_msgSend(v21, "count") == 2)
    {
      if (a4)
      {
        objc_msgSend(v21, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!a5)
        goto LABEL_19;
    }
    else
    {
      v19 = objc_msgSend(v21, "count");
      if (!a5 || v19 != 1)
        goto LABEL_19;
    }
    objc_msgSend(v21, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(v21, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a5)
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a6)
  {
    objc_msgSend(v21, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    *a6 = v16;
LABEL_18:

  }
LABEL_19:

}

- (void)extractEffectiveCollectionName:(id *)a3 effectiveOptionName:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  -[NTKPigmentEditOption collectionName](self, "collectionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentEditOption optionName](self, "optionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  -[NTKPigmentEditOption optionName](self, "optionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14 = v7;
  objc_msgSend(v9, "effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:", v10, &v14, &v13);
  v11 = v14;

  v12 = v13;
  if (a3)
    *a3 = objc_retainAutorelease(v11);
  if (a4)
    *a4 = objc_retainAutorelease(v12);

}

- (id)multitoneNamesWithoutCollection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NTKPigmentEditOption isMultitoneOption](self, "isMultitoneOption"))
  {
    v3 = (void *)objc_opt_class();
    -[NTKPigmentEditOption optionName](self, "optionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "multitoneColorNames:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = (void *)objc_opt_class();
          v16 = 0;
          objc_msgSend(v13, "effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:", v12, 0, &v16);
          v14 = v16;
          if (v14)
          {
            if (objc_msgSend(v6, "length"))
              objc_msgSend(v6, "appendFormat:", CFSTR(" %@ "), CFSTR("&"));
            objc_msgSend(v6, "appendString:", v14);
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (void)effectiveNamesFromName:(id)a3 effectiveCollectionName:(id *)a4 effectiveOptionName:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = a3;
  if (objc_msgSend(a1, "hasInlineCollectionInOptionName:", v8)
    && (objc_msgSend(a1, "isMultitoneOptionWithOptionName:", v8) & 1) == 0)
  {
    v11 = v8;
    v12 = 0;
    +[NTKPigmentEditOption parseFullname:collectionName:optionName:fraction:](NTKPigmentEditOption, "parseFullname:collectionName:optionName:fraction:", v8, &v12, &v11, 0);
    v9 = v12;
    v10 = v11;

    if (a4 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
    }
  }
  else
  {
    v9 = 0;
    v10 = v8;
  }
  if (a5 && v10)
    *a5 = objc_retainAutorelease(v10);

}

+ (BOOL)isMultitoneOptionWithOptionName:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("&"));
}

+ (id)fullnameWithCollectionName:(id)a3 optionName:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, CFSTR("."), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)JSONObjectRepresentationForFace:(id)a3
{
  void *v4;

  -[NTKPigmentEditOption legacyJSONRepresentationForFace:](self, "legacyJSONRepresentationForFace:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[NTKPigmentEditOption json](self, "json");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)json
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[NTKPigmentEditOption optionName](self, "optionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR(".")) & 1) != 0)
  {

  }
  else
  {
    v4 = -[NTKPigmentEditOption isMultitoneOption](self, "isMultitoneOption");

    if (!v4)
    {
      -[NTKPigmentEditOption fullnameIncludingFraction](self, "fullnameIncludingFraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  -[NTKPigmentEditOption identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = v5;
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (BOOL)isValidOption
{
  return 1;
}

- (NTKPigmentEditOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  NTKPigmentEditOption *v8;
  uint64_t v9;
  NSString *alternativeLocalizedStringTableName;
  uint64_t v11;
  NSString *bundlePrincipalClassName;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("colorFraction"));
  v8 = -[NTKPigmentEditOption initWithOptionName:collectionName:colorFraction:](self, "initWithOptionName:collectionName:colorFraction:", v5, v6, v7);
  if (v8)
  {
    v8->_isAddable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAddable"));
    v8->_supportsSlider = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSlider"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternativeLocalizedStringTableName"));
    v9 = objc_claimAutoreleasedReturnValue();
    alternativeLocalizedStringTableName = v8->_alternativeLocalizedStringTableName;
    v8->_alternativeLocalizedStringTableName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePrincipalClassName"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundlePrincipalClassName = v8->_bundlePrincipalClassName;
    v8->_bundlePrincipalClassName = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *optionName;
  double colorFraction;
  id v6;

  optionName = self->_optionName;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", optionName, CFSTR("optionName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_collectionName, CFSTR("collectionName"));
  colorFraction = self->_colorFraction;
  *(float *)&colorFraction = colorFraction;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("colorFraction"), colorFraction);
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAddable, CFSTR("isAddable"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsSlider, CFSTR("supportsSlider"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_alternativeLocalizedStringTableName, CFSTR("alternativeLocalizedStringTableName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundlePrincipalClassName, CFSTR("bundlePrincipalClassName"));

}

- (NTKPigmentEditOption)initWithProtoBuffer:(id)a3
{
  id v4;
  NTKPigmentEditOption *v5;
  void *v6;
  void *v7;
  NTKPigmentEditOption *v8;
  float v9;
  uint64_t v10;
  NSString *alternativeLocalizedStringTableName;
  uint64_t v12;
  NSString *bundlePrincipalClassName;
  NTKPigmentEditOption *v14;

  v4 = a3;
  if (v4)
  {
    v5 = [NTKPigmentEditOption alloc];
    objc_msgSend(v4, "optionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTKPigmentEditOption initWithOptionName:collectionName:](v5, "initWithOptionName:collectionName:", v6, v7);

    if (v8)
    {
      objc_msgSend(v4, "colorFraction");
      v8->_colorFraction = v9;
      v8->_isAddable = objc_msgSend(v4, "isAddable");
      v8->_supportsSlider = objc_msgSend(v4, "supportsSlider");
      objc_msgSend(v4, "alternativeLocalizedStringTableName");
      v10 = objc_claimAutoreleasedReturnValue();
      alternativeLocalizedStringTableName = v8->_alternativeLocalizedStringTableName;
      v8->_alternativeLocalizedStringTableName = (NSString *)v10;

      objc_msgSend(v4, "bundlePrincipalClassName");
      v12 = objc_claimAutoreleasedReturnValue();
      bundlePrincipalClassName = v8->_bundlePrincipalClassName;
      v8->_bundlePrincipalClassName = (NSString *)v12;

      -[NTKPigmentEditOption setFromStore:](v8, "setFromStore:", objc_msgSend(v4, "fromStore"));
      v14 = v8;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)protoBuffer
{
  NTKProtoPigment *v3;
  double colorFraction;

  v3 = objc_alloc_init(NTKProtoPigment);
  -[NTKProtoPigment setOptionName:](v3, "setOptionName:", self->_optionName);
  -[NTKProtoPigment setCollectionName:](v3, "setCollectionName:", self->_collectionName);
  colorFraction = self->_colorFraction;
  *(float *)&colorFraction = colorFraction;
  -[NTKProtoPigment setColorFraction:](v3, "setColorFraction:", colorFraction);
  -[NTKProtoPigment setIsAddable:](v3, "setIsAddable:", self->_isAddable);
  -[NTKProtoPigment setSupportsSlider:](v3, "setSupportsSlider:", self->_supportsSlider);
  -[NTKProtoPigment setBundlePrincipalClassName:](v3, "setBundlePrincipalClassName:", self->_bundlePrincipalClassName);
  -[NTKProtoPigment setAlternativeLocalizedStringTableName:](v3, "setAlternativeLocalizedStringTableName:", self->_alternativeLocalizedStringTableName);
  -[NTKProtoPigment setFromStore:](v3, "setFromStore:", self->_fromStore);
  return v3;
}

- (id)localizationTableNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentEditOption alternativeLocalizedStringTableName](self, "alternativeLocalizedStringTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[NTKPigmentEditOption alternativeLocalizedStringTableName](self, "alternativeLocalizedStringTableName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("FaceColors"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v3, "addObject:", CFSTR("FaceColors"));
  return v3;
}

- (id)localizedName
{
  NSString *localizedName;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  localizedName = self->_localizedName;
  if (!localizedName)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NTKPigmentEditOption localizationTableNames](self, "localizationTableNames", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[NTKPigmentEditOption identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPigmentEditOption localizedNameForKey:table:](self, "localizedNameForKey:table:", v10, v9);
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = self->_localizedName;
        self->_localizedName = v11;

        if (self->_localizedName)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    localizedName = self->_localizedName;
    if (!localizedName)
    {
      -[NTKPigmentEditOption fullname](self, "fullname");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentEditOption localizedNameForKey:](self, "localizedNameForKey:", v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_localizedName;
      self->_localizedName = v14;

      localizedName = self->_localizedName;
    }
  }
  return localizedName;
}

- (id)localizedNameForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSBundle localizedStringForKey:value:table:](self->_mainBundle, "localizedStringForKey:value:table:", CFSTR("MULTITONE_NAMES_SEPARATOR"), &stru_1E6BDC918, CFSTR("FaceColors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NTKPigmentEditOption localizationTableNames](self, "localizationTableNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NTKPigmentEditOption localizedNameForKey:fromTable:separatorString:](self, "localizedNameForKey:fromTable:separatorString:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v5);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (id)v11;

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  v12 = v4;
LABEL_11:

  return v12;
}

- (id)localizedCollectionName
{
  NSString *localizedCollectionName;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  localizedCollectionName = self->_localizedCollectionName;
  if (!localizedCollectionName)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NTKPigmentEditOption localizationTableNames](self, "localizationTableNames", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
          -[NTKPigmentEditOption collectionName](self, "collectionName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKPigmentEditOption localizedNameForKey:table:](self, "localizedNameForKey:table:", v10, v9);
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_12;
          -[NTKPigmentEditOption collectionName](self, "collectionName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[NTKPigmentEditOption localizedNameForKey:table:](self, "localizedNameForKey:table:", v14, v9);
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
LABEL_12:

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[NTKPigmentEditOption collectionName](self, "collectionName");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = self->_localizedCollectionName;
    self->_localizedCollectionName = v11;

    localizedCollectionName = self->_localizedCollectionName;
  }
  return localizedCollectionName;
}

- (id)localizedNameForKey:(id)a3 fromTable:(id)a4 separatorString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NTKPigmentEditOption localizedNameForKey:table:](self, "localizedNameForKey:table:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isMultitoneOptionWithOptionName:", v8) & 1) != 0
      || (v25 = 0,
          +[NTKPigmentEditOption parseFullname:collectionName:optionName:fraction:](NTKPigmentEditOption, "parseFullname:collectionName:optionName:fraction:", v8, 0, &v25, 0), v13 = v25, -[NTKPigmentEditOption localizedNameForKey:table:](self, "localizedNameForKey:table:", v13, v9), v11 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v11))
    {
      if (objc_msgSend((id)objc_opt_class(), "isMultitoneOptionWithOptionName:", v8))
      {
        objc_msgSend((id)objc_opt_class(), "multitoneColorNames:", v8);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v15)
        {
          v16 = v15;
          v11 = 0;
          v17 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              -[NTKPigmentEditOption localizedNameForKey:](self, "localizedNameForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
              v19 = objc_claimAutoreleasedReturnValue();
              if (!v19)
              {

                goto LABEL_20;
              }
              v20 = (void *)v19;
              if (v11)
              {
                objc_msgSend(v11, "appendString:", v10);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v11, "appendString:", v20);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
            if (v16)
              continue;
            break;
          }
        }
        else
        {
LABEL_20:
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

- (BOOL)isMultitoneOption
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[NTKPigmentEditOption optionName](self, "optionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isMultitoneOptionWithOptionName:", v4);

  return (char)v3;
}

+ (BOOL)hasInlineCollectionInOptionName:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("."));
}

+ (id)multitoneColorNames:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, v5);

      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }
  return v4;
}

- (id)localizedNameForKey:(id)a3 table:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;
  if (self->_mainBundle)
    objc_msgSend(v8, "addObject:");
  -[NTKPigmentEditOption sourceBundle](self, "sourceBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NTKPigmentEditOption sourceBundle](self, "sourceBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "localizedStringForKey:value:table:", v6, 0, v7, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v6))
        {

        }
        else if (v17)
        {
          goto LABEL_16;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (NSBundle)sourceBundle
{
  NTKPigmentEditOption *v2;
  NSBundle *sourceBundle;
  uint64_t v4;
  NSBundle *v5;
  NSBundle *v6;

  v2 = self;
  objc_sync_enter(v2);
  sourceBundle = v2->_sourceBundle;
  if (!sourceBundle)
  {
    if (v2->_loadedBundleFromClass || !v2->_bundlePrincipalClassName)
    {
      sourceBundle = 0;
    }
    else
    {
      -[NTKPigmentEditOption _resolveBundleWithBundlePrincipalClassName:](v2, "_resolveBundleWithBundlePrincipalClassName:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v2->_sourceBundle;
      v2->_sourceBundle = (NSBundle *)v4;

      v2->_loadedBundleFromClass = 1;
      sourceBundle = v2->_sourceBundle;
    }
  }
  v6 = sourceBundle;
  objc_sync_exit(v2);

  return v6;
}

- (id)_resolveBundleWithBundlePrincipalClassName:(id)a3
{
  void *v3;

  v3 = NSClassFromString((NSString *)a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isEquivalentToOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKPigmentEditOption effectiveCollectionName](self, "effectiveCollectionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveCollectionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[NTKPigmentEditOption effectiveOptionName](self, "effectiveOptionName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectiveOptionName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualIgnoringFraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKPigmentEditOption collectionName](self, "collectionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[NTKPigmentEditOption optionName](self, "optionName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "optionName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKPigmentEditOption identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NTKPigmentEditOption identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptionName:collectionName:colorFraction:", self->_optionName, self->_collectionName, self->_colorFraction);
  *(_BYTE *)(v4 + 32) = self->_isSensitiveUI;
  *(_BYTE *)(v4 + 33) = self->_isAddable;
  *(_BYTE *)(v4 + 34) = self->_supportsSlider;
  objc_storeStrong((id *)(v4 + 88), self->_bundlePrincipalClassName);
  objc_storeStrong((id *)(v4 + 104), self->_alternativeLocalizedStringTableName);
  objc_storeStrong((id *)(v4 + 80), self->_mainBundle);
  *(_BYTE *)(v4 + 36) = self->_sortedByHue;
  objc_storeStrong((id *)(v4 + 72), self->_desiredPosition);
  objc_msgSend((id)v4, "setFromStore:", -[NTKPigmentEditOption isFromStore](self, "isFromStore"));
  return (id)v4;
}

- (id)copyWithColorFraction:(double)a3
{
  id result;

  result = (id)-[NTKPigmentEditOption copy](self, "copy");
  *((double *)result + 8) = a3;
  return result;
}

- (id)copyWithCollectionOverride:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)-[NTKPigmentEditOption copy](self, "copy");
  v6 = objc_msgSend(v5, "isMultitoneOption");
  v7 = (void *)objc_opt_class();
  if ((v6 & 1) != 0)
  {
    v26 = v5;
    objc_msgSend(v5, "optionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multitoneColorNames:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)MEMORY[0x1E0CB3500];
          v17 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v16, "whitespaceCharacterSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "length"))
            objc_msgSend(v10, "appendFormat:", CFSTR(" %@ "), CFSTR("&"));
          if (objc_msgSend((id)objc_opt_class(), "hasInlineCollectionInOptionName:", v19))
          {
            objc_msgSend(v10, "appendString:", v19);
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "fullnameWithCollectionName:optionName:", v4, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v20);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v5 = v26;
    v21 = (void *)v26[6];
    v26[6] = v10;

  }
  else
  {
    -[NTKPigmentEditOption optionName](self, "optionName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullnameWithCollectionName:optionName:", v4, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v5[6];
    v5[6] = v23;

  }
  objc_msgSend(v5, "loadEffectiveNames");

  return v5;
}

+ (id)duotoneNameWithName:(id)a3 otherName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), a3, CFSTR("&"), a4);
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (NSString)optionName
{
  return self->_optionName;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (BOOL)isSensitiveUI
{
  return self->_isSensitiveUI;
}

- (void)setIsSensitiveUI:(BOOL)a3
{
  self->_isSensitiveUI = a3;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (void)setIsAddable:(BOOL)a3
{
  self->_isAddable = a3;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (void)setSupportsSlider:(BOOL)a3
{
  self->_supportsSlider = a3;
}

- (double)colorFraction
{
  return self->_colorFraction;
}

- (BOOL)isFromStore
{
  return self->_fromStore;
}

- (void)setFromStore:(BOOL)a3
{
  self->_fromStore = a3;
}

- (BOOL)sortedByHue
{
  return self->_sortedByHue;
}

- (void)setSortedByHue:(BOOL)a3
{
  self->_sortedByHue = a3;
}

- (NSNumber)desiredPosition
{
  return self->_desiredPosition;
}

- (void)setDesiredPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (NSString)bundlePrincipalClassName
{
  return self->_bundlePrincipalClassName;
}

- (void)setBundlePrincipalClassName:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, a3);
}

- (void)setSourceBundle:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundle, a3);
}

- (BOOL)loadedBundleFromClass
{
  return self->_loadedBundleFromClass;
}

- (void)setLoadedBundleFromClass:(BOOL)a3
{
  self->_loadedBundleFromClass = a3;
}

- (NSString)alternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName;
}

- (void)setAlternativeLocalizedStringTableName:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, a3);
}

- (NSString)fullname
{
  return self->_fullname;
}

- (void)setFullname:(id)a3
{
  objc_storeStrong((id *)&self->_fullname, a3);
}

- (NSString)effectiveOptionName
{
  return self->_effectiveOptionName;
}

- (void)setEffectiveOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveOptionName, a3);
}

- (NSString)effectiveCollectionName
{
  return self->_effectiveCollectionName;
}

- (void)setEffectiveCollectionName:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveCollectionName, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (id)legacyJSONRepresentationForFace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "requiresPigmentEditOption") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_msgSend(v4, "_optionClassForCustomEditMode:", 10), "legacyOptionWithPigmentEditOption:forDevice:", self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v8, "JSONObjectRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
