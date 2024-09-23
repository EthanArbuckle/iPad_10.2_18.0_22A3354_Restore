@implementation MKPlaceViewStyleProvider

+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  unint64_t v10;
  id v11;
  _MKPlaceAttributionLabel *v12;
  void *v13;
  const __CFString *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = a6;
  v9 = a3;
  v10 = (unint64_t)a4;
  if (v10 | (unint64_t)a5)
  {
    v11 = a5;
    v12 = objc_alloc_init(_MKPlaceAttributionLabel);
    -[_MKPlaceAttributionLabel setImage:](v12, "setImage:", v11);

    -[_MKPlaceAttributionLabel image](v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = CFSTR("%@");
    else
      v14 = 0;
    -[_MKPlaceAttributionLabel setImagePlaceholder:](v12, "setImagePlaceholder:", v14);

    v15 = -3.5;
    if (v6)
      v15 = -12.0;
    -[_MKPlaceAttributionLabel setImageBaselineOffset:](v12, "setImageBaselineOffset:", v15);
    -[_MKPlaceAttributionLabel image](v12, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && !v16)
    {
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v10);
      v17 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v17;
    }
    -[_MKPlaceAttributionLabel attributionWithString:](v12, "attributionWithString:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(v18, "length");
  v20 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 13.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAttribute:value:range:", v20, v21, 0, v19);

  return v18;
}

+ (id)attributionStringWithText:(id)a3 image:(id)a4 placeholder:(id)a5
{
  id v7;
  id v8;
  id v9;
  _MKPlaceAttributionLabel *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_MKPlaceAttributionLabel);
  -[_MKPlaceAttributionLabel setImage:](v10, "setImage:", v8);

  -[_MKPlaceAttributionLabel setImagePlaceholder:](v10, "setImagePlaceholder:", v7);
  -[_MKPlaceAttributionLabel attributionWithString:](v10, "attributionWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
