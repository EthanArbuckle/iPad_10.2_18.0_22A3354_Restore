@implementation PKToolConfiguration

+ (id)_configurationForMonoline
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.ink.monoline"));
}

+ (id)_configurationForFountainPen
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.ink.fountainpen"));
}

+ (id)_configurationForWatercolor
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.ink.watercolor"));
}

- (PKToolConfiguration)initWithLocalizedName:(id)a3 baseImage:(id)a4 shadowPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKToolConfiguration;
  v11 = -[PKToolConfiguration init](&v24, sel_init);
  if (v11)
  {
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          v12 = objc_msgSend(v8, "copy");
          v13 = (void *)*((_QWORD *)v11 + 3);
          *((_QWORD *)v11 + 3) = v12;

          v14 = objc_msgSend(v9, "copy");
          v15 = (void *)*((_QWORD *)v11 + 4);
          *((_QWORD *)v11 + 4) = v14;

          v16 = objc_msgSend(v10, "copy");
          v17 = (void *)*((_QWORD *)v11 + 5);
          *((_QWORD *)v11 + 5) = v16;

          v11[16] = 0;
          v18 = (void *)*((_QWORD *)v11 + 6);
          *((_QWORD *)v11 + 6) = 0;

          *((_QWORD *)v11 + 7) = 0;
          *((_QWORD *)v11 + 10) = 0;
          *((_QWORD *)v11 + 15) = 0;
          *((_QWORD *)v11 + 16) = 0;
          *(_DWORD *)(v11 + 17) = 16842752;
          goto LABEL_6;
        }
        v20 = (void *)MEMORY[0x1E0C99DA0];
        v21 = *MEMORY[0x1E0C99778];
        v22 = CFSTR("shadowPath must not be nil.");
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0C99DA0];
        v21 = *MEMORY[0x1E0C99778];
        v22 = CFSTR("baseImage must not be nil.");
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      v22 = CFSTR("localizedName must not be nil.");
    }
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
LABEL_6:

  return (PKToolConfiguration *)v11;
}

- (PKToolConfiguration)init
{
  id v3;
  id v4;
  PKToolConfiguration *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v5 = -[PKToolConfiguration initWithLocalizedName:baseImage:shadowPath:](self, "initWithLocalizedName:baseImage:shadowPath:", &stru_1E777DEE8, v3, v4);

  return v5;
}

+ (id)defaultConfigurationForToolWithIdentifier:(id)a3
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)a1, a3, -1);
}

+ (id)defaultConfigurationForToolWithIdentifier:(uint64_t)a3 inkVersion:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  _UNKNOWN **v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  double v41;
  id v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  id v51;
  id v52;
  id v53;
  const __CFString *v54;
  void *v55;
  double v56;
  void *v57;
  id v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  double v81;
  double v82;
  int v83;
  id v84;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  uint64_t v101;
  const __CFString *v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  id v114;
  void *v115;
  int v116;
  int v117;
  void *v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v119 = (void *)objc_opt_self();
  if (!v4)
  {
    v100 = (void *)MEMORY[0x1E0C99DA0];
    v101 = *MEMORY[0x1E0C99778];
    v102 = CFSTR("Can not get a default configuration for a nil tool identifier.");
    goto LABEL_266;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.custom")))
  {
    v100 = (void *)MEMORY[0x1E0C99DA0];
    v101 = *MEMORY[0x1E0C99778];
    v102 = CFSTR("Can not get a default configuration for custom ink.");
LABEL_266:
    objc_msgSend(v100, "exceptionWithName:reason:userInfo:", v101, v102, 0);
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v103);
  }
  v5 = v4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.crayon"));
  }

  v7 = v5;
  if ((objc_msgSend(v7, "isEqualToString:") & 1) != 0)
    v116 = 1;
  else
    v116 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ink.objectEraser"));

  v117 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ink.objectEraser"));
  v8 = objc_msgSend(v7, "isEqualToString:");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.pen")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Pen");
LABEL_40:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, v12, CFSTR("Localizable"));
    v13 = objc_claimAutoreleasedReturnValue();

    goto LABEL_41;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Pencil");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.marker")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Marker");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.monoline")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Monoline");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Fountain Pen");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Watercolor");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Crayon");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.lasso")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Lasso");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.eraser")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Pixel Eraser");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Object Eraser");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.tool.ruler")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Ruler");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.handwriting")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Scribble");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.generationtool")))
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Generation Tool");
    goto LABEL_40;
  }
  v13 = 0;
LABEL_41:

  v14 = v9;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_pen_base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_pencil_base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_marker_base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
  {
    v15 = CFSTR("MonolineTool/Base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0)
  {
    v15 = CFSTR("FountainPenTool/Base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
    v15 = CFSTR("WatercolorTool/Base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.crayon")) & 1) != 0)
  {
    v15 = CFSTR("CrayonTool/Base");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.lasso")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_selection");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_bitmap_eraser");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_object_eraser");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.tool.ruler")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_ruler");
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.handwriting")) & 1) != 0)
  {
    v15 = CFSTR("palette_tool_handwriting");
  }
  else if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.generationtool")))
  {
    v15 = CFSTR("palette_tool_generation");
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v118, 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v115)
  {
    v104 = (void *)MEMORY[0x1E0C99DA0];
    v105 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find image with name '%@' in bundle '%@'."), v15, v118);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "exceptionWithName:reason:userInfo:", v105, v106, 0);
    v107 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v107);
  }
  v16 = &off_1E776F000;
  if ((_DWORD)v6)
  {
    +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v14);
    v114 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v114 = 0;
  }
  v17 = v14;
  v112 = v8;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.pen")))
  {
    v18 = a3;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    v21 = 41.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 41.5);
    objc_msgSend(v19, "addLineToPoint:", 19.5, 11.5);
    v22 = 26.5;
    v23 = 11.5;
LABEL_76:
    v24 = v19;
LABEL_77:
    objc_msgSend(v24, "addLineToPoint:", v22, v23);
    objc_msgSend(v19, "addLineToPoint:", 34.0, v21);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 106.0);
    v25 = 12.0;
LABEL_78:
    objc_msgSend(v19, "addLineToPoint:", v25, v20);
    objc_msgSend(v19, "closePath");
