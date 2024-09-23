@implementation MKMapAttribution

- (id)attributedStringWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0CEA258];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setImage:", v4);
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "size");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "setBounds:", v6, v7, v9, v11);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  return v13;
}

- (id)disclosureArrow
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("AttributionArrow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceLayoutDirection");

  if (v5 == 1)
  {
    objc_msgSend(v3, "_mapkit_horizontallyFlippedImage");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKMapAttribution attributedStringWithImage:](self, "attributedStringWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attributionUrlFromRegionalAttributions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v7 = v3;
  else
    v7 = v6;
  v8 = v7;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (objc_msgSend(v9, "hasUrl"))
    {
      objc_msgSend(v9, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MKMapAttribution)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  MKMapAttribution *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSAttributedString *string;
  MKMapAttribution *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  UIImage *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIImage *providerImage;
  UIImage *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSURL *url;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  MKMapAttribution *v71;
  id v73;
  MKMapAttribution *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  MKMapAttributionImage *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  _BOOL4 obj;
  id obja;
  _BOOL4 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _BYTE v95[128];
  uint64_t v96;

  v87 = a6;
  v8 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v92.receiver = self;
  v92.super_class = (Class)MKMapAttribution;
  v13 = -[MKMapAttribution init](&v92, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeTileGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
      v17 = v12;
    else
      v17 = v16;
    v18 = v17;
    if (objc_msgSend(v18, "count"))
    {
      obj = v8;
      objc_msgSend(v18, "objectAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      if (objc_msgSend(v19, "hasName"))
      {
        objc_msgSend(v19, "name");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v19, "hasUrl"))
      {
        objc_msgSend(v19, "url");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v84 = (void *)v21;
      if (objc_msgSend(v19, "hasPlainTextURL"))
      {
        objc_msgSend(v19, "plainTextURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v81 = 0;
      }
      if (objc_msgSend(v19, "hasLinkDisplayStringIndex"))
      {
        v26 = objc_msgSend(v19, "linkDisplayStringIndex");
        objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bestLocalizedStringForDisplayStringAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v28, "hasStringValue"))
        {
          objc_msgSend(v28, "stringValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }

      }
      else
      {
        v29 = 0;
      }
      v78 = v16;
      v77 = v18;
      v30 = -[MKMapAttributionImage initWithAttributions:type:]([MKMapAttributionImage alloc], "initWithAttributions:type:", v18, 0);

      if (!v29)
      {
        if (v30 | v20)
          v31 = CFSTR("%@\nand other data providers");
        else
          v31 = CFSTR("Data from others");
        _MKLocalizedStringFromThisBundle(v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v13->_providerString, v29);
      v79 = (void *)v20;
      objc_storeStrong((id *)&v13->_providerName, (id)v20);
      v76 = v29;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v29, v11);
      objc_msgSend(v32, "string");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "rangeOfString:", CFSTR("%@"));
      v36 = v35;

      v80 = (MKMapAttributionImage *)v30;
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v30)
        {
          objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v30, "imageNameForScale:", a7);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "dataForResourceWithName:fallbackBundle:", v38, 0);
          v39 = objc_claimAutoreleasedReturnValue();

          v82 = (void *)v39;
          v40 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:scale:", v39, a7);
          v41 = *MEMORY[0x1E0CEA0A0];
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIImage _flatImageWithColor:](v40, "_flatImageWithColor:", v43);
            v44 = objc_claimAutoreleasedReturnValue();

            v40 = (UIImage *)v44;
          }
          providerImage = v13->_providerImage;
          v13->_providerImage = v40;
          v46 = v40;

          -[MKMapAttribution attributedStringWithImage:](v13, "attributedStringWithImage:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "replaceCharactersInRange:withAttributedString:", v34, v36, v47);
          v30 = (unint64_t)v80;
        }
        else if (v79)
        {
          objc_msgSend(v32, "replaceCharactersInRange:withString:", v34, v36, v79);
        }
      }
      if (obj)
      {
        v73 = v12;
        v74 = v13;
        v75 = v11;
        -[NSString componentsSeparatedByString:](v13->_providerString, "componentsSeparatedByString:", CFSTR("%@"));
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v89;
          v51 = *MEMORY[0x1E0CEA180];
          v52 = *MEMORY[0x1E0CEA068];
          v83 = *MEMORY[0x1E0CEA0C0];
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v89 != v50)
                objc_enumerationMutation(obja);
              v54 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "stringByTrimmingCharactersInSet:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v32, "string");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "rangeOfString:", v56);
              v60 = v59;

              if (v60)
              {
                v93[0] = v51;
                v93[1] = v52;
                v94[0] = &unk_1E2158C98;
                v94[1] = &unk_1E2158540;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                if (v87 && objc_msgSend(v84, "length"))
                  objc_msgSend(v32, "addAttribute:value:range:", v83, v84, v58, v60);
                objc_msgSend(v32, "addAttributes:range:", v61, v58, v60);

              }
            }
            v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
          }
          while (v49);
        }

        v13 = v74;
        v11 = v75;
        v12 = v73;
        v30 = (unint64_t)v80;
      }
      objc_storeStrong((id *)&v13->_string, v32);
      v62 = v84;
      if (v84)
      {
        v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v84);
        url = v13->_url;
        v13->_url = (NSURL *)v63;

      }
      v65 = v81;
      v16 = v78;
      if (objc_msgSend(v81, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D270B0], "urlFor:", 20);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "URLByAppendingPathComponent:", v81);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "path");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "fileExistsAtPath:", v69);

        if (v70)
          objc_storeStrong((id *)&v13->_plainTextFileURL, v67);

        v62 = v84;
        v30 = (unint64_t)v80;
        v65 = v81;
      }
      v71 = v13;

      v18 = v77;
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", &stru_1E20DFC00, v11);
      string = v13->_string;
      v13->_string = (NSAttributedString *)v22;

      v24 = v13;
    }

  }
  return v13;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)plainTextFileURL
{
  return self->_plainTextFileURL;
}

- (UIImage)providerImage
{
  return self->_providerImage;
}

- (NSString)providerString
{
  return self->_providerString;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerString, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_plainTextFileURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
