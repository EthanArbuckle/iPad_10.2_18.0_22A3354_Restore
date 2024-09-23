@implementation AIAudiogramMap

- (AIAudiogramMap)initWithFrequencies:(id)a3 hearingLevels:(id)a4
{
  id v6;
  id v7;
  AIAudiogramMap *v8;
  AIAudiogramMap *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AIAudiogramMap;
  v8 = -[AIAudiogramMap init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AIAudiogramMap setFrequencies:](v8, "setFrequencies:", v6);
    -[AIAudiogramMap setHearingLevels:](v9, "setHearingLevels:", v7);
    -[AIAudiogramMap _calculateAxisSlopeAndInterceptForAxisType:](v9, "_calculateAxisSlopeAndInterceptForAxisType:", 0);
    -[AIAudiogramMap _calculateAxisSlopeAndInterceptForAxisType:](v9, "_calculateAxisSlopeAndInterceptForAxisType:", 1);
  }

  return v9;
}

- (id)frequencyAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD v42[8];
  uint8_t v43[4];
  id v44;
  __int16 v45;
  void *v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  CGPoint v52;
  CGPoint v53;
  CGPoint v54;
  CGPoint v55;

  y = a3.y;
  x = a3.x;
  v51 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramMap frequencies](self, "frequencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
  {
    -[AIAudiogramMap _adjustedPointForSlopeWithPoint:](self, "_adjustedPointForSlopeWithPoint:", x, y);
    v14 = v13;
    v15 = v12;
    if (v13 != x || v12 != y)
    {
      AXLogAudiogram();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v52.x = x;
        v52.y = y;
        NSStringFromCGPoint(v52);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53.x = v14;
        v53.y = v15;
        NSStringFromCGPoint(v53);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_22FB4F000, v16, OS_LOG_TYPE_INFO, "Point %@ was adjusted to %@", buf, 0x16u);

      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v48 = __Block_byref_object_copy__6;
    v49 = __Block_byref_object_dispose__6;
    v50 = 0;
    -[AIAudiogramMap frequencies](self, "frequencies");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "values");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __35__AIAudiogramMap_frequencyAtPoint___block_invoke;
    v42[3] = &unk_24FD6D8E0;
    *(double *)&v42[6] = v14;
    *(double *)&v42[7] = v15;
    v42[4] = self;
    v42[5] = buf;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v42);

    v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v21)
    {
      AXLogAudiogram();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v54.x = v14;
        v54.y = v15;
        NSStringFromCGPoint(v54);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[AIAudiogramMap frequencies](self, "frequencies");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "maxValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v43 = 138412546;
        v44 = v23;
        v45 = 2112;
        v46 = v25;
        _os_log_impl(&dword_22FB4F000, v22, OS_LOG_TYPE_INFO, "Point %@ was after end of frequency range %@", v43, 0x16u);

      }
      -[AIAudiogramMap frequencies](self, "frequencies");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "values");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", (v8 - 1));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[AIAudiogramMap frequencies](self, "frequencies");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "values");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndex:", (v8 - 2));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:](self, "_valueOfPoint:betweenObject:andObject:onAxis:", v28, v31, 0, v14, v15);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v32;

      v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v34 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v34, "numberWithDouble:", round(v35));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

    AXLogAudiogram();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v55.x = v14;
      v55.y = v15;
      NSStringFromCGPoint(v55);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v43 = 138412546;
      v44 = v39;
      v45 = 2112;
      v46 = v40;
      _os_log_impl(&dword_22FB4F000, v38, OS_LOG_TYPE_INFO, "Returning frequency of %@ from point %@", v43, 0x16u);

    }
    v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[AIAudiogramMap frequencies](self, "frequencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numericalValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __35__AIAudiogramMap_frequencyAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = *(double *)(a1 + 48);
  objc_msgSend(v7, "center");
  if (v8 <= v9)
  {
    *a4 = 1;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "frequencies");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", a3 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXLogAudiogram();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromCGPoint(*(CGPoint *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "frequencies");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "minValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v14;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "Point %@ was at or before start of frequency range %@", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "frequencies");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "values");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", 1);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = v7;
      v7 = (id)v19;
    }
    objc_msgSend(*(id *)(a1 + 32), "_valueOfPoint:betweenObject:andObject:onAxis:", v7, v12, 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

- (id)hearingLevelAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _QWORD v41[8];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  CGPoint v53;
  CGPoint v54;
  CGPoint v55;

  y = a3.y;
  x = a3.x;
  v52 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramMap hearingLevels](self, "hearingLevels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
  {
    -[AIAudiogramMap _adjustedPointForSlopeWithPoint:](self, "_adjustedPointForSlopeWithPoint:", x, y);
    v13 = v12;
    v15 = v14;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    v47 = 0;
    -[AIAudiogramMap hearingLevels](self, "hearingLevels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "values");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __38__AIAudiogramMap_hearingLevelAtPoint___block_invoke;
    v41[3] = &unk_24FD6D8E0;
    *(double *)&v41[6] = v13;
    *(double *)&v41[7] = v15;
    v41[4] = self;
    v41[5] = &v42;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v41);

    if (!v43[5])
    {
      AXLogAudiogram();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v53.x = v13;
        v53.y = v15;
        NSStringFromCGPoint(v53);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        -[AIAudiogramMap hearingLevels](self, "hearingLevels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "maxValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v19;
        v50 = 2112;
        v51 = v21;
        _os_log_impl(&dword_22FB4F000, v18, OS_LOG_TYPE_INFO, "Point %@ was after end of hearing level range %@", buf, 0x16u);

      }
      -[AIAudiogramMap hearingLevels](self, "hearingLevels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "values");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", (v8 - 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[AIAudiogramMap hearingLevels](self, "hearingLevels");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "values");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", (v8 - 2));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:](self, "_valueOfPoint:betweenObject:andObject:onAxis:", v24, v27, 1, v13, v15);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v43[5];
      v43[5] = v28;

    }
    AXLogAudiogram();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)v43[5];
      v54.x = v13;
      v54.y = v15;
      NSStringFromCGPoint(v54);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v31;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_22FB4F000, v30, OS_LOG_TYPE_INFO, "dB value before rounding is %@ from point %@", buf, 0x16u);

    }
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)v43[5], "doubleValue");
    objc_msgSend(v33, "numberWithDouble:", round(v34 / 5.0) * 5.0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v43[5];
    v43[5] = v35;

    AXLogAudiogram();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (void *)v43[5];
      v55.x = v13;
      v55.y = v15;
      NSStringFromCGPoint(v55);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v38;
      v50 = 2112;
      v51 = v39;
      _os_log_impl(&dword_22FB4F000, v37, OS_LOG_TYPE_INFO, "Returning hearing level of %@ from point %@", buf, 0x16u);

    }
    v11 = (id)v43[5];
    _Block_object_dispose(&v42, 8);

  }
  else
  {
    -[AIAudiogramMap hearingLevels](self, "hearingLevels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numericalValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __38__AIAudiogramMap_hearingLevelAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = *(double *)(a1 + 56);
  objc_msgSend(v7, "center");
  if (v8 >= v9)
  {
    *a4 = 1;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "hearingLevels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", a3 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXLogAudiogram();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromCGPoint(*(CGPoint *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "hearingLevels");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "minValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v14;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "Point %@ was at or before start of hearing level range %@", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "hearingLevels");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "values");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", 1);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = v7;
      v7 = (id)v19;
    }
    objc_msgSend(*(id *)(a1 + 32), "_valueOfPoint:betweenObject:andObject:onAxis:", v7, v12, 1, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

- (id)_valueOfPoint:(CGPoint)a3 betweenObject:(id)a4 andObject:(id)a5 onAxis:(unint64_t)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  NSObject *v42;
  void *v43;
  double v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  long double v52;
  void *v53;
  void *v54;
  double v55;
  NSObject *v56;
  id v57;
  _BYTE v58[22];
  uint64_t v59;

  y = a3.y;
  x = a3.x;
  v59 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!a6)
  {
    objc_msgSend(v11, "center");
    v30 = x - v29;
    objc_msgSend(v10, "center");
    v32 = v31;
    objc_msgSend(v12, "center");
    v34 = v30 / (v32 - v33);
    AXLogAudiogram();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:].cold.1(v35, v34);

    if (v34 == 1.0)
      goto LABEL_7;
    if (v34 <= 0.0 || v34 >= 0.4)
    {
      if (v34 > 0.6 && v34 < 1.0)
      {
        AXLogAudiogram();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "numericalValue");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138412290;
          *(_QWORD *)&v58[4] = v43;
          _os_log_impl(&dword_22FB4F000, v42, OS_LOG_TYPE_INFO, "Snapped frequency value up to known value %@", v58, 0xCu);

        }
LABEL_7:
        v36 = v10;
LABEL_22:
        objc_msgSend(v36, "numericalValue", *(_OWORD *)v58);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (v34 <= -0.4 || v34 >= 0.0)
      {
        v44 = fabs(fmod(v34, 1.0));
        AXLogAudiogram();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
        if (v44 > 0.6 || v44 < 0.4)
        {
          if (v46)
          {
            *(_WORD *)v58 = 0;
            _os_log_impl(&dword_22FB4F000, v45, OS_LOG_TYPE_INFO, "Snapped frequency value outside of known range", v58, 2u);
          }

          v34 = round(v34);
        }
        else
        {
          if (v46)
          {
            *(_WORD *)v58 = 0;
            _os_log_impl(&dword_22FB4F000, v45, OS_LOG_TYPE_INFO, "Could not snap frequency as point was too far from expected marks", v58, 2u);
          }

        }
        objc_msgSend(v10, "numericalValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v49 = v48;
        objc_msgSend(v12, "numericalValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValue");
        v52 = v49 / v51;

        v53 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "numericalValue");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "doubleValue");
        objc_msgSend(v53, "numberWithDouble:", (double)(pow(v52, v34) * v55));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        snapToValidFrequency(v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          AXLogAudiogram();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v58 = 138412546;
            *(_QWORD *)&v58[4] = v28;
            *(_WORD *)&v58[12] = 2112;
            *(_QWORD *)&v58[14] = v20;
            _os_log_impl(&dword_22FB4F000, v56, OS_LOG_TYPE_INFO, "Snapped frequency value to further validate. %@ -> %@", v58, 0x16u);
          }

          v57 = v20;
          v28 = v57;
        }
        goto LABEL_3;
      }
      AXLogAudiogram();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "numericalValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v58 = 138412290;
        *(_QWORD *)&v58[4] = v38;
        v39 = "Snapped frequency value up to known value %@";
        goto LABEL_20;
      }
    }
    else
    {
      AXLogAudiogram();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "numericalValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v58 = 138412290;
        *(_QWORD *)&v58[4] = v38;
        v39 = "Snapped frequency value down to known value %@";
LABEL_20:
        _os_log_impl(&dword_22FB4F000, v37, OS_LOG_TYPE_INFO, v39, v58, 0xCu);

      }
    }

    v36 = v12;
    goto LABEL_22;
  }
  objc_msgSend(v11, "center");
  v14 = v13;
  objc_msgSend(v10, "center");
  v16 = v15;
  objc_msgSend(v12, "center");
  v18 = (void *)MEMORY[0x24BDD16E0];
  v19 = (y - v14) / (v16 - v17);
  objc_msgSend(v10, "numericalValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  objc_msgSend(v12, "numericalValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v22 - v24;
  objc_msgSend(v12, "numericalValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v18, "numberWithDouble:", v27 + v25 * v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
LABEL_23:

  return v28;
}

- (void)_calculateAxisSlopeAndInterceptForAxisType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[AIAudiogramMap hearingLevels](self, "hearingLevels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AIAudiogramMap frequencies](self, "frequencies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __61__AIAudiogramMap__calculateAxisSlopeAndInterceptForAxisType___block_invoke;
    v29[3] = &unk_24FD6D908;
    v30 = &unk_24FD778D0;
    objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    objc_msgSend(v6, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "center");
    v16 = v15;
    v18 = v17;

    objc_msgSend(v6, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "center");
    v21 = v20;
    v23 = v22;

    if (v16 == v21)
    {
      AXLogAudiogram();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = "Points are perfectly aligned vertically, slope is undefined";
        v12 = v9;
        v13 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      v24 = (v23 - v18) / (v21 - v16);
      -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v16, v18, v24);
      v26 = v25;
      AXLogAudiogram();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v32 = v24;
        v33 = 2048;
        v34 = v26;
        v35 = 2048;
        v36 = a3;
        _os_log_impl(&dword_22FB4F000, v27, OS_LOG_TYPE_DEFAULT, "Calculated slope %f, intercept %f for axis %lu", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        -[AIAudiogramMap setHearingLevelSlope:](self, "setHearingLevelSlope:", v28);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
        v9 = objc_claimAutoreleasedReturnValue();
        -[AIAudiogramMap setHearingLevelIntercept:](self, "setHearingLevelIntercept:", v9);
      }
      else
      {
        -[AIAudiogramMap setFrequencySlope:](self, "setFrequencySlope:", v28);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
        v9 = objc_claimAutoreleasedReturnValue();
        -[AIAudiogramMap setFrequencyIntercept:](self, "setFrequencyIntercept:", v9);
      }
    }
  }
  else
  {
    AXLogAudiogram();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v32 = *(double *)&v10;
      v11 = "Not enough points (%lu) to calculate slope";
      v12 = v9;
      v13 = 12;
LABEL_10:
      _os_log_impl(&dword_22FB4F000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    }
  }

}

