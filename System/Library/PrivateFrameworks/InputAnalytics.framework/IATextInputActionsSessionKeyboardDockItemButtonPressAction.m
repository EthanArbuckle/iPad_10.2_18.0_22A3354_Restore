@implementation IATextInputActionsSessionKeyboardDockItemButtonPressAction

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  objc_super v65;

  v65.receiver = self;
  v65.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  -[IATextInputActionsSessionAction description](&v65, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend_buttonType(self, v10, v11, v12, v13);
  objc_msgSend_stringForKeyboardDockItemButtonType_(IATextInputActionsUtils, v15, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v19, (uint64_t)CFSTR("buttonType=%@"), v20, v21, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v23, (uint64_t)v22, v24, v25);

  v26 = (void *)MEMORY[0x24BDD17C8];
  v31 = objc_msgSend_buttonPressResult(self, v27, v28, v29, v30);
  objc_msgSend_stringForKeyboardDockItemButtonPressResult_(IATextInputActionsUtils, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v26, v36, (uint64_t)CFSTR("buttonPressResult=%@"), v37, v38, v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v40, (uint64_t)v39, v41, v42);

  v43 = (void *)MEMORY[0x24BDD17C8];
  v48 = objc_msgSend_uiOrientation(self, v44, v45, v46, v47);
  objc_msgSend_stringWithFormat_(v43, v49, (uint64_t)CFSTR("uiOrientation=%lu"), v50, v51, v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v53, (uint64_t)v52, v54, v55);

  objc_msgSend_componentsJoinedByString_(v8, v56, (uint64_t)CFSTR(", "), v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v60, (uint64_t)CFSTR(", %@"), v61, v62, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

- (int64_t)inputActionCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t result;

  v6 = objc_msgSend_buttonPressResult(self, a2, v2, v3, v4);
  result = objc_msgSend_inputActionCountFromMergedActions(self, v7, v8, v9, v10);
  if (v6 != 2)
    ++result;
  return result;
}

- (unint64_t)buttonPressResult
{
  return self->_buttonPressResult;
}

- (void)setButtonPressResult:(unint64_t)a3
{
  self->_buttonPressResult = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)uiOrientation
{
  return self->_uiOrientation;
}

- (void)setUiOrientation:(int64_t)a3
{
  self->_uiOrientation = a3;
}

- (CGSize)buttonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (CGPoint)touchDownPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchDownPoint.x;
  y = self->_touchDownPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (CGPoint)touchUpPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchUpPoint.x;
  y = self->_touchUpPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchUpPoint:(CGPoint)a3
{
  self->_touchUpPoint = a3;
}

- (double)touchDuration
{
  return self->_touchDuration;
}

- (void)setTouchDuration:(double)a3
{
  self->_touchDuration = a3;
}

- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionKeyboardDockItemButtonPressAction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  CGFloat v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CGFloat v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  CGFloat v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGFloat v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  CGFloat v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  CGFloat v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  objc_super v97;

  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v97, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("buttonPressResult"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_buttonPressResult = objc_msgSend_unsignedLongValue(v9, v10, v11, v12, v13);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("buttonType"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_buttonType = objc_msgSend_unsignedLongValue(v17, v18, v19, v20, v21);

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("uiOrientation"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uiOrientation = objc_msgSend_longValue(v25, v26, v27, v28, v29);

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("buttonSize_width"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v33, v34, v35, v36, v37);
    v39 = v38;
    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, (uint64_t)CFSTR("buttonSize_height"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
    v5->_buttonSize.width = v39;
    v5->_buttonSize.height = v48;

    v49 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, (uint64_t)CFSTR("touchDownPoint_x"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v52, v53, v54, v55, v56);
    v58 = v57;
    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)CFSTR("touchDownPoint_y"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v62, v63, v64, v65, v66);
    v5->_touchDownPoint.x = v58;
    v5->_touchDownPoint.y = v67;

    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("touchUpPoint_x"), v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v71, v72, v73, v74, v75);
    v77 = v76;
    v78 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v79, v78, (uint64_t)CFSTR("touchUpPoint_y"), v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v81, v82, v83, v84, v85);
    v5->_touchUpPoint.x = v77;
    v5->_touchUpPoint.y = v86;

    v87 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, (uint64_t)CFSTR("touchDuration"), v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v90, v91, v92, v93, v94);
    v5->_touchDuration = v95;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v72, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, self->_buttonPressResult, v6, v7, v72.receiver, v72.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("buttonPressResult"), v10);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, self->_buttonType, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("buttonType"), v16);

  objc_msgSend_numberWithLong_(MEMORY[0x24BDD16E0], v17, self->_uiOrientation, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("uiOrientation"), v22);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v23, v24, v25, v26, self->_buttonSize.width);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v27, (uint64_t)CFSTR("buttonSize_width"), v29);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v30, v31, v32, v33, self->_buttonSize.height);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("buttonSize_height"), v36);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v37, v38, v39, v40, self->_touchDownPoint.x);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v42, (uint64_t)v41, (uint64_t)CFSTR("touchDownPoint_x"), v43);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v44, v45, v46, v47, self->_touchDownPoint.y);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, (uint64_t)CFSTR("touchDownPoint_y"), v50);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v51, v52, v53, v54, self->_touchUpPoint.x);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("touchUpPoint_x"), v57);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v58, v59, v60, v61, self->_touchUpPoint.y);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v63, (uint64_t)v62, (uint64_t)CFSTR("touchUpPoint_y"), v64);

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v65, v66, v67, v68, self->_touchDuration);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v70, (uint64_t)v69, (uint64_t)CFSTR("touchDuration"), v71);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