LABEL_79:
    v26 = v19;

    goto LABEL_80;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
  {
    v18 = a3;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    v21 = 44.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 44.5);
    objc_msgSend(v19, "addLineToPoint:", 19.0, 15.5);
    v22 = 27.0;
    v23 = 15.5;
    goto LABEL_76;
  }
  v18 = a3;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.marker")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    v21 = 39.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 39.5);
    objc_msgSend(v19, "addLineToPoint:", 13.0, 35.5);
    objc_msgSend(v19, "addLineToPoint:", 16.0, 28.5);
    objc_msgSend(v19, "addLineToPoint:", 16.0, 15.47);
    objc_msgSend(v19, "addLineToPoint:", 17.0, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 30.0, 15.5);
    objc_msgSend(v19, "addLineToPoint:", 30.0, 28.5);
    v22 = 33.0;
    v24 = v19;
    v23 = 35.5;
    goto LABEL_77;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.monoline")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "moveToPoint:", 12.2618099, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.2618099, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 14.2503486, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 14.2503486, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 16.5339738, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 16.5339738, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 8.32630841);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 3.32473958);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 3.32473958);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 8.32630841);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 29.8894292, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 29.8894292, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 32.1598719, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 32.1598719, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 34.0916241, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 34.0916241, 106.0);
    goto LABEL_79;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "moveToPoint:", 12.2601668);
    objc_msgSend(v19, "addLineToPoint:", 13.2601668, 51.9198442);
    objc_msgSend(v19, "addLineToPoint:", 15.1484375, 48.0507036);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0358887, 46.1215105, 15.0358887, 45.5854492, 14.7400716, 46.943262);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 14.9029147, 44.3973689, 14.6369669, 43.629392, 15.0358887, 45.0493879);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0732805, 43.3439394, 15.9459078, 42.7730341, 14.6369669, 43.629392);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2601668, 30.4790039, 12.2601668, 26.6476707, 15.9459078, 37.9335938);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 19.6647949, 10.418457, 23.0923308, 1.65112305, 12.2601668, 22.8163376);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 33.9244948, 22.1508102, 33.9244948, 26.6476707, 26.543457, 10.4182129);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 30.4541991, 37.3776855, 30.4541991, 42.7730341, 33.9244948, 31.1445313);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.7211492, 43.3271476, 32.0599319, 43.629392, 31.1859049, 43.041695);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.3964844, 45.0633311, 31.3964844, 45.5854492, 31.6176336, 44.411312);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.6176336, 46.9293188, 32.0599319, 48.0507036, 31.3964844, 46.1075674);
    objc_msgSend(v19, "addLineToPoint:", 33.9244948, 51.9198442);
    objc_msgSend(v19, "addLineToPoint:", 33.9244948, 106.0);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 18.0, 21.25, 10.0, 10.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bezierPathByReversingPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendPath:", v37);

    v16 = &off_1E776F000;
    goto LABEL_79;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "moveToPoint:", 12.2158203);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2158203, 49.1869718, 12.2158203);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 16.4457308, 35.171875, 12.2158203, 45.659218, 13.7754602, 41.0078087);
    objc_msgSend(v19, "addLineToPoint:", 16.4457308, 31.4229939);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5809329, 31.4229939, 16.8986844, 31.4229939, 17.2770851, 31.4229939);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 23.0, 2.26262478, 17.5809329, 19.2776602, 20.4644097, 7.17426215);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 28.6675323, 31.4229939, 25.4383789, 7.22929688, 28.6675323, 19.2776602);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 29.8027344, 31.4229939, 28.9713802, 31.4229939, 29.3497808, 31.4229939);
    objc_msgSend(v19, "addLineToPoint:", 29.8027344, 35.171875);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 49.1869718, 32.473005, 41.0078087, 34.0, 45.659218);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 106.0, 34.0, 52.7147255, 34.0, 71.6524016);
    goto LABEL_79;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    v87 = (void *)MEMORY[0x1E0DC3508];
    v88 = 24.25;
    v89 = 105.25;
    v90 = 12.0;
    v91 = 22.0;
LABEL_220:
    objc_msgSend(v87, "bezierPathWithRect:", v90, v88, v91, v89);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_79;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.lasso")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    v21 = 41.38;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 41.38);
    objc_msgSend(v19, "addLineToPoint:", 22.48, 2.0);
    v22 = 23.52;
    v23 = 2.0;
    goto LABEL_76;
  }
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0
    || objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 12.0, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 12.0, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 17.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 48.72);
    v94 = v19;
LABEL_236:
    objc_msgSend(v94, "addLineToPoint:", 33.5, v20);
    v25 = 12.5;
    goto LABEL_78;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.tool.ruler")))
  {
    v87 = (void *)MEMORY[0x1E0DC3508];
    v91 = 36.0;
    v89 = 103.5;
    v90 = 5.0;
    v88 = 2.5;
    goto LABEL_220;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.handwriting")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.5;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.5);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 65.5);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 53.5);
    objc_msgSend(v19, "addLineToPoint:", 15.5, 36.83);
    objc_msgSend(v19, "addLineToPoint:", 19.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 20.21, 11.73);
    objc_msgSend(v19, "addLineToPoint:", 20.5, 10.58);
    objc_msgSend(v19, "addLineToPoint:", 21.5, 3.51);
    objc_msgSend(v19, "addLineToPoint:", 22.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 23.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 24.5, 3.51);
    objc_msgSend(v19, "addLineToPoint:", 25.5, 10.58);
    objc_msgSend(v19, "addLineToPoint:", 26.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 30.5, 36.83);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 53.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 65.5);
    v96 = v19;
    v97 = 106.5;
LABEL_253:
    objc_msgSend(v96, "addLineToPoint:", 33.5, v97);
    v94 = v19;
    goto LABEL_236;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.generationtool")))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 17.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 4.51);
    v96 = v19;
    v97 = 6.52;
    goto LABEL_253;
  }
  v26 = 0;
LABEL_80:

  v27 = objc_msgSend(objc_alloc((Class)v16[487]), "initWithLocalizedName:baseImage:shadowPath:", v13, v115, v26);
  *(_BYTE *)(v27 + 21) = v116;
  *(_BYTE *)(v27 + 18) = v112;
  *(_QWORD *)(v27 + 152) = v18;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.eraser")))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(v27 + 136);
    *(_QWORD *)(v27 + 136) = v28;

  }
  objc_msgSend((id)v27, "setSupportsColor:andOpacity:defaultColor:", v6, v6, v114);
  if ((_DWORD)v6)
    objc_msgSend((id)v27, "setOpacityLabelVerticalOffset:", 70.0);
  v30 = v17;
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v31 = CFSTR("palette_tool_pen_band");
LABEL_88:
    v32 = (void *)v13;