uint64_t __61__AIAudiogramMap__calculateAxisSlopeAndInterceptForAxisType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  return v2 ^ 1;
}

- (CGPoint)_adjustedPointForSlopeWithPoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  void *v7;
  long double v8;
  double v9;
  void *v10;
  long double v11;
  double v12;
  _BOOL4 v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
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
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  long double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = fabs(fabs(atan(v8)) * 180.0 / 3.14159265 + -90.0);

  }
  else
  {
    v9 = 0.0;
  }

  -[AIAudiogramMap frequencySlope](self, "frequencySlope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = fabs(atan(v11)) * 180.0 / 3.14159265;

  v13 = v12 > 1.0 || v9 > 1.0;
  if (v9 >= 3.0 || (v12 < 3.0 ? (v14 = !v13) : (v14 = 0), !v14))
  {
    v97 = y;
    v98 = x;
    -[AIAudiogramMap frequencies](self, "frequencies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "minValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "center");
    v20 = v19;
    v95 = v21;

    -[AIAudiogramMap frequencies](self, "frequencies");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "maxValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "center");
    v25 = v24;

    -[AIAudiogramMap hearingLevels](self, "hearingLevels");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "center");
    v96 = v28;
    v30 = v29;

    -[AIAudiogramMap hearingLevels](self, "hearingLevels");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "maxValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "center");
    v94 = v33;
    v35 = v34;

    if (v9 < 3.0 || v12 >= 3.0)
    {
      if (v9 >= 3.0 || v12 < 3.0)
      {
        if (v13)
        {
          -[AIAudiogramMap frequencySlope](self, "frequencySlope");
          v50 = objc_claimAutoreleasedReturnValue();
          y = v97;
          x = v98;
          if (v50)
          {
            v51 = (void *)v50;
            -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "doubleValue");
              v55 = v54;

              -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v55);
              v57 = v56;
              -[AIAudiogramMap frequencySlope](self, "frequencySlope");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "doubleValue");
              v60 = v59;
              -[AIAudiogramMap frequencyIntercept](self, "frequencyIntercept");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "doubleValue");
              -[AIAudiogramMap _intersectionOfLinesWithSlope:intercept:slope2:intercept2:](self, "_intersectionOfLinesWithSlope:intercept:slope2:intercept2:", v60, v62, v55, v57);
              v64 = v63;

              -[AIAudiogramMap frequencySlope](self, "frequencySlope");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "doubleValue");
              v67 = v66;

              -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v67);
              v69 = v68;
              -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "doubleValue");
              v72 = v71;
              -[AIAudiogramMap hearingLevelIntercept](self, "hearingLevelIntercept");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "doubleValue");
              -[AIAudiogramMap _intersectionOfLinesWithSlope:intercept:slope2:intercept2:](self, "_intersectionOfLinesWithSlope:intercept:slope2:intercept2:", v72, v74, v67, v69);
              y = v75;

              x = v64;
            }
          }
        }
        else
        {
          y = v97;
          x = v98;
        }
      }
      else
      {
        -[AIAudiogramMap frequencySlope](self, "frequencySlope");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v44 = v43;
        if (vabdd_f64(v95, v30) < vabdd_f64(v95, v35))
        {

          -[AIAudiogramMap frequencySlope](self, "frequencySlope");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          v47 = -v88;
        }
        else
        {
          v44 = -v43;

          -[AIAudiogramMap frequencySlope](self, "frequencySlope");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          v47 = v46;
        }

        v89 = (v97 - v30) / (v35 - v30);
        if (fabs(v89 + -0.5) >= 0.05)
        {
          v90 = atan(v44);
          v91 = atan(v47);
          v92 = tan(v90 + (v91 - v90) * v89);
          x = v98;
          -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v92);
          y = v93 + v92 * ((v96 + v94) * 0.5);
        }
        else
        {
          y = v97;
          x = v98;
        }
      }
    }
    else
    {
      -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
      x = v98;
      if (vabdd_f64(v96, v20) < vabdd_f64(v96, v25))
      {

        -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = -v48;
      }
      else
      {
        v38 = -v37;

        -[AIAudiogramMap hearingLevelSlope](self, "hearingLevelSlope");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;
      }

      v49 = (v98 - v20) / (v25 - v20);
      if (fabs(v49 + -0.5) >= 0.05)
      {
        v76 = atan(v38);
        v77 = atan(v41);
        v78 = v76 + 3.14159265;
        if (v76 >= 0.0)
          v78 = v76;
        if (v77 < 0.0)
          v77 = v77 + 3.14159265;
        v79 = tan(v78 + (v77 - v78) * v49);
        y = v97;
        -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v79);
        v81 = v80;
        -[AIAudiogramMap frequencySlope](self, "frequencySlope");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "doubleValue");
        v84 = v83;
        -[AIAudiogramMap frequencyIntercept](self, "frequencyIntercept");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "doubleValue");
        -[AIAudiogramMap _intersectionOfLinesWithSlope:intercept:slope2:intercept2:](self, "_intersectionOfLinesWithSlope:intercept:slope2:intercept2:", v84, v86, v79, v81);
        x = v87;

      }
      else
      {
        y = v97;
      }
    }
  }
  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)_interceptForLineThroughPoint:(CGPoint)a3 withSlope:(double)a4
{
  return a3.y - a4 * a3.x;
}

