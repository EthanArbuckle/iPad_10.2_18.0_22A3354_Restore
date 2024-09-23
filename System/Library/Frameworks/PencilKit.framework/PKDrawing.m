@implementation PKDrawing

Class __33__PKDrawing_drawingClassForPaper__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("PKDrawingCoherence"));
  qword_1ECEE61B8 = (uint64_t)result;
  return result;
}

- (PKDrawing)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDrawing;
  return -[PKDrawing init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  -[PKDrawing _teardownRecognitionObjects](self, "_teardownRecognitionObjects");
  v3.receiver = self;
  v3.super_class = (Class)PKDrawing;
  -[PKDrawing dealloc](&v3, sel_dealloc);
}

- (void)_teardownRecognitionObjects
{
  PKRecognitionSessionManager *recognitionManager;
  CHRecognitionSession *recognitionSession;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMapTable *ongoingQueries;
  PKVisualizationManager **p_visualizationManager;
  PKVisualizationManager *visualizationManager;
  PKVisualizationManager *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  recognitionManager = self->_recognitionManager;
  self->_recognitionManager = 0;

  recognitionSession = self->_recognitionSession;
  self->_recognitionSession = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_ongoingQueries;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8++), "setDelegate:", 0, (_QWORD)v13);
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  ongoingQueries = self->_ongoingQueries;
  self->_ongoingQueries = 0;

  visualizationManager = self->_visualizationManager;
  p_visualizationManager = &self->_visualizationManager;
  -[PKVisualizationManager setDelegate:](visualizationManager, "setDelegate:", 0);
  v12 = *p_visualizationManager;
  *p_visualizationManager = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationManager, 0);
  objc_storeStrong((id *)&self->_ongoingQueries, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
  objc_storeStrong((id *)&self->_recognitionManager, 0);
  objc_storeStrong((id *)&self->_cachedVisibleStrokes, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_forcedRecognitionLocales, 0);
}

+ (int64_t)_currentSerializationVersion
{
  return 2;
}

+ (Class)drawingClassForPaper
{
  if (_MergedGlobals_124 != -1)
    dispatch_once(&_MergedGlobals_124, &__block_literal_global_31);
  return (Class)(id)qword_1ECEE61B8;
}

+ (PKDrawing)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (PKDrawing *)+[PKDrawing allocWithZone:](PKDrawingConcrete, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PKDrawing;
  return (PKDrawing *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)_unclippedStroke:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copyForMutation");
  objc_msgSend(v4, "_setClipPlane:", 0);
  objc_msgSend(v4, "_setRenderMask:", 0);
  objc_msgSend(v4, "didUpdateInDrawing:", self);
  return v4;
}

- (id)_clipStroke:(id)a3 newRootStroke:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  id v35;
  id v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "_clipPlane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "copyForMutation");
    objc_msgSend(v8, "generateMask");
    objc_msgSend(v8, "_setClipPlane:", 0);
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v30[0] = *MEMORY[0x1E0C9BAA8];
    v30[1] = v9;
    v30[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v6, "generateClipPaths:transform:", &v31, v30);
    if (v32 == v31)
    {
      -[PKDrawing _unclippedStroke:](self, "_unclippedStroke:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *a4;
      *a4 = v21;

      v36 = *a4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "sliceWithEraser:", &v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") != 1)
        goto LABEL_7;
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_strokeUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_strokeUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        -[PKDrawing _unclippedStroke:](self, "_unclippedStroke:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *a4;
        *a4 = v15;

        v35 = *a4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_7:
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __49__PKDrawing_Clipping___clipStroke_newRootStroke___block_invoke;
        v27 = &unk_1E7776E98;
        v28 = v6;
        v29 = v10;
        v20 = _Block_copy(&v24);
        objc_msgSend(v8, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", v20, self, a4, v24, v25, v26, v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v34 = (void **)&v31;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v34);

  }
  else
  {
    -[PKDrawing _unclippedStroke:](self, "_unclippedStroke:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *a4;
    *a4 = v18;

    v37[0] = *a4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __49__PKDrawing_Clipping___clipStroke_newRootStroke___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a2, "_strokeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_strokeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
    v6 = *(id *)(a1 + 40);
  else
    v6 = 0;
  return v6;
}

- (id)_clipAgainstLegacyCanvas:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  double MinX;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  double MaxX;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  __int128 v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  __int128 v53;
  __int128 v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  __int128 v63;
  _QWORD *v64;
  _QWORD *v65;
  __int128 v66;
  char *v67;
  char *v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  _QWORD *v73;
  uint64_t v74;
  void *__p;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasSubstrokes"))
  {
    objc_msgSend(v4, "_substrokesInDrawing:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v83 != v9)
            objc_enumerationMutation(v7);
          -[PKDrawing _clipAgainstLegacyCanvas:](self, "_clipAgainstLegacyCanvas:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "addObject:", v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      }
      while (v8);
    }

    if ((objc_msgSend(v7, "isEqualToArray:", v6) & 1) != 0)
    {
      v12 = v4;
    }
    else
    {
      v12 = (id)objc_msgSend(v4, "_newStrokeWithSubstrokes:inDrawing:", v6, self);
      objc_msgSend(v12, "didUpdateInDrawing:", self);
    }

  }
  else
  {
    v79 = 0;
    v80 = 0;
    v81 = 0;
    __p = 0;
    v77 = 0;
    v78 = 0;
    v90.size.width = 1024.0;
    v90.size.height = 768.0;
    v90.origin.x = 0.0;
    v90.origin.y = 0.0;
    MinX = CGRectGetMinX(v90);
    v91.size.width = 1024.0;
    v91.size.height = 768.0;
    v91.origin.x = 0.0;
    v91.origin.y = 0.0;
    v14 = (int)(CGRectGetMinY(v91) * 100.0);
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, 1uLL);
    v17 = &v16[8 * ((v77 - (_BYTE *)__p) >> 3)];
    *(_QWORD *)v17 = (int)(MinX * 100.0);
    *((_QWORD *)v17 + 1) = v14;
    *((_QWORD *)v17 + 2) = 0x3F800000BF800000;
    __p = v17;
    v78 = (unint64_t)&v16[24 * v15];
    v77 = v17 + 24;
    v92.size.width = 1024.0;
    v92.size.height = 768.0;
    v92.origin.x = 0.0;
    v92.origin.y = 0.0;
    MaxX = CGRectGetMaxX(v92);
    v93.size.width = 1024.0;
    v93.size.height = 768.0;
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    v19 = (int)(MaxX * 100.0);
    v20 = (int)(CGRectGetMinY(v93) * 100.0);
    v21 = v77;
    if ((unint64_t)v77 >= v78)
    {
      v23 = (char *)__p;
      v24 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (_BYTE *)__p) >> 3) + 1;
      if (v24 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3) > v24)
        v24 = 0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (_QWORD)__p) >> 3) >= 0x555555555555555)
        v25 = 0xAAAAAAAAAAAAAAALL;
      else
        v25 = v24;
      if (v25)
      {
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v25);
        v23 = (char *)__p;
        v21 = v77;
      }
      else
      {
        v26 = 0;
      }
      v27 = &v26[8 * ((v77 - (_BYTE *)__p) >> 3)];
      v28 = &v26[24 * v25];
      *(_QWORD *)v27 = v19;
      *((_QWORD *)v27 + 1) = v20;
      *((_QWORD *)v27 + 2) = 0x3F800000BF800000;
      v22 = v27 + 24;
      if (v21 != v23)
      {
        do
        {
          v29 = *(_OWORD *)(v21 - 24);
          *((_QWORD *)v27 - 1) = *((_QWORD *)v21 - 1);
          *(_OWORD *)(v27 - 24) = v29;
          v27 -= 24;
          v21 -= 24;
        }
        while (v21 != v23);
        v23 = (char *)__p;
      }
      __p = v27;
      v77 = v22;
      v78 = (unint64_t)v28;
      if (v23)
        operator delete(v23);
    }
    else
    {
      *(_QWORD *)v77 = v19;
      *((_QWORD *)v21 + 1) = v20;
      *((_QWORD *)v21 + 2) = 0x3F800000BF800000;
      v22 = v21 + 24;
    }
    v77 = v22;
    v94.size.width = 1024.0;
    v94.size.height = 768.0;
    v94.origin.x = 0.0;
    v94.origin.y = 0.0;
    v30 = CGRectGetMaxX(v94);
    v95.size.width = 1024.0;
    v95.size.height = 768.0;
    v95.origin.x = 0.0;
    v95.origin.y = 0.0;
    v31 = (int)(v30 * 100.0);
    v32 = (int)(CGRectGetMaxY(v95) * 100.0);
    v33 = v77;
    if ((unint64_t)v77 >= v78)
    {
      v35 = (char *)__p;
      v36 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (_BYTE *)__p) >> 3) + 1;
      if (v36 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3) > v36)
        v36 = 0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (_QWORD)__p) >> 3) >= 0x555555555555555)
        v37 = 0xAAAAAAAAAAAAAAALL;
      else
        v37 = v36;
      if (v37)
      {
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v37);
        v35 = (char *)__p;
        v33 = v77;
      }
      else
      {
        v38 = 0;
      }
      v39 = &v38[8 * ((v77 - (_BYTE *)__p) >> 3)];
      v40 = &v38[24 * v37];
      *(_QWORD *)v39 = v31;
      *((_QWORD *)v39 + 1) = v32;
      *((_QWORD *)v39 + 2) = 0x3F800000BF800000;
      v34 = v39 + 24;
      if (v33 != v35)
      {
        do
        {
          v41 = *(_OWORD *)(v33 - 24);
          *((_QWORD *)v39 - 1) = *((_QWORD *)v33 - 1);
          *(_OWORD *)(v39 - 24) = v41;
          v39 -= 24;
          v33 -= 24;
        }
        while (v33 != v35);
        v35 = (char *)__p;
      }
      __p = v39;
      v77 = v34;
      v78 = (unint64_t)v40;
      if (v35)
        operator delete(v35);
    }
    else
    {
      *(_QWORD *)v77 = v31;
      *((_QWORD *)v33 + 1) = v32;
      *((_QWORD *)v33 + 2) = 0x3F800000BF800000;
      v34 = v33 + 24;
    }
    v77 = v34;
    v96.size.width = 1024.0;
    v96.size.height = 768.0;
    v96.origin.x = 0.0;
    v96.origin.y = 0.0;
    v42 = CGRectGetMinX(v96);
    v97.size.width = 1024.0;
    v97.size.height = 768.0;
    v97.origin.x = 0.0;
    v97.origin.y = 0.0;
    v43 = (int)(v42 * 100.0);
    v44 = (int)(CGRectGetMaxY(v97) * 100.0);
    v46 = v77;
    v45 = (char *)v78;
    if ((unint64_t)v77 >= v78)
    {
      v48 = (char *)__p;
      v49 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (_BYTE *)__p) >> 3) + 1;
      if (v49 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3) > v49)
        v49 = 0x5555555555555556 * ((uint64_t)(v78 - (_QWORD)__p) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (_QWORD)__p) >> 3) >= 0x555555555555555)
        v50 = 0xAAAAAAAAAAAAAAALL;
      else
        v50 = v49;
      if (v50)
      {
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v50);
        v48 = (char *)__p;
        v46 = v77;
      }
      else
      {
        v51 = 0;
      }
      v52 = &v51[8 * ((v77 - (_BYTE *)__p) >> 3)];
      v45 = &v51[24 * v50];
      *(_QWORD *)v52 = v43;
      *((_QWORD *)v52 + 1) = v44;
      *((_QWORD *)v52 + 2) = 0x3F800000BF800000;
      v47 = v52 + 24;
      if (v46 != v48)
      {
        do
        {
          v53 = *(_OWORD *)(v46 - 24);
          *((_QWORD *)v52 - 1) = *((_QWORD *)v46 - 1);
          *(_OWORD *)(v52 - 24) = v53;
          v52 -= 24;
          v46 -= 24;
        }
        while (v46 != v48);
        v48 = (char *)__p;
      }
      __p = v52;
      v77 = v47;
      v78 = (unint64_t)v45;
      if (v48)
      {
        operator delete(v48);
        v45 = (char *)v78;
      }
    }
    else
    {
      *(_QWORD *)v77 = v43;
      *((_QWORD *)v46 + 1) = v44;
      *((_QWORD *)v46 + 2) = 0x3F800000BF800000;
      v47 = v46 + 24;
    }
    v77 = v47;
    if (v47 >= v45)
    {
      v56 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (_BYTE *)__p) >> 3);
      v57 = v56 + 1;
      if (v56 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v58 = 0xAAAAAAAAAAAAAAABLL * ((v45 - (_BYTE *)__p) >> 3);
      if (2 * v58 > v57)
        v57 = 2 * v58;
      if (v58 >= 0x555555555555555)
        v59 = 0xAAAAAAAAAAAAAAALL;
      else
        v59 = v57;
      if (v59)
        v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v59);
      else
        v60 = 0;
      v61 = &v60[24 * v56];
      v62 = &v60[24 * v59];
      v63 = *(_OWORD *)__p;
      *((_QWORD *)v61 + 2) = *((_QWORD *)__p + 2);
      *(_OWORD *)v61 = v63;
      v55 = v61 + 24;
      v65 = __p;
      v64 = v77;
      if (v77 != __p)
      {
        do
        {
          v66 = *(_OWORD *)(v64 - 3);
          *((_QWORD *)v61 - 1) = *(v64 - 1);
          *(_OWORD *)(v61 - 24) = v66;
          v61 -= 24;
          v64 -= 3;
        }
        while (v64 != v65);
        v64 = __p;
      }
      __p = v61;
      v77 = v55;
      v78 = (unint64_t)v62;
      if (v64)
        operator delete(v64);
    }
    else
    {
      v54 = *(_OWORD *)__p;
      *((_QWORD *)v47 + 2) = *((_QWORD *)__p + 2);
      *(_OWORD *)v47 = v54;
      v55 = v47 + 24;
    }
    v77 = v55;
    if (ClipperLib::Area((uint64_t *)&__p) >= 0.0 && __p != v55)
    {
      v67 = v55 - 24;
      if (v55 - 24 > __p)
      {
        v68 = (char *)__p + 24;
        do
        {
          v86 = *(_OWORD *)(v68 - 24);
          v69 = v86;
          v87 = *((_QWORD *)v68 - 1);
          v70 = v87;
          v71 = *((_QWORD *)v67 + 2);
          *(_OWORD *)(v68 - 24) = *(_OWORD *)v67;
          *((_QWORD *)v68 - 1) = v71;
          *((_QWORD *)v67 + 2) = v70;
          *(_OWORD *)v67 = v69;
          v67 -= 24;
          v72 = v68 >= v67;
          v68 += 24;
        }
        while (!v72);
      }
    }
    v73 = v80;
    if ((unint64_t)v80 >= v81)
    {
      v74 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v79, (uint64_t)&__p);
    }
    else
    {
      *v80 = 0;
      v73[1] = 0;
      v73[2] = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v73, __p, (uint64_t)v77, 0xAAAAAAAAAAAAAAABLL * ((v77 - (_BYTE *)__p) >> 3));
      v74 = (uint64_t)(v73 + 3);
    }
    v80 = (_QWORD *)v74;
    -[PKDrawing _clipStroke:againstPaths:](self, "_clipStroke:againstPaths:", v4, &v79, __p);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (__p)
    {
      v77 = (char *)__p;
      operator delete(__p);
    }
    *(_QWORD *)&v86 = &v79;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v86);
  }

  return v12;
}

