@implementation CHStrokeGroup

- (CHStrokeGroup)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 groupingConfidence:(double)a8 strategyIdentifier:(id)a9 firstStrokeOrigin:(CGPoint)a10
{
  return (CHStrokeGroup *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, a2, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a7, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a8, a10.x, a10.y);
}

- (CHStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 strategyIdentifier:(id)a10 firstStrokeOrigin:(CGPoint)a11
{
  double y;
  double x;
  double height;
  double width;
  double v18;
  double v19;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  const char *v29;
  uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  CHStrokeGroup *v31;
  _QWORD block[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  y = a11.y;
  x = a11.x;
  height = a7.size.height;
  width = a7.size.width;
  v18 = a7.origin.y;
  v19 = a7.origin.x;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a10;
  objc_opt_self();
  if (qword_1EF568078 != -1)
    dispatch_once(&qword_1EF568078, &unk_1E77F16B0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE6DFFC8;
  block[3] = &unk_1E77F2D50;
  block[4] = &v34;
  dispatch_sync((dispatch_queue_t)qword_1EF568070, block);
  v28 = v35[3];
  _Block_object_dispose(&v34, 8);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v29, v28, v28, (uint64_t)v24, (uint64_t)v25, v26, a8, v19, v18, width, height, a9, x, y, v27);
  else
    StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v29, v28, a3, (uint64_t)v24, (uint64_t)v25, v26, a8, v19, v18, width, height, a9, x, y, v27);
  v31 = (CHStrokeGroup *)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;

  return v31;
}

- (CHStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 groupingConfidence:(double)a10 strategyIdentifier:(id)a11 firstStrokeOrigin:(CGPoint)a12
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v20;
  CGFloat v21;
  id v24;
  id v25;
  id v26;
  CHStrokeGroup *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CHStrokeGroup *v33;
  uint64_t v34;
  NSSet *strokeIdentifiers;
  CGSize *v36;
  id v39;
  objc_super v40;

  y = a12.y;
  x = a12.x;
  height = a8.size.height;
  width = a8.size.width;
  v20 = a8.origin.y;
  v21 = a8.origin.x;
  v24 = a5;
  v39 = a6;
  v25 = a7;
  v26 = a11;
  v40.receiver = self;
  v40.super_class = (Class)CHStrokeGroup;
  v27 = -[CHStrokeGroup init](&v40, sel_init);
  v33 = v27;
  if (v27)
  {
    v27->_uniqueIdentifier = a3;
    v27->_ancestorIdentifier = a4;
    v34 = objc_msgSend_copy(v24, v28, v29, v30, v31, v32);
    strokeIdentifiers = v33->_strokeIdentifiers;
    v33->_strokeIdentifiers = (NSSet *)v34;

    objc_storeStrong((id *)&v33->_firstStrokeIdentifier, a6);
    objc_storeStrong((id *)&v33->_lastStrokeIdentifier, a7);
    v33->_bounds.origin.x = v21;
    v33->_bounds.origin.y = v20;
    v36 = (CGSize *)MEMORY[0x1E0C9D820];
    v33->_bounds.size.width = width;
    v33->_bounds.size.height = height;
    v33->_normalizedSize = *v36;
    v33->_classification = a9;
    v33->_groupingConfidence = a10;
    objc_storeStrong((id *)&v33->_strategyIdentifier, a11);
    v33->_firstStrokeOrigin.x = x;
    v33->_firstStrokeOrigin.y = y;
  }

  return v33;
}

- (void)updateStrategyIdentifier:(id)a3 classification:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  NSString *strategyIdentifier;
  id v13;

  v13 = a3;
  v11 = (NSString *)objc_msgSend_copy(v13, v6, v7, v8, v9, v10);
  strategyIdentifier = self->_strategyIdentifier;
  self->_strategyIdentifier = v11;

  self->_classification = a4;
}

+ (BOOL)isStrokeGroupSet:(id)a3 equivalentToStrokeGroupSet:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  BOOL v44;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v46 = v5;
  v47 = v6;
  if (v5 == v6)
  {
    v44 = 1;
  }
  else
  {
    v12 = v6;
    v13 = objc_msgSend_count(v5, v7, v8, v9, v10, v11);
    if (v13 == objc_msgSend_count(v12, v14, v15, v16, v17, v18))
    {
      v24 = (void *)objc_msgSend_mutableCopy(v12, v19, v20, v21, v22, v23);
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v5;
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v53, (uint64_t)v58, 16, v26);
      if (v27)
      {
        v28 = *(_QWORD *)v54;
        while (1)
        {
          v29 = 0;
LABEL_6:
          if (*(_QWORD *)v54 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v29);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v31 = v24;
          v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v49, (uint64_t)v57, 16, v33);
          if (!v38)
            break;
          v39 = *(_QWORD *)v50;
LABEL_10:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v50 != v39)
              objc_enumerationMutation(v31);
            v41 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v40);
            if (objc_msgSend_isEquivalentToStrokeGroup_(v30, v34, v41, v35, v36, v37))
              break;
            if (v38 == ++v40)
            {
              v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v49, (uint64_t)v57, 16, v37);
              if (v38)
                goto LABEL_10;
              goto LABEL_22;
            }
          }
          objc_msgSend_removeObject_(v31, v34, v41, v35, v36, v37);

          if (++v29 != v27)
            goto LABEL_6;
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v53, (uint64_t)v58, 16, v43);
          v44 = 1;
          if (!v27)
            goto LABEL_24;
        }
LABEL_22:

        v44 = 0;
      }
      else
      {
        v44 = 1;
      }
