@implementation NTKCBlackcombFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(CFSTR("FACE_STYLE_40_IN_TITLE_CASE"), CFSTR("Meridian"));
}

- (id)facesForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  while (2)
  {
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 40, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switch(v4)
    {
      case 0:
        +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot](NTKCBlackcombFacesGalleryCollection, "complicationTypesBySlot");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v9 = 200;
        v11 = 1;
        goto LABEL_19;
      case 1:
        v32[0] = CFSTR("subdial-left");
        v32[1] = CFSTR("subdial-right");
        v33[0] = &unk_1E6CA8C38;
        v33[1] = &unk_1E6CA8C50;
        v32[2] = CFSTR("subdial-bottom");
        v33[2] = &unk_1E6CA8C68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setFaceGalleryComplicationTypesForSlots:", v12);
        +[NTKBundleComplication bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:](NTKBundleComplication, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.NoiseComplications"), CFSTR("com.apple.Noise"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v5;
        v15 = v13;
        v16 = CFSTR("subdial-top");
        goto LABEL_7;
      case 2:
        v30[0] = CFSTR("subdial-top");
        v30[1] = CFSTR("subdial-left");
        v31[0] = &unk_1E6CA8C80;
        v31[1] = &unk_1E6CA8C98;
        v30[2] = CFSTR("subdial-right");
        v31[2] = &unk_1E6CA8CB0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setFaceGalleryComplicationTypesForSlots:", v12);
        +[NTKBundleComplication bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:](NTKBundleComplication, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.weather.precipitation.chance"), CFSTR("com.apple.weather.watchapp"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v5;
        v15 = v13;
        v16 = CFSTR("subdial-bottom");
LABEL_7:
        objc_msgSend(v14, "setComplication:forSlot:", v15, v16);

        goto LABEL_8;
      case 3:
        +[NTKComplication allComplicationsOfType:](NTKComplication, "allComplicationsOfType:", 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        v28[0] = CFSTR("subdial-top");
        v28[1] = CFSTR("subdial-left");
        v29[0] = &unk_1E6CA8CC8;
        v29[1] = &unk_1E6CA8CE0;
        v28[2] = CFSTR("subdial-right");
        v28[3] = CFSTR("subdial-bottom");
        v29[2] = &unk_1E6CA8CF8;
        v29[3] = &unk_1E6CA8D10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");
        v21 = v20;
        if (v18 < 2)
        {
          v10 = 1;
          goto LABEL_17;
        }
        if (v18 == 2)
        {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E6CA8D28, CFSTR("subdial-top"));
          v20 = v21;
          v22 = &unk_1E6CA8D40;
          v23 = CFSTR("subdial-bottom");
        }
        else
        {
          if (v18 != 3)
            goto LABEL_16;
          v22 = &unk_1E6CA8D58;
          v23 = CFSTR("subdial-top");
        }
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v23);
LABEL_16:
        v10 = 0;
LABEL_17:
        v6 = (void *)objc_msgSend(v21, "copy");

LABEL_18:
        v11 = 0;
        v9 = 200;
LABEL_19:
        +[NTKBlackcombDialColorEditOption optionWithBlackcombDialColor:forDevice:](NTKBlackcombDialColorEditOption, "optionWithBlackcombDialColor:forDevice:", v11, v3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selectOption:forCustomEditMode:slot:", v24, 15, 0);

        +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorMonochromeEditOption, "optionWithFaceColor:forDevice:", v9, v3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selectOption:forCustomEditMode:slot:", v25, 10, 0);

        if (v6)
          objc_msgSend(v5, "_setFaceGalleryComplicationTypesForSlots:canRepeat:", v6, 1);
        if ((v10 & 1) == 0)
          objc_msgSend(v27, "addObject:", v5);

        if (++v4 != 7)
          continue;

        return v27;
      case 4:
      case 5:
      case 6:
        +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot](NTKCBlackcombFacesGalleryCollection, "complicationTypesBySlot");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKFaceColorEditOption standardColorValuesForDevice:](NTKFaceColorEditOption, "standardColorValuesForDevice:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v4 - 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "integerValue");

        v10 = 0;
        v11 = 0;
        goto LABEL_19;
      default:
LABEL_8:
        v10 = 0;
        v6 = 0;
        goto LABEL_18;
    }
  }
}

+ (id)complicationTypesBySlot
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("subdial-top");
  v3[1] = CFSTR("subdial-left");
  v4[0] = &unk_1E6CA8D70;
  v4[1] = &unk_1E6CA8D88;
  v3[2] = CFSTR("subdial-right");
  v3[3] = CFSTR("subdial-bottom");
  v4[2] = &unk_1E6CA8DA0;
  v4[3] = &unk_1E6CA8DB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