- (id)_clipStroke:(id)a3 againstPaths:(const void *)a4
{
  id v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD aBlock[4];
  id v28;
  id v29;
  void **v30;
  void *v31[2];
  void *v32[2];
  __int128 v33;
  void *__p[2];
  uint64_t v35;
  _QWORD v36[4];
  char v37;
  char v38;
  char v39;
  uint64_t v40;
  void (**v41)(ClipperLib::Clipper *__hidden);
  __int128 v42;
  __int128 v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD v55[3];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v6 = a3;
  objc_msgSend(v6, "_clipPlane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = 0;
  v61 = 0;
  if (v7)
  {
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v55[0] = *MEMORY[0x1E0C9BAA8];
    v55[1] = v8;
    v55[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v6, "generateClipPaths:transform:", &v56, v55);
    if (v57 != v56)
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v49 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v42 = 0u;
      v43 = 0u;
      v30 = (void **)&off_1E7774540;
      *(_OWORD *)v31 = 0u;
      *(_OWORD *)v32 = 0u;
      v33 = 0u;
      *(_OWORD *)__p = 0u;
      v35 = 0;
      v36[0] = v36;
      v36[1] = v36;
      v36[2] = 0;
      v37 = 0;
      v44 = 0;
      v38 = 0;
      v39 = 0;
      v48 = 0;
      v40 = 0;
      v41 = &off_1E7774588;
      ClipperLib::ClipperBase::AddPaths((uint64_t)&v41, (uint64_t *)a4, 0, 1);
      v9 = v56;
      if (v57 != v56)
      {
        v10 = 0;
        v11 = 0;
        v12 = (char *)&v31[-1] + (_QWORD)*(v30 - 3);
        do
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 16))(v12, v9 + v10, 1, 1);
          ++v11;
          v9 = v56;
          v10 += 24;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v57 - v56) >> 3));
      }
      ClipperLib::Clipper::Execute((uint64_t)&v30, 2, &v59, 0, 0);
      v30 = (void **)&off_1E7774540;
      v41 = &off_1E7774588;
      std::__list_imp<long long>::clear(v36);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v32[1])
      {
        *(void **)&v33 = v32[1];
        operator delete(v32[1]);
      }
      if (v31[0])
      {
        v31[1] = v31[0];
        operator delete(v31[0]);
      }
      ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v41);
    }
    v30 = (void **)&v56;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v30);
  }
  v13 = (void *)objc_msgSend(v6, "copyForMutation");
  objc_msgSend(v13, "generateMask");
  objc_msgSend(v13, "_setClipPlane:", 0);
  if (v60 == v59)
    v14 = (uint64_t *)a4;
  else
    v14 = &v59;
  objc_msgSend(v13, "sliceWithMask:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 1)
    goto LABEL_20;
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_strokeUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_strokeUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if (v19)
  {
    -[PKDrawing _unclippedStroke:](self, "_unclippedStroke:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_20:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__PKDrawing_Clipping___clipStroke_againstPaths___block_invoke;
    aBlock[3] = &unk_1E7776E98;
    v21 = v6;
    v28 = v21;
    v29 = v15;
    v22 = _Block_copy(aBlock);
    v30 = 0;
    objc_msgSend(v13, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", v22, self, &v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v30)
    {
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v24, "lastObject");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = v21;
      }
      v20 = v25;
    }
    else
    {
      v20 = (void *)objc_msgSend(v21, "mutableCopy");
      objc_msgSend(v20, "_setHidden:", 1);
      objc_msgSend(v20, "didUpdateSubstrokesInDrawing:", self);
    }

  }
  v30 = (void **)&v59;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v20;
}

id __48__PKDrawing_Clipping___clipStroke_againstPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a2, "_strokeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_strokeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
    v6 = *(id *)(a1 + 40);
  else
    v6 = 0;
  return v6;
}

- (PKDrawing)initWithDrawing:(id)a3
{
  id *v4;
  PKDrawing *v5;
  uint64_t v6;
  NSMutableArray *cachedVisibleStrokes;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDrawing;
  v5 = -[PKDrawing init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4[4], "mutableCopy");
    cachedVisibleStrokes = v5->_cachedVisibleStrokes;
    v5->_cachedVisibleStrokes = (NSMutableArray *)v6;

  }
  return v5;
}

- (PKDrawing)initWithStrokes:(NSArray *)strokes
{
  NSArray *v4;
  PKDrawing *v5;
  __int128 v6;
  _OWORD v8[3];

  v4 = strokes;
  v5 = -[PKDrawing init](self, "init");
  objc_opt_class();
  objc_opt_isKindOfClass();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKDrawing _copyAndAddStrokes:transform:](v5, "_copyAndAddStrokes:transform:", v4, v8);

  return v5;
}

- (PKDrawing)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (PKDrawing)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  id v5;

  v5 = a3;
  PKCrash();
}

+ (id)fileType
{
  return CFSTR("com.apple.drawing");
}

- (Class)strokeClass
{
  PKCrash();
}

- (id)newStroke
{
  PKCrash();
}

- (Class)strokeSelectionClass
{
  PKCrash();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDrawing)initWithCoder:(id)a3
{
  id v4;
  PKDrawing *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint64_t v12;

  v12 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = (PKDrawing *)objc_msgSend(v4, "decodeBytesWithReturnedLength:", &v12);
  if (v5)
  {
    v6 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v8 = (void *)objc_msgSend(v6, "initWithData:error:", v7, &v11);
    v9 = v11;

    if (v9)
    {
      objc_msgSend(v4, "failWithError:", v9);
    }
    else
    {
      if (v8)
      {
        self = -[PKDrawing initWithDrawing:](self, "initWithDrawing:", v8);
        v9 = 0;
        v5 = self;
        goto LABEL_8;
      }
      v9 = 0;
    }
    v5 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
LABEL_8:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[PKDrawing serialize](self, "serialize");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "encodeBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDrawing:", self);
}

- (id)version
{
  PKCrash();
}

- (id)_rootStrokes
{
  PKCrash();
}

- (int64_t)_rootStrokesCount
{
  void *v2;
  int64_t v3;

  -[PKDrawing _rootStrokes](self, "_rootStrokes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_isEmpty
{
  return -[PKDrawing _rootStrokesCount](self, "_rootStrokesCount") == 0;
}

- (void)_setAllStrokes:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (BOOL)containsInternalStrokes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PKDrawing strokes](self, "strokes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_isInternal") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)copyWithoutInternalStrokes
{
  PKCrash();
}

- (void)_imageInRect:(CGRect)a3 scale:(double)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v9;
  PKImageRenderer *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  v9 = a5;
  v10 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", width, height, a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__PKDrawing__imageInRect_scale_completionHandler___block_invoke;
  v12[3] = &unk_1E7779650;
  v11 = v9;
  v13 = v11;
  -[PKImageRenderer renderDrawing:completion:](v10, "renderDrawing:completion:", self, v12);

}

void __50__PKDrawing__imageInRect_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (UIImage)imageFromRect:(CGRect)rect scale:(CGFloat)scale
{
  double v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = scale;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  if (scale <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v4 = v11;

  }
  v12 = -[PKImageRenderer initSyncWithSize:scale:]([PKImageRenderer alloc], "initSyncWithSize:scale:", width, height, v4);
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInvertColors:", objc_msgSend(v13, "userInterfaceStyle") == 2);

  -[PKDrawing strokes](self, "strokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__PKDrawing_imageFromRect_scale___block_invoke;
  v17[3] = &unk_1E7779678;
  v17[4] = &v18;
  objc_msgSend(v12, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v17, x, y, width, height, 1.0);

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return (UIImage *)v15;
}

void __33__PKDrawing_imageFromRect_scale___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4
{
  __int128 v4;
  __int128 v5;
  _OWORD v6[3];
  _OWORD v7[3];

  v4 = *(_OWORD *)&a4->c;
  v7[0] = *(_OWORD *)&a4->a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&a4->tx;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKDrawing _copyAndAddStrokes:transform:inkTransform:](self, "_copyAndAddStrokes:transform:inkTransform:", a3, v7, v6);
}

- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  id v17;
  id obj;
  id v19;
  _OWORD v20[3];
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v14 = *(_OWORD *)&a4->c;
        v21[0] = *(_OWORD *)&a4->a;
        v21[1] = v14;
        v21[2] = *(_OWORD *)&a4->tx;
        v15 = *(_OWORD *)&a5->c;
        v20[0] = *(_OWORD *)&a5->a;
        v20[1] = v15;
        v20[2] = *(_OWORD *)&a5->tx;
        objc_msgSend(v13, "ink");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v12;
        v17 = -[PKDrawing _copyAndAddStroke:transform:inkTransform:ink:newParent:](self, "_copyAndAddStroke:transform:inkTransform:ink:newParent:", v13, v21, v20, v16, &v19);
        v9 = v19;

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);

  }
}

