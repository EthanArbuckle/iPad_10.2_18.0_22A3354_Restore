@implementation CHTopDownStrokeSplit

- (CHTopDownStrokeSplit)initWithStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 splitIndex:(int64_t)a5 writingOrientation:(int64_t)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
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
  double v87;
  double v88;
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
  uint64_t v99;
  double v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  objc_super v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v10 = a3;
  v11 = a4;
  v117.receiver = self;
  v117.super_class = (Class)CHTopDownStrokeSplit;
  v17 = -[CHTopDownStrokeSplit init](&v117, sel_init);
  if (v17)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21, v22, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = *MEMORY[0x1E0C9D628];
    v32 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v33 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v34 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    x = *MEMORY[0x1E0C9D628];
    y = v32;
    width = v33;
    height = v34;
    while (v30 < (unint64_t)objc_msgSend_count(v10, v24, v25, v26, v27, v28))
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v39, v30, v41, v42, v43);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 <= a5)
      {
        objc_msgSend_addObject_(v18, v44, (uint64_t)v48, v45, v46, v47);
        objc_msgSend_bounds(v48, v58, v59, v60, v61, v62);
        v123.origin.x = v63;
        v123.origin.y = v64;
        v123.size.width = v65;
        v123.size.height = v66;
        v120.origin.x = x;
        v120.origin.y = y;
        v120.size.width = width;
        v120.size.height = height;
        v121 = CGRectUnion(v120, v123);
        x = v121.origin.x;
        y = v121.origin.y;
        width = v121.size.width;
        height = v121.size.height;
      }
      else
      {
        objc_msgSend_addObject_(v29, v44, (uint64_t)v48, v45, v46, v47);
        objc_msgSend_bounds(v48, v49, v50, v51, v52, v53);
        v122.origin.x = v54;
        v122.origin.y = v55;
        v122.size.width = v56;
        v122.size.height = v57;
        v118.origin.x = v31;
        v118.origin.y = v32;
        v118.size.width = v33;
        v118.size.height = v34;
        v119 = CGRectUnion(v118, v122);
        v31 = v119.origin.x;
        v32 = v119.origin.y;
        v33 = v119.size.width;
        v34 = v119.size.height;
      }

      ++v30;
    }
    v67 = objc_msgSend_copy(v18, v39, v40, v41, v42, v43);
    v68 = (void *)*((_QWORD *)v17 + 1);
    *((_QWORD *)v17 + 1) = v67;

    v74 = objc_msgSend_copy(v29, v69, v70, v71, v72, v73);
    v75 = (void *)*((_QWORD *)v17 + 2);
    *((_QWORD *)v17 + 2) = v74;

    *((CGFloat *)v17 + 9) = x;
    *((CGFloat *)v17 + 10) = y;
    *((CGFloat *)v17 + 11) = width;
    *((CGFloat *)v17 + 12) = height;
    *((CGFloat *)v17 + 13) = v31;
    *((CGFloat *)v17 + 14) = v32;
    *((CGFloat *)v17 + 15) = v33;
    *((CGFloat *)v17 + 16) = v34;
    objc_msgSend_firstObject(v29, v76, v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimestamp(v81, v82, v83, v84, v85, v86);
    v88 = v87;
    objc_msgSend_lastObject(v18, v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endTimestamp(v94, v95, v96, v97, v98, v99);
    *((double *)v17 + 3) = v88 - v100;

    v101 = (void *)objc_opt_class();
    objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v101, v102, (uint64_t)v10, (uint64_t)v11, a6, v103);
    v104 = objc_claimAutoreleasedReturnValue();
    v105 = (void *)*((_QWORD *)v17 + 4);
    *((_QWORD *)v17 + 4) = v104;

    v106 = (void *)objc_opt_class();
    objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v106, v107, *((_QWORD *)v17 + 1), (uint64_t)v11, a6, v108);
    v109 = objc_claimAutoreleasedReturnValue();
    v110 = (void *)*((_QWORD *)v17 + 5);
    *((_QWORD *)v17 + 5) = v109;

    v111 = (void *)objc_opt_class();
    objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(v111, v112, *((_QWORD *)v17 + 2), (uint64_t)v11, a6, v113);
    v114 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)*((_QWORD *)v17 + 6);
    *((_QWORD *)v17 + 6) = v114;

    *((_QWORD *)v17 + 7) = sub_1BE785BF4(v18, v11);
    *((_QWORD *)v17 + 8) = sub_1BE785BF4(v29, v11);

  }
  return (CHTopDownStrokeSplit *)v17;
}

+ (id)writingDirectionOrderedStrokes:(id)a3 substrokesByStrokeIdentifier:(id)a4 writingOrientation:(int64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  int64_t v17;

  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE785E1C;
  v15[3] = &unk_1E77F4C28;
  v16 = v7;
  v17 = a5;
  v8 = v7;
  objc_msgSend_sortedArrayUsingComparator_(a3, v9, (uint64_t)v15, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)strokeGroup1
{
  return self->_strokeGroup1;
}

- (NSArray)strokeGroup2
{
  return self->_strokeGroup2;
}

- (CGRect)groupBounds1
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_groupBounds1.origin.x;
  y = self->_groupBounds1.origin.y;
  width = self->_groupBounds1.size.width;
  height = self->_groupBounds1.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)groupBounds2
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_groupBounds2.origin.x;
  y = self->_groupBounds2.origin.y;
  width = self->_groupBounds2.size.width;
  height = self->_groupBounds2.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (NSArray)orderedStrokes
{
  return self->_orderedStrokes;
}

- (NSArray)orderedStrokesGroup1
{
  return self->_orderedStrokesGroup1;
}

- (NSArray)orderedStrokesGroup2
{
  return self->_orderedStrokesGroup2;
}

- (int64_t)substrokeCount1
{
  return self->_substrokeCount1;
}

- (int64_t)substrokeCount2
{
  return self->_substrokeCount2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedStrokesGroup2, 0);
  objc_storeStrong((id *)&self->_orderedStrokesGroup1, 0);
  objc_storeStrong((id *)&self->_orderedStrokes, 0);
  objc_storeStrong((id *)&self->_strokeGroup2, 0);
  objc_storeStrong((id *)&self->_strokeGroup1, 0);
}

@end