LABEL_24:

    }
    else
    {
      v44 = 0;
    }
  }

  return v44;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)CHStrokeGroup;
  -[CHStrokeGroup description](&v68, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_uniqueIdentifier(self, v4, v5, v6, v7, v8);
  v15 = objc_msgSend_ancestorIdentifier(self, v10, v11, v12, v13, v14);
  objc_msgSend_bounds(self, v16, v17, v18, v19, v20);
  v22 = v21;
  objc_msgSend_bounds(self, v23, v24, v25, v26, v27);
  v29 = v28;
  objc_msgSend_bounds(self, v30, v31, v32, v33, v34);
  v36 = v35;
  objc_msgSend_bounds(self, v37, v38, v39, v40, v41);
  v43 = v42;
  objc_msgSend_strokeIdentifiers(self, v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_count(v49, v50, v51, v52, v53, v54);
  objc_msgSend_strategyIdentifier(self, v56, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v62, (uint64_t)CFSTR(" uniqueID: %ld, ancestorID: %ld, bounds: {x: %0.1f, y: %0.1f, width: %0.1f, height: %0.1f}, strokes: %ld, strategy: %@"), v63, v64, v65, v9, v15, v22, v29, v36, v43, v55, v61);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v66;
}

- (CGVector)averageWritingOrientation
{
  double v2;
  double v3;
  CGVector result;

  v2 = 1.0;
  v3 = 0.0;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGSize)normalizedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_normalizedSize.width;
  height = self->_normalizedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNormalizedSize:(CGSize)a3
{
  self->_normalizedSize = a3;
}

- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 firstStrokeOrigin:(CGPoint)a10
{
  double y;
  double x;
  double height;
  double width;
  double v16;
  double v17;
  id v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  uint8_t v70[16];

  y = a10.y;
  x = a10.x;
  height = a7.size.height;
  width = a7.size.width;
  v16 = a7.origin.y;
  v17 = a7.origin.x;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  objc_msgSend_strokeIdentifiers(self, v26, v27, v28, v29, v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v37 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_impl(&dword_1BE607000, v37, OS_LOG_TYPE_FAULT, "Cannot have nil strokeIdentifiers", v70, 2u);
    }

  }
  if (objc_msgSend_count(v22, v31, v32, v33, v34, v35))
  {
    objc_msgSend_setByAddingObjectsFromSet_(v36, v38, (uint64_t)v22, v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v43;
  }
  if (objc_msgSend_count(v23, v38, v39, v40, v41, v42))
  {
    v49 = (void *)objc_msgSend_mutableCopy(v36, v44, v45, v46, v47, v48);
    objc_msgSend_minusSet_(v49, v50, (uint64_t)v23, v51, v52, v53);

  }
  else
  {
    v49 = v36;
  }
  v54 = objc_alloc((Class)objc_opt_class());
  v60 = objc_msgSend_ancestorIdentifier(self, v55, v56, v57, v58, v59);
  objc_msgSend_strategyIdentifier(self, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v54, v67, v60, (uint64_t)v49, (uint64_t)v24, (uint64_t)v25, a8, v66, v17, v16, width, height, a9, x, y);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4
{
  CGPath *Mutable;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat MinX;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat MaxY;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat MaxX;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  Mutable = CGPathCreateMutable();
  objc_msgSend_bounds(self, v6, v7, v8, v9, v10);
  MinX = CGRectGetMinX(v31);
  objc_msgSend_bounds(self, v12, v13, v14, v15, v16);
  MaxY = CGRectGetMaxY(v32);
  CGPathMoveToPoint(Mutable, 0, MinX, MaxY);
  objc_msgSend_bounds(self, v18, v19, v20, v21, v22);
  MaxX = CGRectGetMaxX(v33);
  objc_msgSend_bounds(self, v24, v25, v26, v27, v28);
  v29 = CGRectGetMaxY(v34);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v43 = a3;
  objc_msgSend_encodeInteger_forKey_(v43, v4, self->_ancestorIdentifier, (uint64_t)CFSTR("ancestorIdentifier"), v5, v6);
  objc_msgSend_encodeInteger_forKey_(v43, v7, self->_uniqueIdentifier, (uint64_t)CFSTR("uniqueIdentifier"), v8, v9);
  objc_msgSend_encodeObject_forKey_(v43, v10, (uint64_t)self->_strokeIdentifiers, (uint64_t)CFSTR("strokeIdentifiers"), v11, v12);
  objc_msgSend_encodeObject_forKey_(v43, v13, (uint64_t)self->_firstStrokeIdentifier, (uint64_t)CFSTR("firstStrokeIdentifier"), v14, v15);
  objc_msgSend_encodeObject_forKey_(v43, v16, (uint64_t)self->_lastStrokeIdentifier, (uint64_t)CFSTR("lastStrokeIdentifier"), v17, v18);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v19, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v43, v23, (uint64_t)v22, (uint64_t)CFSTR("bounds"), v24, v25);
  objc_msgSend_encodeInteger_forKey_(v43, v26, self->_classification, (uint64_t)CFSTR("classification"), v27, v28);
  objc_msgSend_encodeDouble_forKey_(v43, v29, (uint64_t)CFSTR("groupingConfidence"), v30, v31, v32, self->_groupingConfidence);
  objc_msgSend_encodeObject_forKey_(v43, v33, (uint64_t)self->_strategyIdentifier, (uint64_t)CFSTR("strategyIdentifier"), v34, v35);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v36, (uint64_t)&self->_firstStrokeOrigin, (uint64_t)"{CGPoint=dd}", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v43, v40, (uint64_t)v39, (uint64_t)CFSTR("firstStrokeOrigin"), v41, v42);

}

