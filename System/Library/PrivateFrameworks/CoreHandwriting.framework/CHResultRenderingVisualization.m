@implementation CHResultRenderingVisualization

- (CHResultRenderingVisualization)initWithRecognitionSession:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHResultRenderingVisualization *v8;
  uint64_t v9;
  NSMutableArray *renderedResults;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHResultRenderingVisualization;
  v8 = -[CHVisualization initWithRecognitionSession:](&v12, sel_initWithRecognitionSession_, a3);
  if (v8)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    renderedResults = v8->_renderedResults;
    v8->_renderedResults = (NSMutableArray *)v9;

  }
  return v8;
}

- (NSArray)renderedResults
{
  return (NSArray *)self->_renderedResults;
}

- (int64_t)layeringPriority
{
  return 2;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  v9.receiver = self;
  v9.super_class = (Class)CHResultRenderingVisualization;
  -[CHStrokeGroupBasedVisualization dirtyRectForStrokeGroup:](&v9, sel_dirtyRectForStrokeGroup_, a3);
  v6 = v5 + 60.0;
  v8 = v7 + -60.0;
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v8;
  result.origin.x = v3;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
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
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  CGFloat v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  CGFloat v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColorSpace *DeviceRGB;
  CGColor *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v131;
  void *v132;
  id obj;
  NSMutableArray *renderedResults;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  objc_super v139;
  _QWORD v140[5];
  _BYTE v141[128];
  uint64_t v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  v142 = *MEMORY[0x1E0C80C00];
  v139.receiver = self;
  v139.super_class = (Class)CHResultRenderingVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v139, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend_resultDrawn(self, v6, v7, v8, v9, v10);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v132, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(self->_renderedResults, v17, v18, v19, v20, v21);
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v128 = v16;
  objc_msgSend_strokeGroups(v16, v22, v23, v24, v25, v26);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v135, (uint64_t)v141, 16, v28);
  if (v29)
  {
    v34 = v29;
    v35 = *(_QWORD *)v136;
    v129 = *(_QWORD *)v136;
    do
    {
      v36 = 0;
      v131 = v34;
      do
      {
        if (*(_QWORD *)v136 == v35)
        {
          v37 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v36);
          if (!objc_msgSend_shouldRenderStrokeGroupResult_(self, v30, (uint64_t)v37, v31, v32, v33))
            goto LABEL_6;
        }
        else
        {
          objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v36);
          if (!objc_msgSend_shouldRenderStrokeGroupResult_(self, v39, (uint64_t)v37, v40, v41, v42))
            goto LABEL_6;
        }
        v43 = objc_msgSend_uniqueIdentifier(v37, v30, v38, v31, v32, v33);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v132, v44, v43, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v48, v49, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend_bounds(v37, v55, v56, v57, v58, v59);
          v61 = v60;
          objc_msgSend_bounds(v37, v62, v63, v64, v65, v66);
          v68 = v67 + -60.0;
          objc_msgSend_bounds(v37, v69, v70, v71, v72, v73);
          v143.size.height = 60.0;
          v143.origin.x = v61;
          v143.origin.y = v68;
          v144 = CGRectInset(v143, 1.0, 1.0);
          x = v144.origin.x;
          y = v144.origin.y;
          width = v144.size.width;
          height = v144.size.height;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v79 = CGColorCreate(DeviceRGB, dbl_1BE8D6670);
          CGContextSetStrokeColorWithColor(a4, v79);
          CGContextSetLineWidth(a4, 1.0);
          v145.origin.x = x;
          v145.origin.y = y;
          v145.size.width = width;
          v145.size.height = height;
          CGContextStrokeRect(a4, v145);
          CGColorRelease(v79);
          CGColorSpaceRelease(DeviceRGB);
          v146.origin.x = x;
          v146.origin.y = y;
          v146.size.width = width;
          v146.size.height = height;
          v147 = CGRectInset(v146, 1.0, 1.0);
          v80 = v147.origin.x;
          v81 = v147.origin.y;
          v82 = v147.size.width;
          v83 = v147.size.height;
          renderedResults = self->_renderedResults;
          objc_msgSend_mathResult(v48, v84, v85, v86, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_preferredTranscription(v89, v90, v91, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v140[0] = v95;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v96, v97, v98, v99, v100, v80);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v140[1] = v101;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v102, v103, v104, v105, v106, v81);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v140[2] = v107;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v108, v109, v110, v111, v112, v82);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v140[3] = v113;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v114, v115, v116, v117, v118, v83);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v140[4] = v119;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v120, (uint64_t)v140, 5, v121, v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(renderedResults, v124, (uint64_t)v123, v125, v126, v127);

          v35 = v129;
          v34 = v131;

        }
LABEL_6:
        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v135, (uint64_t)v141, 16, v33);
    }
    while (v34);
  }

}

- (BOOL)shouldRenderStrokeGroupResult:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v11 = objc_msgSend_classification(v4, v6, v7, v8, v9, v10);
  if (objc_msgSend_isStrokeClassificationTextOrMath_(v5, v12, v11, v13, v14, v15))
  {
    objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v28 = objc_msgSend_ancestorIdentifier(v4, v23, v24, v25, v26, v27);
    objc_msgSend_numberWithInteger_(v22, v29, v28, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_msgSend_containsObject_(v21, v34, (uint64_t)v33, v35, v36, v37);

    return (char)v22;
  }
  else
  {

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedResults, 0);
}

@end
