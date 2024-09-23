@implementation HFColorPalette

+ (HFColorPaletteColor)warmWhiteColor
{
  HFRGBColor *v2;
  double v3;
  double v4;
  double v5;
  HFRGBColor *v6;
  HFTemperatureColor *v7;
  double v8;
  HFTemperatureColor *v9;
  HFColorCollection *v10;
  void *v11;
  HFColorCollection *v12;
  HFColorPaletteColor *v13;

  v2 = [HFRGBColor alloc];
  LODWORD(v3) = 1063295210;
  LODWORD(v4) = 1061494456;
  LODWORD(v5) = 1.0;
  v6 = -[HFRGBColor initWithRed:green:blue:](v2, "initWithRed:green:blue:", v5, v3, v4);
  v7 = [HFTemperatureColor alloc];
  LODWORD(v8) = 1136066560;
  v9 = -[HFTemperatureColor initWithTemperatureInMired:](v7, "initWithTemperatureInMired:", v8);
  v10 = [HFColorCollection alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v6, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFColorCollection initWithPrimitiveColors:](v10, "initWithPrimitiveColors:", v11);

  v13 = -[HFColorPaletteColor initWithColorCollection:]([HFColorPaletteColor alloc], "initWithColorCollection:", v12);
  return v13;
}

+ (id)_defaultRGBColors
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__HFColorPalette__defaultRGBColors__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __35__HFColorPalette__defaultRGBColors__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __35__HFColorPalette__defaultRGBColors__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HFColorPalette__defaultRGBColors__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_MergedGlobals_284 != -1)
    dispatch_once(&_MergedGlobals_284, block);
  return (id)qword_1ED379848;
}

void __35__HFColorPalette__defaultRGBColors__block_invoke_2(uint64_t a1)
{
  HFColorPaletteColor *v2;
  double v3;
  double v4;
  double v5;
  HFColorPaletteColor *v6;
  HFColorPaletteColor *v7;
  double v8;
  double v9;
  double v10;
  HFColorPaletteColor *v11;
  void *v12;
  HFColorPaletteColor *v13;
  double v14;
  double v15;
  double v16;
  HFColorPaletteColor *v17;
  HFColorPaletteColor *v18;
  double v19;
  double v20;
  double v21;
  HFColorPaletteColor *v22;
  HFColorPaletteColor *v23;
  double v24;
  double v25;
  double v26;
  HFColorPaletteColor *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[7];

  v30[6] = *MEMORY[0x1E0C80C00];
  v2 = [HFColorPaletteColor alloc];
  LODWORD(v3) = 1061966242;
  LODWORD(v4) = 1062994089;
  LODWORD(v5) = 1.0;
  v6 = -[HFColorPaletteColor initWithRed:green:blue:](v2, "initWithRed:green:blue:", v3, v4, v5);
  v30[0] = v6;
  v7 = [HFColorPaletteColor alloc];
  LODWORD(v8) = 1064668145;
  LODWORD(v9) = 1064514355;
  LODWORD(v10) = 1.0;
  v11 = -[HFColorPaletteColor initWithRed:green:blue:](v7, "initWithRed:green:blue:", v8, v9, v10);
  v30[1] = v11;
  objc_msgSend(*(id *)(a1 + 32), "warmWhiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v12;
  v13 = [HFColorPaletteColor alloc];
  LODWORD(v14) = 1061300772;
  LODWORD(v15) = 1057278939;
  LODWORD(v16) = 1.0;
  v17 = -[HFColorPaletteColor initWithRed:green:blue:](v13, "initWithRed:green:blue:", v16, v14, v15);
  v30[3] = v17;
  v18 = [HFColorPaletteColor alloc];
  LODWORD(v19) = 1059695018;
  LODWORD(v20) = 1051372202;
  LODWORD(v21) = 1.0;
  v22 = -[HFColorPaletteColor initWithRed:green:blue:](v18, "initWithRed:green:blue:", v21, v19, v20);
  v30[4] = v22;
  v23 = [HFColorPaletteColor alloc];
  LODWORD(v24) = 1056629064;
  LODWORD(v25) = 1050924810;
  LODWORD(v26) = 1.0;
  v27 = -[HFColorPaletteColor initWithRed:green:blue:](v23, "initWithRed:green:blue:", v24, v25, v26);
  v30[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)qword_1ED379848;
  qword_1ED379848 = v28;

}

+ (id)_defaultTemperatureColors
{
  if (qword_1ED379850 != -1)
    dispatch_once(&qword_1ED379850, &__block_literal_global_8_7);
  return (id)qword_1ED379858;
}

void __43__HFColorPalette__defaultTemperatureColors__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(&unk_1EA7CDE10, "na_map:", &__block_literal_global_19_5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379858;
  qword_1ED379858 = v0;

}

HFColorPaletteColor *__43__HFColorPalette__defaultTemperatureColors__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  HFTemperatureColor *v3;
  int v4;
  int v5;
  double v6;
  HFTemperatureColor *v7;
  HFColorCollection *v8;
  HFColorPaletteColor *v9;

  v2 = a2;
  v3 = [HFTemperatureColor alloc];
  objc_msgSend(v2, "floatValue");
  v5 = v4;

  LODWORD(v6) = v5;
  v7 = -[HFTemperatureColor initWithTemperatureInKelvin:](v3, "initWithTemperatureInKelvin:", v6);
  v8 = -[HFColorCollection initWithPrimitiveColor:]([HFColorCollection alloc], "initWithPrimitiveColor:", v7);
  v9 = -[HFColorPaletteColor initWithColorCollection:]([HFColorPaletteColor alloc], "initWithColorCollection:", v8);

  return v9;
}