- (CHStrokeGroup)initWithCoder:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  CHStrokeGroup *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  double v75[2];
  __int128 v76;
  __int128 v77;
  _QWORD v78[3];

  v78[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = objc_msgSend_decodeIntegerForKey_(v3, v4, (uint64_t)CFSTR("ancestorIdentifier"), v5, v6, v7);
  v13 = objc_msgSend_decodeIntegerForKey_(v3, v9, (uint64_t)CFSTR("uniqueIdentifier"), v10, v11, v12);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v78, 2, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v14, v19, (uint64_t)v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v24, (uint64_t)v23, (uint64_t)CFSTR("strokeIdentifiers"), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v29, v28, (uint64_t)CFSTR("firstStrokeIdentifier"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v34, v33, (uint64_t)CFSTR("lastStrokeIdentifier"), v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v39, v38, (uint64_t)CFSTR("bounds"), v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v76 = *MEMORY[0x1E0C9D628];
  v77 = v43;
  objc_msgSend_getValue_size_(v42, v44, (uint64_t)&v76, 32, v45, v46);
  v51 = objc_msgSend_decodeIntegerForKey_(v3, v47, (uint64_t)CFSTR("classification"), v48, v49, v50);
  objc_msgSend_decodeDoubleForKey_(v3, v52, (uint64_t)CFSTR("groupingConfidence"), v53, v54, v55);
  v57 = v56;
  v58 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v59, v58, (uint64_t)CFSTR("strategyIdentifier"), v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v64, v63, (uint64_t)CFSTR("firstStrokeOrigin"), v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v67, v68, (uint64_t)v75, 16, v69, v70);
  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (CHStrokeGroup *)objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v71, v13, v8, (uint64_t)v27, (uint64_t)v32, v37, v51, v76, v77, v57, v75[0], v75[1], v62, 0);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHStrokeGroup *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHStrokeGroup *v11;
  int64_t ancestorIdentifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t uniqueIdentifier;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSet *strokeIdentifiers;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSSet *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int isEqual;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CHEncodedStrokeIdentifier *firstStrokeIdentifier;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CHEncodedStrokeIdentifier *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CHEncodedStrokeIdentifier *lastStrokeIdentifier;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CHEncodedStrokeIdentifier *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64_t classification;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double groupingConfidence;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  NSString *strategyIdentifier;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSString *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v123;
  double v124;
  double v125;
  double v126;
  CGRect v127;
  CGRect v128;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHStrokeGroup *)v4;
    v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        ancestorIdentifier = self->_ancestorIdentifier;
        if (ancestorIdentifier != objc_msgSend_ancestorIdentifier(v5, v6, v7, v8, v9, v10))
          goto LABEL_25;
        uniqueIdentifier = self->_uniqueIdentifier;
        if (uniqueIdentifier != objc_msgSend_uniqueIdentifier(v11, v13, v14, v15, v16, v17))
          goto LABEL_25;
        strokeIdentifiers = self->_strokeIdentifiers;
        objc_msgSend_strokeIdentifiers(v11, v19, v20, v21, v22, v23);
        v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (strokeIdentifiers == v30)
        {

        }
        else
        {
          objc_msgSend_strokeIdentifiers(v11, v25, v26, v27, v28, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v31, v32, (uint64_t)self->_strokeIdentifiers, v33, v34, v35);

          if (!isEqual)
            goto LABEL_25;
        }
        firstStrokeIdentifier = self->_firstStrokeIdentifier;
        objc_msgSend_firstStrokeIdentifier(v11, v37, v38, v39, v40, v41);
        v48 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (firstStrokeIdentifier == v48)
        {

        }
        else
        {
          objc_msgSend_firstStrokeIdentifier(v11, v43, v44, v45, v46, v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend_isEqual_(v49, v50, (uint64_t)self->_firstStrokeIdentifier, v51, v52, v53);

          if (!v54)
            goto LABEL_25;
        }
        lastStrokeIdentifier = self->_lastStrokeIdentifier;
        objc_msgSend_lastStrokeIdentifier(v11, v55, v56, v57, v58, v59);
        v66 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (lastStrokeIdentifier == v66)
        {

LABEL_20:
          x = self->_bounds.origin.x;
          y = self->_bounds.origin.y;
          width = self->_bounds.size.width;
          height = self->_bounds.size.height;
          objc_msgSend_bounds(v11, v73, v74, v75, v76, v77);
          v128.origin.x = v82;
          v128.origin.y = v83;
          v128.size.width = v84;
          v128.size.height = v85;
          v127.origin.x = x;
          v127.origin.y = y;
          v127.size.width = width;
          v127.size.height = height;
          if (!CGRectEqualToRect(v127, v128))
            goto LABEL_25;
          classification = self->_classification;
          if (classification != objc_msgSend_classification(v11, v86, v87, v88, v89, v90))
            goto LABEL_25;
          groupingConfidence = self->_groupingConfidence;
          objc_msgSend_groupingConfidence(v11, v92, v93, v94, v95, v96);
          if (groupingConfidence != v103)
            goto LABEL_25;
          strategyIdentifier = self->_strategyIdentifier;
          objc_msgSend_strategyIdentifier(v11, v98, v99, v100, v101, v102);
          v110 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (strategyIdentifier == v110)
          {

          }
          else
          {
            objc_msgSend_strategyIdentifier(v11, v105, v106, v107, v108, v109);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = objc_msgSend_isEqual_(v111, v112, (uint64_t)self->_strategyIdentifier, v113, v114, v115);

            if (!v116)
              goto LABEL_25;
          }
          v124 = self->_firstStrokeOrigin.x;
          v123 = self->_firstStrokeOrigin.y;
          objc_msgSend_firstStrokeOrigin(v11, v117, v118, v119, v120, v121);
          LOBYTE(self) = v123 == v126 && v124 == v125;
          goto LABEL_26;
        }
        objc_msgSend_lastStrokeIdentifier(v11, v61, v62, v63, v64, v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_isEqual_(v67, v68, (uint64_t)self->_lastStrokeIdentifier, v69, v70, v71);

        if (v72)
          goto LABEL_20;
LABEL_25:
        LOBYTE(self) = 0;
        goto LABEL_26;
      }
      LOBYTE(self) = 1;
    }
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
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
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v7 = objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v8, v9, v10, v11, v12, self->_bounds.origin.x);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v13, v14, v15, v16, v17, v18);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v20, v21, v22, v23, v24, self->_bounds.origin.y);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_hash(v25, v26, v27, v28, v29, v30);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v32, v33, v34, v35, v36, self->_bounds.size.width);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_hash(v37, v38, v39, v40, v41, v42);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v44, v45, v46, v47, v48, self->_bounds.size.height);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend_hash(v49, v50, v51, v52, v53, v54);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v55, v56, v57, v58, v59, self->_firstStrokeOrigin.x);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend_hash(v60, v61, v62, v63, v64, v65);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v66, v67, v68, v69, v70, self->_firstStrokeOrigin.y);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v43;
  v72 = v31;
  v73 = v19;
  v74 = v7;
  v80 = objc_msgSend_hash(v71, v75, v76, v77, v78, v79);

  v86 = objc_msgSend_hash(self->_firstStrokeIdentifier, v81, v82, v83, v84, v85);
  v92 = objc_msgSend_hash(self->_firstStrokeIdentifier, v87, v88, v89, v90, v91);
  v98 = objc_msgSend_hash(self->_strategyIdentifier, v93, v94, v95, v96, v97);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v99, v100, v101, v102, v103, self->_groupingConfidence);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend_hash(v104, v105, v106, v107, v108, v109);

  return v73 ^ v74 ^ v72 ^ v112 ^ v114 ^ v113 ^ v80 ^ v86 ^ v92 ^ v98 ^ v110 ^ self->_ancestorIdentifier ^ self->_uniqueIdentifier ^ self->_classification;
}

