@implementation CHStrokeGroupBasedVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)recognitionSessionDidUpdateRecognitionResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHRecognitionSessionResult *resultDrawn;
  double y;
  double x;
  double height;
  double width;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v106 = *MEMORY[0x1E0C80C00];
  objc_msgSend_resultDrawn(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    resultDrawn = self->_resultDrawn;
    self->_resultDrawn = 0;

  }
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend_recognitionSession(self, v8, v9, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastRecognitionResult(v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokeGroupingResult(v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend_createdStrokeGroups(v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v100, (uint64_t)v105, 16, v38);
  if (v39)
  {
    v44 = v39;
    v45 = *(_QWORD *)v101;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v101 != v45)
          objc_enumerationMutation(v36);
        objc_msgSend_dirtyRectForStrokeGroup_(self, v40, *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v46), v41, v42, v43);
        v112.origin.x = v47;
        v112.origin.y = v48;
        v112.size.width = v49;
        v112.size.height = v50;
        v107.origin.x = x;
        v107.origin.y = y;
        v107.size.width = width;
        v107.size.height = height;
        v108 = CGRectUnion(v107, v112);
        x = v108.origin.x;
        y = v108.origin.y;
        width = v108.size.width;
        height = v108.size.height;
        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v40, (uint64_t)&v100, (uint64_t)v105, 16, v43);
    }
    while (v44);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend_deletedStrokeGroups(v30, v51, v52, v53, v54, v55, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v96, (uint64_t)v104, 16, v58);
  if (v59)
  {
    v64 = v59;
    v65 = *(_QWORD *)v97;
    do
    {
      v66 = 0;
      do
      {
        if (*(_QWORD *)v97 != v65)
          objc_enumerationMutation(v56);
        objc_msgSend_dirtyRectForStrokeGroup_(self, v60, *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v66), v61, v62, v63);
        v113.origin.x = v67;
        v113.origin.y = v68;
        v113.size.width = v69;
        v113.size.height = v70;
        v109.origin.x = x;
        v109.origin.y = y;
        v109.size.width = width;
        v109.size.height = height;
        v110 = CGRectUnion(v109, v113);
        x = v110.origin.x;
        y = v110.origin.y;
        width = v110.size.width;
        height = v110.size.height;
        ++v66;
      }
      while (v64 != v66);
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v60, (uint64_t)&v96, (uint64_t)v104, 16, v63);
    }
    while (v64);
  }

  if (objc_msgSend_newGroupsDefaultToActive(self, v71, v72, v73, v74, v75))
  {
    objc_msgSend_createdStrokeGroups(v30, v76, v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BE7E5C38(self, v81);

  }
  if (!v7)
  {
    objc_msgSend_delegate(self, v76, v77, v78, v79, v80);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualizationNeedsDisplay_(v87, v92, (uint64_t)self, v93, v94, v95);
    goto LABEL_23;
  }
  v111.origin.x = x;
  v111.origin.y = y;
  v111.size.width = width;
  v111.size.height = height;
  if (!CGRectIsEmpty(v111))
  {
    objc_msgSend_delegate(self, v82, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualization_needsDisplayInRect_(v87, v88, (uint64_t)self, v89, v90, v91, x, y, width, height);
LABEL_23:

  }
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;

  objc_msgSend_resultDrawn(self, a2, (uint64_t)a4, v5, v6, v7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_recognitionSession(self, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastRecognitionResult(v15, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_resultDrawn, v21);

    if (objc_msgSend_newGroupsDefaultToActive(self, v22, v23, v24, v25, v26))
    {
      objc_msgSend_resultDrawn(self, v27, v28, v29, v30, v31);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeGroupingResult(v44, v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeGroups(v37, v38, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE7E5C38(self, v43);

    }
  }
}

- (void)toggleVisualizationRegionAtPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat y;
  CGFloat x;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double height;
  double width;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  void *v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;
  CGPoint v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  y = a3.y;
  x = a3.x;
  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, a2, v3, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_mutableCopy(v10, v11, v12, v13, v14, v15);

  if (!v16)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v17, v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (double *)MEMORY[0x1E0C9D628];
  objc_msgSend_resultDrawn(self, v17, v18, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend_recognitionSession(self, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastRecognitionResult(v29, v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_resultDrawn, v35);

  }
  v37 = *v22;
  v36 = v22[1];
  width = v22[2];
  height = v22[3];
  objc_msgSend_resultDrawn(self, v24, v25, v26, v27, v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v40, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend_strokeGroups(v46, v47, v48, v49, v50, v51, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v99, (uint64_t)v103, 16, v54);
  if (v55)
  {
    v61 = v55;
    v62 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v100 != v62)
          objc_enumerationMutation(v52);
        v72 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend_bounds(v72, v56, v57, v58, v59, v60);
        v105.x = x;
        v105.y = y;
        if (CGRectContainsPoint(v108, v105))
        {
          v73 = (void *)MEMORY[0x1E0CB37E8];
          v74 = objc_msgSend_ancestorIdentifier(v72, v56, v57, v58, v59, v60);
          objc_msgSend_numberWithInteger_(v73, v75, v74, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_containsObject_(v16, v80, (uint64_t)v79, v81, v82, v83))
            objc_msgSend_removeObject_(v16, v84, (uint64_t)v79, v85, v86, v87);
          else
            objc_msgSend_addObject_(v16, v84, (uint64_t)v79, v85, v86, v87);
          objc_msgSend_dirtyRectForStrokeGroup_(self, v64, (uint64_t)v72, v65, v66, v67);
          v110.origin.x = v68;
          v110.origin.y = v69;
          v110.size.width = v70;
          v110.size.height = v71;
          v106.origin.x = v37;
          v106.origin.y = v36;
          v106.size.width = width;
          v106.size.height = height;
          v107 = CGRectUnion(v106, v110);
          v37 = v107.origin.x;
          v36 = v107.origin.y;
          width = v107.size.width;
          height = v107.size.height;

        }
      }
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v99, (uint64_t)v103, 16, v60);
    }
    while (v61);
  }

  if (self)
    objc_setProperty_nonatomic_copy(self, v88, v16, 40);
  v109.origin.x = v37;
  v109.origin.y = v36;
  v109.size.width = width;
  v109.size.height = height;
  if (!CGRectIsNull(v109))
  {
    objc_msgSend_delegate(self, v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualization_needsDisplayInRect_(v94, v95, (uint64_t)self, v96, v97, v98, v37, v36, width, height);

  }
}

- (CHRecognitionSessionResult)resultDrawn
{
  return self->_resultDrawn;
}

- (NSSet)activeStrokeGroupAncestorIdentifiers
{
  return self->_activeStrokeGroupAncestorIdentifiers;
}

- (BOOL)newGroupsDefaultToActive
{
  return self->_newGroupsDefaultToActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStrokeGroupAncestorIdentifiers, 0);
  objc_storeStrong((id *)&self->_resultDrawn, 0);
}

@end