- (PKDrawing)drawingByApplyingTransform:(CGAffineTransform *)transform
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&transform->c;
  v5[0] = *(_OWORD *)&transform->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&transform->tx;
  -[PKDrawing drawingByApplyingTransform:transformInk:](self, "drawingByApplyingTransform:transformInk:", v5, 1);
  return (PKDrawing *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4
{
  __int128 v6;
  double v7;
  id v8;
  void *v9;
  __int128 v10;
  CGAffineTransform v12;
  _OWORD v13[3];
  CGAffineTransform v14;

  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v14.c = v6;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (!a4)
  {
    v7 = sqrt(a3->b * a3->b + a3->a * a3->a);
    if (v7 > 0.0)
      CGAffineTransformMakeScale(&v14, 1.0 / v7, 1.0 / v7);
  }
  v8 = objc_alloc_init((Class)objc_opt_class());
  -[PKDrawing strokes](self, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->tx;
  v12 = v14;
  objc_msgSend(v8, "_copyAndAddStrokes:transform:inkTransform:", v9, v13, &v12);

  return v8;
}

- (PKDrawing)drawingByAppendingDrawing:(PKDrawing *)drawing
{
  PKDrawing *v4;
  void *v5;
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  v4 = drawing;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDrawing:", self);
  -[PKDrawing strokes](v4, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "_copyAndAddStrokes:transform:", v6, v9);

  return (PKDrawing *)v5;
}

- (PKDrawing)drawingByAppendingStrokes:(NSArray *)strokes
{
  NSArray *v4;
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  v4 = strokes;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDrawing:", self);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "_copyAndAddStrokes:transform:", v4, v8);

  return (PKDrawing *)v5;
}

- (NSArray)strokes
{
  PKDrawing *v2;
  NSMutableArray *cachedVisibleStrokes;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  cachedVisibleStrokes = v2->_cachedVisibleStrokes;
  if (!cachedVisibleStrokes)
  {
    -[PKDrawing _rootStrokes](v2, "_rootStrokes");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v5 += objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8++), "_visibleSubstrokeCountInDrawing:", v2);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "_addVisibleSubstrokesTo:inDrawing:", v9, v2, (_QWORD)v17);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

    v14 = v2->_cachedVisibleStrokes;
    v2->_cachedVisibleStrokes = (NSMutableArray *)v9;

    cachedVisibleStrokes = v2->_cachedVisibleStrokes;
  }
  v15 = (void *)-[NSMutableArray copy](cachedVisibleStrokes, "copy", (_QWORD)v17);
  objc_sync_exit(v2);

  return (NSArray *)v15;
}

- (CGRect)calculateStrokeBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  v23 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKDrawing strokes](self, "strokes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "_bounds");
        v27.origin.x = v10;
        v27.origin.y = v11;
        v27.size.width = v12;
        v27.size.height = v13;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)bounds
{
  PKCrash();
}

- (NSUUID)uuid
{
  PKCrash();
}

- (void)_setUUID:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (CGRect)_canvasBounds
{
  PKCrash();
}

- (void)set_canvasBounds:(CGRect)a3
{
  PKCrash();
}

- (void)invalidateVisibleStrokes
{
  NSMutableArray *cachedVisibleStrokes;

  cachedVisibleStrokes = self->_cachedVisibleStrokes;
  self->_cachedVisibleStrokes = 0;

}

+ (void)sortStrokes:(id)a3
{
  objc_msgSend(a3, "sortWithOptions:usingComparator:", 1, &__block_literal_global_19);
}

uint64_t __25__PKDrawing_sortStrokes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareToStroke:");
}

+ (id)visibleStrokesFromStrokes:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "_strokeUUID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_visibleStrokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)drawingStrokesFromStrokes:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "_strokeUUID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_strokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)insertNewTestStroke
{
  id v3;
  PKInk *v4;
  void *v5;

  v3 = -[PKDrawing newStroke](self, "newStroke");
  v4 = objc_alloc_init(PKInk);
  objc_msgSend(v3, "_setInk:", v4);

  -[PKDrawing visibleStrokeForInsertingStroke:](self, "visibleStrokeForInsertingStroke:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing addNewStroke:](self, "addNewStroke:", v5);

  return v5;
}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (PKContentVersion)requiredContentVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  PKContentVersion v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKDrawing _rootStrokes](self, "_rootStrokes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = PKContentVersion1;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v4)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "requiredContentVersion");
      if (v5 <= v7)
        v5 = v7;
      if (v5 == (PKContentVersionLatest|PKContentVersion1))
        break;
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v5 = PKContentVersion1;
  }

  return v5;
}

- (void)addNewStroke:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)undoableAddNewStrokes:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (id)_addStroke:(id)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[PKDrawing _copyAndAddStroke:transform:](self, "_copyAndAddStroke:transform:", a3, v5);
}

- (void)_removeStroke:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing deleteStrokes:](self, "deleteStrokes:", v5);

}

- (id)copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v10;

  v6 = a3;
  objc_msgSend(v6, "ink", *(_QWORD *)&a4->a, *(_QWORD *)&a4->b, *(_QWORD *)&a4->c, *(_QWORD *)&a4->d, *(_QWORD *)&a4->tx, *(_QWORD *)&a4->ty);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDrawing _copyAndAddStroke:transform:ink:newParent:](self, "_copyAndAddStroke:transform:ink:newParent:", v6, &v10, v7, 0);

  return v8;
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v10;

  v6 = a3;
  objc_msgSend(v6, "ink", *(_QWORD *)&a4->a, *(_QWORD *)&a4->b, *(_QWORD *)&a4->c, *(_QWORD *)&a4->d, *(_QWORD *)&a4->tx, *(_QWORD *)&a4->ty);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDrawing _copyAndAddStroke:transform:ink:newParent:](self, "_copyAndAddStroke:transform:ink:newParent:", v6, &v10, v7, 0);

  return v8;
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 newParent:(id *)a6
{
  __int128 v6;
  __int128 v7;
  _OWORD v9[3];
  _OWORD v10[3];

  v6 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->tx;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[PKDrawing _copyAndAddStroke:transform:inkTransform:ink:newParent:](self, "_copyAndAddStroke:transform:inkTransform:ink:newParent:", a3, v10, v9, a5, a6);
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5 ink:(id)a6 newParent:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  CGAffineTransform v38;

  v12 = a3;
  v13 = a6;
  -[PKDrawing visibleStrokeForInsertingStroke:](self, "visibleStrokeForInsertingStroke:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v38.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v38.c = v15;
  *(_OWORD *)&v38.tx = *(_OWORD *)&a4->tx;
  if (!CGAffineTransformIsIdentity(&v38))
  {
    if (v14)
      objc_msgSend(v14, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v16 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v37, &t1, &t2);
    objc_msgSend(v14, "_setTransform:", &v37);
  }
  v17 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v34.c = v17;
  *(_OWORD *)&v34.tx = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformIsIdentity(&v34))
  {
    if (v14)
      objc_msgSend(v14, "_inkTransform");
    else
      memset(&v32, 0, sizeof(v32));
    v18 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v18;
    *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
    CGAffineTransformConcat(&v33, &v32, &v31);
    objc_msgSend(v14, "_setInkTransform:", &v33);
  }
  objc_msgSend(v14, "ink");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 != v13)
    objc_msgSend(v14, "setInk:", v13);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setStrokeUUID:", v20);

  objc_msgSend(v14, "_setFlags:", objc_msgSend(v12, "_flags") & 0xFFFFFFC000000011 | (32 * objc_msgSend(v12, "randomSeed")) | 0x2000000000);
  objc_msgSend(v14, "_strokeMask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (a7)
    {
      v22 = *a7;
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "_strokeDataUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_strokeDataUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_23;
      }
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v14, "parentStrokeForInsertionInDrawing:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDrawing addNewStroke:](self, "addNewStroke:", v27);
    if (a7)
    {
      v23 = objc_retainAutorelease(v27);
      *a7 = v23;
    }
    else
    {
      v23 = v27;
    }
LABEL_23:
    objc_msgSend(v23, "_substrokes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObject:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "set_substrokes:", v29);

    -[PKDrawing invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
    goto LABEL_24;
  }
  -[PKDrawing addNewStroke:](self, "addNewStroke:", v14);
LABEL_24:

  return v14;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  id v4;

  v4 = a3;
  PKCrash();
}

- (void)setStrokes:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  __int128 v5;
  _OWORD v6[3];

  v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->tx;
  -[PKDrawing transformStrokes:withTransform:concat:](self, "transformStrokes:withTransform:concat:", a3, v6, a5);
}

- (id)setStroke:(id)a3 ink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing setStrokes:inks:](self, "setStrokes:inks:", v8, v9);

  objc_msgSend(v6, "_strokeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing _strokeForIdentifier:](self, "_strokeForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)setStroke:(id)a3 hidden:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__PKDrawing_setStroke_hidden___block_invoke;
  v10[3] = &unk_1E77796E0;
  v12 = a4;
  v11 = v6;
  v7 = v6;
  -[PKDrawing updateStroke:updater:](self, "updateStroke:updater:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __30__PKDrawing_setStroke_hidden___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == objc_msgSend(v3, "_isHidden"))
  {
    v4 = v3;
  }
  else
  {
    v5 = objc_msgSend(v3, "_pointsCount");
    v6 = v3;
    if (!v5)
      v6 = *(void **)(a1 + 32);
    v4 = (id)objc_msgSend(v6, "copyForMutation");
    objc_msgSend(v4, "_setHidden:", *(unsigned __int8 *)(a1 + 40));
    objc_msgSend(v4, "_setFlags:", objc_msgSend(v4, "_flags") & 0xFFFFFFFFFFFFFFFDLL);
  }

  return v4;
}

- (void)_eraseWithEraserStroke:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKDrawing sliceWithEraseStroke:](self, "sliceWithEraseStroke:", v4);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing deleteStrokes:](self, "deleteStrokes:", v6);

}

- (void)_clipMaskedStrokes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__PKDrawing__clipMaskedStrokes__block_invoke;
  v2[3] = &unk_1E7777378;
  v2[4] = self;
  -[PKDrawing clipStrokesIfNeededOnQueue:completion:](self, "clipStrokesIfNeededOnQueue:completion:", 0, v2);
}

uint64_t __31__PKDrawing__clipMaskedStrokes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeWithDrawing:", a2);
}

- (void)deleteStrokes:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)undoableDeleteStrokes:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  id v5;

  v5 = a3;
  PKCrash();
}

- (void)transformStrokes:(id)a3 withTransforms:(id)a4 concat:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];

  v5 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  for (i = 0; objc_msgSend(v8, "count") > i; ++i)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "CGAffineTransformValue");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
    }

    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    -[PKDrawing transformStrokes:withTransform:concat:](self, "transformStrokes:withTransform:concat:", v14, v15, v5);

  }
}

- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKDrawing _originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:](self, "_originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing undoableAddNewStrokes:](self, "undoableAddNewStrokes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDrawing undoableDeleteStrokes:](self, "undoableDeleteStrokes:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Straighten Strokes"), CFSTR("Straighten Strokes"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setActionName:", v16);
  objc_msgSend(v14, "setActionName:", v16);
  v19[0] = v13;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5
{
  -[PKDrawing _originalDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:shouldUseStrokeDataUUID:](self, "_originalDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:shouldUseStrokeDataUUID:", a3, a4, a5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_originalStrokeUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5
{
  -[PKDrawing _originalDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:shouldUseStrokeDataUUID:](self, "_originalDataUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:shouldUseStrokeDataUUID:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_originalDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5 shouldUseStrokeDataUUID:(BOOL)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v26;
  id obj;
  _BOOL4 v28;
  id v29;
  id v30;
  id v31;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v28 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v30 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v13, "_strokeUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v13, "_strokeData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "_strokeUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v13, "_strokeMask");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = objc_alloc(-[PKDrawing strokeClass](self, "strokeClass"));
        objc_msgSend(v13, "ink");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v13, "transform");
        else
          memset(v32, 0, sizeof(v32));
        objc_msgSend(v13, "mask");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v18, "initWithInk:strokePath:transform:mask:", v19, v15, v32, v20);

        objc_msgSend(v13, "_strokeMask");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (!v23)
          objc_msgSend(v21, "_setStrokeMask:", v17);
        if (v28)
          objc_msgSend(v13, "_strokeDataUUID");
        else
          objc_msgSend(v13, "_strokeUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v21, v24);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  return v29;
}

- (BOOL)shouldClearSelectionAfterStraightening
{
  return 1;
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  id v5;

  v5 = a3;
  PKCrash();
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  PKCrash();
}

- (void)_transformAllStrokes:(CGAffineTransform *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];
  CGAffineTransform v9;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v9.c = v5;
  *(_OWORD *)&v9.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v9))
  {
    -[PKDrawing strokes](self, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_OWORD *)&a3->c;
    v8[0] = *(_OWORD *)&a3->a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a3->tx;
    -[PKDrawing transformStrokes:withTransform:concat:](self, "transformStrokes:withTransform:concat:", v6, v8, 1);

  }
}

