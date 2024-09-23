@implementation _BlastDoorDrawing

+ (id)createDrawing:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v14 = (void *)getDKDrawingClass_softClass;
  v29 = getDKDrawingClass_softClass;
  if (!getDKDrawingClass_softClass)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __getDKDrawingClass_block_invoke;
    v25[3] = &unk_1E5CCC218;
    v25[4] = &v26;
    __getDKDrawingClass_block_invoke((uint64_t)v25);
    v14 = (void *)v27[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v26, 8);
  v16 = (void *)objc_msgSend([v15 alloc], "init");
  objc_msgSend(v16, "setStrokesFrame:", v12, v11, v10, v9);
  objc_msgSend(v16, "setCanvasBounds:", x, y, width, height);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v21, "strokePoints");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createDKStroke:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "addBrushStroke:", v23);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v18);
  }

  return v16;
}

+ (id)decodeDrawingStrokes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[_BlastDoorDrawingStroke createBDStroke:](_BlastDoorDrawingStroke, "createBDStroke:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }

  return v4;
}

@end
