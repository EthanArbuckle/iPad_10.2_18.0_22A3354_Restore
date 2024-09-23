@implementation MKMapAttributionImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNameForScale, 0);
}

- (MKMapAttributionImage)initWithAttributions:(id)a3 type:(int64_t)a4
{
  id v5;
  MKMapAttributionImage *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  MKMapAttributionImage *v41;
  MKMapAttributionImage *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v50;
  void *v51;
  id obj;
  id obja;
  id v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)MKMapAttributionImage;
  v6 = -[MKMapAttributionImage init](&v65, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      _attributionImagesForType(v46, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v43 = v6;
        v45 = v8;
        objc_msgSend(v8, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByDeletingPathExtension");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v11 = 3;
        do
        {
          v12 = v11;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v9, "rangeOfString:", v13);

          if ((v10 & 1) != 0)
            break;
          v10 = 1;
          v11 = 2;
        }
        while (v14 == 0x7FFFFFFFFFFFFFFFLL);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          v15 = 1;
        else
          v15 = v12;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v7;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, v16);

        v47 = (void *)objc_msgSend(v45, "mutableCopy");
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v44 = v5;
        obj = v5;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        v18 = v46;
        if (v17)
        {
          v19 = v17;
          v54 = *(id *)v62;
          do
          {
            v20 = 0;
            v48 = v19;
            do
            {
              if (*(id *)v62 != v54)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v20);
              if (v21 != v18)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v20), "name");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  objc_msgSend(v21, "name");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "name");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v13, "isEqualToString:", v16) & 1) == 0)
                  {

LABEL_27:
                    goto LABEL_28;
                  }
                }
                objc_msgSend(v21, "url");
                v23 = objc_claimAutoreleasedReturnValue();
                if (!v23)
                {
                  if (v22)
                  {

                  }
LABEL_26:
                  _attributionImagesForType(v21, a4);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "addObjectsFromArray:", v22);
                  goto LABEL_27;
                }
                v24 = (void *)v23;
                objc_msgSend(v21, "url");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "url");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqualToString:", v26);

                if (!v22)
                {
                  v18 = v46;
                  v19 = v48;
                  if (!v27)
                    goto LABEL_28;
                  goto LABEL_26;
                }

                v18 = v46;
                v19 = v48;
                if ((v27 & 1) != 0)
                  goto LABEL_26;
              }
LABEL_28:
              ++v20;
            }
            while (v19 != v20);
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          }
          while (v19);
        }

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = v47;
        v28 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v58;
          v50 = *(_QWORD *)v58;
          do
          {
            v31 = 0;
            obja = (id)v29;
            do
            {
              if (*(_QWORD *)v58 != v30)
                objc_enumerationMutation(v55);
              v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v31);
              if ((objc_msgSend(v32, "isEqualToString:", v56) & 1) == 0)
              {
                objc_msgSend(v32, "stringByDeletingPathExtension");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = 0;
                v35 = 3;
                do
                {
                  v36 = v35;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v33, "rangeOfString:", v37);

                  if ((v34 & 1) != 0)
                    break;
                  v34 = 1;
                  v35 = 2;
                }
                while (v38 == 0x7FFFFFFFFFFFFFFFLL);
                if (v38 == 0x7FFFFFFFFFFFFFFFLL)
                  v39 = 1;
                else
                  v39 = v36;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v32, v40);

                v30 = v50;
                v29 = (uint64_t)obja;
              }
              ++v31;
            }
            while (v31 != v29);
            v29 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          }
          while (v29);
        }

        v6 = v43;
        v5 = v44;
        v7 = v51;
        v8 = v45;
      }

    }
    if (objc_msgSend(v7, "count"))
    {
      objc_storeStrong((id *)&v6->_imageNameForScale, v7);
      v41 = v6;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)imageNameForScale:(double)a3
{
  NSDictionary *imageNameForScale;
  void *v4;
  void *v5;

  imageNameForScale = self->_imageNameForScale;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", vcvtpd_u64_f64(a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](imageNameForScale, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)badgeImageForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MKMapAttributionImage *v7;
  void *v8;
  void *v9;
  void *v10;
  MKMapAttributionImage *v11;
  double v12;
  double v13;
  MKMapAttributionImage *v14;
  void (**v15)(_QWORD, double);
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  MKMapAttributionImage *v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "attributionsCount");

  if (v6)
  {
    v7 = [MKMapAttributionImage alloc];
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTileGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MKMapAttributionImage initWithAttributions:type:](v7, "initWithAttributions:type:", v10, 1);

    objc_msgSend(v3, "_currentScreenScale");
    v13 = v12;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__MKMapAttributionImage_badgeImageForView___block_invoke;
    v19[3] = &unk_1E20DB838;
    v14 = v11;
    v20 = v14;
    v15 = (void (**)(_QWORD, double))MEMORY[0x18D778DB8](v19);
    v16 = vcvtpd_u64_f64(v13);
    if (v16)
    {
      while (1)
      {
        v15[2](v15, (double)v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
          break;
        if (!--v16)
          goto LABEL_5;
      }
      v6 = (void *)v17;
    }
    else
    {
LABEL_5:
      v6 = 0;
    }

  }
  return v6;
}

id __43__MKMapAttributionImage_badgeImageForView___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "imageNameForScale:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForResourceWithName:fallbackBundle:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithData:scale:", v5, a2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
