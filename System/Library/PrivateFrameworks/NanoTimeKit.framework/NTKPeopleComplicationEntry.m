@implementation NTKPeopleComplicationEntry

+ (id)lockedEntry
{
  void *v2;
  void *v3;
  NTKPeopleComplicationEntry *v4;

  NTKClockFaceLocalizedString(CFSTR("PEOPLE_LOCKED_FULL_NAME"), CFSTR("------"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("PEOPLE_LOCKED_ABBREVIATION"), CFSTR("‒‒"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKPeopleComplicationEntry initWithFullName:abbreviation:profileImage:]([NTKPeopleComplicationEntry alloc], "initWithFullName:abbreviation:profileImage:", v2, v3, 0);

  return v4;
}

- (NTKPeopleComplicationEntry)initWithFullName:(id)a3 abbreviation:(id)a4 profileImage:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKPeopleComplicationEntry *v12;
  NTKPeopleComplicationEntry *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKPeopleComplicationEntry;
  v12 = -[NTKPeopleComplicationEntry init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullName, a3);
    objc_storeStrong((id *)&v13->_abbreviation, a4);
    objc_storeStrong((id *)&v13->_profileImage, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKTimelineEntryModel setEntryDate:](v13, "setEntryDate:", v14);

  }
  return v13;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  NTKPeopleComplicationImageProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  void *v25;
  const __CFString *v27;
  NTKPeopleComplicationImageProvider *v28;
  const __CFString *v29;
  NTKPeopleComplicationImageProvider *v30;
  const __CFString *v31;
  NTKPeopleComplicationImageProvider *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(NTKPeopleComplicationImageProvider);
  -[NTKPeopleComplicationImageProvider setProfileImage:](v5, "setProfileImage:", self->_profileImage);
  -[NTKPeopleComplicationImageProvider setFullName:](v5, "setFullName:", self->_fullName);
  -[NTKPeopleComplicationImageProvider setNameAbbreviation:](v5, "setNameAbbreviation:", self->_abbreviation);
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 2.0);
    -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 20.0);
    v6 = (void *)MEMORY[0x1E0C94170];
LABEL_3:
    objc_msgSend(v6, "templateWithImageProvider:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    switch(a3)
    {
      case 0:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 1.5);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 15.0);
        v6 = (void *)MEMORY[0x1E0C94438];
        goto LABEL_3;
      case 2:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 1.0);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 10.5);
        v6 = (void *)MEMORY[0x1E0C94488];
        goto LABEL_3;
      case 4:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 1.5);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 15.0);
        v6 = (void *)MEMORY[0x1E0C941A0];
        goto LABEL_3;
      case 7:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 5.0);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 55.0);
        v6 = (void *)MEMORY[0x1E0C94218];
        goto LABEL_3;
      case 8:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 1.5);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 15.0);
        objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = CFSTR("NTKPeopleComplicationImageProviderMetadataKey");
        v34[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMetadata:", v9);

        v10 = (void *)MEMORY[0x1E0C942C0];
        goto LABEL_18;
      case 9:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 2.0);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 20.0);
        objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("NTKPeopleComplicationImageProviderMetadataKey");
        v28 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMetadata:", v11);

        objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      case 10:
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", 2.0);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", 20.0);
        objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("NTKPeopleComplicationImageProviderMetadataKey");
        v32 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMetadata:", v13);

        v10 = (void *)MEMORY[0x1E0C94260];
        goto LABEL_18;
      case 12:
        os_unfair_lock_lock((os_unfair_lock_t)&templateForComplicationFamily____lock);
        WeakRetained = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        if (!WeakRetained)
          goto LABEL_16;
        v15 = WeakRetained;
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        if (v16 == v17)
        {
          objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "version");
          v20 = templateForComplicationFamily____previousCLKDeviceVersion;

          if (v19 == v20)
            goto LABEL_17;
        }
        else
        {

        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak(&templateForComplicationFamily____cachedDevice, v21);

        v22 = objc_loadWeakRetained(&templateForComplicationFamily____cachedDevice);
        templateForComplicationFamily____previousCLKDeviceVersion = objc_msgSend(v22, "version");

        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CLKComplicationGraphicExtraLargeCircularScalingFactor();
        *(double *)&templateForComplicationFamily__graphicXLargeBorderWidth = v24 + v24;
        *(double *)&templateForComplicationFamily__graphicXLargeFontSize = v24 * 20.0;

LABEL_17:
        os_unfair_lock_unlock((os_unfair_lock_t)&templateForComplicationFamily____lock);
        -[NTKPeopleComplicationImageProvider setBorderWidth:](v5, "setBorderWidth:", *(double *)&templateForComplicationFamily__graphicXLargeBorderWidth);
        -[NTKPeopleComplicationImageProvider setFontSize:](v5, "setFontSize:", *(double *)&templateForComplicationFamily__graphicXLargeFontSize);
        objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("NTKPeopleComplicationImageProviderMetadataKey");
        v30 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMetadata:", v25);

        v10 = (void *)MEMORY[0x1E0C94330];
LABEL_18:
        objc_msgSend(v10, "templateWithImageProvider:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        break;
      default:
        break;
    }
  }

  return v7;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImage, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
