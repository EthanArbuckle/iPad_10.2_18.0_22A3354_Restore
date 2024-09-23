@implementation VCPExifAnalyzer

- (VCPExifAnalyzer)initWithProperties:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v7;
  VCPExifAnalyzer *v8;
  VCPExifAnalyzer *v9;
  NSMutableDictionary *results;
  VCPExifAnalyzer *v11;
  VCPExifAnalyzer *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPExifAnalyzer;
  v8 = -[VCPExifAnalyzer init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_properties, a3);
      results = v9->_results;
      v9->_requestedAnalyses = a4;
      v9->_results = 0;

      v11 = v9;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGAffineTransform)transformUprightAboutTopLeft:(SEL)a3
{
  uint64_t v9;
  __int128 v10;

  switch(a4)
  {
    case 2u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = -1.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&retstr->d = _Q0;
      retstr->ty = 0.0;
      return self;
    case 3u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = -1.0;
      *(_OWORD *)&retstr->d = xmmword_1B6FBCBB0;
      goto LABEL_6;
    case 4u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = 1.0;
      *(_OWORD *)&retstr->d = xmmword_1B6FBCA30;
LABEL_6:
      retstr->ty = 1.0;
      return self;
    case 5u:
      *(_OWORD *)&retstr->a = xmmword_1B6FBD470;
      retstr->c = 1.0;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->ty = 0.0;
      return self;
    case 6u:
      *(_OWORD *)&retstr->a = xmmword_1B6FBD470;
      *(_OWORD *)&retstr->c = xmmword_1B6FBCA30;
      _Q0 = xmmword_1B6FBCBE0;
      goto LABEL_10;
    case 7u:
      *(_OWORD *)&retstr->a = xmmword_1B6FBCBF0;
      *(_OWORD *)&retstr->c = xmmword_1B6FBCA30;
      __asm { FMOV            V0.2D, #1.0 }
      goto LABEL_10;
    case 8u:
      *(_OWORD *)&retstr->a = xmmword_1B6FBCBF0;
      retstr->c = 1.0;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->ty = 1.0;
      return self;
    default:
      v9 = MEMORY[0x1E0C9BAA8];
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&retstr->c = v10;
      _Q0 = *(_OWORD *)(v9 + 32);
LABEL_10:
      *(_OWORD *)&retstr->tx = _Q0;
      return self;
  }
}

- (int)addFaceResults:(id)a3 flags:(unint64_t *)a4
{
  id v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableDictionary *results;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  void *v61;
  int v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  CGAffineTransform v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v76;
  __int128 v77;
  CGAffineTransform v78;
  const __CFString *v79;
  id v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Orientation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v78.c = v6;
    *(_OWORD *)&v78.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v55 = v5;
    if (v5)
    {
      -[VCPExifAnalyzer transformUprightAboutTopLeft:](self, "transformUprightAboutTopLeft:", objc_msgSend(v5, "intValue"));
      *(CGPoint *)&v78.a = v76.origin;
      *(CGSize *)&v78.c = v76.size;
      *(_OWORD *)&v78.tx = v77;
    }
    t1 = v78;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.a = 1.0;
    *(_OWORD *)&t2.d = xmmword_1B6FBCA30;
    t2.ty = 1.0;
    CGAffineTransformConcat(&v78, &t1, &t2);
    objc_msgSend(v61, "objectForKey:", *MEMORY[0x1E0CBCA28]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v7;
    if (!v7)
    {
      v62 = 0;
LABEL_50:

      goto LABEL_51;
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("Regions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    if (!v8)
    {
      v62 = 0;
LABEL_49:

      goto LABEL_50;
    }
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CBCAC8]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v62 = 0;
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      obj = v49;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
      if (v9)
      {
        v62 = 0;
        v66 = *(_QWORD *)v71;
        v65 = *MEMORY[0x1E0CBCAD0];
        v64 = *MEMORY[0x1E0CBCAB0];
        v59 = *MEMORY[0x1E0CBCAE0];
        v58 = *MEMORY[0x1E0CBCAE8];
        v57 = *MEMORY[0x1E0CBCAD8];
        v56 = *MEMORY[0x1E0CBCAC0];
        v10 = 0.0;
LABEL_10:
        v67 = v9;
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v71 != v66)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v11);
          objc_msgSend(v12, "objectForKey:", v65);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v64))
          {
            objc_msgSend(v12, "objectForKey:", v59);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v58);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v57);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v56);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = !v68 || v14 == 0;
            v18 = v17 || v15 == 0;
            v19 = v18 || v16 == 0;
            v20 = !v19;
            v63 = v20;
            if (v19)
            {
              v62 = -18;
            }
            else
            {
              memset(&v76, 0, sizeof(v76));
              objc_msgSend(v68, "floatValue");
              v22 = v21;
              objc_msgSend(v15, "floatValue");
              v24 = v23;
              objc_msgSend(v14, "floatValue");
              v26 = v25;
              objc_msgSend(v16, "floatValue");
              v28 = v27;
              objc_msgSend(v15, "floatValue");
              v30 = v29;
              objc_msgSend(v16, "floatValue");
              v32 = (float)(v22 + (float)(v24 * -0.5));
              v35 = v31;
              v76.origin.x = v32;
              v76.origin.y = (float)(v26 + (float)(v28 * -0.5));
              v76.size.width = v30;
              v76.size.height = v31;
              v36 = v31 >= v30 ? v31 : v30;
              if (v10 < v36)
                v10 = v36;
              v69 = v78;
              v37 = v32;
              v33 = (float)(v26 + (float)(v28 * -0.5));
              v34 = v30;
              v76 = CGRectApplyAffineTransform(*(CGRect *)(&v35 - 3), &v69);
              v38 = MediaAnalysisFacePosition(&v76);
              v86[0] = CFSTR("flags");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 16 * (v36 >= 0.449999988));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v87[0] = v39;
              v86[1] = CFSTR("attributes");
              v84[0] = CFSTR("facePosition");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v85[0] = v40;
              v84[1] = CFSTR("faceBounds");
              NSStringFromRect(v76);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v85[1] = v41;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v87[1] = v42;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v43);

            }
            if (!v63)
              break;
          }

          if (v67 == ++v11)
          {
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
            if (v9)
              goto LABEL_10;
            goto LABEL_44;
          }
        }
      }
      else
      {
        v62 = 0;
        v10 = 0.0;
LABEL_44:

        if (!objc_msgSend(v53, "count"))
          goto LABEL_47;
        *a4 |= 0x20uLL;
        -[NSMutableDictionary setObject:forKey:](self->_results, "setObject:forKey:", v53, CFSTR("FaceResults"));
        v44 = MediaAnalysisShotType(v10);
        results = self->_results;
        v81 = CFSTR("attributes");
        v79 = CFSTR("shotType");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v44);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v80 = obj;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](results, "setObject:forKey:", v47, CFSTR("ShotTypeResults"));

      }
    }
    else
    {
      v62 = -108;
    }
LABEL_47:

    goto LABEL_48;
  }
  v62 = -50;
LABEL_51:

  return v62;
}

- (int)analyzeAsset:(unint64_t *)a3 results:(id *)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *results;
  NSMutableDictionary *v8;
  int result;
  NSMutableDictionary *v10;

  *a4 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v6;

  v8 = self->_results;
  if (!v8)
    return -108;
  if (self->_properties && (self->_requestedAnalyses & 4) != 0)
  {
    result = -[VCPExifAnalyzer addFaceResults:flags:](self, "addFaceResults:flags:");
    if (result)
      return result;
    v8 = self->_results;
  }
  v10 = objc_retainAutorelease(v8);
  result = 0;
  *a4 = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
