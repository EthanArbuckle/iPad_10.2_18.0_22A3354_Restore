@implementation AXMVisionColorMarker

+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5 localizedName:(id)a6
{
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___AXMVisionColorMarker;
  v9 = a6;
  objc_msgSendSuper2(&v12, sel_colorWithHueDegrees_saturation_brightness_, a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalizedName:", v9, v12.receiver, v12.super_class);

  return v10;
}

+ (NSArray)allColorMarkers
{
  if (allColorMarkers_onceToken != -1)
    dispatch_once(&allColorMarkers_onceToken, &__block_literal_global_7);
  return (NSArray *)(id)allColorMarkers__ColorMarkers;
}

void __39__AXMVisionColorMarker_allColorMarkers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[42];

  v42[40] = *MEMORY[0x1E0C80C00];
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Black"), 0.0, 0.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v41;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Gray"), 0.0, 0.0, 0.5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v40;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Silver"), 0.0, 0.0, 0.85);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v39;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("White"), 0.0, 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v38;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Red"), 0.0, 1.0, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v37;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Salmon"), 5.0, 0.53, 0.97);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v36;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Rose"), 18.0, 0.25, 0.84);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v35;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Brown"), 18.0, 0.66, 0.38);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v34;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Coral"), 24.0, 0.84, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v33;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Orange"), 30.0, 1.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v32;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Chestnut"), 35.0, 0.23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v31;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Tan"), 37.0, 0.22, 0.78);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v30;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Gold"), 50.0, 0.8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v29;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Olive"), 59.0, 0.82);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[13] = v28;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Ivory"), 60.0, 0.06, 0.99);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[14] = v27;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Beige"), 60.0, 0.1, 0.96);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[15] = v26;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Yellow"), 60.0, 1.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[16] = v25;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Lime Green"), 72.0, 0.94, 0.91);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[17] = v24;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Light Green"), 94.0, 0.23, 0.75);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[18] = v23;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Sea Foam Green"), 112.0, 0.17, 0.97);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[19] = v22;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Forest Green"), 119.0, 0.71, 0.54);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[20] = v21;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Light Green"), 120.0, 0.38, 0.93);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[21] = v20;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Green"), 120.0, 1.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[22] = v19;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Turquoise"), 174.0, 0.67, 0.87);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[23] = v18;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Teal"), 174.0, 0.83, 0.93);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[24] = v17;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Cyan"), 180.0, 1.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[25] = v16;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Aqua"), 191.0, 0.86, 0.86);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[26] = v15;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Sky Blue"), 221.0, 0.15, 0.88);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[27] = v14;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Royal Blue"), 228.0, 0.91, 0.93);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[28] = v13;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Navy Blue"), 228.0, 0.93, 0.37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[29] = v12;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Indigo"), 228.0, 0.9, 0.5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v42[30] = v0;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Lavender"), 240.0, 0.08, 0.98);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v42[31] = v1;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Purple"), 266.0, 0.15, 0.75);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42[32] = v2;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Fuchsia"), 300.0, 0.84, 0.99);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42[33] = v3;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Dark Purple"), 301.0, 0.88, 0.44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[34] = v4;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Light Pink"), 317.0, 0.08, 0.94);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[35] = v5;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Violet"), 300.0, 0.43, 0.91);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[36] = v6;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Pink"), 320.0, 0.28, 0.95);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[37] = v7;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Maroon"), 339.0, 0.72, 0.38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[38] = v8;
  +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", CFSTR("Crimson"), 357.0, 0.97, 0.59);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[39] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 40);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allColorMarkers__ColorMarkers;
  allColorMarkers__ColorMarkers = v10;

}

+ (id)closestMarkerToColor:(id)a3 withMaximumThreshold:(double)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = fmin(fmax(a4, 0.0), 1.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(a1, "allColorMarkers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v14, "euclidianDistanceHS:", v6);
        if (v15 < v7 + v7)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }
  v16 = v7 * 2.23606798;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v30;
    v22 = 1.79769313e308;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v24, "euclidianDistanceHSV:", v6, (_QWORD)v29);
        if (v25 < v22)
        {
          v26 = v25;
          v27 = v24;

          v22 = v26;
          v20 = v27;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
    v22 = 1.79769313e308;
  }

  if (v22 > v16)
  {

    v20 = 0;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXMVisionColorMarker;
  -[AXMVisionColor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionColorMarker localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ name:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