+ (id)_defaultColorsOfType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id result;

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      objc_msgSend(a1, "_defaultRGBColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      objc_msgSend(a1, "_defaultTemperatureColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      result = v5;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)defaultColorPaletteOfType:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_defaultColorsOfType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithColors:type:", v6, a3);

  return v7;
}

- (HFColorPalette)initWithColors:(id)a3 type:(unint64_t)a4
{
  id v7;
  HFColorPalette *v8;
  HFColorPalette *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFColorPalette;
  v8 = -[HFColorPalette init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_paletteType = a4;
    objc_storeStrong((id *)&v8->_rawColors, a3);
  }

  return v9;
}

- (HFColorPalette)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithColors_type_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorPalette.m"), 102, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFColorPalette init]",
    v5);

  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HFColorPalette colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFColorPalette *v4;
  void *v5;
  HFColorPalette *v6;

  v4 = [HFColorPalette alloc];
  -[HFColorPalette rawColors](self, "rawColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFColorPalette initWithColors:type:](v4, "initWithColors:type:", v5, -[HFColorPalette paletteType](self, "paletteType"));

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableColorPalette *v4;
  void *v5;
  HFMutableColorPalette *v6;

  v4 = [HFMutableColorPalette alloc];
  -[HFColorPalette rawColors](self, "rawColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFColorPalette initWithColors:type:](v4, "initWithColors:type:", v5, -[HFColorPalette paletteType](self, "paletteType"));

  return v6;
}

- (HFColorPalette)initWithSerializedRepresentation:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  HFColorPalette *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultColorsOfType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke;
    v12[3] = &unk_1EA738A70;
    v14 = v15;
    v8 = v7;
    v13 = v8;
    objc_msgSend(v6, "na_map:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HFColorPalette initWithColors:type:](self, "initWithColors:type:", v9, a4);

    _Block_object_dispose(v15, 8);
    v10 = self;
  }
  else
  {
    NSLog(CFSTR("Invalid representation %@"), v6);
    v10 = 0;
  }

  return v10;
}

HFColorPaletteColor *__56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  HFColorPaletteColor *v5;
  unint64_t v6;
  _QWORD aBlock[5];

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke_2;
  aBlock[3] = &unk_1EA738A48;
  aBlock[4] = *(_QWORD *)(a1 + 40);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = -[HFColorPaletteColor initWithDictionaryRepresentation:]([HFColorPaletteColor alloc], "initWithDictionaryRepresentation:", v3)) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v5 = 0;
      if (!v4)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v5 = (HFColorPaletteColor *)objc_claimAutoreleasedReturnValue();
  }
  if (v4)
LABEL_6:
    v4[2](v4);
LABEL_7:

  return v5;
}

