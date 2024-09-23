@implementation FCColorGradient

+ (id)colorGradientWithConfigDict:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v36 = (objc_class *)a1;
  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "objectForKey:", CFSTR("startPoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("y"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
    v10 = 0.5;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("endPoint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v14;
  v35 = v6;
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("x"), v14, v6, v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v7 = v17;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("y"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

  }
  else
  {
    v20 = 1.0;
  }
  v37 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("colorStops"), v33);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("color"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v27);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("location"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v28);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v22);
  }
  v29 = objc_msgSend(v39, "count");
  if (v29 != objc_msgSend(v4, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("there should be the same number of colors as locations"));
    *(_DWORD *)buf = 136315906;
    v45 = "+[FCColorGradient colorGradientWithConfigDict:]";
    v46 = 2080;
    v47 = "FCColorGradient.m";
    v48 = 1024;
    v49 = 89;
    v50 = 2114;
    v51 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v30 = (void *)objc_msgSend([v36 alloc], "initWithStartPoint:endPoint:colors:locations:", v39, v4, v10, v13, v7, v20);

  return v30;
}

- (FCColorGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  id v14;
  uint64_t v15;
  FCColorGradient *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "colors");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    v25 = 2080;
    v26 = "FCColorGradient.m";
    v27 = 1024;
    v28 = 20;
    v29 = 2114;
    v30 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14)
      goto LABEL_6;
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "locations");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    v25 = 2080;
    v26 = "FCColorGradient.m";
    v27 = 1024;
    v28 = 21;
    v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v15 = objc_msgSend(v13, "count");
  if (v15 != objc_msgSend(v14, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("the number of colors and locations should match"));
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    v25 = 2080;
    v26 = "FCColorGradient.m";
    v27 = 1024;
    v28 = 22;
    v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22.receiver = self;
  v22.super_class = (Class)FCColorGradient;
  v16 = -[FCColorGradient init](&v22, sel_init);
  if (v16)
  {
    if (objc_msgSend(v13, "count")
      && objc_msgSend(v14, "count")
      && (v17 = objc_msgSend(v13, "count"), v17 == objc_msgSend(v14, "count")))
    {
      v16->_startPoint.x = v11;
      v16->_startPoint.y = v10;
      v16->_endPoint.x = x;
      v16->_endPoint.y = y;
      objc_storeStrong((id *)&v16->_colors, a5);
      objc_storeStrong((id *)&v16->_locations, a6);
    }
    else
    {

      v16 = 0;
    }
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

- (FCColorGradient)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCColorGradient init]";
    v9 = 2080;
    v10 = "FCColorGradient.m";
    v11 = 1024;
    v12 = 15;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCColorGradient init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)colorGradientWithColors:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "colors");
    *(_DWORD *)buf = 136315906;
    v13 = "+[FCColorGradient colorGradientWithColors:locations:]";
    v14 = 2080;
    v15 = "FCColorGradient.m";
    v16 = 1024;
    v17 = 44;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "locations");
    *(_DWORD *)buf = 136315906;
    v13 = "+[FCColorGradient colorGradientWithColors:locations:]";
    v14 = 2080;
    v15 = "FCColorGradient.m";
    v16 = 1024;
    v17 = 45;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartPoint:endPoint:colors:locations:", v6, v7, 0.5, 0.0, 0.5, 1.0);

  return v8;
}

+ (id)blackGradient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  +[FCColor blackColor](FCColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[FCColor blackColor](FCColor, "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorGradientWithColors:locations:", v5, &unk_1E470C5D0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)whiteGradient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorGradientWithColors:locations:", v5, &unk_1E470C5E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSimilarToColorGradient:(id)a3 withinPercentage:(double)a4
{
  FCColorGradient *v6;
  FCColorGradient *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  FCColorGradient *v33;
  void *v34;
  _QWORD v35[4];
  FCColorGradient *v36;
  uint64_t *v37;
  _QWORD v38[4];
  FCColorGradient *v39;
  uint64_t *v40;
  double v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v6 = (FCColorGradient *)a3;
  v7 = v6;
  if (self == v6)
  {
    v15 = 1;
    goto LABEL_9;
  }
  if (!v6)
    goto LABEL_7;
  -[FCColorGradient startPoint](self, "startPoint");
  v9 = v8;
  v11 = v10;
  -[FCColorGradient startPoint](v7, "startPoint");
  if (v9 != v13 || v11 != v12)
    goto LABEL_7;
  -[FCColorGradient endPoint](self, "endPoint");
  v18 = v17;
  v20 = v19;
  -[FCColorGradient endPoint](v7, "endPoint");
  v15 = 0;
  if (v18 == v22 && v20 == v21)
  {
    -[FCColorGradient colors](self, "colors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[FCColorGradient colors](v7, "colors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v24 != v26)
      goto LABEL_7;
    -[FCColorGradient locations](self, "locations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");
    -[FCColorGradient locations](v7, "locations");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v28 != v30)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_9;
    }
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    -[FCColorGradient colors](self, "colors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke;
    v38[3] = &unk_1E463C4D0;
    v33 = v7;
    v39 = v33;
    v40 = &v42;
    v41 = a4;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v38);

    if (*((_BYTE *)v43 + 24))
    {
      -[FCColorGradient locations](self, "locations");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v32;
      v35[1] = 3221225472;
      v35[2] = __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke_2;
      v35[3] = &unk_1E463C4F8;
      v36 = v33;
      v37 = &v42;
      objc_msgSend(v34, "enumerateObjectsUsingBlock:", v35);

      v15 = *((_BYTE *)v43 + 24) != 0;
    }
    else
    {
      v15 = 0;
    }

    _Block_object_dispose(&v42, 8);
  }
LABEL_9:

  return v15;
}

void __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v8, "isSimilarToColor:withinPercentage:", v10, *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

void __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "locations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v8, "isEqualToNumber:", v10);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FCColorGradient startPoint](self, "startPoint");
    v7 = v6;
    objc_msgSend(v5, "startPoint");
    if (v7 != v8)
      goto LABEL_9;
    -[FCColorGradient startPoint](self, "startPoint");
    v10 = v9;
    objc_msgSend(v5, "startPoint");
    if (v10 != v11)
      goto LABEL_9;
    -[FCColorGradient endPoint](self, "endPoint");
    v13 = v12;
    objc_msgSend(v5, "endPoint");
    if (v13 == v14
      && (-[FCColorGradient endPoint](self, "endPoint"), v16 = v15, objc_msgSend(v5, "endPoint"), v16 == v17))
    {
      -[FCColorGradient colors](self, "colors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "colors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToArray:", v19))
      {
        -[FCColorGradient locations](self, "locations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "locations");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToArray:", v21);

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
LABEL_9:
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColorGradient startPoint](self, "startPoint");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColorGradient startPoint](self, "startPoint");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") ^ v5;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColorGradient endPoint](self, "endPoint");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColorGradient endPoint](self, "endPoint");
  objc_msgSend(v13, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 ^ v12 ^ objc_msgSend(v15, "hash");
  -[FCColorGradient colors](self, "colors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[FCColorGradient locations](self, "locations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

@end