- (id)setStroke:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __int128 v9;
  id v10;
  void *v11;
  __int128 v12;
  void *v13;
  _OWORD v15[3];
  CGAffineTransform v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v5
    && (v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&v16.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&v16.c = v9,
        *(_OWORD *)&v16.tx = *(_OWORD *)&a4->tx,
        CGAffineTransformIsIdentity(&v16)))
  {
    v10 = v8;
  }
  else
  {
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&a4->c;
    v15[0] = *(_OWORD *)&a4->a;
    v15[1] = v12;
    v15[2] = *(_OWORD *)&a4->tx;
    -[PKDrawing transformStrokes:withTransform:concat:](self, "transformStrokes:withTransform:concat:", v11, v15, 1);

    objc_msgSend(v8, "_strokeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawing _strokeForIdentifier:](self, "_strokeForIdentifier:", v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)updateStroke:(id)a3 updater:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PKDrawing *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v8 = v6;
  v26 = v8;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__PKDrawing_updateStroke_updater___block_invoke;
  v13[3] = &unk_1E7779708;
  v17 = v19;
  v18 = &v21;
  v15 = self;
  v16 = v7;
  v14 = v8;
  v9 = v7;
  v10 = v8;
  -[PKDrawing updateStrokes:](self, "updateStrokes:", v13);
  v11 = (id)v22[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

id __34__PKDrawing_updateStroke_updater___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "_strokeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_strokeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v5 = v6;
    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *a3 = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v5 = v6;
      if (*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != v6)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "didUpdateInDrawing:", *(_QWORD *)(a1 + 40));
        v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
    }
  }
  v13 = v5;

  return v13;
}

- (void)setStrokeSubstrokes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKDrawing *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PKDrawing_setStrokeSubstrokes___block_invoke;
  v6[3] = &unk_1E7779730;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PKDrawing updateStrokes:](self, "updateStrokes:", v6);

}

id __33__PKDrawing_setStrokeSubstrokes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_strokeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (id)objc_msgSend(v3, "_newStrokeWithSubstrokes:inDrawing:", v6, *(_QWORD *)(a1 + 40));
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4
{
  id v4;

  v4 = a3;
  PKCrash();
}

- (void)updateStrokes:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)undoableMergeWithDrawing:(id)a3
{
  -[PKDrawing mergeWithDrawing:](self, "mergeWithDrawing:", a3);
  return 0;
}

- (id)CHDrawing
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id obj;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D16800]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKDrawing strokes](self, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __22__PKDrawing_CHDrawing__block_invoke;
        v13[3] = &unk_1E7779758;
        v10 = v3;
        v14 = v10;
        v15 = &v16;
        objc_msgSend(v9, "enumeratePointsWithTimestep:usingBlock:", v13, 0.00833333333);
        if (*((_BYTE *)v17 + 24))
          objc_msgSend(v10, "endStroke");

        _Block_object_dispose(&v16, 8);
      }
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  return v3;
}

uint64_t __22__PKDrawing_CHDrawing__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addPoint:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (unint64_t)hash
{
  PKCrash();
}

- (BOOL)isEqual:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)debugQuickLookObject
{
  -[PKDrawing bounds](self, "bounds");
  return -[PKDrawing imageFromRect:scale:](self, "imageFromRect:scale:");
}

- (PKDrawing)initWithData:(NSData *)data error:(NSError *)error
{
  NSData *v4;

  v4 = data;
  PKCrash();
}

- (NSData)dataRepresentation
{
  PKCrash();
}

- (BOOL)recognitionEnabled
{
  return self->_recognitionEnabled;
}

- (void)setRecognitionEnabled:(BOOL)a3
{
  if (self->_recognitionEnabled != a3)
  {
    self->_recognitionEnabled = a3;
    -[PKDrawing _updateRecognitionSession](self, "_updateRecognitionSession");
  }
}

- (id)forcedRecognitionLocales
{
  return self->_forcedRecognitionLocales;
}

- (void)setForcedRecognitionLocales:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_forcedRecognitionLocales != v5)
  {
    objc_storeStrong((id *)&self->_forcedRecognitionLocales, a3);
    -[PKDrawing _updateRecognitionSession](self, "_updateRecognitionSession");
  }

}

- (PKVisualizationManager)visualizationManager
{
  void *v3;
  void *v4;
  void *v5;
  PKVisualizationManager *v6;
  PKVisualizationManager *visualizationManager;
  PKVisualizationManager *v8;
  void *v9;
  PKVisualizationManager *v10;
  PKVisualizationManager *v11;

  if (self->_recognitionEnabled)
  {
    -[PKDrawing uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKRecognitionSessionManager session](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[PKVisualizationManager initWithRecognitionSession:]([PKVisualizationManager alloc], "initWithRecognitionSession:", v5);
      -[PKVisualizationManager setRecognitionStatusReportingEnabled:](v6, "setRecognitionStatusReportingEnabled:", 1);
    }
    else
    {
      visualizationManager = self->_visualizationManager;
      if (!visualizationManager)
      {
        v8 = [PKVisualizationManager alloc];
        -[PKDrawing recognitionSession](self, "recognitionSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKVisualizationManager initWithRecognitionSession:](v8, "initWithRecognitionSession:", v9);
        v11 = self->_visualizationManager;
        self->_visualizationManager = v10;

        visualizationManager = self->_visualizationManager;
      }
      v6 = visualizationManager;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_updateRecognitionSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKRecognitionSessionManager *v9;
  void *v10;
  char *v11;
  PKRecognitionSessionManager *recognitionManager;
  void *v13;
  PKRecognitionSessionManager *v14;
  NSUUID *v15;
  NSUUID *listenerID;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  if (-[PKDrawing recognitionEnabled](self, "recognitionEnabled")
    && (-[PKDrawing recognitionSession](self, "recognitionSession"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[PKDrawing uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKRecognitionSessionManager session](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_storeStrong((id *)&self->_recognitionManager, v6);
      -[PKRecognitionSessionManager session](v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawing setRecognitionSession:](self, "setRecognitionSession:", v8);
    }
    else
    {
      v9 = [PKRecognitionSessionManager alloc];
      +[PKRecognitionSessionManagerConfiguration backgroundIndexingConfiguration]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)v9, v10);
      recognitionManager = self->_recognitionManager;
      self->_recognitionManager = (PKRecognitionSessionManager *)v11;

      -[PKRecognitionSessionManager setDrawing:](self->_recognitionManager, self);
      -[PKRecognitionSessionManager session](self->_recognitionManager);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawing setRecognitionSession:](self, "setRecognitionSession:", v13);

      v14 = self->_recognitionManager;
      -[PKDrawing uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v14, v8);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    listenerID = self->_listenerID;
    self->_listenerID = v15;

    -[PKRecognitionSessionManager addListener:]((uint64_t)self->_recognitionManager, self->_listenerID);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawing setOngoingQueries:](self, "setOngoingQueries:", v17);

  }
  else if (-[PKDrawing recognitionEnabled](self, "recognitionEnabled")
         || (-[PKDrawing recognitionSession](self, "recognitionSession"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v4,
             !v4))
  {
    -[PKRecognitionSessionManager setDrawing:](self->_recognitionManager, self);
  }
  else
  {
    -[PKRecognitionSessionManager removeListener:]((uint64_t)self->_recognitionManager, self->_listenerID);
    -[PKDrawing _teardownRecognitionObjects](self, "_teardownRecognitionObjects");
  }
  if (-[PKDrawing recognitionEnabled](self, "recognitionEnabled"))
  {
    -[PKDrawing forcedRecognitionLocales](self, "forcedRecognitionLocales");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18
      && (-[PKDrawing forcedRecognitionLocales](self, "forcedRecognitionLocales"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "count"),
          v19,
          v18,
          v20))
    {
      -[PKDrawing forcedRecognitionLocales](self, "forcedRecognitionLocales");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PKRecognitionSessionManager enabledLocales](PKRecognitionSessionManager, "enabledLocales");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (id)v21;
    -[PKDrawing recognitionSession](self, "recognitionSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPreferredLocales:", v23);

  }
}

- (id)_strokeForIdentifier:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)_visibleStrokeForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[PKDrawing _strokeForIdentifier:](self, "_strokeForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isHidden") & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

+ (id)_uuidDescriptionForStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((v8 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(", "), (_QWORD)v14);
        objc_msgSend(v10, "_strokeUUID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v12);

        v8 = 0;
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = 0;
    }
    while (v6);
  }

  objc_msgSend(v4, "appendString:", CFSTR("]"));
  return v4;
}

- (void)setNeedsRecognitionUpdate
{
  char v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PKDrawingRecognitionDisableUpdates"));

  if ((v3 & 1) == 0)
  {
    -[PKDrawing recognitionSession](self, "recognitionSession");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsRecognitionUpdate");

  }
}

- (void)cancelOngoingRecognitionRequests
{
  id v2;

  -[PKDrawing recognitionSession](self, "recognitionSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelOngoingRequests");

}

- (id)strokesForCHStrokeIdentifiers:(id)a3
{
  -[PKDrawing strokesForCHStrokeIdentifiers:didFindAllStrokes:](self, "strokesForCHStrokeIdentifiers:didFindAllStrokes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)strokesForCHStrokeIdentifiers:(id)a3 didFindAllStrokes:(BOOL *)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v15;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "strokeUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawing _visibleStrokeForIdentifier:](self, "_visibleStrokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v6, "addObject:", v13);
        else
          v10 = 0;

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  if (a4)
    *a4 = v10 & 1;

  return v6;
}

- (id)indexableContent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  PKIndexableContent *v7;
  void *v8;
  PKIndexableContent *v9;

  -[PKDrawing recognitionSession](self, "recognitionSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D16810]);
    -[PKDrawing recognitionSession](self, "recognitionSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithRecognitionSession:", v5);

    objc_msgSend(v6, "start");
    objc_msgSend(v6, "waitForPendingUpdates");
    v7 = [PKIndexableContent alloc];
    objc_msgSend(v6, "indexableContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKIndexableContent initWithIndexableContent:](v7, "initWithIndexableContent:", v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)performSearchQuery:(id)a3 withBlock:(id)a4
{
  -[PKDrawing performSearchQuery:fullWordsOnly:caseMatchingOnly:withBlock:](self, "performSearchQuery:fullWordsOnly:caseMatchingOnly:withBlock:", a3, 0, 0, a4);
}

- (void)performSearchQuery:(id)a3 fullWordsOnly:(BOOL)a4 caseMatchingOnly:(BOOL)a5 withBlock:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v17 = a3;
  v10 = a6;
  if (v10)
  {
    -[PKDrawing recognitionSession](self, "recognitionSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D16860]);
      -[PKDrawing recognitionSession](self, "recognitionSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithRecognitionSession:", v13);

      objc_msgSend(v14, "setQueryString:", v17);
      objc_msgSend(v14, "setDelegate:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "setFullWordsOnly:", v8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "setCaseMatchingOnly:", v7);
      -[PKDrawing ongoingQueries](self, "ongoingQueries");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = _Block_copy(v10);
      objc_msgSend(v15, "setObject:forKey:", v16, v14);

      objc_msgSend(v14, "start");
    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

- (void)queryDidUpdateResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double *v8;
  uint64_t i;
  void *v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  PKSearchQueryItem *v26;
  void *v27;
  PKSearchQueryItem *v28;
  void (**v29)(_QWORD, _QWORD);
  id v30;
  id v31;
  id obj;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v31;
    objc_msgSend(v30, "pause");
    objc_msgSend(v30, "setDelegate:", 0);
    -[PKDrawing ongoingQueries](self, "ongoingQueries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v30);
    v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[PKDrawing ongoingQueries](self, "ongoingQueries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v30);

    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "foundItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v6;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v7)
      {
        v33 = *(_QWORD *)v41;
        v8 = (double *)MEMORY[0x1E0C9D628];
        do
        {
          v35 = v7;
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v41 != v33)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            x = *v8;
            y = v8[1];
            width = v8[2];
            height = v8[3];
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v10, "strokeIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v37 != v18)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "strokeUUID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PKDrawing _visibleStrokeForIdentifier:](self, "_visibleStrokeForIdentifier:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                    objc_msgSend(v15, "addObject:", v21);
                  objc_msgSend(v21, "_bounds");
                  v49.origin.x = v22;
                  v49.origin.y = v23;
                  v49.size.width = v24;
                  v49.size.height = v25;
                  v47.origin.x = x;
                  v47.origin.y = y;
                  v47.size.width = width;
                  v47.size.height = height;
                  v48 = CGRectUnion(v47, v49);
                  x = v48.origin.x;
                  y = v48.origin.y;
                  width = v48.size.width;
                  height = v48.size.height;

                }
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v17);
            }

            v26 = [PKSearchQueryItem alloc];
            v27 = (void *)objc_msgSend(v15, "copy");
            v28 = -[PKSearchQueryItem initWithBounds:strokes:](v26, "initWithBounds:strokes:", v27, x, y, width, height);

            objc_msgSend(v34, "addObject:", v28);
          }
          v6 = obj;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v7);
      }

      ((void (**)(_QWORD, void *))v29)[2](v29, v34);
    }
    else
    {

    }
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing strokes](self, "strokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %ld strokes>"), v5, self, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_ascii
{
  BOOL *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t j;
  __CFString *v11;
  __CFString *v12;

  v3 = -[PKDrawing _newAsciiBitfield](self, "_newAsciiBitfield");
  -[PKDrawing bounds](self, "bounds");
  v5 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v4);
  -[PKDrawing bounds](self, "bounds");
  v7 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v6);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if (v5 >= 1)
      {
        for (j = 0; j != v5; ++j)
        {
          if (v3[+[PKStroke _asciiBitfieldIndexForX:y:width:](PKStroke, "_asciiBitfieldIndexForX:y:width:", j, i, v5)])v11 = CFSTR("■");
          else
            v11 = CFSTR(" ");
          v12 = v11;
          objc_msgSend(v8, "appendString:", v12);

        }
      }
      objc_msgSend(v8, "appendString:", CFSTR("\n"));
    }
  }
  free(v3);
  return v8;
}