LABEL_89:

    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v31, v118, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v27, "setBandMaskImage:", v33);
    goto LABEL_90;
  }
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v31 = CFSTR("palette_tool_pencil_band");
    goto LABEL_88;
  }
  v32 = (void *)v13;
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v31 = CFSTR("palette_tool_marker_band");
    goto LABEL_89;
  }
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
    goto LABEL_111;
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0)
  {
    v31 = CFSTR("FountainPenTool/BandMask");
    goto LABEL_89;
  }
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
LABEL_111:
    v31 = CFSTR("MonolineTool/BandMask");
    goto LABEL_89;
  }
  v33 = v30;
  if (objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    v31 = CFSTR("CrayonTool/BandMask");
    goto LABEL_89;
  }
LABEL_90:

  v34 = v30;
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v35 = CFSTR("palette_tool_pen_band_contour");
LABEL_114:

    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v35, v118, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v27, "setBandContourImage:", v38);
    goto LABEL_115;
  }
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v35 = CFSTR("palette_tool_pencil_band_contour");
    goto LABEL_114;
  }
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v35 = CFSTR("palette_tool_marker_band_contour");
    goto LABEL_114;
  }
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
    goto LABEL_113;
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0)
  {
    v35 = CFSTR("FountainPenTool/BandContour");
    goto LABEL_114;
  }
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
LABEL_113:
    v35 = CFSTR("MonolineTool/BandContour");
    goto LABEL_114;
  }
  v38 = v34;
  if (objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    v35 = CFSTR("CrayonTool/BandContour");
    goto LABEL_114;
  }
LABEL_115:

  if (!(_DWORD)v6)
    goto LABEL_123;
  v39 = v34;
  if ((objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0
    || (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0
    || (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0
    || (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.crayon")) & 1) != 0)
  {
    *(double *)&v40 = 50.0;
  }
  else
  {
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) == 0
      && (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) == 0)
    {
      if (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
        v41 = 60.0;
      else
        v41 = 0.0;
      goto LABEL_122;
    }
    *(double *)&v40 = 60.0;
  }
  v41 = *(double *)&v40;
LABEL_122:

  objc_msgSend((id)v27, "setBandVerticalOffset:", v41);
LABEL_123:
  v42 = v34;
  if ((objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v43 = CFSTR("palette_tool_pen_tip");
  }
  else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v43 = CFSTR("palette_tool_pencil_tip");
  }
  else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v43 = CFSTR("palette_tool_marker_tip");
  }
  else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
  {
    v43 = CFSTR("MonolineTool/Tip");
  }
  else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
    v43 = CFSTR("WatercolorTool/Tip");
  }
  else
  {
    v44 = v42;
    if (!objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
      goto LABEL_149;
    v43 = CFSTR("CrayonTool/Tip");
  }

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v43, v118, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = v32;
    v46 = v42;
    v111 = v46;
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.pen")))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "moveToPoint:", 12.0, 106.0);
      v48 = 41.5;
      objc_msgSend(v47, "addLineToPoint:", 12.0, 41.5);
      objc_msgSend(v47, "addLineToPoint:", 19.5, 11.5);
      objc_msgSend(v47, "addLineToPoint:", 23.0, 0.0);
      v49 = 26.5;
      v50 = 11.5;
LABEL_145:
      objc_msgSend(v47, "addLineToPoint:", v49, v50);
      objc_msgSend(v47, "addLineToPoint:", 34.0, v48);
      objc_msgSend(v47, "addLineToPoint:", 34.0, 106.0);
      objc_msgSend(v47, "addLineToPoint:", 12.0, 106.0);
      objc_msgSend(v47, "closePath");
      v51 = v47;
      v52 = v51;
LABEL_146:
      v32 = v45;
LABEL_147:

LABEL_148:
      objc_msgSend((id)v27, "setTipMaskImage:withShadowPathIncludingTip:", v44, v52);

      goto LABEL_149;
    }
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "moveToPoint:", 12.0, 106.0);
      v48 = 44.5;
      objc_msgSend(v47, "addLineToPoint:", 12.0, 44.5);
      objc_msgSend(v47, "addLineToPoint:", 19.0, 15.5);
      objc_msgSend(v47, "addLineToPoint:", 23.0, 0.0);
      v49 = 27.0;
      v50 = 15.5;
      goto LABEL_145;
    }
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.marker")))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 106.0;
      objc_msgSend(v55, "moveToPoint:", 12.0, 106.0);
      objc_msgSend(v55, "addLineToPoint:", 12.0, 39.5);
      objc_msgSend(v55, "addLineToPoint:", 13.0, 35.5);
      objc_msgSend(v55, "addLineToPoint:", 16.0, 28.5);
      objc_msgSend(v55, "addLineToPoint:", 16.0, 15.47);
      objc_msgSend(v55, "addLineToPoint:", 17.0, 14.5);
      objc_msgSend(v55, "addLineToPoint:", 17.0, 8.0);
      objc_msgSend(v55, "addLineToPoint:", 28.5, 2.0);
      objc_msgSend(v55, "addLineToPoint:", 28.5, 14.5);
      objc_msgSend(v55, "addLineToPoint:", 30.0, 15.5);
      objc_msgSend(v55, "addLineToPoint:", 30.0, 28.5);
      objc_msgSend(v55, "addLineToPoint:", 33.0, 35.5);
      objc_msgSend(v55, "addLineToPoint:", 34.0, 39.5);
      v57 = v55;