- (BOOL)isEquivalentToStrokeGroup:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHStrokeGroup *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  const char *v42;
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
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char isEqualToString;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char isEqualToSet;
  CGRect v86;
  CGRect v87;

  v9 = (CHStrokeGroup *)a3;
  if (self == v9)
  {
    isEqualToSet = 1;
  }
  else
  {
    objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
    objc_msgSend_strokeIdentifiers(v9, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

    if (v16 != v28)
      goto LABEL_6;
    objc_msgSend_bounds(self, v29, v30, v31, v32, v33);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend_bounds(v9, v42, v43, v44, v45, v46);
    v87.origin.x = v47;
    v87.origin.y = v48;
    v87.size.width = v49;
    v87.size.height = v50;
    v86.origin.x = v35;
    v86.origin.y = v37;
    v86.size.width = v39;
    v86.size.height = v41;
    if (!CGRectEqualToRect(v86, v87))
      goto LABEL_6;
    objc_msgSend_strategyIdentifier(self, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strategyIdentifier(v9, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v56, v63, (uint64_t)v62, v64, v65, v66);

    if ((isEqualToString & 1) != 0)
    {
      objc_msgSend_strokeIdentifiers(self, v68, v69, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifiers(v9, v74, v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToSet = objc_msgSend_isEqualToSet_(v73, v80, (uint64_t)v79, v81, v82, v83);

    }
    else
    {
LABEL_6:
      isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

+ (id)strokeGroupsClusteredByProximity:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  double *v29;
  double *v30;
  uint64_t v31;
  double v32;
  uint64_t i;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  double *v42;
  uint64_t v43;
  int64_t v44;
  unint64_t v45;
  double *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD *v51;
  double *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  double v70;
  double *v71;
  uint64_t v72;
  float64x2_t v73;
  float64x2_t *v74;
  uint64_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  double v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double MaxY;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double *v110;
  double *v111;
  double *v112;
  uint64_t v113;
  unint64_t v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v131;
  double v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  _BYTE *v137;
  double *v138;
  int64_t v139;
  unint64_t v140;
  double *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _OWORD *v146;
  double *v147;
  uint64_t v148;
  __int128 v149;
  double v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  double v154;
  double *v155;
  uint64_t v156;
  float64x2_t v157;
  float64x2_t *v158;
  uint64_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  double v164;
  unint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  double v190;
  double v191;
  double v192;
  double v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  CGFloat v205;
  double v206;
  CGFloat v207;
  double v208;
  CGFloat v209;
  double v210;
  CGFloat v211;
  double MinY;
  double v213;
  float v214;
  double v215;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  double v230;
  double v231;
  double v232;
  double v233;
  CGFloat v234;
  CGFloat v235;
  CGFloat v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  double v244;
  CGFloat v245;
  double v246;
  CGFloat v247;
  double v248;
  CGFloat v249;
  double v250;
  CGFloat v251;
  double v252;
  double v253;
  float v254;
  double v255;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  id v267;
  uint64_t v268;
  id v269;
  double v270;
  double v271;
  double v272;
  void *v273;
  double rect;
  id recta;
  CGFloat rectb;
  CGFloat rectc;
  id rect_24;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  void *__p;
  uint64_t v284;
  double *v285;
  double *v286;
  uint64_t v287;
  double *v288;
  uint64_t v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;

  v289 = *MEMORY[0x1E0C80C00];
  v267 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
  v269 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v8, v9, v10, v11, v12);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v267, v13, v14, v15, v16, v17);
  v19 = v267;
  objc_opt_self();
  __p = 0;
  v284 = 0;
  v285 = 0;
  v279 = 0u;
  v280 = 0u;
  v281 = 0u;
  v282 = 0u;
  rect_24 = v19;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(rect_24, v20, (uint64_t)&v279, (uint64_t)&v286, 16, v21);
  v268 = v18;
  if (!v27)
  {
    v30 = 0;
    v32 = 0.0;
    goto LABEL_41;
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = *(_QWORD *)v280;
  v32 = 0.0;
  do
  {
    for (i = 0; i != v27; ++i)
    {
      while (1)
      {
        if (*(_QWORD *)v280 != v31)
          objc_enumerationMutation(rect_24);
        v34 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i);
        objc_msgSend_normalizedSize(v34, v22, v23, v24, v25, v26);
        v36 = v35;
        if (v35 == 0.0)
        {
          objc_msgSend_bounds(v34, v22, v23, v24, v25, v26);
          v36 = v37;
        }
        if (v30 >= v29)
          break;
        *v30++ = v36;
        v284 = (uint64_t)v30;
        v32 = v32 + v36;
        if (++i == v27)
          goto LABEL_38;
      }
      v38 = v30 - v28;
      v39 = v38 + 1;
      if ((unint64_t)(v38 + 1) >> 61)
        sub_1BE61F930();
      if (((char *)v29 - (char *)v28) >> 2 > v39)
        v39 = ((char *)v29 - (char *)v28) >> 2;
      if ((unint64_t)((char *)v29 - (char *)v28) >= 0x7FFFFFFFFFFFFFF8)
        v40 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v40 = v39;
      if (v40)
      {
        if (v40 >> 61)
          sub_1BE61F100();
        v41 = operator new(8 * v40);
        v42 = (double *)&v41[8 * v38];
        *v42 = v36;
        v43 = (uint64_t)(v42 + 1);
        v44 = (char *)v30 - (char *)v28;
        if (v30 == v28)
          goto LABEL_24;
      }
      else
      {
        v41 = 0;
        v42 = (double *)(8 * v38);
        *(double *)(8 * v38) = v36;
        v43 = 8 * v38 + 8;
        v44 = (char *)v30 - (char *)v28;
        if (v30 == v28)
          goto LABEL_24;
      }
      v45 = v44 - 8;
      if (v45 < 0x168)
      {
        v46 = v30;
        goto LABEL_23;
      }
      v48 = ((char *)(v30 - 1) - (char *)v28) & 0xFFFFFFFFFFFFFFF8;
      if (&v41[(char *)v30 - (char *)v28 - 8 - v48] > &v41[(char *)v30 - (char *)v28 - 8])
      {
        v46 = v30;
        do
        {
LABEL_23:
          v47 = *((_QWORD *)v46-- - 1);
          *((_QWORD *)v42-- - 1) = v47;
        }
        while (v46 != v28);
        goto LABEL_24;
      }
      if ((double *)((char *)v30 - v48 - 8) > v30 - 1)
      {
        v46 = v30;
        goto LABEL_23;
      }
      if ((unint64_t)((char *)v28 - v41) < 0x20)
      {
        v46 = v30;
        goto LABEL_23;
      }
      v49 = (v45 >> 3) + 1;
      v50 = 8 * (v49 & 0x3FFFFFFFFFFFFFFCLL);
      v46 = &v30[v50 / 0xFFFFFFFFFFFFFFF8];
      v42 = (double *)((char *)v42 - v50);
      v51 = &v41[8 * v38 - 16];
      v52 = v30 - 2;
      v53 = v49 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v54 = *(_OWORD *)v52;
        *(v51 - 1) = *((_OWORD *)v52 - 1);
        *v51 = v54;
        v51 -= 2;
        v52 -= 4;
        v53 -= 4;
      }
      while (v53);
      if (v49 != (v49 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_23;
LABEL_24:
      v29 = (double *)&v41[8 * v40];
      __p = v42;
      v284 = v43;
      v285 = v29;
      if (v28)
        operator delete(v28);
      v28 = v42;
      v30 = (double *)v43;
      v284 = v43;
      v32 = v32 + v36;
    }
LABEL_38:
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(rect_24, v22, (uint64_t)&v279, (uint64_t)&v286, 16, v26);
  }
  while (v27);
LABEL_41:

  v55 = v18;
  v66 = 0.0;
  rect = 0.0;
  if (objc_msgSend_count(rect_24, v56, v57, v58, v59, v60))
    rect = v32 / (double)(unint64_t)objc_msgSend_count(rect_24, v61, v62, v63, v64, v65);
  v67 = (char *)v30 - (_BYTE *)__p;
  if (v30 != __p)
  {
    v68 = v67 >> 3;
    v69 = v67 - 8;
    v70 = 0.0;
    v71 = (double *)__p;
    if (v69 < 0x18)
      goto LABEL_131;
    v72 = (v69 >> 3) + 1;
    v71 = (double *)((char *)__p + 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL));
    v73 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&rect, 0);
    v74 = (float64x2_t *)((char *)__p + 16);
    v75 = v72 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v76 = vsubq_f64(v74[-1], v73);
      v77 = vsubq_f64(*v74, v73);
      v78 = vmulq_f64(v76, v76);
      v79 = vmulq_f64(v77, v77);
      v70 = v70 + v78.f64[0] + v78.f64[1] + v79.f64[0] + v79.f64[1];
      v74 += 2;
      v75 -= 4;
    }
    while (v75);
    if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_131:
      do
      {
        v80 = *v71++;
        v70 = v70 + (v80 - rect) * (v80 - rect);
      }
      while (v71 != v30);
    }
    v66 = sqrt(v70 / (double)(unint64_t)v68);
  }
  if (__p)
    operator delete(__p);

  v270 = fmax(rect + v66 * 1.5, 30.0);
  v271 = v270;
  if (v18 < 5)
    goto LABEL_101;
  v86 = rect_24;
  recta = v86;
  objc_opt_self();
  v286 = 0;
  v287 = 0;
  v288 = 0;
  v97 = 0.0;
  v272 = 0.0;
  if ((unint64_t)objc_msgSend_count(v86, v87, v88, v89, v90, v91) < 2)
    goto LABEL_100;
  objc_msgSend_firstObject(v86, v92, v93, v94, v95, v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v98, v99, v100, v101, v102, v103);
  MaxY = CGRectGetMaxY(v290);

  v110 = 0;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v114 = 1;
  v115 = 0.0;
  while (2)
  {
    if (v114 < objc_msgSend_count(v86, v105, v106, v107, v108, v109))
    {
      objc_msgSend_objectAtIndexedSubscript_(v86, v116, v114, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v121, v122, v123, v124, v125, v126);
      x = v291.origin.x;
      y = v291.origin.y;
      width = v291.size.width;
      height = v291.size.height;
      v131 = CGRectGetMinY(v291) - MaxY;
      if (v131 >= 0.0)
        v132 = v131;
      else
        v132 = 0.0;
      if (v131 < height / -3.0)
      {
        ++v113;
LABEL_81:
        v292.origin.x = x;
        v292.origin.y = y;
        v292.size.width = width;
        v292.size.height = height;
        MaxY = CGRectGetMaxY(v292);

        v55 = v268;
        v115 = v115 + v132;
        ++v114;
        continue;
      }
      if (v112 < v111)
      {
        *v112 = v132;
        v133 = (uint64_t)(v112 + 1);
LABEL_80:
        v287 = v133;
        v112 = (double *)v133;
        goto LABEL_81;
      }
      v134 = v112 - v110;
      v135 = v134 + 1;
      if ((unint64_t)(v134 + 1) >> 61)
        sub_1BE61F930();
      if (((char *)v111 - (char *)v110) >> 2 > v135)
        v135 = ((char *)v111 - (char *)v110) >> 2;
      if ((unint64_t)((char *)v111 - (char *)v110) >= 0x7FFFFFFFFFFFFFF8)
        v136 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v136 = v135;
      if (v136)
      {
        if (v136 >> 61)
          sub_1BE61F100();
        v137 = operator new(8 * v136);
        v138 = (double *)&v137[8 * v134];
        *v138 = v132;
        v133 = (uint64_t)(v138 + 1);
        v139 = (char *)v112 - (char *)v110;
        if (v112 == v110)
          goto LABEL_77;
LABEL_74:
        v140 = v139 - 8;
        if (v140 < 0x168)
        {
          v141 = v112;
          goto LABEL_76;
        }
        v143 = ((char *)(v112 - 1) - (char *)v110) & 0xFFFFFFFFFFFFFFF8;
        if (&v137[(char *)v112 - (char *)v110 - 8 - v143] > &v137[(char *)v112 - (char *)v110 - 8])
        {
          v141 = v112;
          goto LABEL_76;
        }
        if ((double *)((char *)v112 - v143 - 8) > v112 - 1)
        {
          v141 = v112;
          goto LABEL_76;
        }
        if ((unint64_t)((char *)v110 - v137) < 0x20)
        {
          v141 = v112;
          goto LABEL_76;
        }
        v144 = (v140 >> 3) + 1;
        v145 = 8 * (v144 & 0x3FFFFFFFFFFFFFFCLL);
        v141 = &v112[v145 / 0xFFFFFFFFFFFFFFF8];
        v138 = (double *)((char *)v138 - v145);
        v146 = &v137[8 * v134 - 16];
        v147 = v112 - 2;
        v148 = v144 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v149 = *(_OWORD *)v147;
          *(v146 - 1) = *((_OWORD *)v147 - 1);
          *v146 = v149;
          v146 -= 2;
          v147 -= 4;
          v148 -= 4;
        }
        while (v148);
        if (v144 != (v144 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_76:
            v142 = *((_QWORD *)v141-- - 1);
            *((_QWORD *)v138-- - 1) = v142;
          }
          while (v141 != v110);
        }
      }
      else
      {
        v137 = 0;
        v138 = (double *)(8 * v134);
        *(double *)(8 * v134) = v132;
        v133 = 8 * v134 + 8;
        v139 = (char *)v112 - (char *)v110;
        if (v112 != v110)
          goto LABEL_74;
      }
LABEL_77:
      v111 = (double *)&v137[8 * v136];
      v286 = v138;
      v288 = v111;
      if (v110)
        operator delete(v110);
      v110 = v138;
      v86 = recta;
      goto LABEL_80;
    }
    break;
  }
  v150 = v115 / (double)(unint64_t)(objc_msgSend_count(v86, v116, v117, v118, v119, v120) + ~v113);
  v151 = (char *)v112 - (char *)v110;
  v272 = v150;
  if (v112 == v110)
  {
    v97 = 0.0;
    if (v110)
      goto LABEL_99;
  }
  else
  {
    v152 = v151 >> 3;
    v153 = v151 - 8;
    v154 = 0.0;
    v155 = v110;
    if (v153 < 0x18)
      goto LABEL_132;
    v156 = (v153 >> 3) + 1;
    v155 = &v110[v156 & 0x3FFFFFFFFFFFFFFCLL];
    v157 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v150, 0);
    v158 = (float64x2_t *)(v110 + 2);
    v159 = v156 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v160 = vsubq_f64(v158[-1], v157);
      v161 = vsubq_f64(*v158, v157);
      v162 = vmulq_f64(v160, v160);
      v163 = vmulq_f64(v161, v161);
      v154 = v154 + v162.f64[0] + v162.f64[1] + v163.f64[0] + v163.f64[1];
      v158 += 2;
      v159 -= 4;
    }
    while (v159);
    if (v156 != (v156 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_132:
      do
      {
        v164 = *v155++;
        v154 = v154 + (v164 - v150) * (v164 - v150);
      }
      while (v155 != v112);
    }
    v97 = sqrt(v154 / (double)(unint64_t)v152);
    if (v110)
LABEL_99:
      operator delete(v110);
  }