- (BOOL)_newAsciiBitfield
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UNKNOWN **v9;
  int64_t v10;
  BOOL *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t i;
  uint64_t v31;
  _UNKNOWN **v32;
  int v33;
  _UNKNOWN **v34;
  uint64_t v35;
  BOOL v36;
  int64_t v38;
  int64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[PKDrawing bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = &off_1E776F000;
  v39 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:");
  v10 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v4);
  v44 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v6);
  v11 = (BOOL *)malloc_type_calloc(+[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v8)* v44, 1uLL, 0x100004077774924uLL);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[PKDrawing strokes](self, "strokes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v13)
  {
    v40 = v12;
    v41 = *(_QWORD *)v46;
    v38 = -v10;
    do
    {
      v14 = 0;
      v42 = v13;
      do
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
        v16 = (unsigned __int8 *)objc_msgSend(v15, "_newAsciiBitfield", v38);
        objc_msgSend(v15, "_bounds");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v23 = objc_msgSend(v9[402], "_asciiDimensionForBoundsDimension:");
        v24 = objc_msgSend(v9[402], "_asciiDimensionForBoundsDimension:", v18);
        v25 = objc_msgSend(v9[402], "_asciiDimensionForBoundsDimension:", v20);
        v26 = objc_msgSend(v9[402], "_asciiDimensionForBoundsDimension:", v22);
        v43 = v14;
        if (v25 >= 1)
        {
          v27 = v26;
          v28 = 0;
          v29 = v38 + v24;
          do
          {
            if (v27 >= 1)
            {
              for (i = 0; i != v27; ++i)
              {
                v31 = objc_msgSend(v9[402], "_asciiBitfieldIndexForX:y:width:", v28, i, v25);
                v32 = v9;
                v33 = v16[v31];
                v34 = v32;
                v35 = objc_msgSend(v32[402], "_asciiBitfieldIndexForX:y:width:", v23 - v39 + v28, v29 + i, v44);
                if (v33)
                  v36 = 1;
                else
                  v36 = v11[v35];
                v11[v35] = v36;
                v9 = v34;
              }
            }
            ++v28;
          }
          while (v28 != v25);
        }
        free(v16);
        v14 = v43 + 1;
        v12 = v40;
      }
      while (v43 + 1 != v42);
      v13 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v13);
  }

  return v11;
}

- (NSMutableArray)_cachedVisibleStrokes
{
  return self->_cachedVisibleStrokes;
}

- (void)set_cachedVisibleStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVisibleStrokes, a3);
}

- (PKRecognitionSessionManager)recognitionManager
{
  return self->_recognitionManager;
}

- (void)setRecognitionManager:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionManager, a3);
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (void)setRecognitionSession:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionSession, a3);
}

- (NSMapTable)ongoingQueries
{
  return self->_ongoingQueries;
}

- (void)setOngoingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingQueries, a3);
}

- (void)setVisualizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_visualizationManager, a3);
}