LABEL_157:
      objc_msgSend(v57, "addLineToPoint:", 34.0, v56);
      objc_msgSend(v55, "addLineToPoint:", 12.0, v56);
      objc_msgSend(v55, "closePath");
      v51 = v55;
      v52 = v51;
      goto LABEL_146;
    }
    if ((objc_msgSend(v46, "isEqualToString:") & 1) == 0
      && (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) == 0
      && !objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
    {
      if (!objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
      {
        v52 = 0;
        v32 = v45;
        goto LABEL_148;
      }
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "moveToPoint:", 12.0, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 14.5, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 21.0, 0.0);
      objc_msgSend(v55, "addLineToPoint:", 25.0, 0.0);
      objc_msgSend(v55, "addLineToPoint:", 31.5, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 34.0, 24.25);
      v56 = 129.5;
      v57 = v55;
      goto LABEL_157;
    }
    v58 = v46;
    v108 = v58;
    if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.pen")))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      objc_msgSend(v59, "addLineToPoint:", 12.0, 41.5);
      objc_msgSend(v59, "addLineToPoint:", 19.5, 11.5);
      objc_msgSend(v59, "addLineToPoint:", 26.5, 11.5);
      objc_msgSend(v59, "addLineToPoint:", 34.0, 41.5);
      objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
      objc_msgSend(v59, "addLineToPoint:", 12.0, 106.0);
      objc_msgSend(v59, "closePath");
      v32 = v45;
LABEL_213:
      v52 = v59;

      v51 = v108;
      goto LABEL_147;
    }
    v32 = v45;
    if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 106.0;
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      v61 = 44.5;
      objc_msgSend(v59, "addLineToPoint:", 12.0, 44.5);
      objc_msgSend(v59, "addLineToPoint:", 19.0, 15.5);
      v62 = 27.0;
      v63 = 15.5;
      v64 = v59;
    }
    else
    {
      if (!objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.marker")))
      {
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.monoline")))
        {
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "moveToPoint:", 12.2618099, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.2618099, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 14.2503486, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 14.2503486, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 16.5339738, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 16.5339738, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 8.32630841);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 3.32473958);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 3.32473958);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 8.32630841);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 29.8894292, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 29.8894292, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 32.1598719, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 32.1598719, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 34.0916241, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 34.0916241, 106.0);
          goto LABEL_213;
        }
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")))
        {
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "moveToPoint:", 12.2601668);
          objc_msgSend(v59, "addLineToPoint:", 13.2601668, 51.9198442);
          objc_msgSend(v59, "addLineToPoint:", 15.1484375, 48.0507036);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0358887, 46.1215105, 15.0358887, 45.5854492, 14.7400716, 46.943262);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 14.9029147, 44.3973689, 14.6369669, 43.629392, 15.0358887, 45.0493879);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0732805, 43.3439394, 15.9459078, 42.7730341, 14.6369669, 43.629392);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2601668, 30.4790039, 12.2601668, 26.6476707, 15.9459078, 37.9335938);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 19.6647949, 10.418457, 23.0923308, 1.65112305, 12.2601668, 22.8163376);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 33.9244948, 22.1508102, 33.9244948, 26.6476707, 26.543457, 10.4182129);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 30.4541991, 37.3776855, 30.4541991, 42.7730341, 33.9244948, 31.1445313);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.7211492, 43.3271476, 32.0599319, 43.629392, 31.1859049, 43.041695);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.3964844, 45.0633311, 31.3964844, 45.5854492, 31.6176336, 44.411312);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.6176336, 46.9293188, 32.0599319, 48.0507036, 31.3964844, 46.1075674);
          objc_msgSend(v59, "addLineToPoint:", 33.9244948, 51.9198442);
          objc_msgSend(v59, "addLineToPoint:", 33.9244948, 106.0);
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 18.0, 21.25, 10.0, 10.0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "bezierPathByReversingPath");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "appendPath:", v93);

          goto LABEL_213;
        }
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
        {
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "moveToPoint:", 12.2158203);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2158203, 49.1869718, 12.2158203);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 16.4457308, 35.171875, 12.2158203, 45.659218, 13.7754602, 41.0078087);
          objc_msgSend(v59, "addLineToPoint:", 16.4457308, 31.4229939);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5809329, 31.4229939, 16.8986844, 31.4229939, 17.2770851, 31.4229939);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 23.0, 2.26262478, 17.5809329, 19.2776602, 20.4644097, 7.17426215);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 28.6675323, 31.4229939, 25.4383789, 7.22929688, 28.6675323, 19.2776602);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 29.8027344, 31.4229939, 28.9713802, 31.4229939, 29.3497808, 31.4229939);
          objc_msgSend(v59, "addLineToPoint:", 29.8027344, 35.171875);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 49.1869718, 32.473005, 41.0078087, 34.0, 45.659218);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 106.0, 34.0, 52.7147255, 34.0, 71.6524016);
          goto LABEL_213;
        }
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
        {
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 12.0, 24.25, 22.0, 105.25);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_213;
        }
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.lasso")))
        {
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 41.38);
          objc_msgSend(v59, "addLineToPoint:", 22.48, 2.0);
          objc_msgSend(v59, "addLineToPoint:", 23.52, 2.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 41.38);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
          v95 = 12.0;
        }
        else
        {
          if ((objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) == 0
            && !objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")))
          {
            if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.tool.ruler")))
            {
              objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 5.0, 2.5, 36.0, 103.5);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_213;
            }
            if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.handwriting")))
            {
              objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 106.5;
              objc_msgSend(v59, "moveToPoint:", 12.5, 106.5);
              objc_msgSend(v59, "addLineToPoint:", 12.5, 65.5);
              objc_msgSend(v59, "addLineToPoint:", 13.5, 53.5);
              objc_msgSend(v59, "addLineToPoint:", 15.5, 36.83);
              objc_msgSend(v59, "addLineToPoint:", 19.5, 14.5);
              objc_msgSend(v59, "addLineToPoint:", 20.21, 11.73);
              objc_msgSend(v59, "addLineToPoint:", 20.5, 10.58);
              objc_msgSend(v59, "addLineToPoint:", 21.5, 3.51);
              objc_msgSend(v59, "addLineToPoint:", 22.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 23.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 24.5, 3.51);
              objc_msgSend(v59, "addLineToPoint:", 25.5, 10.58);
              objc_msgSend(v59, "addLineToPoint:", 26.5, 14.5);
              objc_msgSend(v59, "addLineToPoint:", 30.5, 36.83);
              objc_msgSend(v59, "addLineToPoint:", 32.5, 53.5);
              objc_msgSend(v59, "addLineToPoint:", 33.5, 65.5);
              v98 = v59;
              v99 = 106.5;
            }
            else
            {
              if (!objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.ink.generationtool")))
              {
                v52 = 0;
                v51 = v58;
                goto LABEL_147;
              }
              objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 106.0;
              objc_msgSend(v59, "moveToPoint:", 12.5, 106.0);
              objc_msgSend(v59, "addLineToPoint:", 12.5, 6.52);
              objc_msgSend(v59, "addLineToPoint:", 13.5, 4.51);
              objc_msgSend(v59, "addLineToPoint:", 17.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 28.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 32.5, 4.51);
              v98 = v59;
              v99 = 6.52;
            }
            objc_msgSend(v98, "addLineToPoint:", 33.5, v99);
            objc_msgSend(v59, "addLineToPoint:", 33.5, v60);
            v86 = 12.5;
            goto LABEL_212;
          }
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "moveToPoint:", 12.5, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 6.52);
          objc_msgSend(v59, "addLineToPoint:", 13.5, 4.51);
          objc_msgSend(v59, "addLineToPoint:", 17.5, 2.5);
          objc_msgSend(v59, "addLineToPoint:", 28.5, 2.5);
          objc_msgSend(v59, "addLineToPoint:", 32.5, 4.51);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 6.52);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 48.72);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 106.0);
          v95 = 12.5;
        }
        objc_msgSend(v59, "addLineToPoint:", v95, 106.0);
        objc_msgSend(v59, "closePath");
        goto LABEL_213;
      }
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 106.0;
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      v61 = 39.5;
      objc_msgSend(v59, "addLineToPoint:", 12.0, 39.5);
      objc_msgSend(v59, "addLineToPoint:", 13.0, 35.5);
      objc_msgSend(v59, "addLineToPoint:", 16.0, 28.5);
      objc_msgSend(v59, "addLineToPoint:", 16.0, 15.47);
      objc_msgSend(v59, "addLineToPoint:", 17.0, 14.5);
      objc_msgSend(v59, "addLineToPoint:", 28.5, 14.5);
      objc_msgSend(v59, "addLineToPoint:", 30.0, 15.5);
      objc_msgSend(v59, "addLineToPoint:", 30.0, 28.5);
      v62 = 33.0;
      v64 = v59;
      v63 = 35.5;
    }
    objc_msgSend(v64, "addLineToPoint:", v62, v63);
    objc_msgSend(v59, "addLineToPoint:", 34.0, v61);
    objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
    v86 = 12.0;
