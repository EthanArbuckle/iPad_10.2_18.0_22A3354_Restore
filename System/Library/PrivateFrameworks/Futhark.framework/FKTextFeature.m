@implementation FKTextFeature

- (FKTextFeature)initWithType:(int64_t)a3 boundingBox:(CGRect *)a4 corners:(id)a5 featureID:(int64_t)a6 session:(FKSession *)a7 backingIndex:(id)a8 scale:(int)a9
{
  FKTextFeature *v15;
  FKTextFeature *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float64x2_t v25;
  uint64_t v26;
  const __CFDictionary *v27;
  uint64_t v28;
  CGSize size;
  CGFloat x;
  CGPoint v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  CGPoint point;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _QWORD v44[5];
  CGPoint v45;
  CGPoint v46;
  CGPoint v47;

  v44[4] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)FKTextFeature;
  v15 = -[FKTextFeature init](&v42, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_backingIndex.seqInd = a8.var0;
    v15->_session = a7;
    v15->_scale = a9;
    if (a5)
    {
      v15->_corners = (NSArray *)a5;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v17 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v39;
        __asm { FMOV            V0.2D, #1.0 }
        v34 = _Q0;
        v25 = 0uLL;
        v33 = (CGPoint)*MEMORY[0x1E0C9D538];
        do
        {
          v26 = 0;
          do
          {
            v35 = v25;
            if (*(_QWORD *)v39 != v19)
              objc_enumerationMutation(a5);
            v27 = *(const __CFDictionary **)(*((_QWORD *)&v38 + 1) + 8 * v26);
            point = v33;
            if (CGPointMakeWithDictionaryRepresentation(v27, &point))
            {
              v34 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v34, (float64x2_t)point), (int8x16_t)point, (int8x16_t)v34);
              v25 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v35, (float64x2_t)point), (int8x16_t)v35, (int8x16_t)point);
            }
            else
            {
              v25 = v35;
            }
            ++v26;
          }
          while (v18 != v26);
          v36 = v25;
          v28 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          v25 = v36;
          v18 = v28;
        }
        while (v28);
      }
      else
      {
        __asm { FMOV            V0.2D, #1.0 }
        v34 = _Q0;
        v25 = 0uLL;
      }
      v16->_boundingBox.origin = (CGPoint)v34;
      v16->_boundingBox.size = (CGSize)vsubq_f64(v25, v34);
      v16->_featureID = a6;
    }
    else if (a4)
    {
      size = a4->size;
      v15->_boundingBox.origin = a4->origin;
      v15->_boundingBox.size = size;
      x = a4->origin.x;
      size.width = a4->origin.y;
      v44[0] = CGPointCreateDictionaryRepresentation(*(CGPoint *)((char *)&size - 8));
      v45.x = a4->origin.x;
      v45.y = a4->origin.y + a4->size.height;
      v44[1] = CGPointCreateDictionaryRepresentation(v45);
      v46.x = a4->origin.x + a4->size.width;
      v46.y = a4->origin.y + a4->size.height;
      v44[2] = CGPointCreateDictionaryRepresentation(v46);
      v47.y = a4->origin.y;
      v47.x = a4->origin.x + a4->size.width;
      v44[3] = CGPointCreateDictionaryRepresentation(v47);
      v16->_corners = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
    }
    else
    {
      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FKTextFeature;
  -[FKTextFeature dealloc](&v3, sel_dealloc);
}