+ (id)_upgradeDrawingData:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, id);
  PKDrawingConcrete *v10;
  void *v11;
  uint64_t v12;
  id v13;
  PKDrawingConcrete *v14;
  PKDrawingConcrete *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = -[PKDrawingConcrete initWithLegacyData:]([PKDrawingConcrete alloc], "initWithLegacyData:", v7);
  -[PKDrawingConcrete _allStrokes](v10, "_allStrokes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v20 = 0;
    v15 = -[PKDrawingConcrete initWithData:error:]([PKDrawingConcrete alloc], "initWithData:error:", v7, &v20);
    v13 = v20;

    if (v15)
    {
      v14 = v15;
      goto LABEL_6;
    }
    if (v13)
    {
LABEL_9:
      v9[2](v9, 0, v13);
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_8:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("Error reading old ICDrawing data format.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1, v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!v10)
    goto LABEL_8;
  v13 = 0;
  v14 = v10;
LABEL_6:
  -[PKDrawingConcrete _upgradeOnQueue:isLegacyDrawing:completionBlock:](v14, "_upgradeOnQueue:isLegacyDrawing:completionBlock:", v8, v10 != 0, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v16;
}

- (void)set_orientation:(int64_t)a3
{
  PKCrash();
}

- (int64_t)_orientation
{
  PKCrash();
}

- (CGAffineTransform)_transformForImageWithSize:(SEL)a3
{
  PKCrash();
}

- (CGSize)_orientedDrawingSize
{
  PKCrash();
}

- (void)_upgradeLegacyPenInks
{
  PKCrash();
}

- (id)sliceWithEraseStroke:(id)a3
{
  double v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  size_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  __int128 v77;
  uint64_t v78;
  char *v79;
  unint64_t v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  _QWORD *v89;
  unint64_t v90;
  _QWORD *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  unint64_t v107;
  __int128 v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  void **v112;
  unint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  int64_t v129;
  char *v130;
  uint64_t *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  _BYTE *v142;
  uint64_t v143;
  void *v144;
  unint64_t v145;
  id v146;
  void *v147;
  size_t v148;
  id v149;
  id v150;
  NSObject *v151;
  char *v152;
  _BYTE *v153;
  uint64_t v154;
  double v155;
  void *v156;
  double v158;
  uint64_t *v159;
  void *v160;
  void *v161;
  void *v162;
  unint64_t v164;
  double v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  id obj;
  uint64_t obja;
  _QWORD v175[4];
  id v176;
  PKDrawing *v177;
  id v178;
  void **v179;
  void ***v180;
  _QWORD aBlock[4];
  id v182;
  _QWORD v183[3];
  id v184;
  void **v185;
  void ***v186;
  uint64_t v187;
  __n128 (*v188)(__n128 *, __n128 *);
  void (*v189)(uint64_t);
  const char *v190;
  _QWORD v191[3];
  id v192;
  void *v193;
  int64x2_t v194;
  __int128 v195;
  __int128 v196;
  void ***v197;
  id v198;
  void **v199;
  void **v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD block[5];
  _QWORD v205[4];
  id v206;
  uint64_t *v207;
  void **v208;
  CGFloat v209;
  CGFloat v210;
  CGFloat v211;
  CGFloat v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  __n128 (*v220)(__n128 *, __n128 *);
  void (*v221)(uint64_t);
  const char *v222;
  int64x2_t v223;
  char *v224;
  void *__p;
  char *v226;
  char *v227;
  _BYTE buf[12];
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  double v232;
  _BYTE v233[128];
  uint64_t v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;

  v234 = *MEMORY[0x1E0C80C00];
  v166 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v158 = v3;
  v4 = objc_msgSend(v166, "newOutlinePaths");
  v5 = *(uint64_t **)v4;
  v6 = *(uint64_t **)(v4 + 8);
  v159 = (uint64_t *)v4;
  if (*(uint64_t **)v4 != v6)
  {
    do
    {
      v7 = *v5;
      v8 = v5[1];
      while (v7 != v8)
      {
        *(_QWORD *)(v7 + 16) = 0x3F800000BF800000;
        v7 += 24;
      }
      v5 += 3;
    }
    while (v5 != v6);
  }
  objc_msgSend(v166, "_bounds");
  v236 = CGRectInset(v235, -1.0, -1.0);
  x = v236.origin.x;
  y = v236.origin.y;
  width = v236.size.width;
  height = v236.size.height;
  -[PKDrawing strokes](self, "strokes");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v160, "count"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = 0;
  __p = 0;
  v227 = 0;
  v217 = 0;
  v218 = &v217;
  v219 = 0x4812000000;
  v220 = __Block_byref_object_copy__75;
  v221 = __Block_byref_object_dispose__76;
  v222 = "";
  v223 = 0uLL;
  v224 = 0;
  v13 = objc_msgSend(v160, "count");
  v14 = v223.i64[0];
  if (v13 > (uint64_t)&v224[-v223.i64[0]] >> 3)
  {
    if (v13 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v15 = v223.i64[1];
    *((_QWORD *)&v195 + 1) = &v224;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v13);
    v18 = (_QWORD *)v223.i64[1];
    v19 = (_QWORD *)v223.i64[0];
    if (v223.i64[1] == v223.i64[0])
    {
      v22 = vdupq_n_s64(v223.u64[1]);
      v20 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v20 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v21 = *--v18;
        *v18 = 0;
        *((_QWORD *)v20 - 1) = v21;
        v20 -= 8;
      }
      while (v18 != v19);
      v22 = v223;
    }
    v223.i64[0] = (uint64_t)v20;
    v223.i64[1] = (uint64_t)&v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    v194 = v22;
    v23 = v224;
    v224 = &v16[8 * v17];
    *(_QWORD *)&v195 = v23;
    v193 = (void *)v22.i64[0];
    std::__split_buffer<PKStroke * {__strong}>::~__split_buffer((uint64_t)&v193);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v160, "count"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  -[PKDrawing _rootStrokes](self, "_rootStrokes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v213, v233, 16);
  if (v24)
  {
    v25 = 0;
    v26 = *(_QWORD *)v214;
LABEL_16:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v214 != v26)
        objc_enumerationMutation(obj);
      v28 = *(id *)(*((_QWORD *)&v213 + 1) + 8 * v27);
      if (v28 == v166)
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * v27), "ink");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

      if ((v31 & 1) == 0)
      {
        v193 = 0;
        v194.i64[0] = (uint64_t)&v193;
        v194.i64[1] = 0x2020000000;
        LOBYTE(v195) = 0;
        v205[0] = MEMORY[0x1E0C809B0];
        v205[1] = 3221225472;
        v205[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke;
        v205[3] = &unk_1E777A9E0;
        v209 = x;
        v210 = y;
        v211 = width;
        v212 = height;
        v206 = v162;
        v207 = &v217;
        v208 = &v193;
        objc_msgSend(v28, "_visitVisibleSubstrokes:inDrawing:", v205, self);
        if (*(_BYTE *)(v194.i64[0] + 24))
        {
          objc_msgSend(v161, "addObject:", v28);
          v32 = v226;
          if (v226 >= v227)
          {
            v34 = (char *)__p;
            v35 = (v226 - (_BYTE *)__p) >> 3;
            v36 = v35 + 1;
            if ((unint64_t)(v35 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v37 = v227 - (_BYTE *)__p;
            if ((v227 - (_BYTE *)__p) >> 2 > v36)
              v36 = v37 >> 2;
            if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
              v38 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v38 = v36;
            if (v38)
            {
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v227, v38);
              v32 = v226;
              v34 = (char *)__p;
            }
            else
            {
              v39 = 0;
            }
            v40 = &v39[8 * v35];
            *(_QWORD *)v40 = v25;
            v33 = v40 + 8;
            while (v32 != v34)
            {
              v41 = *((_QWORD *)v32 - 1);
              v32 -= 8;
              *((_QWORD *)v40 - 1) = v41;
              v40 -= 8;
            }
            __p = v40;
            v226 = v33;
            v227 = &v39[8 * v38];
            if (v34)
              operator delete(v34);
          }
          else
          {
            *(_QWORD *)v226 = v25;
            v33 = v32 + 8;
          }
          v226 = v33;
        }

        _Block_object_dispose(&v193, 8);
      }
      ++v25;
      if (++v27 == v24)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v213, v233, 16);
        if (v24)
          goto LABEL_16;
        break;
      }
    }
  }

  v42 = (v218[7] - v218[6]) >> 3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_2;
  block[3] = &unk_1E777AA08;
  block[4] = &v217;
  dispatch_apply(v42, 0, block);
  v201 = 0;
  v202 = 0;
  v203 = 0;
  v43 = v218;
  v44 = *v159;
  v45 = v159[1];
  if (*v159 == v45)
  {
    v49 = 0.0;
  }
  else
  {
    v46 = 0;
    do
    {
      v193 = 0;
      v194 = 0uLL;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v193, *(const void **)v44, *(_QWORD *)(v44 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v44 + 8) - *(_QWORD *)v44) >> 3));
      v47 = v193;
      v48 = v194.i64[0];
      if (v193)
      {
        v194.i64[0] = (uint64_t)v193;
        operator delete(v193);
      }
      v46 -= 0x5555555555555555 * ((v48 - (uint64_t)v47) >> 3);
      v44 += 24;
    }
    while (v44 != v45);
    v49 = (double)(uint64_t)((double)v46 * 1.4);
  }
  v165 = v49;
  v50 = v43[7] - v43[6];
  if (v50 >= 1)
  {
    v51 = 0;
    v52 = (unint64_t)v50 >> 3;
    if (v52 <= 1)
      v53 = 1;
    else
      v53 = v52;
    do
    {
      objc_msgSend(*(id *)(v43[6] + 8 * v51), "_strokeMask");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (uint64_t *)objc_msgSend(v54, "maskPaths");

      v56 = *v55;
      v57 = v55[1];
      if (*v55 == v57)
      {
        v58 = 0;
      }
      else
      {
        v58 = 0;
        do
        {
          v193 = 0;
          v194 = 0uLL;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v193, *(const void **)v56, *(_QWORD *)(v56 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v56 + 8) - *(_QWORD *)v56) >> 3));
          v59 = v193;
          v60 = v194.i64[0];
          if (v193)
          {
            v194.i64[0] = (uint64_t)v193;
            operator delete(v193);
          }
          v58 -= 0x5555555555555555 * ((v60 - (uint64_t)v59) >> 3);
          v56 += 24;
        }
        while (v56 != v57);
      }
      objc_msgSend(*(id *)(v43[6] + 8 * v51), "_bounds");
      v62 = v61;
      v64 = v63;
      v66 = v65;
      v68 = v67;
      v69 = v201;
      v70 = (v202 - v201) >> 6;
      if (v70 <= 100)
        v70 = 100;
      v71 = v70 - 100;
      if (v70 - 100 >= (unint64_t)((v202 - v201) >> 6))
      {
LABEL_66:
        v193 = 0;
        v194 = 0uLL;
        v77 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v195 = *MEMORY[0x1E0C9D628];
        v196 = v77;
        v197 = 0;
        std::vector<Bucket>::push_back[abi:ne180100](&v201, (uint64_t)&v193);
        if (v193)
          operator delete(v193);
        v78 = v202;
        v79 = *(char **)(v202 - 56);
        v80 = *(_QWORD *)(v202 - 48);
        if ((unint64_t)v79 >= v80)
        {
          v82 = *(char **)(v202 - 64);
          v83 = (v79 - v82) >> 3;
          if ((unint64_t)(v83 + 1) >> 61)
            goto LABEL_161;
          v84 = v80 - (_QWORD)v82;
          v85 = (uint64_t)(v80 - (_QWORD)v82) >> 2;
          if (v85 <= v83 + 1)
            v85 = v83 + 1;
          if (v84 >= 0x7FFFFFFFFFFFFFF8)
            v86 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v86 = v85;
          if (v86)
          {
            v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v202 - 48, v86);
            v82 = *(char **)(v78 - 64);
            v79 = *(char **)(v78 - 56);
          }
          else
          {
            v87 = 0;
          }
          v92 = &v87[8 * v83];
          *(_QWORD *)v92 = v51;
          v81 = v92 + 8;
          while (v79 != v82)
          {
            v93 = *((_QWORD *)v79 - 1);
            v79 -= 8;
            *((_QWORD *)v92 - 1) = v93;
            v92 -= 8;
          }
          *(_QWORD *)(v78 - 64) = v92;
          *(_QWORD *)(v78 - 56) = v81;
          *(_QWORD *)(v78 - 48) = &v87[8 * v86];
          if (v82)
            operator delete(v82);
        }
        else
        {
          *(_QWORD *)v79 = v51;
          v81 = v79 + 8;
        }
        *(_QWORD *)(v78 - 56) = v81;
        v94 = v202;
        *(_QWORD *)(v202 - 8) = v58;
        *(CGFloat *)(v94 - 40) = v62;
        *(CGFloat *)(v94 - 32) = v64;
        *(CGFloat *)(v94 - 24) = v66;
        *(CGFloat *)(v94 - 16) = v68;
      }
      else
      {
        v72 = (v70 << 6) - 6400;
        while (1)
        {
          v73 = *(double *)(v69 + v72 + 24);
          v74 = *(double *)(v69 + v72 + 32);
          v76 = *(double *)(v69 + v72 + 40);
          v75 = *(double *)(v69 + v72 + 48);
          v237.origin.x = v62;
          v237.origin.y = v64;
          v237.size.width = v66;
          v237.size.height = v68;
          v239 = CGRectInset(v237, -2.0, -2.0);
          v238.origin.x = v73;
          v238.origin.y = v74;
          v238.size.width = v76;
          v238.size.height = v75;
          if (!CGRectIntersectsRect(v238, v239))
            break;
          ++v71;
          v69 = v201;
          v72 += 64;
          if (v71 >= (v202 - v201) >> 6)
            goto LABEL_66;
        }
        v88 = v69 + v72;
        v89 = *(_QWORD **)(v69 + v72 + 8);
        v90 = *(_QWORD *)(v69 + v72 + 16);
        if ((unint64_t)v89 >= v90)
        {
          v95 = *(_QWORD **)v88;
          v96 = ((uint64_t)v89 - *(_QWORD *)v88) >> 3;
          v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 61)
LABEL_161:
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v98 = v90 - (_QWORD)v95;
          if (v98 >> 2 > v97)
            v97 = v98 >> 2;
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF8)
            v99 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v99 = v97;
          if (v99)
          {
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v69 + v72 + 16, v99);
            v95 = *(_QWORD **)v88;
            v89 = *(_QWORD **)(v88 + 8);
          }
          else
          {
            v100 = 0;
          }
          v101 = &v100[8 * v96];
          *(_QWORD *)v101 = v51;
          v91 = v101 + 8;
          while (v89 != v95)
          {
            v102 = *--v89;
            *((_QWORD *)v101 - 1) = v102;
            v101 -= 8;
          }
          *(_QWORD *)v88 = v101;
          *(_QWORD *)(v88 + 8) = v91;
          *(_QWORD *)(v88 + 16) = &v100[8 * v99];
          if (v95)
            operator delete(v95);
        }
        else
        {
          *v89 = v51;
          v91 = v89 + 1;
        }
        *(_QWORD *)(v88 + 8) = v91;
        *(_QWORD *)(v69 + v72 + 56) += v58;
        v240.origin.x = v62;
        v240.origin.y = v64;
        v240.size.width = v66;
        v240.size.height = v68;
        *(CGRect *)(v88 + 24) = CGRectUnion(*(CGRect *)(v88 + 24), v240);
      }
      ++v51;
    }
    while (v51 != v53);
  }
  if (v202 - v201 >= 1)
  {
    v103 = 0;
    v104 = (unint64_t)(v202 - v201) >> 6;
    if (v104 <= 1)
      v104 = 1;
    v164 = v104;
    while (1)
    {
      v105 = (_QWORD *)(v201 + (v103 << 6));
      v172 = vcvtpd_s64_f64((double)(uint64_t)v105[7] / v165);
      if (v172 >= 2)
        break;
LABEL_148:
      if (++v103 == v164)
        goto LABEL_149;
    }
    v106 = 0;
    v107 = ((uint64_t)(v105[1] - *v105) >> 3) / (unint64_t)v172;
    if (v107 <= 1)
      v107 = 1;
    v167 = v103;
    v168 = -(uint64_t)v107;
    v170 = 8 * v107;
    v171 = v107 + 1;
    v169 = v107;
    obja = (uint64_t)(8 * v107) >> 3;
    while (1)
    {
      if (v171 >= (uint64_t)(*(_QWORD *)(v201 + (v103 << 6) + 8) - *(_QWORD *)(v201 + (v103 << 6))) >> 3)
        goto LABEL_148;
      v193 = 0;
      v194 = 0uLL;
      v108 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v195 = *MEMORY[0x1E0C9D628];
      v196 = v108;
      v197 = 0;
      std::vector<Bucket>::push_back[abi:ne180100](&v201, (uint64_t)&v193);
      if (v193)
        operator delete(v193);
      v109 = (_QWORD *)(v201 + (v103 << 6));
      if (v170 >= 1)
      {
        v110 = v202;
        v112 = (void **)(v202 - 64);
        v111 = *(_QWORD *)(v202 - 64);
        v113 = *(_QWORD *)(v202 - 56);
        v114 = (char *)v109[1];
        v115 = &v114[8 * v168];
        v116 = v113 - v111;
        v117 = (char *)(v111 + ((v113 - v111) & 0xFFFFFFFFFFFFFFF8));
        v118 = *(_QWORD *)(v202 - 48);
        v119 = obja;
        if (obja <= (uint64_t)(v118 - v113) >> 3)
        {
          v127 = (uint64_t)(v113 - (_QWORD)v117) >> 3;
          if (v127 >= obja)
          {
            v128 = &v115[8 * obja];
            v130 = *(char **)(v202 - 56);
          }
          else
          {
            v128 = &v115[8 * v127];
            v129 = v114 - v128;
            if (v114 != v128)
              memmove(*(void **)(v202 - 56), &v115[8 * v127], v114 - v128);
            v130 = (char *)(v113 + v129);
            *(_QWORD *)(v110 - 56) = v113 + v129;
            if ((uint64_t)(v113 - (_QWORD)v117) < 1)
              goto LABEL_147;
            v119 = obja;
          }
          v131 = (uint64_t *)&v130[-8 * v119];
          v132 = v130;
          while ((unint64_t)v131 < v113)
          {
            v133 = *v131++;
            *(_QWORD *)v132 = v133;
            v132 += 8;
          }
          v134 = &v117[8 * obja];
          *(_QWORD *)(v110 - 56) = v132;
          if (v130 != v134)
            memmove(&v130[-8 * ((v130 - v134) >> 3)], v117, v130 - v134);
          if (v128 != v115)
            memmove(v117, v115, v128 - v115);
        }
        else
        {
          v120 = v116 >> 3;
          v121 = (v116 >> 3) + obja;
          if (v121 >> 61)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v122 = v118 - v111;
          if (v122 >> 2 > v121)
            v121 = v122 >> 2;
          if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8)
            v123 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v123 = v121;
          if (v123)
          {
            v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v202 - 48, v123);
            v126 = v125;
            v119 = obja;
          }
          else
          {
            v124 = 0;
            v126 = 0;
          }
          v135 = &v124[8 * v120];
          v136 = &v135[8 * v119];
          v137 = v135;
          do
          {
            v138 = *(_QWORD *)v115;
            v115 += 8;
            *(_QWORD *)v137 = v138;
            v137 += 8;
          }
          while (v137 != v136);
          v139 = (char *)*v112;
          if (*v112 != v117)
          {
            v140 = v117;
            do
            {
              v141 = *((_QWORD *)v140 - 1);
              v140 -= 8;
              *((_QWORD *)v135 - 1) = v141;
              v135 -= 8;
            }
            while (v140 != v139);
          }
          v142 = *(_BYTE **)(v110 - 56);
          v143 = v142 - v117;
          if (v142 != v117)
            memmove(v136, v117, v142 - v117);
          v144 = *(void **)(v110 - 64);
          *(_QWORD *)(v110 - 64) = v135;
          *(_QWORD *)(v110 - 56) = &v136[v143];
          *(_QWORD *)(v110 - 48) = &v124[8 * v126];
          v103 = v167;
          if (v144)
            operator delete(v144);
        }
      }
LABEL_147:
      std::vector<long>::resize((uint64_t)v109, ((uint64_t)(v109[1] - *v109) >> 3) - v169);
      if (++v106 == v172)
        goto LABEL_148;
    }
  }