LABEL_212:
    objc_msgSend(v59, "addLineToPoint:", v86, v60);
    objc_msgSend(v59, "closePath");
    goto LABEL_213;
  }
LABEL_149:

  v53 = v42;
  if ((objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v54 = CFSTR("palette_tool_pen_tip_contour");
  }
  else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v54 = CFSTR("palette_tool_pencil_tip_contour");
  }
  else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v54 = CFSTR("palette_tool_marker_tip_contour");
  }
  else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
  {
    v54 = CFSTR("MonolineTool/TipContour");
  }
  else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
    v54 = CFSTR("WatercolorTool/TipContour");
  }
  else
  {
    v65 = v53;
    if (!objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
      goto LABEL_172;
    v54 = CFSTR("CrayonTool/TipContour");
  }

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v54, v118, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v27, "setTipContourImage:", v65);
LABEL_172:

  if ((v6 | v116) == 1)
  {
    v113 = (void *)v27;
    objc_msgSend((id)v27, "strokeWeightButtonSize");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v32;
    v109 = v26;
    if ((_DWORD)v6)
    {
      +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "inkBehaviorForIdentifier:variant:", v53, CFSTR("default"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v68, "uiWidths");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "count"))
        v70 = v69;
      else
        v70 = &unk_1E77ECD78;

    }
    else
    {
      v70 = &unk_1E77ECD78;
    }
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v71 = v70;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v121;
      v75 = 1;
      do
      {
        for (i = 0; i != v73; ++i)
        {
          if (*(_QWORD *)v121 != v74)
            objc_enumerationMutation(v71);
          v77 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
          if ((_DWORD)v6)
          {
            objc_msgSend(v119, "p_assetImageForToolIdentifier:assetNumber:bundle:", v53, v75 + i, v118);
            v78 = objc_claimAutoreleasedReturnValue();
          }
          else if (v117)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "doubleValue");
            objc_msgSend(v119, "p_objectEraserImageWithWeight:imageSize:");
            v78 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!v116)
              continue;
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "doubleValue");
            objc_msgSend(v119, "p_bitmapEraserImageWithWeight:imageSize:");
            v78 = objc_claimAutoreleasedReturnValue();
          }
          v79 = (void *)v78;
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v78, v77);

        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
        v75 += i;
      }
      while (v73);
    }

    objc_msgSend(v113, "setStrokeWeightsToButtonImages:", v66);
    v80 = v53;
    v81 = 8.0;
    v82 = 2.0;
    if ((objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
    {
      v26 = v109;
      v32 = v110;
    }
    else
    {
      v81 = 12.0;
      v26 = v109;
      v32 = v110;
      if ((objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) == 0)
      {
        if ((objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
        {
          v81 = 18.0;
          v82 = 6.0;
        }
        else
        {
          v81 = 10.0;
          if ((objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) == 0
            && (objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) == 0
            && (objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) == 0)
          {
            v83 = objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.ink.crayon"));
            if (v83)
              v82 = 2.0;
            else
              v82 = 0.0;
            if (v83)
              v81 = 10.0;
            else
              v81 = 0.0;
          }
        }
      }
    }

    objc_msgSend(v113, "setMinimumBandThickness:andMaximumBandThickness:", v82, v81);
    v27 = (uint64_t)v113;

  }
  v84 = (id)v27;

  return v84;
}

+ (id)defaultColorForInkingToolWithIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v3, CFSTR("black"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0823529412, 0.494117647, 0.984313725, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("blue");
LABEL_7:
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.marker")))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.815686275, 0.188235294, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("yellow");
    goto LABEL_7;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294, 0.192156863, 0.258823529, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("red");
    goto LABEL_7;
  }
LABEL_8:
  +[PKInk defaultOpacityForIdentifier:](PKInk, "defaultOpacityForIdentifier:", v2);
  objc_msgSend(v5, "colorWithAlphaComponent:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKToolConfiguration *v4;
  PKToolConfiguration *v5;
  PKToolConfiguration *v6;
  NSString *localizedName;
  UIImage *v8;
  UIImage *v9;
  void *v10;
  int v11;
  BOOL v12;
  UIImage *baseImage;
  unint64_t v14;
  UIBezierPath *shadowPath;
  unint64_t v16;
  double opacityLabelVerticalOffset;
  double v18;
  double bandVerticalOffset;
  double v20;
  double minimumBandThickness;
  double v22;
  double maximumBandThickness;
  double v24;
  int v25;
  int v26;

  v4 = (PKToolConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        localizedName = v6->_localizedName;
        v8 = self->_localizedName;
        v9 = localizedName;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_45;
          v11 = -[UIImage isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_46;
        }
        baseImage = v6->_baseImage;
        v8 = self->_baseImage;
        v14 = baseImage;
        if ((unint64_t)v8 | v14)
        {
          v10 = (void *)v14;
          if (!v8 || !v14)
            goto LABEL_45;
          v25 = -[UIImage isEqual:](v8, "isEqual:", v14);

          if (!v25)
            goto LABEL_46;
        }
        shadowPath = v6->_shadowPath;
        v8 = self->_shadowPath;
        v16 = shadowPath;
        if (!((unint64_t)v8 | v16))
        {
LABEL_14:
          if (self->_supportsColor == v6->_supportsColor && self->_supportsOpacity == v6->_supportsOpacity)
          {
            opacityLabelVerticalOffset = self->_opacityLabelVerticalOffset;
            v18 = v6->_opacityLabelVerticalOffset;
            if (opacityLabelVerticalOffset == v18
              || vabdd_f64(opacityLabelVerticalOffset, v18) < fabs(v18 * 0.000000999999997))
            {
              if (DKUNilsEquivalentEqualObjects(self->_bandMaskImage, v6->_bandMaskImage))
              {
                if (DKUNilsEquivalentEqualObjects(self->_bandContourImage, v6->_bandContourImage))
                {
                  bandVerticalOffset = self->_bandVerticalOffset;
                  v20 = v6->_bandVerticalOffset;
                  if (bandVerticalOffset == v20 || vabdd_f64(bandVerticalOffset, v20) < fabs(v20 * 0.000000999999997))
                  {
                    if (DKUNilsEquivalentEqualObjects(self->_tipMaskImage, v6->_tipMaskImage))
                    {
                      if (DKUNilsEquivalentEqualObjects(self->_tipContourImage, v6->_tipContourImage))
                      {
                        if (DKUNilsEquivalentEqualObjects(self->_shadowPathIncludingTip, v6->_shadowPathIncludingTip))
                        {
                          if (DKUNilsEquivalentEqualHashes(self->_strokeWeightsToButtonImages, v6->_strokeWeightsToButtonImages))
                          {
                            minimumBandThickness = self->_minimumBandThickness;
                            v22 = v6->_minimumBandThickness;
                            if (minimumBandThickness == v22
                              || vabdd_f64(minimumBandThickness, v22) < fabs(v22 * 0.000000999999997))
                            {
                              maximumBandThickness = self->_maximumBandThickness;
                              v24 = v6->_maximumBandThickness;
                              if ((maximumBandThickness == v24
                                 || vabdd_f64(maximumBandThickness, v24) < fabs(v24 * 0.000000999999997))
                                && self->_isEraserTool == v6->_isEraserTool
                                && self->_inkVersion == v6->_inkVersion
                                && self->_viewControllerProvider == v6->_viewControllerProvider
                                && self->_imageProvider == v6->_imageProvider
                                && self->_supportsLassoBehaviors == v6->_supportsLassoBehaviors
                                && self->_wantsStrokeWeightControl == v6->_wantsStrokeWeightControl)
                              {
                                v12 = self->_wantsOpacityControl == v6->_wantsOpacityControl;
LABEL_47:

                                goto LABEL_48;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_46:
          v12 = 0;
          goto LABEL_47;
        }
        v10 = (void *)v16;
        if (v8 && v16)
        {
          v26 = -[UIImage isEqual:](v8, "isEqual:", v16);

          if (!v26)
            goto LABEL_46;
          goto LABEL_14;
        }
LABEL_45:

        goto LABEL_46;
      }
    }
    v12 = 0;
  }
LABEL_48:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSUInteger v21;

  v21 = -[NSString hash](self->_localizedName, "hash");
  v3 = -[UIImage hash](self->_baseImage, "hash");
  v19 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * self->_supportsColor) ^ ((0xBF58476D1CE4E5B9 * self->_supportsColor) >> 27));
  v20 = v3;
  v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * self->_supportsOpacity) ^ ((0xBF58476D1CE4E5B9 * self->_supportsOpacity) >> 27));
  v5 = 0xBF58476D1CE4E5B9
     * ((unint64_t)self->_opacityLabelVerticalOffset ^ ((unint64_t)self->_opacityLabelVerticalOffset >> 30));
  v6 = 0x94D049BB133111EBLL * (v5 ^ (v5 >> 27));
  v18 = -[UIImage hash](self->_bandMaskImage, "hash");
  v17 = -[UIImage hash](self->_bandContourImage, "hash");
  v7 = 0xBF58476D1CE4E5B9
     * ((unint64_t)self->_bandVerticalOffset ^ ((unint64_t)self->_bandVerticalOffset >> 30));
  v8 = 0x94D049BB133111EBLL * (v7 ^ (v7 >> 27));
  v9 = -[UIImage hash](self->_tipMaskImage, "hash");
  v10 = -[UIImage hash](self->_tipContourImage, "hash");
  v11 = -[NSDictionary hash](self->_strokeWeightsToButtonImages, "hash");
  v12 = PKHashBytes((uint64_t)&self->_minimumBandThickness, 8);
  v13 = PKHashBytes((uint64_t)&self->_maximumBandThickness, 8);
  v14 = 0xBF58476D1CE4E5B9 * (self->_inkVersion ^ ((unint64_t)self->_inkVersion >> 30));
  v15 = (0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * self->_isEraserTool) ^ ((0xBF58476D1CE4E5B9 * self->_isEraserTool) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_supportsLassoBehaviors) ^ ((0xBF58476D1CE4E5B9 * self->_supportsLassoBehaviors) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_wantsStrokeWeightControl) ^ ((0xBF58476D1CE4E5B9 * self->_wantsStrokeWeightControl) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_wantsOpacityControl) ^ ((0xBF58476D1CE4E5B9 * self->_wantsOpacityControl) >> 27))) ^ (0x94D049BB133111EBLL * (v14 ^ (v14 >> 27)));
  return v15 ^ v20 ^ v21 ^ v18 ^ (v19 >> 31) ^ v17 ^ (v4 >> 31) ^ v9 ^ (v6 >> 31) ^ v10 ^ v11 ^ v12 ^ (v8 >> 31) ^ v13 ^ (v15 >> 31) ^ v19 ^ v4 ^ v6 ^ v8;
}

- (void)setLocalizedName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *localizedName;
  id v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("localizedName must not be nil."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8 = v4;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  localizedName = self->_localizedName;
  self->_localizedName = v5;

}

- (void)setBaseImage:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *baseImage;
  id v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("baseImage must not be nil."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8 = v4;
  v5 = (UIImage *)objc_msgSend(v4, "copy");
  baseImage = self->_baseImage;
  self->_baseImage = v5;

}

- (void)setShadowPath:(id)a3
{
  id v4;
  UIBezierPath *v5;
  UIBezierPath *shadowPath;
  id v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("shadowPath must not be nil."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8 = v4;
  v5 = (UIBezierPath *)objc_msgSend(v4, "copy");
  shadowPath = self->_shadowPath;
  self->_shadowPath = v5;

}

- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4 defaultColor:(id)a5
{
  _BOOL4 v5;
  UIColor *v8;
  UIColor *defaultColor;
  id v10;

  v5 = a4;
  v8 = (UIColor *)a5;
  if (v5 && !a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Tools can not support opacity without supporting color."), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  self->_supportsColor = a3;
  self->_supportsOpacity = v5;
  defaultColor = self->_defaultColor;
  self->_defaultColor = v8;

}

- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4
{
  -[PKToolConfiguration setSupportsColor:andOpacity:defaultColor:](self, "setSupportsColor:andOpacity:defaultColor:", a3, a4, 0);
}

- (void)clearTipMaskImageAndShadowPathIncludingTip
{
  UIImage *tipMaskImage;
  UIBezierPath *shadowPathIncludingTip;

  tipMaskImage = self->_tipMaskImage;
  self->_tipMaskImage = 0;

  shadowPathIncludingTip = self->_shadowPathIncludingTip;
  self->_shadowPathIncludingTip = 0;

}

- (void)setTipMaskImage:(id)a3 withShadowPathIncludingTip:(id)a4
{
  id v6;
  void *v7;
  UIImage *v8;
  UIImage *tipMaskImage;
  UIBezierPath *v10;
  UIBezierPath *shadowPathIncludingTip;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!v16)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("tipMaskImage must not be nil.");
    goto LABEL_6;
  }
  v7 = v6;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("shadowPathIncludingTip must not be nil.");
LABEL_6:
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v8 = (UIImage *)objc_msgSend(v16, "copy");
  tipMaskImage = self->_tipMaskImage;
  self->_tipMaskImage = v8;

  v10 = (UIBezierPath *)objc_msgSend(v7, "copy");
  shadowPathIncludingTip = self->_shadowPathIncludingTip;
  self->_shadowPathIncludingTip = v10;

}

- (BOOL)supportsStrokeWeight
{
  void *v2;
  BOOL v3;

  -[PKToolConfiguration strokeWeightsToButtonImages](self, "strokeWeightsToButtonImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setStrokeWeightsToButtonImages:(id)a3
{
  NSDictionary *v4;
  NSDictionary *strokeWeightsToButtonImages;
  PKFloatRange *cachedStrokeWeightRange;

  +[PKToolConfiguration _deepCopyStrokeWeightDictionary:](PKToolConfiguration, "_deepCopyStrokeWeightDictionary:", a3);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  strokeWeightsToButtonImages = self->_strokeWeightsToButtonImages;
  self->_strokeWeightsToButtonImages = v4;

  cachedStrokeWeightRange = self->_cachedStrokeWeightRange;
  self->_cachedStrokeWeightRange = 0;

}

+ (id)_deepCopyStrokeWeightDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setMinimumBandThickness:(double)a3 andMaximumBandThickness:(double)a4
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;

  if (a3 < 0.0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("minimumBandThickness must not be less than zero.");
    goto LABEL_8;
  }
  if (a4 < 0.0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("maximumBandThickness must not be less than zero.");
    goto LABEL_8;
  }
  if (a4 < a3)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("maximumBandThickness must not be less than minimumBandThickness.");
LABEL_8:
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  self->_minimumBandThickness = a3;
  self->_maximumBandThickness = a4;
}

- (double)bandThicknessForStrokeWeight:(void *)a1
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;

  if (!a1)
    return 0.0;
  if ((objc_msgSend(a1, "supportsStrokeWeight") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not attempt to calculate band thickness a tool configuration that does not support stroke weight."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(a1, "p_strokeWeightRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowerBound");
  v6 = v5;
  objc_msgSend(v4, "upperBound");
  v8 = v7;
  objc_msgSend(a1, "minimumBandThickness");
  v10 = v9;
  objc_msgSend(a1, "maximumBandThickness");
  if (v6 != v8 && vabdd_f64(v6, v8) >= fabs(v8 * 0.000000999999997))
  {
    v12 = (a2 - v6) / (v8 - v6);
    v13 = 0.0;
    if (v12 >= 0.0)
    {
      v13 = (a2 - v6) / (v8 - v6);
      if (v12 > 1.0)
        v13 = 1.0;
    }
    v10 = v10 + (v11 - v10) * v13;
  }

  return v10;
}

+ (id)p_assetImageForToolIdentifier:(id)a3 assetNumber:(unint64_t)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v7;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0)
  {
    v10 = CFSTR("com.apple.ink.pen.");
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
  {
    v10 = CFSTR("com.apple.ink.pencil.");
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0)
  {
    v10 = CFSTR("com.apple.ink.marker.");
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0)
  {
    v10 = CFSTR("MonolineTool/StrokeWeight/Weight");
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0)
  {
    v10 = CFSTR("FountainPenTool/StrokeWeight/Weight");
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
    v10 = CFSTR("WatercolorTool/StrokeWeight/Weight");
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {
    v10 = CFSTR("CrayonTool/StrokeWeight/Weight");
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%zu"), v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v8, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    v14 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = a4;
      v19 = 2112;
      v20 = v9;
      _os_log_fault_impl(&dword_1BE213000, v14, OS_LOG_TYPE_FAULT, "Unable to find stroke weight asset (%zu) for tool identifier (%@). Defaulting to pen.", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%zu"), CFSTR("com.apple.ink.pen"), a4);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v15;
  }

  return v13;
}

+ (id)p_objectEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4
{
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v5 = a4.width * 0.5;
  v6 = a4.height * 0.5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a4.width, a4.height);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKToolConfiguration_p_objectEraserImageWithWeight_imageSize___block_invoke;
  v10[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v10[4] = a3;
  *(CGFloat *)&v10[5] = v5;
  *(CGFloat *)&v10[6] = v6;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __63__PKToolConfiguration_p_objectEraserImageWithWeight_imageSize___block_invoke(double *a1, void *a2)
{
  uint64_t v3;
  CGContext *v4;
  id v5;

  v3 = objc_msgSend(a2, "CGContext");
  if (fabs(a1[4]) < 0.00999999978)
  {
    v4 = (CGContext *)v3;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v4, (CGColorRef)objc_msgSend(v5, "CGColor"));

    CGContextSetLineWidth(v4, 2.0);
    CGContextSetLineCap(v4, kCGLineCapRound);
    CGContextMoveToPoint(v4, a1[5] + -5.0, a1[5] + -5.0);
    CGContextAddLineToPoint(v4, a1[5] + 5.0, a1[6] + 5.0);
    CGContextStrokePath(v4);
    CGContextMoveToPoint(v4, a1[5] + -5.0, a1[5] + 5.0);
    CGContextAddLineToPoint(v4, a1[5] + 5.0, a1[6] + -5.0);
    CGContextStrokePath(v4);
  }
}

+ (id)p_bitmapEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v4 = a4.width * 0.5;
  v5 = a4.height * 0.5;
  v6 = (a3 + 1.0) * 0.5 * 18.0 + 14.0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a4.width, a4.height);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKToolConfiguration_p_bitmapEraserImageWithWeight_imageSize___block_invoke;
  v10[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v10[4] = v4;
  *(CGFloat *)&v10[5] = v5;
  *(double *)&v10[6] = v6;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __63__PKToolConfiguration_p_bitmapEraserImageWithWeight_imageSize___block_invoke(double *a1, void *a2)
{
  CGContext *v3;
  id v4;
  CGRect v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  CGContextSetLineWidth(v3, 2.0);
  v5.size.width = a1[6];
  v5.origin.x = a1[4] - v5.size.width * 0.5;
  v5.origin.y = a1[5] - v5.size.width * 0.5;
  v5.size.height = v5.size.width;
  CGContextStrokeEllipseInRect(v3, v5);
}

- (id)p_strokeWeightRange
{
  void *cachedStrokeWeightRange;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  float v10;
  double v11;
  PKFloatRange *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedStrokeWeightRange)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PKToolConfiguration strokeWeightsToButtonImages](self, "strokeWeightsToButtonImages", 0);
    cachedStrokeWeightRange = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(cachedStrokeWeightRange, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v4)
    {
LABEL_18:

      return self->_cachedStrokeWeightRange;
    }
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 1.79769313e308;
    v8 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(cachedStrokeWeightRange);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "floatValue");
        v11 = v10;
        if (v7 > v11)
          v7 = v11;
        if (v8 < v11)
          v8 = v11;
      }
      v5 = objc_msgSend(cachedStrokeWeightRange, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);

    if (v7 < 1.79769313e308 && v8 > 2.22507386e-308)
    {
      v13 = -[PKFloatRange initWithLowerBound:upperBound:]([PKFloatRange alloc], "initWithLowerBound:upperBound:", v7, v8);
      cachedStrokeWeightRange = self->_cachedStrokeWeightRange;
      self->_cachedStrokeWeightRange = v13;
      goto LABEL_18;
    }
  }
  return self->_cachedStrokeWeightRange;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalizedName:baseImage:shadowPath:", self->_localizedName, self->_baseImage, self->_shadowPath);
  *(_BYTE *)(v4 + 16) = self->_supportsColor;
  *(_BYTE *)(v4 + 17) = self->_supportsOpacity;
  *(double *)(v4 + 56) = self->_opacityLabelVerticalOffset;
  v5 = -[UIImage copy](self->_bandMaskImage, "copy");
  v6 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v5;

  v7 = -[UIImage copy](self->_bandContourImage, "copy");
  v8 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v7;

  *(double *)(v4 + 80) = self->_bandVerticalOffset;
  v9 = -[UIImage copy](self->_tipMaskImage, "copy");
  v10 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v9;

  v11 = -[UIImage copy](self->_tipContourImage, "copy");
  v12 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v11;

  v13 = -[UIBezierPath copy](self->_shadowPathIncludingTip, "copy");
  v14 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v13;

  +[PKToolConfiguration _deepCopyStrokeWeightDictionary:](PKToolConfiguration, "_deepCopyStrokeWeightDictionary:", self->_strokeWeightsToButtonImages);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v15;

  *(double *)(v4 + 120) = self->_minimumBandThickness;
  *(double *)(v4 + 128) = self->_maximumBandThickness;
  *(_BYTE *)(v4 + 21) = self->_isEraserTool;
  *(_QWORD *)(v4 + 152) = self->_inkVersion;
  v17 = objc_msgSend(self->_viewControllerProvider, "copy");
  v18 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v17;

  v19 = objc_msgSend(self->_imageProvider, "copy");
  v20 = *(void **)(v4 + 160);
  *(_QWORD *)(v4 + 160) = v19;

  *(_BYTE *)(v4 + 18) = self->_supportsLassoBehaviors;
  *(_BYTE *)(v4 + 19) = self->_wantsStrokeWeightControl;
  *(_BYTE *)(v4 + 20) = self->_wantsOpacityControl;
  return (id)v4;
}

- (CGSize)strokeWeightButtonSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[PKToolConfiguration isEraserTool](self, "isEraserTool");
  v3 = 32.0;
  if (v2)
    v3 = 44.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (BOOL)supportsColor
{
  return self->_supportsColor;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (BOOL)supportsOpacity
{
  return self->_supportsOpacity;
}

- (double)opacityLabelVerticalOffset
{
  return self->_opacityLabelVerticalOffset;
}

- (void)setOpacityLabelVerticalOffset:(double)a3
{
  self->_opacityLabelVerticalOffset = a3;
}

- (UIImage)bandMaskImage
{
  return self->_bandMaskImage;
}

- (void)setBandMaskImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)bandContourImage
{
  return self->_bandContourImage;
}

- (void)setBandContourImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)bandVerticalOffset
{
  return self->_bandVerticalOffset;
}

- (void)setBandVerticalOffset:(double)a3
{
  self->_bandVerticalOffset = a3;
}

- (UIImage)tipMaskImage
{
  return self->_tipMaskImage;
}

- (UIImage)tipContourImage
{
  return self->_tipContourImage;
}

- (void)setTipContourImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIBezierPath)shadowPathIncludingTip
{
  return self->_shadowPathIncludingTip;
}

- (NSDictionary)strokeWeightsToButtonImages
{
  return self->_strokeWeightsToButtonImages;
}

- (double)minimumBandThickness
{
  return self->_minimumBandThickness;
}

- (double)maximumBandThickness
{
  return self->_maximumBandThickness;
}

- (BOOL)isEraserTool
{
  return self->_isEraserTool;
}

- (UIColor)weightButtonTintColorOverride
{
  return self->_weightButtonTintColorOverride;
}

- (id)viewControllerProvider
{
  return self->_viewControllerProvider;
}

- (void)setViewControllerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
  objc_storeStrong((id *)&self->_weightButtonTintColorOverride, 0);
  objc_storeStrong((id *)&self->_strokeWeightsToButtonImages, 0);
  objc_storeStrong((id *)&self->_shadowPathIncludingTip, 0);
  objc_storeStrong((id *)&self->_tipContourImage, 0);
  objc_storeStrong((id *)&self->_tipMaskImage, 0);
  objc_storeStrong((id *)&self->_bandContourImage, 0);
  objc_storeStrong((id *)&self->_bandMaskImage, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_cachedStrokeWeightRange, 0);
}

@end