LABEL_100:

  v271 = fmax(v272 + v97 * 1.5, 5.0);
LABEL_101:
  v165 = 0;
  while (v165 < objc_msgSend_count(rect_24, v81, v82, v83, v84, v85))
  {
    if (objc_msgSend_containsIndex_(v273, v166, v165, v167, v168, v169))
    {
      ++v165;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(rect_24, v81, v165, v83, v84, v85);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addIndex_(v273, v171, v165, v172, v173, v174);
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v175, (uint64_t)v170, v176, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v170, v180, v181, v182, v183, v184);
      rectb = v193;
      if (v55 > (uint64_t)(v165 + 1))
      {
        v194 = v190;
        v195 = v191;
        v196 = v192;
        v197 = 1;
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(rect_24, v185, v165 + v197, v187, v188, v189);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v198, v199, v200, v201, v202, v203);
          v205 = v204;
          v207 = v206;
          v209 = v208;
          v211 = v210;

          v293.origin.x = v205;
          v293.origin.y = v207;
          v293.size.width = v209;
          v293.size.height = v211;
          MinY = CGRectGetMinY(v293);
          v294.origin.x = rectb;
          v294.origin.y = v194;
          v294.size.width = v195;
          v294.size.height = v196;
          v213 = CGRectGetMaxY(v294);
          if (v197 == 11)
            break;
          v214 = MinY - v213;
          v215 = v214;
          if (v271 <= v215 || v270 < v215)
            break;
          objc_msgSend_objectAtIndexedSubscript_(rect_24, v185, v165 + v197, v187, v188, v189);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v179, v218, (uint64_t)v217, v219, v220, v221);

          objc_msgSend_addIndex_(v273, v222, v165 + v197++, v223, v224, v225);
          rectb = v205;
          v194 = v207;
          v195 = v209;
          v196 = v211;
        }
        while (v55 - v165 != v197);
      }
      objc_msgSend_bounds(v170, v185, v186, v187, v188, v189);
      rectc = v233;
      if (v165)
      {
        v234 = v230;
        v235 = v231;
        v236 = v232;
        v237 = 0;
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(rect_24, v226, v165 + v237 - 1, v227, v228, v229);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v238, v239, v240, v241, v242, v243);
          v245 = v244;
          v247 = v246;
          v249 = v248;
          v251 = v250;

          v295.origin.x = rectc;
          v295.origin.y = v234;
          v295.size.width = v235;
          v295.size.height = v236;
          v252 = CGRectGetMinY(v295);
          v234 = v247;
          v235 = v249;
          v236 = v251;
          rectc = v245;
          v296.origin.x = v245;
          v296.origin.y = v247;
          v296.size.width = v249;
          v296.size.height = v251;
          v253 = CGRectGetMaxY(v296);
          if (v237 == -10)
            break;
          v254 = v252 - v253;
          v255 = v254;
          if (v271 <= v255 || v270 < v255)
            break;
          objc_msgSend_objectAtIndexedSubscript_(rect_24, v226, v165 + v237 - 1, v227, v228, v229);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v179, v258, (uint64_t)v257, v259, v260, v261);

          objc_msgSend_addIndex_(v273, v262, v165 + v237-- - 1, v263, v264, v265);
        }
        while (v165 + v237);
      }
      objc_msgSend_addObject_(v269, v226, (uint64_t)v179, v227, v228, v229);

      ++v165;
    }
  }

  return v269;
}