- (CGPoint)_intersectionOfLinesWithSlope:(double)a3 intercept:(double)a4 slope2:(double)a5 intercept2:(double)a6
{
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = (a4 - a6) / (a5 - a3);
  v7 = a4 + a3 * v6;
  v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v19.receiver = self;
  v19.super_class = (Class)AIAudiogramMap;
  -[AIAudiogramMap description](&v19, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramMap frequencies](self, "frequencies");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramMap frequencies](self, "frequencies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numericalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramMap hearingLevels](self, "hearingLevels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numericalValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramMap hearingLevels](self, "hearingLevels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numericalValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ Frequency: %@Hz to %@Hz, Hearing Level: %@dB to %@dB"), v14, v3, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (AIAudiogramAxis)frequencies
{
  return self->_frequencies;
}

- (void)setFrequencies:(id)a3
{
  objc_storeStrong((id *)&self->_frequencies, a3);
}

- (AIAudiogramAxis)hearingLevels
{
  return self->_hearingLevels;
}

- (void)setHearingLevels:(id)a3
{
  objc_storeStrong((id *)&self->_hearingLevels, a3);
}

- (NSNumber)frequencySlope
{
  return self->_frequencySlope;
}

- (void)setFrequencySlope:(id)a3
{
  objc_storeStrong((id *)&self->_frequencySlope, a3);
}

- (NSNumber)hearingLevelSlope
{
  return self->_hearingLevelSlope;
}

- (void)setHearingLevelSlope:(id)a3
{
  objc_storeStrong((id *)&self->_hearingLevelSlope, a3);
}

- (NSNumber)frequencyIntercept
{
  return self->_frequencyIntercept;
}

- (void)setFrequencyIntercept:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyIntercept, a3);
}

- (NSNumber)hearingLevelIntercept
{
  return self->_hearingLevelIntercept;
}

- (void)setHearingLevelIntercept:(id)a3
{
  objc_storeStrong((id *)&self->_hearingLevelIntercept, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingLevelIntercept, 0);
  objc_storeStrong((id *)&self->_frequencyIntercept, 0);
  objc_storeStrong((id *)&self->_hearingLevelSlope, 0);
  objc_storeStrong((id *)&self->_frequencySlope, 0);
  objc_storeStrong((id *)&self->_hearingLevels, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
}

- (void)_valueOfPoint:(os_log_t)log betweenObject:(double)a2 andObject:onAxis:.cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_22FB4F000, log, OS_LOG_TYPE_DEBUG, "Finding frequency value. Percent between points = %f", (uint8_t *)&v2, 0xCu);
}

@end