LABEL_149:
  v145 = (v218[7] - v218[6]) >> 3;
  v198 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(&v199, v145, &v198);
  v193 = (void *)MEMORY[0x1E0C809B0];
  v194.i64[0] = 3221225472;
  v194.i64[1] = (uint64_t)___ZL12sliceBucketsPNSt3__16vectorINS0_IN10ClipperLib8IntPointENS_9allocatorIS2_EEEENS3_IS5_EEEERNS0_IU8__strongP8PKStrokeNS3_ISB_EEEERNS0_I6BucketNS3_ISF_EEEERNS0_IU8__strongP7NSArrayISA_ENS3_ISM_EEEE_block_invoke;
  *(_QWORD *)&v195 = &__block_descriptor_64_e8_v16__0Q8l;
  *((_QWORD *)&v195 + 1) = &v201;
  *(_QWORD *)&v196 = v218 + 6;
  *((_QWORD *)&v196 + 1) = v159;
  v197 = &v199;
  dispatch_apply((v202 - v201) >> 6, 0, &v193);
  v193 = 0;
  v194.i64[0] = (uint64_t)&v193;
  v194.i64[1] = 0x4812000000;
  *(_QWORD *)&v195 = __Block_byref_object_copy__75;
  *((_QWORD *)&v195 + 1) = __Block_byref_object_dispose__76;
  *(_QWORD *)&v196 = "";
  v192 = 0;
  std::vector<PKStroke * {__strong}>::vector((_QWORD *)&v196 + 1, objc_msgSend(v161, "count"), &v192);
  v185 = 0;
  v186 = &v185;
  v187 = 0x4812000000;
  v188 = __Block_byref_object_copy__82;
  v189 = __Block_byref_object_dispose__83;
  v190 = "";
  v184 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(v191, objc_msgSend(v161, "count"), &v184);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3321888768;
  aBlock[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_85;
  aBlock[3] = &unk_1E7774DA0;
  v146 = v162;
  v182 = v146;
  memset(v183, 0, sizeof(v183));
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__init_with_size[abi:ne180100]<NSArray<PKStroke *> * {__strong}*,NSArray<PKStroke *> * {__strong}*>((char *)v183, v199, v200, v200 - v199);
  v147 = _Block_copy(aBlock);
  v148 = objc_msgSend(v161, "count");
  v175[0] = MEMORY[0x1E0C809B0];
  v175[1] = 3221225472;
  v175[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_87;
  v175[3] = &unk_1E777AA30;
  v149 = v161;
  v176 = v149;
  v179 = &v193;
  v180 = &v185;
  v150 = v147;
  v177 = self;
  v178 = v150;
  dispatch_apply(v148, 0, v175);
  *(_QWORD *)buf = v159;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  MEMORY[0x1C3B7F770](v159, 0x20C40960023A9);
  v151 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
  {
    v152 = v226;
    v153 = __p;
    v154 = objc_msgSend(v160, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = (v152 - v153) >> 3;
    v229 = 2048;
    v230 = v154;
    v231 = 2048;
    v232 = v155 - v158;
    _os_log_impl(&dword_1BE213000, v151, OS_LOG_TYPE_DEFAULT, "Sliced %ld/%ld strokes in %fs.", buf, 0x20u);
  }

  if (v226 == __p || *(_QWORD *)(v194.i64[0] + 56) == *(_QWORD *)(v194.i64[0] + 48) || v186[7] == v186[6])
  {
    v156 = 0;
  }
  else
  {
    -[PKDrawing updateFromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:](self, "updateFromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
  }

  *(_QWORD *)buf = v183;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  _Block_object_dispose(&v185, 8);
  *(_QWORD *)buf = v191;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  _Block_object_dispose(&v193, 8);
  v185 = (void **)&v196 + 1;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v185);
  v193 = &v199;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);
  v193 = &v201;
  std::vector<Bucket>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);

  _Block_object_dispose(&v217, 8);
  v193 = &v223;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);
  if (__p)
  {
    v226 = (char *)__p;
    operator delete(__p);
  }

  return v156;
}

uint64_t __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  CGRect v9;

  v3 = a2;
  v8 = v3;
  if ((objc_msgSend(v3, "_isHidden") & 1) == 0 && (objc_msgSend(v3, "hasSubstrokes") & 1) == 0)
  {
    objc_msgSend(v3, "_bounds");
    if (CGRectIntersectsRect(v9, *(CGRect *)(a1 + 56)))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56)- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)) >> 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v3, "_strokeUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

      std::vector<PKStroke * {__strong}>::push_back[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), &v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }

  return 1;
}

void __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * a2), "_strokeMask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * a2), "copyForMutation");
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v7 = *(void **)(v6 + 8 * a2);
    *(_QWORD *)(v6 + 8 * a2) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * a2), "generateMask");
  }
}

id __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_strokeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 8 * (int)objc_msgSend(v6, "intValue"));
  }
  else
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

void __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_87(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) + 8 * a2), v7);
  objc_msgSend(v7, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) + 8 * a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48);
  v6 = *(void **)(v5 + 8 * a2);
  *(_QWORD *)(v5 + 8 * a2) = v4;

}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
  PKCrash();
}

- (id)clipStroke:(id)a3 onPlane:(id)a4 renderMask:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v11;
  if (v10)
  {
    -[PKDrawing _clipStroke:againstPaths:](self, "_clipStroke:againstPaths:", v11, objc_msgSend(v10, "maskPaths"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v11;
    if (v9)
    {
      objc_msgSend(v11, "_setClipPlane:", v9);
      v16 = 0;
      v14 = -[PKDrawing _clipStroke:newRootStroke:](self, "_clipStroke:newRootStroke:", v12, &v16);
      v13 = v16;

    }
  }

  return v13;
}

- (void)clipStrokesIfNeededOnQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t *v17;
  char *v18;
  unint64_t v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void (**v32)(_QWORD);
  void *v33;
  PKDrawing *v34;
  NSObject *v35;
  id v36;
  _QWORD block[4];
  void (**v38)(_QWORD);
  _QWORD aBlock[4];
  id v40;
  PKDrawing *v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  __n128 (*v52)(__n128 *, __n128 *);
  void (*v53)(uint64_t);
  const char *v54;
  _QWORD v55[3];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  __n128 (*v59)(__n128 *, __n128 *);
  void (*v60)(uint64_t);
  const char *v61;
  void *__p;
  void *v63;
  uint64_t v64;
  void **v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = a4;
  v56 = 0;
  v57 = &v56;
  v58 = 0x4812000000;
  v59 = __Block_byref_object_copy__90;
  v60 = __Block_byref_object_dispose__91;
  v61 = "";
  __p = 0;
  v63 = 0;
  v64 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x4812000000;
  v52 = __Block_byref_object_copy__75;
  v53 = __Block_byref_object_dispose__76;
  v34 = self;
  v54 = "";
  memset(v55, 0, sizeof(v55));
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[PKDrawing _rootStrokes](self, "_rootStrokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void ***)(*((_QWORD *)&v45 + 1) + 8 * i);
        v65 = v11;
        if ((objc_msgSend(v11, "_isHidden") & 1) == 0 && (objc_msgSend(v11, "hasSubstrokes") & 1) == 0)
        {
          objc_msgSend(v11, "ink");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "behavior");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEraser"))
          {

            goto LABEL_30;
          }
          objc_msgSend(v11, "_clipPlane");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {

          }
          else
          {
            objc_msgSend(v11, "_renderMask");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (v16)
              goto LABEL_30;
          }
          v17 = v57;
          v18 = (char *)v57[7];
          v19 = v57[8];
          if ((unint64_t)v18 >= v19)
          {
            v21 = (char *)v57[6];
            v22 = (v18 - v21) >> 3;
            if ((unint64_t)(v22 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v23 = v19 - (_QWORD)v21;
            v24 = (uint64_t)(v19 - (_QWORD)v21) >> 2;
            if (v24 <= v22 + 1)
              v24 = v22 + 1;
            if (v23 >= 0x7FFFFFFFFFFFFFF8)
              v25 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v25 = v24;
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v57 + 8), v25);
              v21 = (char *)v17[6];
              v18 = (char *)v17[7];
            }
            else
            {
              v26 = 0;
            }
            v27 = &v26[8 * v22];
            *(_QWORD *)v27 = v8;
            v20 = v27 + 8;
            while (v18 != v21)
            {
              v28 = *((_QWORD *)v18 - 1);
              v18 -= 8;
              *((_QWORD *)v27 - 1) = v28;
              v27 -= 8;
            }
            v17[6] = (uint64_t)v27;
            v17[7] = (uint64_t)v20;
            v17[8] = (uint64_t)&v26[8 * v25];
            if (v21)
              operator delete(v21);
          }
          else
          {
            *(_QWORD *)v18 = v8;
            v20 = v18 + 8;
          }
          v17[7] = (uint64_t)v20;
          std::vector<PKStroke * {__strong}>::push_back[abi:ne180100](v50 + 6, (id *)&v65);
        }
LABEL_30:
        ++v8;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
    }
    while (v7);
  }

  if (v50[7] != v50[6])
  {
    v29 = (void *)-[PKDrawing copy](self, "copy");
    v30 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke;
    aBlock[3] = &unk_1E777AA80;
    v43 = &v49;
    v31 = v29;
    v40 = v31;
    v41 = v34;
    v44 = &v56;
    v42 = v36;
    v32 = (void (**)(_QWORD))_Block_copy(aBlock);
    v33 = v32;
    if (v35)
    {
      block[0] = v30;
      block[1] = 3221225472;
      block[2] = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_98;
      block[3] = &unk_1E7776F60;
      v38 = v32;
      dispatch_async(v35, block);

    }
    else
    {
      v32[2](v32);
    }

  }
  _Block_object_dispose(&v49, 8);
  v65 = (void **)v55;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v65);
  _Block_object_dispose(&v56, 8);
  if (__p)
  {
    v63 = __p;
    operator delete(__p);
  }

}

void __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  size_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void ***v17;
  id v18;
  void **v19[6];
  _QWORD v20[3];
  id v21;
  _QWORD v22[6];
  _QWORD v23[3];
  void **v24;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x4812000000;
  v22[3] = __Block_byref_object_copy__75;
  v22[4] = __Block_byref_object_dispose__76;
  v22[5] = "";
  v2 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56)
               - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48)) >> 3;
  v21 = 0;
  std::vector<PKStroke * {__strong}>::vector(v23, v2, &v21);
  v19[0] = 0;
  v19[1] = (void **)v19;
  v19[2] = (void **)0x4812000000;
  v19[3] = (void **)__Block_byref_object_copy__82;
  v19[4] = (void **)__Block_byref_object_dispose__83;
  v19[5] = (void **)"";
  v3 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56)
               - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48)) >> 3;
  v18 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(v20, v3, &v18);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 56) - *(_QWORD *)(*(_QWORD *)(v4 + 8) + 48)) >> 3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_2;
  v12 = &unk_1E777AA58;
  v15 = v4;
  v16 = v22;
  v6 = *(id *)(a1 + 32);
  v17 = v19;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  dispatch_apply(v5, 0, &v9);
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "updateFromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:", v9, v10, v11, v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  _Block_object_dispose(v19, 8);
  v24 = (void **)v20;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v24);
  _Block_object_dispose(v22, 8);
  v19[0] = (void **)v23;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](v19);
}

void __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) + 8 * a2);
  v5 = v4;
  objc_msgSend(v5, "_renderMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_renderMask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_clipStroke:againstPaths:", v5, objc_msgSend(v8, "maskPaths"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
    v11 = *(void **)(v10 + 8 * a2);
    *(_QWORD *)(v10 + 8 * a2) = v9;

  }
  else
  {
    objc_msgSend(v5, "_clipPlane");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) + 8 * a2), v4);
    objc_msgSend(*(id *)(a1 + 32), "_clipStroke:newRootStroke:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) + 8 * a2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48);
    v8 = *(void **)(v14 + 8 * a2);
    *(_QWORD *)(v14 + 8 * a2) = v13;
  }

LABEL_6:
  v15 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(void **)(a1 + 40);
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v5;
    _os_log_debug_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEBUG, "Drawing %@ merged clipped/masked stroke %@", (uint8_t *)&v19, 0x16u);
  }

  v16 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "_groupID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Stroke merged into group: %@", (uint8_t *)&v19, 0xCu);

  }
}