+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v7, v8, (uint64_t)v5, (uint64_t)v6, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4 foundStrokeGroupIndex:(int64_t *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t i;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;

  v7 = a3;
  v13 = a4;
  for (i = 0; ; ++i)
  {
    if (i >= objc_msgSend_count(v13, v8, v9, v10, v11, v12))
    {
      v31 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_9;
    }
    objc_msgSend_objectAtIndexedSubscript_(v13, v15, i, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiers(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_containsObject_(v25, v26, (uint64_t)v7, v27, v28, v29);

    if (v30)
      break;
  }
  objc_msgSend_objectAtIndexedSubscript_(v13, v8, i, v10, v11, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
    goto LABEL_11;
  *a5 = i;
LABEL_9:
  if (!v31)
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v31;
}

+ (id)strokeGroupClosestToPoint:(CGPoint)a3 strokeGroups:(id)a4
{
  double y;
  double x;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  id v26;
  unint64_t i;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t *v41;
  char *v42;
  int64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void **v48;
  void **v49;
  char *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void **v55;
  void *v56;
  id *v57;
  void **v58;
  void *v60;
  id v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void **v111;
  void **v112;
  void *v113;
  void **__p;
  void **v116;
  void **v117;
  uint8_t buf[4];
  double v119;
  __int16 v120;
  double v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  double v127;
  __int16 v128;
  double v129;
  uint64_t v130;

  y = a3.y;
  x = a3.x;
  v130 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v119 = x;
    v120 = 2048;
    v121 = y;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "Finding the stroke group closest to point: (%f, %f)", buf, 0x16u);
  }

  if (objc_msgSend_count(v6, v8, v9, v10, v11, v12))
  {
    __p = 0;
    v116 = 0;
    v117 = 0;
    v18 = objc_msgSend_count(v6, v13, v14, v15, v16, v17);
    v24 = v18;
    if (v18)
    {
      if (v18 >> 61)
        sub_1BE61F930();
      __p = (void **)operator new(8 * v18);
      v116 = __p;
      v117 = &__p[v24];
    }
    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend_count(v6, v19, v20, v21, v22, v23))
      {
        v57 = __p;
        v58 = __p + 1;
        if (__p != v116 && v58 != v116)
        {
          do
          {
            v60 = *v58;
            v61 = *v57;
            v62 = sub_1BE6E2C00((uint64_t)CHStrokeGroup, v60);
            objc_msgSend_distanceFromPoint_toRectangle_(CHStrokeUtilities, v63, v64, v65, v66, v67, x, y, v62, v68, v69, v70);
            v72 = v71;
            v73 = sub_1BE6E2C00((uint64_t)CHStrokeGroup, v61);
            objc_msgSend_distanceFromPoint_toRectangle_(CHStrokeUtilities, v74, v75, v76, v77, v78, x, y, v73, v79, v80, v81);
            LODWORD(v60) = v72 < v82;

            if ((_DWORD)v60)
              v57 = v58;
            ++v58;
          }
          while (v58 != v116);
        }
        v26 = *v57;
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v83 = (id)qword_1EF568E28;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_bounds(v26, v84, v85, v86, v87, v88);
          v90 = v89;
          objc_msgSend_bounds(v26, v91, v92, v93, v94, v95);
          v97 = v96;
          objc_msgSend_bounds(v26, v98, v99, v100, v101, v102);
          v104 = v103;
          objc_msgSend_bounds(v26, v105, v106, v107, v108, v109);
          *(_DWORD *)buf = 134219264;
          v119 = v90;
          v120 = 2048;
          v121 = v97;
          v122 = 2048;
          v123 = v104;
          v124 = 2048;
          v125 = v110;
          v126 = 2048;
          v127 = x;
          v128 = 2048;
          v129 = y;
          _os_log_impl(&dword_1BE607000, v83, OS_LOG_TYPE_DEFAULT, "Found the stroke group with origin: (%f, %f) and size: (%f, %f) closest to point: (%f, %f)", buf, 0x3Eu);
        }

        if (__p)
        {
          v111 = v116;
          v112 = __p;
          if (v116 != __p)
          {
            do
            {
              v113 = *--v111;

            }
            while (v111 != __p);
            v112 = __p;
          }
          operator delete(v112);
        }
        goto LABEL_58;
      }
      objc_msgSend_objectAtIndexedSubscript_(v6, v28, i, v29, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = v116;
      if (v116 < v117)
      {
        *v116 = (void *)v32;
        v35 = (uint64_t)(v116 + 1);
        goto LABEL_41;
      }
      v36 = v116 - __p;
      v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 61)
        sub_1BE61F930();
      v38 = (char *)v117 - (char *)__p;
      if (((char *)v117 - (char *)__p) >> 2 > v37)
        v37 = v38 >> 2;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
        v39 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v39 = v37;
      if (v39)
      {
        if (v39 >> 61)
          sub_1BE61F100();
        v40 = (char *)operator new(8 * v39);
        v41 = (uint64_t *)&v40[8 * v36];
        v42 = &v40[8 * v39];
        *v41 = v33;
        v35 = (uint64_t)(v41 + 1);
        v43 = (char *)v116 - (char *)__p;
        if (v116 != __p)
        {
LABEL_27:
          v44 = v43 - 8;
          if (v44 < 0x78)
            goto LABEL_64;
          v45 = ((char *)(v116 - 1) - (char *)__p) & 0xFFFFFFFFFFFFFFF8;
          if ((char *)v116 - v45 - 8 < (char *)v41 && &v40[(char *)v116 - (char *)__p - v45 - 8] < (char *)v116)
            goto LABEL_64;
          v46 = (v44 >> 3) + 1;
          v47 = 8 * (v46 & 0x3FFFFFFFFFFFFFFCLL);
          v41 = (uint64_t *)((char *)v41 - v47);
          v48 = &v116[v47 / 0xFFFFFFFFFFFFFFF8];
          v49 = v116 - 2;
          v50 = &v40[8 * v36 - 16];
          v51 = v46 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v53 = *((_OWORD *)v49 - 1);
            v52 = *(_OWORD *)v49;
            *((_OWORD *)v49 - 1) = 0uLL;
            *(_OWORD *)v49 = 0uLL;
            *((_OWORD *)v50 - 1) = v53;
            *(_OWORD *)v50 = v52;
            v49 -= 4;
            v50 -= 32;
            v51 -= 4;
          }
          while (v51);
          v34 = v48;
          if (v46 != (v46 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_64:
            do
            {
              v54 = (uint64_t)*--v34;
              *v34 = 0;
              *--v41 = v54;
            }
            while (v34 != __p);
          }
          v34 = __p;
          v55 = v116;
          __p = (void **)v41;
          v117 = (void **)v42;
          while (v55 != v34)
          {
            v56 = *--v55;

          }
          goto LABEL_39;
        }
      }
      else
      {
        v40 = 0;
        v41 = (uint64_t *)(8 * v36);
        v42 = 0;
        *(_QWORD *)(8 * v36) = v33;
        v35 = 8 * v36 + 8;
        v43 = (char *)v116 - (char *)__p;
        if (v116 != __p)
          goto LABEL_27;
      }
      __p = (void **)v41;
      v117 = (void **)v42;
LABEL_39:
      if (v34)
        operator delete(v34);
LABEL_41:
      v116 = (void **)v35;
    }
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v25 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v119 = x;
    v120 = 2048;
    v121 = y;
    _os_log_impl(&dword_1BE607000, v25, OS_LOG_TYPE_ERROR, "Stroke Groups is empty, cannot find the closest stroke group to point: (%f, %f)", buf, 0x16u);
  }

  v26 = 0;
