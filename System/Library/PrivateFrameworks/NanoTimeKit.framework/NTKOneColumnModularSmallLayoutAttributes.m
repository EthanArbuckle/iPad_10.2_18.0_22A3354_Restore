@implementation NTKOneColumnModularSmallLayoutAttributes

+ (id)attributesForTemplate:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  char isKindOfClass;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&attributesForTemplate_forDevice____lock);
    WeakRetained = objc_loadWeakRetained(&attributesForTemplate_forDevice____cachedDevice);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained(&attributesForTemplate_forDevice____cachedDevice);
      if (v9 == v6)
      {
        v11 = objc_msgSend(v6, "version");
        v12 = attributesForTemplate_forDevice____previousCLKDeviceVersion;

        if (v11 == v12)
          goto LABEL_8;
      }
      else
      {

      }
    }
    v13 = objc_storeWeak(&attributesForTemplate_forDevice____cachedDevice, v6);
    attributesForTemplate_forDevice____previousCLKDeviceVersion = objc_msgSend(v6, "version");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)attributesForTemplate_forDevice____classToAttributes;
    attributesForTemplate_forDevice____classToAttributes = v14;

LABEL_8:
    os_unfair_lock_unlock((os_unfair_lock_t)&attributesForTemplate_forDevice____lock);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)attributesForTemplate_forDevice____classToAttributes, "objectForKeyedSubscript:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_20:

      goto LABEL_21;
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend((id)attributesForTemplate_forDevice____classToAttributes, "setObject:forKeyedSubscript:", v10, v17);
    objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v6, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = &unk_1E6C9D780;
    v68[1] = &unk_1E6C9D798;
    v69[0] = &unk_1E6CA2BC8;
    v69[1] = &unk_1E6CA2BD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scaledValue:withOverrides:", v19, 39.0);
    v21 = v20;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v21 = v21 * 3.0;
    objc_msgSend(v10, "setSubtitleBaselineOffset:", v21);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v18, "scaledValue:", 16.5);
      v23 = v22;
      v66[0] = &unk_1E6C9D780;
      v66[1] = &unk_1E6C9D798;
      v67[0] = &unk_1E6CA2BC8;
      v67[1] = &unk_1E6CA2BD8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValue:withOverrides:", v24, 39.0);
      v26 = v25;

      v64[0] = &unk_1E6C9D780;
      v64[1] = &unk_1E6C9D798;
      v65[0] = &unk_1E6CA2BE8;
      v65[1] = &unk_1E6CA2BF8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValue:withOverrides:", v27, 22.0);
      v29 = v28;

      v62[0] = &unk_1E6C9D798;
      v62[1] = &unk_1E6C9D7B0;
      v63[0] = &unk_1E6CA2C08;
      v63[1] = &unk_1E6CA2C08;
      v62[2] = &unk_1E6C9D7C8;
      v63[2] = &unk_1E6CA2C08;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constantValue:withOverrides:", v30, 0.0);
      v32 = v31;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v23 * 3.0;
        v26 = v26 * 3.0;
        v29 = v29 * 3.0;
        v32 = v32 * 3.0;
        v33 = 25.5;
      }
      else
      {
        v33 = 8.5;
      }
      objc_msgSend(v10, "setMinimumFontSize:", v33);
      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSubtitleFont:", v34);

      objc_msgSend(v10, "setSubtitleBaselineOffset:", v26);
      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v23, *MEMORY[0x1E0DC1438]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitleFont:", v35);

      objc_msgSend(v10, "setTitleBaselineOffset:", v29);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
      }
      objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 0, 14.0, 11.0);
      v38 = v37;
      v60[0] = &unk_1E6C9D780;
      v60[1] = &unk_1E6C9D798;
      v61[0] = &unk_1E6CA2C18;
      v61[1] = &unk_1E6CA2C28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValue:withOverrides:", v39, 10.5);
      v41 = v40;

      v58[0] = &unk_1E6C9D780;
      v58[1] = &unk_1E6C9D798;
      v59[0] = &unk_1E6CA2C38;
      v59[1] = &unk_1E6CA2C48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValue:withOverrides:", v42, 14.0);
      v44 = v43;

      v56[0] = &unk_1E6C9D798;
      v56[1] = &unk_1E6C9D7B0;
      v57[0] = &unk_1E6CA2C08;
      v57[1] = &unk_1E6CA2C08;
      v56[2] = &unk_1E6C9D7C8;
      v57[2] = &unk_1E6CA2C08;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constantValue:withOverrides:", v45, 0.0);
      v47 = v46;

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v49 = v38 * 3.0;
      v50 = v41 * 3.0;
      v51 = v44 * 3.0;
      if ((isKindOfClass & 1) != 0)
        v52 = v38 * 3.0;
      else
        v52 = v38;
      if ((isKindOfClass & 1) != 0)
        v53 = v41 * 3.0;
      else
        v53 = v41;
      if ((isKindOfClass & 1) != 0)
        v54 = v44 * 3.0;
      else
        v54 = v44;
      if ((isKindOfClass & 1) != 0)
        v32 = v47 * 3.0;
      else
        v32 = v47;
      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v52, v49, v50, v51, v47 * 3.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSubtitleFont:", v55);

      objc_msgSend(v10, "setImageOriginY:", v53);
      objc_msgSend(v10, "setImageHeight:", v54);
    }
    objc_msgSend(v10, "setMarginWidth:", v32);
LABEL_19:

    goto LABEL_20;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (CLKFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (double)subtitleBaselineOffset
{
  return self->_subtitleBaselineOffset;
}

- (void)setSubtitleBaselineOffset:(double)a3
{
  self->_subtitleBaselineOffset = a3;
}

- (double)marginWidth
{
  return self->_marginWidth;
}

- (void)setMarginWidth:(double)a3
{
  self->_marginWidth = a3;
}

- (double)imageOriginY
{
  return self->_imageOriginY;
}

- (void)setImageOriginY:(double)a3
{
  self->_imageOriginY = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (CLKFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (double)titleBaselineOffset
{
  return self->_titleBaselineOffset;
}

- (void)setTitleBaselineOffset:(double)a3
{
  self->_titleBaselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
}

@end