uint64_t __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 onscreenVisibleStrokes:(id)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKDrawing strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:](self, "strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:", v7, a5, a3.x, a3.y, a4.x, a4.y, 10.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 transform:(CGAffineTransform *)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v10;
  void *v11;
  __int128 v13;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  -[PKDrawing strokes](self, "strokes", *(_QWORD *)&a5->a, *(_QWORD *)&a5->b, *(_QWORD *)&a5->c, *(_QWORD *)&a5->d, *(_QWORD *)&a5->tx, *(_QWORD *)&a5->ty);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawing strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:](self, "strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:", &v13, v10, v8, v7, x, y, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 minThreshold:(double)a5 transform:(CGAffineTransform *)a6 onscreenVisibleStrokes:(id)a7
{
  double y;
  double x;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  PKDrawing *v46;
  id v47;
  id v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;
  CGRect v65;
  CGRect v66;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v64 = *MEMORY[0x1E0C80C00];
  v48 = a7;
  v13 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v61.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&v61.c = v13;
  *(_OWORD *)&v61.tx = *(_OWORD *)&a6->tx;
  if (!CGAffineTransformIsIdentity(&v61))
  {
    v14 = *(_OWORD *)&a6->c;
    *(_OWORD *)&v59.a = *(_OWORD *)&a6->a;
    *(_OWORD *)&v59.c = v14;
    *(_OWORD *)&v59.tx = *(_OWORD *)&a6->tx;
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformInvert(&v60, &v59);
    v15 = v10 * v60.d + v60.b * v11;
    v11 = v60.tx + v10 * v60.c + v60.a * v11;
    v10 = v60.ty + v15;
    v16 = y * v60.d + v60.b * x;
    x = v60.tx + y * v60.c + v60.a * x;
    y = v60.ty + v16;
  }
  -[PKDrawing _eraserStrokeBounds](self, "_eraserStrokeBounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v46 = self;
  if (v48)
  {
    v47 = v48;
  }
  else
  {
    -[PKDrawing strokes](self, "strokes");
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v26 = v47;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v56 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v30, "ink");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "behavior");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEraser");

        if ((v33 & 1) == 0)
        {
          objc_msgSend(v30, "_bounds");
          v66.origin.x = v18;
          v66.origin.y = v20;
          v66.size.width = v22;
          v66.size.height = v24;
          if (!CGRectIntersectsRect(v65, v66))
          {
            if (objc_msgSend(v30, "intersectsLineFrom:to:minThreshold:", v11, v10, x, y, a5))
            {
              objc_msgSend(v50, "addObject:", v30);
              objc_msgSend(v30, "_groupID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34 == 0;

              if (!v35)
              {
                objc_msgSend(v30, "_groupID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v36);

              }
            }
          }
        }
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v27);
  }

  if (objc_msgSend(v25, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[PKDrawing strokes](v46, "strokes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v52 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v41, "_groupID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v41, "_groupID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v25, "containsObject:", v43);

            if (v44)
              objc_msgSend(v50, "addObject:", v41);
          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v38);
    }

  }
  return v50;
}

- (id)intersectedStrokesFromStroke:(id)a3 visibleOnscreenStrokes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKDrawing_IntersectionAdditions__intersectedStrokesFromStroke_visibleOnscreenStrokes___block_invoke;
  v11[3] = &unk_1E777C368;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v8, "_bounds");
  -[PKDrawing intersectedStrokesTest:inBounds:visibleOnscreenStrokes:](self, "intersectedStrokesTest:inBounds:visibleOnscreenStrokes:", v11, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __88__PKDrawing_IntersectionAdditions__intersectedStrokesFromStroke_visibleOnscreenStrokes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectsClosedStroke:", *(_QWORD *)(a1 + 32));
}

- (id)intersectedStrokesFromRect:(CGRect)a3 visibleOnscreenStrokes:(id)a4
{
  _QWORD v5[4];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKDrawing_IntersectionAdditions__intersectedStrokesFromRect_visibleOnscreenStrokes___block_invoke;
  v5[3] = &__block_descriptor_64_e18_B16__0__PKStroke_8l;
  v6 = a3;
  -[PKDrawing intersectedStrokesTest:inBounds:visibleOnscreenStrokes:](self, "intersectedStrokesTest:inBounds:visibleOnscreenStrokes:", v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __86__PKDrawing_IntersectionAdditions__intersectedStrokesFromRect_visibleOnscreenStrokes___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "intersectsRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (id)intersectedStrokesTest:(id)a3 inBounds:(CGRect)a4 visibleOnscreenStrokes:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  id v39;
  unsigned int (**v40)(id, void *);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v52 = *MEMORY[0x1E0C80C00];
  v40 = (unsigned int (**)(id, void *))a3;
  v11 = a5;
  v38 = v11;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v39 = v11;
  }
  else
  {
    -[PKDrawing strokes](self, "strokes");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PKDrawing _eraserStrokeBounds](self, "_eraserStrokeBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = v39;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v25, "_bounds");
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        if (CGRectIntersectsRect(v53, v55))
        {
          objc_msgSend(v25, "_bounds");
          v56.origin.x = v13;
          v56.origin.y = v15;
          v56.size.width = v17;
          v56.size.height = v19;
          if (!CGRectIntersectsRect(v54, v56))
          {
            if (v40[2](v40, v25))
            {
              objc_msgSend(v41, "addObject:", v25);
              objc_msgSend(v25, "_groupID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26 == 0;

              if (!v27)
              {
                objc_msgSend(v25, "_groupID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v28);

              }
            }
          }
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v20, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v21;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v33, "_groupID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v33, "_groupID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v20, "containsObject:", v35);

            if (v36)
              objc_msgSend(v41, "addObject:", v33);
          }
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v30);
    }

  }
  return v41;
}

- (CGRect)_eraserStrokeBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  v27 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PKDrawing strokes](self, "strokes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "ink");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "behavior");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEraser");

        if (v13)
        {
          objc_msgSend(v10, "_bounds");
          v31.origin.x = v14;
          v31.origin.y = v15;
          v31.size.width = v16;
          v31.size.height = v17;
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          v29 = CGRectUnion(v28, v31);
          x = v29.origin.x;
          y = v29.origin.y;
          width = v29.size.width;
          height = v29.size.height;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)intersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[PKDrawing strokes](self, "strokes");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v13, a4, a5, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)fetchIntersectedStrokesBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleOnscreenStrokes:(id)a5 completion:(id)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  id v13;
  void *v14;
  id v15;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v15 = a5;
  v12 = a6;
  if (v15)
  {
    v13 = v15;
  }
  else
  {
    -[PKDrawing strokes](self, "strokes");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  +[PKClusteringUtility _fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:otherPoint:visibleStrokes:completion:](PKClusteringUtility, "_fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:otherPoint:visibleStrokes:completion:", v13, v12, v10, v9, x, y);

}

+ (CGRect)_boundingBoxForStrokes:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "_bounds", (_QWORD)v20);
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGRect)_boundingBoxForStrokeArray:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "_bounds", (_QWORD)v20);
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (id)_findRightmostStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double MaxX;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
  {
    v14 = v5;
    goto LABEL_13;
  }
  v8 = *(_QWORD *)v17;
  v9 = -1.79769313e308;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v11, "_bounds", (_QWORD)v16);
      MaxX = CGRectGetMaxX(v22);
      if (MaxX > v9)
      {
        v13 = v11;

        v9 = MaxX;
        v6 = v13;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);

  if (v6)
  {
    objc_msgSend(v4, "addObject:", v6);
    +[PKDrawing _otherStrokesCloseToLeft:forStrokes:withClosestStroke:](PKDrawing, "_otherStrokesCloseToLeft:forStrokes:withClosestStroke:", 0, v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v14);
LABEL_13:

  }
  return v4;
}

+ (id)_findLeftmostStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double MinX;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
  {
    v14 = v5;
    goto LABEL_13;
  }
  v8 = *(_QWORD *)v17;
  v9 = 1.79769313e308;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v11, "_bounds", (_QWORD)v16);
      MinX = CGRectGetMinX(v22);
      if (MinX < v9)
      {
        v13 = v11;

        v9 = MinX;
        v6 = v13;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);

  if (v6)
  {
    objc_msgSend(v4, "addObject:", v6);
    +[PKDrawing _otherStrokesCloseToLeft:forStrokes:withClosestStroke:](PKDrawing, "_otherStrokesCloseToLeft:forStrokes:withClosestStroke:", 1, v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v14);
LABEL_13:

  }
  return v4;
}

+ (id)_otherStrokesCloseToLeft:(BOOL)a3 forStrokes:(id)a4 withClosestStroke:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MaxX;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MidY;
  double v40;
  double v41;
  id v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  _BOOL4 v59;
  double v60;
  double v61;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  char v76;
  BOOL v77;
  double MidX;
  CGFloat v80;
  CGFloat rect;
  CGFloat v82;
  CGFloat v83;
  double MaxY;
  double v85;
  double MinY;
  double MinX;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v6 = a3;
  v93 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", v7);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if (v6)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v10);
    v94.origin.x = v14;
    v94.origin.y = v15;
    v94.size.width = v16;
    v94.size.height = v17;
    MinY = CGRectGetMinY(v94);
    v95.origin.x = v14;
    v95.origin.y = v15;
    v95.size.width = v16;
    v95.size.height = v17;
    MaxX = CGRectGetMinX(v95);
  }
  else
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v10);
    v96.origin.x = v14;
    v96.origin.y = v15;
    v96.size.width = v16;
    v96.size.height = v17;
    MinY = CGRectGetMinY(v96);
    v97.origin.x = v14;
    v97.origin.y = v15;
    v97.size.width = v16;
    v97.size.height = v17;
    MaxX = CGRectGetMaxX(v97);
  }
  v85 = MaxX;
  v98.origin.x = v14;
  v98.origin.y = v15;
  v98.size.width = v16;
  v98.size.height = v17;
  MaxY = CGRectGetMaxY(v98);
  objc_msgSend(v8, "_bounds");
  v82 = v20;
  v83 = v19;
  rect = v21;
  v23 = v22;
  objc_msgSend(v8, "_bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v8, "_bounds");
  v80 = v32;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v99.origin.x = v25;
  v99.origin.y = v27;
  v99.size.width = v29;
  v99.size.height = v31;
  MidX = CGRectGetMidX(v99);
  v100.origin.x = v25;
  v100.origin.y = v27;
  v100.size.width = v29;
  v100.size.height = v31;
  MidY = CGRectGetMidY(v100);
  v101.origin.x = v34;
  v101.origin.y = v80;
  v101.size.width = v36;
  v101.size.height = v38;
  v40 = CGRectGetMidX(v101);
  v102.origin.x = v34;
  v102.origin.y = v80;
  v102.size.width = v36;
  v102.size.height = v38;
  v41 = CGRectGetMidY(v102);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v42 = v7;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
  if (v43)
  {
    v44 = fmax((MidY - MinY) * (MidY - MinY) + (MidX - MinX) * (MidX - MinX), (v41 - MaxY) * (v41 - MaxY) + (v40 - v85) * (v40 - v85));
    v45 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v89 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        if ((objc_msgSend(v47, "isEqual:", v8) & 1) != 0)
          continue;
        objc_msgSend(v47, "_bounds");
        x = v103.origin.x;
        y = v103.origin.y;
        width = v103.size.width;
        height = v103.size.height;
        v52 = CGRectGetMidX(v103);
        v104.origin.x = x;
        v104.origin.y = y;
        v104.size.width = width;
        v104.size.height = height;
        v53 = CGRectGetMidY(v104);
        v54 = x;
        v55 = y;
        v56 = width;
        v57 = height;
        if (v6)
        {
          v58 = CGRectGetMinX(*(CGRect *)&v54);
          v105.origin.y = v82;
          v105.origin.x = v83;
          v105.size.width = rect;
          v105.size.height = v23;
          v59 = v58 < CGRectGetMaxX(v105);
        }
        else
        {
          v60 = CGRectGetMaxX(*(CGRect *)&v54);
          v106.origin.y = v82;
          v106.origin.x = v83;
          v106.size.width = rect;
          v106.size.height = v23;
          v59 = v60 > CGRectGetMinX(v106);
        }
        v61 = (v53 - MinY) * (v53 - MinY) + (v52 - MinX) * (v52 - MinX);
        if (((v53 - MaxY) * (v53 - MaxY) + (v52 - v85) * (v52 - v85) < v44 || v61 < v44) && v59)
        {
LABEL_32:
          objc_msgSend(v9, "addObject:", v47, v61);
          continue;
        }
        objc_msgSend(v47, "_bounds", v61);
        v65 = v64;
        v67 = v66;
        v69 = v68;
        v71 = v70;
        objc_msgSend(v8, "_bounds");
        if (v65 >= v72)
        {
          if (v72 + v74 > v65)
          {
LABEL_23:
            v76 = 0;
            goto LABEL_26;
          }
        }
        else if (v65 + v69 > v72)
        {
          goto LABEL_23;
        }
        v76 = 1;
LABEL_26:
        if (v67 >= v73)
        {
          v61 = v73 + v75;
          v77 = v73 + v75 > v67;
        }
        else
        {
          v61 = v67 + v71;
          v77 = v67 + v71 > v73;
        }
        if (!v77)
          v76 = 1;
        if ((v76 & 1) == 0)
          goto LABEL_32;
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    }
    while (v43);
  }

  return v9;
}

+ (PKDrawing)drawingWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:error:", v4, 0);

  return (PKDrawing *)v5;
}

- (int64_t)_minimumSerializationVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKDrawing _rootStrokes](self, "_rootStrokes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    v5 = 1;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasSubstrokes") & 1) != 0)
          goto LABEL_17;
        objc_msgSend(v7, "_strokeMask");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (!v9 || objc_msgSend(v7, "_shapeType"))
          goto LABEL_17;
        objc_msgSend(v7, "_groupID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

LABEL_17:
          v5 = +[PKDrawing _currentSerializationVersion](PKDrawing, "_currentSerializationVersion");
          goto LABEL_18;
        }
        objc_msgSend(v7, "_renderGroupID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (!v12)
          goto LABEL_17;
        objc_msgSend(v7, "ink");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "version") == 2)
        {
          v5 = +[PKDrawing _currentSerializationVersion](PKDrawing, "_currentSerializationVersion");

          goto LABEL_18;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v5 = 1;
  }
LABEL_18:

  return v5;
}

@end