LABEL_58:

  return v26;
}

+ (void)strokeGroupsContainingPoint:(CGPoint)a3 strokeGroups:(id)a4 groupProcessingBlock:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(id, void *, unint64_t, _BYTE *);
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v14 = (void (**)(id, void *, unint64_t, _BYTE *))a5;
  v15 = 0;
  v21 = 0;
  while (v15 < objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    objc_msgSend_objectAtIndexedSubscript_(v8, v16, v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = sub_1BE6E2C00((uint64_t)CHStrokeGroup, v20);
    v22.x = x;
    v22.y = y;
    if (CGRectContainsPoint(v23, v22))
    {
      v14[2](v14, v20, v15, &v21);
      if (v21)
      {

        break;
      }
    }

    ++v15;
  }

}

+ (id)strokeIdentifierToGroupIndexMappingForStrokeIdentifiers:(id)a3 orderedStrokeGroups:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v42, (uint64_t)v48, 16, v14);
  if (v15)
  {
    v16 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        v41 = 0x7FFFFFFFFFFFFFFFLL;
        v19 = (void *)objc_opt_class();
        v22 = (id)objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v19, v20, v18, (uint64_t)v6, (uint64_t)&v41, v21);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v33 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v18;
            _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_ERROR, "No group found for stroke identifier %@, All strokes should belong to a group.", buf, 0xCu);
          }

          objc_msgSend_removeAllObjects(v12, v34, v35, v36, v37, v38);
          goto LABEL_15;
        }
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v23, v41, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v12, v28, (uint64_t)v27, v18, v29, v30);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v42, (uint64_t)v48, 16, v32);
      if (v15)
        continue;
      break;
    }
  }
