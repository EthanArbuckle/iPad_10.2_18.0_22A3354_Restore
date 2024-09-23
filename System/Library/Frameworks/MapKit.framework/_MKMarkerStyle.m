@implementation _MKMarkerStyle

+ (id)markerStyleForTraitCollection:(id)a3 state:(int64_t)a4 styleAttributes:(id)a5 coordinate:(CLLocationCoordinate2D)a6
{
  double longitude;
  double latitude;
  id v11;
  id v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  _BOOL8 v28;
  id v29;
  id v30;
  _UNKNOWN **v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  BOOL v39;
  BOOL v40;
  char v41;
  id *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  float v51;
  float v52;
  id v53;
  float v54;
  uint64_t v55;
  id v56;
  id v57;
  float v58;
  uint64_t v59;
  id v60;
  float v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  double v66;
  uint64_t v67;
  id v68;
  char v70;
  id v71;
  void *v72;

  longitude = a6.longitude;
  latitude = a6.latitude;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "displayScale");
  if (v13 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v16 = v15;

  }
  else
  {
    v16 = v13;
  }
  if (qword_1ECE2D7C0 != -1)
    dispatch_once(&qword_1ECE2D7C0, &__block_literal_global_7);
  v17 = objc_msgSend(v11, "userInterfaceStyle");
  v18 = 1000;
  if (v17 != 2)
    v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100 * a4 + (int)v16 + v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v12)
  {
    v71 = v11;
    v72 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForSearchResultWithAttributes:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)_MergedGlobals_7, "objectForKey:", v19);
    v42 = (id *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
LABEL_45:
      v42 = v42;
      v31 = (_UNKNOWN **)v42;
      goto LABEL_46;
    }
    v71 = v11;
    v72 = v20;
    objc_msgSend(MEMORY[0x1E0D270A8], "annotationViewProvidedCustomFeatureStyleAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  objc_msgSend(v21, "styleAttributesWithElevatedGround:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = a4;
  v25 = a4 - 1;
  v26 = a1;
  if (v25 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForCalloutWithAttributes:", v23);
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
  }
  v28 = v17 == 2;
  v29 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v29, "setNightMode:", v28);
  objc_msgSend(v29, "setSearchResult:", 1);
  v30 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v30, "setGlyphOnly:", 1);
  objc_msgSend(v30, "setNightMode:", v28);
  objc_msgSend(v30, "setSearchResult:", 1);
  v31 = &off_1E20D4000;
  +[MKIconManager iconManager](MKIconManager, "iconManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  *(float *)&v34 = v33;
  objc_msgSend(v32, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v23, CFSTR("default"), 8, v30, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKIconManager iconManager](MKIconManager, "iconManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v37 = v16;
  objc_msgSend(v36, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v23, CFSTR("default"), 8, v29, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    v39 = v38 == 0;
  else
    v39 = 1;
  v40 = !v39 || v12 == 0;
  v41 = !v40;
  v70 = v41;
  if (!v40)
  {
    v11 = v71;
    objc_msgSend(v26, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", latitude, longitude);
    v31 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    goto LABEL_44;
  }
  v42 = (id *)objc_alloc_init((Class)v26);
  objc_msgSend(v42, "strokeWidth");
  v42[4] = v43;
  if (v38)
  {
    if (objc_msgSend(v38, "calloutHaloColor"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v38, "calloutHaloColor"));
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v42[1];
      v42[1] = (id)v44;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v38, "fillColor"));
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v42[1];
      v42[1] = (id)v46;

      if (*((double *)v42 + 4) <= 0.0)
      {
LABEL_31:
        v31 = (_UNKNOWN **)MEMORY[0x1E0CEA478];
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v38, "glyphColor"));
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v42[5];
        v42[5] = (id)v49;

        objc_msgSend(v38, "opacity");
        if (v51 < 1.0)
        {
          objc_msgSend(v38, "opacity");
          if (v52 > 0.01)
          {
            v53 = v42[1];
            objc_msgSend(v38, "opacity");
            objc_msgSend(v53, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(v42[1], "CGColor")) * v54);
            v55 = objc_claimAutoreleasedReturnValue();
            v56 = v42[1];
            v42[1] = (id)v55;

            v57 = v42[3];
            if (v57)
            {
              objc_msgSend(v38, "opacity");
              objc_msgSend(v57, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(v42[3], "CGColor")) * v58);
              v59 = objc_claimAutoreleasedReturnValue();
              v60 = v42[3];
              v42[3] = (id)v59;

            }
            v31 = (_UNKNOWN **)v42[5];
            objc_msgSend(v38, "opacity");
            objc_msgSend(v31, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(v42[5], "CGColor")) * v61);
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = v42[5];
            v42[5] = (id)v62;

          }
        }
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v38, "haloColor"));
      v48 = objc_claimAutoreleasedReturnValue();
      v45 = v42[3];
      v42[3] = (id)v48;
    }

    goto LABEL_31;
  }
LABEL_36:
  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(v35, "image"), 0, v16);
    v31 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithRenderingMode:", 2);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v42[6];
    v42[6] = (id)v64;

  }
  if (!v24)
  {
    objc_msgSend(v42[6], "size");
    if (v66 > 28.0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(v42[6], "CGImage"), 0, v16 + v16);
      v31 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "imageWithRenderingMode:", 2);
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = v42[6];
      v42[6] = (id)v67;

    }
  }
  if (!v12)
    objc_msgSend((id)_MergedGlobals_7, "setObject:forKey:", v42, v72);
  v11 = v71;
LABEL_44:

  v20 = v72;
  if ((v70 & 1) == 0)
    goto LABEL_45;
LABEL_46:

  return v31;
}

- (UIColor)markerColor
{
  return self->_markerColor;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_markerColor, 0);
}

@end