+ (id)featureFromConcompIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 type:(int64_t)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unsigned int v14;
  void *v15;
  int var2;
  double v17;
  concomp *var22;
  double v19;
  _WORD *v20;
  double x;
  double y;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double width;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  id v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  FKTextFeature *v46;
  FKTextFeature *v47;
  uint64_t v49;
  int64_t v50;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v11 = a6;
  v14 = a3;
  v15 = 0;
  var2 = a5->var2;
  v17 = 0.5;
  if (!var2)
    v17 = 0.0;
  var22 = a4->var22;
  v19 = (float)(1 << var2);
  v20 = (_WORD *)((char *)var22 + 100 * a3);
  LOWORD(v8) = v20[40];
  x = a5->var1.x;
  y = a5->var1.y;
  v23 = x + v19 * ((double)v8 - v17);
  LOWORD(v9) = v20[41];
  *(double *)&v24 = v17 + (double)v9;
  v25 = x + v19 * *(double *)&v24;
  LOWORD(v24) = v20[42];
  v26 = y + v19 * ((double)v24 - v17);
  LOWORD(v10) = v20[43];
  v27 = y + v19 * (v17 + (double)v10);
  width = (double)(int)a5->var0.width;
  height = (double)(int)a5->var0.height;
  v30 = v23 / width;
  v31 = v26 / height;
  v32 = (v25 - v23 + 1.0) / width;
  v33 = (v27 - v26 + 1.0) / height;
  v52 = v23 / width;
  v53 = v26 / height;
  v54 = v32;
  v55 = v33;
  v34 = (*a8)++;
  if (a6 == 1 && a7)
  {
    if (*((_DWORD *)var22 + 25 * a3 + 16) == -1)
    {
      v15 = 0;
    }
    else
    {
      v50 = v34;
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v37 = 0;
      v38 = 1;
      do
      {
        v39 = v38;
        v40 = *((unsigned int *)var22 + 25 * a3 + v37 + 16);
        if ((_DWORD)v40 == -1)
          break;
        v41 = +[FKTextFeature featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:", v40, a4, a5, 2, 0, a8);
        objc_msgSend(v15, "addObject:", v41);
        objc_msgSend(v41, "boundingBox");
        v58.origin.x = v42;
        v58.origin.y = v43;
        v58.size.width = v44;
        v58.size.height = v45;
        v56.origin.x = v30;
        v56.origin.y = v31;
        v56.size.width = v32;
        v56.size.height = v33;
        v57 = CGRectUnion(v56, v58);
        v30 = v57.origin.x;
        v31 = v57.origin.y;
        v32 = v57.size.width;
        v33 = v57.size.height;
        v38 = 0;
        v37 = 1;
      }
      while ((v39 & 1) != 0);
      v54 = v32;
      v55 = v33;
      v52 = v30;
      v53 = v31;
      v14 = a3;
      v11 = 1;
      v34 = v50;
    }
  }
  v46 = [FKTextFeature alloc];
  LODWORD(v49) = a5->var2;
  v47 = -[FKTextFeature initWithType:boundingBox:corners:featureID:session:backingIndex:scale:](v46, "initWithType:boundingBox:corners:featureID:session:backingIndex:scale:", v11, &v52, 0, v34, a4, v14, v49);
  -[FKTextFeature setSubFeatures:](v47, "setSubFeatures:", v15);
  return v47;
}