LABEL_15:

  return v12;
}

- (CRNormalizedQuad)boundingQuad
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double MidX;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double MidY;
  id v78;
  double v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CGRect v89;
  CGRect v90;

  v3 = objc_alloc(MEMORY[0x1E0DBECD8]);
  objc_msgSend_bounds(self, v4, v5, v6, v7, v8);
  v14 = (void *)objc_msgSend_initWithNormalizedBoundingBox_size_(v3, v9, v10, v11, v12, v13);
  objc_msgSend_normalizedSize(self, v15, v16, v17, v18, v19);
  if (v26 != *MEMORY[0x1E0C9D820] || v25 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend_averageWritingOrientation(self, v20, v21, v22, v23, v24);
    v29 = v28;
    objc_msgSend_averageWritingOrientation(self, v30, v31, v32, v33, v34);
    if (v29 >= 0.0)
      v41 = v40;
    else
      v41 = -v40;
    if (v29 >= 0.0)
      v42 = v29;
    else
      v42 = -v29;
    objc_msgSend_normalizedSize(self, v35, v36, v37, v38, v39, -v29);
    v44 = v43;
    objc_msgSend_normalizedSize(self, v45, v46, v47, v48, v49);
    v51 = v50;
    objc_msgSend_normalizedSize(self, v52, v53, v54, v55, v56);
    v58 = v57;
    objc_msgSend_normalizedSize(self, v59, v60, v61, v62, v63);
    v65 = v64;
    objc_msgSend_bounds(self, v66, v67, v68, v69, v70);
    MidX = CGRectGetMidX(v89);
    objc_msgSend_bounds(self, v72, v73, v74, v75, v76);
    MidY = CGRectGetMidY(v90);
    v78 = objc_alloc(MEMORY[0x1E0DBECD8]);
    v79 = v42 * v44 * 0.5;
    v80 = v41 * v51 * 0.5;
    v81 = v41 * v58 * 0.5;
    v87 = objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v78, v82, v83, v84, v85, v86, v81 + MidX - v79, MidY - v80 - v42 * v65 * 0.5, v81 + v79 + MidX, v80 + MidY - v42 * v65 * 0.5, v79 + MidX - v81, v42 * v65 * 0.5 + v80 + MidY, MidX - v79 - v81, v42 * v65 * 0.5 + MidY - v80, 0x3FF0000000000000, 0x3FF0000000000000);

    v14 = (void *)v87;
  }
  return (CRNormalizedQuad *)v14;
}

- (unint64_t)layoutDirection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = objc_msgSend_classification(self, a2, v2, v3, v4, v5);
  if ((unint64_t)(v6 - 1) > 7)
    return 0;
  else
    return qword_1BE8D5EC8[v6 - 1];
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)firstStrokeOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_firstStrokeOrigin.x;
  y = self->_firstStrokeOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHEncodedStrokeIdentifier)firstStrokeIdentifier
{
  return self->_firstStrokeIdentifier;
}

- (CHEncodedStrokeIdentifier)lastStrokeIdentifier
{
  return self->_lastStrokeIdentifier;
}

- (int64_t)classification
{
  return self->_classification;
}

- (double)groupingConfidence
{
  return self->_groupingConfidence;
}

- (NSString)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_firstStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