uint64_t __56__HFColorPalette_initWithSerializedRepresentation_type___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFColorPalette rawColors](self, "rawColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HFColorPalette_serializedRepresentation__block_invoke;
  v6[3] = &unk_1EA738A98;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__HFColorPalette_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "dictionaryRepresentationWithPreferredPaletteType:", objc_msgSend(v2, "paletteType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFColorPalette)initWithDawnColorPickerFavorites:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  _UNKNOWN **v8;
  HFColorPaletteColor *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HFTemperatureColor *v16;
  HFTemperatureColor *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  HFRGBColor *v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  HFRGBColor *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  HFColorPalette *v52;
  NSObject *v54;
  id v55;
  HFColorPalette *v56;
  unint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    HFLogForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v6;
      _os_log_error_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_ERROR, "Invalid color picker favorites %@", buf, 0xCu);
    }
    v52 = 0;
  }
  else
  {
    v56 = self;
    objc_msgSend((id)objc_opt_class(), "_defaultColorsOfType:", a4);
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = a4;
    v8 = &off_1EA721000;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v9 = -[HFColorPaletteColor initWithNaturalLightColor]([HFColorPaletteColor alloc], "initWithNaturalLightColor");
      objc_msgSend(v7, "addObject:", v9);

    }
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v55 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v11)
    {
      v12 = v11;
      v60 = *(_QWORD *)v66;
      v58 = v10;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v66 != v60)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v13);
        if ((unint64_t)objc_msgSend(v7, "count") > 5)
          goto LABEL_30;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("temperature"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          break;
        if ((v57 & 0xFFFFFFFFFFFFFFFDLL) != 1)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("saturation"));
          v19 = objc_claimAutoreleasedReturnValue();
          if (v18)
            v20 = v19 == 0;
          else
            v20 = 1;
          v59 = (void *)v19;
          if (v20)
          {
            v17 = 0;
          }
          else
          {
            v21 = (void *)v19;
            v22 = [HFRGBColor alloc];
            objc_msgSend(v18, "floatValue");
            v24 = v23;
            objc_msgSend(v21, "floatValue");
            LODWORD(v26) = v25;
            LODWORD(v27) = 1.0;
            LODWORD(v28) = v24;
            v29 = -[HFRGBColor initWithHue:saturation:brightness:](v22, "initWithHue:saturation:brightness:", v28, v26, v27);
            v17 = (HFTemperatureColor *)objc_msgSend(objc_alloc((Class)v8[432]), "initWithColorPrimitive:", v29);

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("r"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("g"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("b"));
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v30 && v31 && v32)
          {
            v34 = objc_alloc((Class)v8[432]);
            objc_msgSend(v30, "floatValue");
            v36 = v35;
            objc_msgSend(v31, "floatValue");
            v38 = v37;
            objc_msgSend(v33, "floatValue");
            LODWORD(v40) = v39;
            LODWORD(v41) = v36;
            LODWORD(v42) = v38;
            v43 = objc_msgSend(v34, "initWithRed:green:blue:", v41, v42, v40);

            v17 = (HFTemperatureColor *)v43;
          }
          if (v17)
            objc_msgSend(v7, "addObject:", v17);

          v8 = &off_1EA721000;
          v10 = v58;
          goto LABEL_27;
        }
LABEL_28:

        if (v12 == ++v13)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
          if (v12)
            goto LABEL_7;
          goto LABEL_30;
        }
      }
      v16 = [HFTemperatureColor alloc];
      objc_msgSend(v15, "floatValue");
      v17 = -[HFTemperatureColor initWithTemperatureInMired:](v16, "initWithTemperatureInMired:");
      v18 = (void *)objc_msgSend(objc_alloc((Class)v8[432]), "initWithColorPrimitive:", v17);
      objc_msgSend(v7, "addObject:", v18);
LABEL_27:

      goto LABEL_28;
    }
LABEL_30:

    v44 = v54;
    if ((unint64_t)objc_msgSend(v7, "count") <= 5)
    {
      v45 = objc_msgSend(v7, "count");
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v46 = v54;
      v47 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v47)
      {
        v48 = v47;
        v49 = 6 - v45;
        v50 = *(_QWORD *)v62;
LABEL_33:
        v51 = 0;
        while (1)
        {
          if (*(_QWORD *)v62 != v50)
            objc_enumerationMutation(v46);
          if (v49 == v51)
            break;
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v51++));
          if (v48 == v51)
          {
            v48 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            v49 -= v51;
            if (v48)
              goto LABEL_33;
            break;
          }
        }
      }

    }
    self = -[HFColorPalette initWithColors:type:](v56, "initWithColors:type:", v7, v57);

    v52 = self;
    v6 = v55;
  }

  return v52;
}

- (BOOL)_isNaturalLightPalette
{
  return -[HFColorPalette paletteType](self, "paletteType") == 2
      || -[HFColorPalette paletteType](self, "paletteType") == 3;
}

- (NSArray)colors
{
  void *v3;
  void *v4;
  HFColorPaletteColor *v5;

  -[HFColorPalette rawColors](self, "rawColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HFColorPalette _isNaturalLightPalette](self, "_isNaturalLightPalette"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    v5 = -[HFColorPaletteColor initWithNaturalLightColor]([HFColorPaletteColor alloc], "initWithNaturalLightColor");
    objc_msgSend(v4, "replaceObjectAtIndex:withObject:", 0, v5);

  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "copy");
  }

  return (NSArray *)v4;
}

- (id)colorPaletteByAdjustingForColorProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFColorPalette colors](self, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HFColorPalette_colorPaletteByAdjustingForColorProfile___block_invoke;
  v10[3] = &unk_1EA738AC0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColors:type:", v7, -[HFColorPalette paletteType](self, "paletteType"));
  return v8;
}

uint64_t __57__HFColorPalette_colorPaletteByAdjustingForColorProfile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorByAdjustingToColorProfile:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFColorPalette colors](self, "colors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HFColorPalette *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HFColorPalette *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFColorPalette colors](self, "colors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFColorPalette colors](v4, "colors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)paletteType
{
  return self->_paletteType;
}

- (NSArray)rawColors
{
  return self->_rawColors;
}

- (void)setRawColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawColors, 0);
}

@end
