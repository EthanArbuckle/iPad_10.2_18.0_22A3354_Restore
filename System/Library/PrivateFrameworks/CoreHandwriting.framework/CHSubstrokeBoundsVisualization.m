@implementation CHSubstrokeBoundsVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)CHSubstrokeBoundsVisualization;
  -[CHStrokeGroupBasedVisualization dirtyRectForStrokeGroup:](&v3, sel_dirtyRectForStrokeGroup_, a3);
  return CGRectInset(v4, -2.0, -2.0);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];
  _BYTE v79[128];
  CGFloat lengths[2];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v81 = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)CHSubstrokeBoundsVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v77, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend_resultDrawn(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v16, v17, v18, v19, v20, v21);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokeGroups(v67, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayWithOptions_usingComparator_(v33, v34, 1, (uint64_t)&unk_1E77F1770, v35, v36);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  CGContextSetLineWidth(a4, 2.0);
  *(_OWORD *)lengths = xmmword_1BE8D5D10;
  CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v66;
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v73, (uint64_t)v79, 16, v38);
  if (v44)
  {
    v45 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v74 != v45)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend_bounds(v47, v39, v40, v41, v42, v43);
        v84.origin.x = x;
        v84.origin.y = y;
        v84.size.width = width;
        v84.size.height = height;
        if (CGRectIntersectsRect(v82, v84))
        {
          v48 = v47;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend_writingDirectionSortedSubstrokes(v48, v49, v50, v51, v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v55 = v54;
            v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v69, (uint64_t)v78, 16, v57);
            if (v63)
            {
              v64 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v63; ++j)
                {
                  if (*(_QWORD *)v70 != v64)
                    objc_enumerationMutation(v55);
                  objc_msgSend_rotatedBounds(*(void **)(*((_QWORD *)&v69 + 1) + 8 * j), v58, v59, v60, v61, v62);
                  CGContextStrokeRect(a4, v83);
                }
                v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v69, (uint64_t)v78, 16, v62);
              }
              while (v63);
            }

          }
        }
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v73, (uint64_t)v79, 16, v43);
    }
    while (v44);
  }

}

@end