+ (id)featureFromSequenceIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 createConcompFeatures:(BOOL)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8
{
  unint64_t v8;
  int64_t *v9;
  uint64_t v10;
  _BOOL4 v11;
  $6E568BCB613A46A0F97ABA1A094F3C91 *v12;
  unsigned int v14;
  sequence *var29;
  int v16;
  char *v17;
  unsigned int v18;
  unsigned __int16 *v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  int v25;
  double v26;
  _BOOL4 v27;
  int v28;
  int v29;
  char *v30;
  int *v31;
  int v32;
  uint64_t v33;
  concomp *var22;
  int v35;
  _WORD *v36;
  char v37;
  uint64_t v38;
  int v39;
  char v40;
  _WORD *v41;
  double v42;
  double v43;
  double v44;
  _WORD *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
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
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double x;
  double y;
  double height;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  uint64_t v91;
  FKTextFeature *v92;
  FKTextFeature *v93;
  char *v94;
  int *v95;
  int v96;
  int v97;
  void *v98;
  sequence *v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v103;
  unsigned __int16 *v104;
  unsigned __int16 *v105;
  _BOOL4 v106;
  sequence *v108;
  _BOOL4 v109;
  _QWORD *v113;
  uint64_t v114;
  int v115;
  int v116;
  int v117;
  _QWORD v118[6];
  CGPoint v119;
  CGPoint v120;
  CGPoint v121;
  CGPoint v122;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v14 = a3;
  v118[4] = *MEMORY[0x1E0C80C00];
  var29 = a4->var29;
  v16 = a3;
  v17 = (char *)var29 + 104 * a3;
  v20 = *((unsigned __int16 *)v17 + 12);
  v19 = (unsigned __int16 *)(v17 + 24);
  v18 = v20;
  v21 = *((_DWORD *)v19 + 2);
  v22 = *((_DWORD *)v19 + 3);
  v23 = *((_DWORD *)v19 + 4);
  v24 = (double)v20;
  v25 = v19[1];
  v26 = (double)(v25 + 1);
  if (a5->var2)
  {
    v27 = v21 > v22;
    v28 = 2 * (v23 + v21);
    v116 = v28;
    v117 = 1;
    v29 = 2 * (v23 + v22);
    v115 = v29;
    LOWORD(v118[0]) = 2 * v18 - 1;
    WORD1(v118[0]) = (2 * v25) | 1;
    v30 = (char *)var29 + 104 * a3;
    v32 = *((_DWORD *)v30 + 5);
    v31 = (int *)(v30 + 20);
    WORD2(v118[0]) = 2 * *((_WORD *)v31 + 4) - 1;
    HIWORD(v118[0]) = (2 * *((_WORD *)v31 + 5)) | 1;
    if (v32 < 1)
    {
      v42 = 0.5;
    }
    else
    {
      v104 = v19 + 1;
      v105 = v19;
      v106 = a6;
      v109 = a7;
      v33 = 0;
      v108 = var29;
      v113 = (_QWORD *)((char *)var29 + 104 * a3 + 8);
      do
      {
        v114 = 0;
        var22 = a4->var22;
        v35 = *(_DWORD *)(*v113 + 4 * v33);
        v36 = (_WORD *)((char *)var22 + 100 * v35);
        LOWORD(v114) = 2 * v36[40] - 1;
        v37 = 1;
        WORD1(v114) = (2 * v36[41]) | 1;
        WORD2(v114) = 2 * v36[42] - 1;
        HIWORD(v114) = (2 * v36[43]) | 1;
        FKSequenceAdjustSlantedLines((uint64_t)a4, (unsigned __int16 *)v118, (uint64_t)&v114, v27, &v116, &v115, &v117);
        v38 = 0;
        do
        {
          v39 = *((_DWORD *)var22 + 25 * v35 + v38 + 16);
          if (v39 == -1)
            break;
          v40 = v37;
          v41 = (_WORD *)((char *)a4->var22 + 100 * v39);
          LOWORD(v114) = 2 * v41[40] - 1;
          WORD1(v114) = (2 * v41[41]) | 1;
          WORD2(v114) = 2 * v41[42] - 1;
          HIWORD(v114) = (2 * v41[43]) | 1;
          FKSequenceAdjustSlantedLines((uint64_t)a4, (unsigned __int16 *)v118, (uint64_t)&v114, v27, &v116, &v115, &v117);
          v37 = 0;
          v38 = 1;
        }
        while ((v40 & 1) != 0);
        ++v33;
      }
      while (v33 < *v31);
      v29 = v115;
      v28 = v116;
      v42 = (double)v117 * 0.5;
      v18 = *v105;
      v25 = *v104;
      v9 = a8;
      v10 = v109;
      v16 = a3;
      var29 = v108;
      v11 = v106;
    }
    v43 = (double)v28 * 0.5;
    v44 = (double)v29 * 0.5;
    v8 = -0.5;
    v24 = v24 + -0.5;
    v26 = v26 + 0.5;
    v14 = a3;
    v12 = a5;
  }
  else
  {
    v43 = (double)v21;
    v44 = (double)v22;
    v42 = (double)v23;
  }
  v45 = (_WORD *)((char *)var29 + 104 * v16 + 28);
  if (v44 >= v43)
  {
    LOWORD(v8) = *v45;
    v46 = (double)v8;
    v47 = (double)(*((unsigned __int16 *)var29 + 52 * v16 + 15) + 1);
  }
  else
  {
    v46 = (double)(*((unsigned __int16 *)var29 + 52 * v16 + 15) + 1);
    LOWORD(v8) = *v45;
    v47 = (double)v8;
  }
  v48 = v43 + v42;
  v49 = (double)(v25 + 1);
  v50 = v44 + v42;
  v51 = (double)v18 - (v44 - v43);
  v52 = v26 - v24 + v46;
  v53 = v49 - (v44 - v43);
  v54 = v26 - v24 + v47;
  v55 = (double)v18 * v52 - v46 * v51;
  v56 = (double)v18 - v51;
  v57 = v24 * v44 - v43 * v26;
  v58 = v43 - v44;
  v59 = v46 - v52;
  v60 = v56 * v58 - (v46 - v52) * (v24 - v26);
  v61 = (v55 * (v24 - v26) - v56 * v57) / v60;
  v62 = (v55 * v58 - (v46 - v52) * v57) / v60;
  v63 = v24 * v50 - v48 * v26;
  v64 = v48 - v50;
  v65 = v56 * v64 - v59 * (v24 - v26);
  v66 = (v55 * (v24 - v26) - v56 * v63) / v65;
  v67 = (v55 * v64 - v59 * v63) / v65;
  v68 = v49 * v54 - v47 * v53;
  v69 = v49 - v53;
  v70 = v68 * (v24 - v26) - v69 * v57;
  v71 = v47 - v54;
  v72 = v68 * v58 - v71 * v57;
  v73 = -(v71 * (v24 - v26));
  v74 = v69 * v58 - v71 * (v24 - v26);
  v75 = v70 / v74;
  v76 = v72 / v74;
  v77 = v68 * v64 - v71 * v63;
  v78 = v73 + v69 * v64;
  v79 = (v68 * (v24 - v26) - v69 * v63) / v78;
  v80 = v77 / v78;
  v81 = (float)(1 << v12->var2);
  x = v12->var1.x;
  y = v12->var1.y;
  height = v12->var0.height;
  v119.x = (x + v81 * v61) / v12->var0.width;
  v119.y = (y + v81 * v62) / height;
  v85 = (x + v81 * v66) / v12->var0.width;
  v86 = (y + v81 * v67) / height;
  v87 = (x + v81 * v75) / v12->var0.width;
  v88 = (y + v81 * v76) / height;
  v89 = (x + v81 * v79) / v12->var0.width;
  v90 = (y + v81 * v80) / height;
  v118[0] = CGPointCreateDictionaryRepresentation(v119);
  v120.x = v85;
  v120.y = v86;
  v118[1] = CGPointCreateDictionaryRepresentation(v120);
  v121.x = v89;
  v121.y = v90;
  v118[2] = CGPointCreateDictionaryRepresentation(v121);
  v122.x = v87;
  v122.y = v88;
  v118[3] = CGPointCreateDictionaryRepresentation(v122);
  v91 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
  v92 = [FKTextFeature alloc];
  LODWORD(v103) = v12->var2;
  v93 = -[FKTextFeature initWithType:boundingBox:corners:featureID:session:backingIndex:scale:](v92, "initWithType:boundingBox:corners:featureID:session:backingIndex:scale:", 0, 0, v91, (*v9)++, a4, v14, v103);
  if (v11)
  {
    v94 = (char *)var29 + 104 * v16;
    v96 = *((_DWORD *)v94 + 5);
    v95 = (int *)(v94 + 20);
    if (v96 >= 1)
    {
      v97 = v16;
      v98 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      if (*v95 >= 1)
      {
        v99 = var29;
        v100 = 0;
        v101 = (_QWORD *)((char *)v99 + 104 * v97 + 8);
        do
          objc_msgSend(v98, "addObject:", +[FKTextFeature featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:", *(unsigned int *)(*v101 + 4 * v100++), a4, v12, 1, v10, v9));
        while (v100 < *v95);
      }
      -[FKTextFeature setSubFeatures:](v93, "setSubFeatures:", v98);
    }
  }
  return v93;
}

- (NSArray)candidates
{
  NSArray *candidates;
  uint64_t i;
  FKTextCandidate *v5;
  uint64_t v6;
  double v7;
  FKTextCandidate *v8;
  FKTextCandidate *v9;
  _OWORD v11[3];
  uint64_t v12;
  _OWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  candidates = self->_candidates;
  if (!candidates)
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    FKRecognizeGetCandidates((uint64_t)self->_session->var22 + 100 * self->_backingIndex.seqInd, (int *)v13, v11);
    candidates = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 56; i += 4)
    {
      if (!*(_DWORD *)((char *)v13 + i))
        break;
      v5 = [FKTextCandidate alloc];
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v11 + i);
      *(float *)&v7 = (float)*(int *)((char *)v13 + i) / 100.0;
      v8 = -[FKTextCandidate initWithText:confidence:](v5, "initWithText:confidence:", v6, v7);
      v9 = v8;
      -[NSArray addObject:](candidates, "addObject:", v8);
    }
    self->_candidates = candidates;
  }
  return candidates;
}

- (int64_t)featureID
{
  return self->_featureID;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)corners
{
  return self->_corners;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (NSArray)subFeatures
{
  return self->_subFeatures;
}

- (void)setSubFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
