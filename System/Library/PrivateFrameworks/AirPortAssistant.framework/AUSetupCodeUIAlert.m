@implementation AUSetupCodeUIAlert

- (void)dealloc
{
  objc_super v3;

  self->_selectionRange = 0;
  v3.receiver = self;
  v3.super_class = (Class)AUSetupCodeUIAlert;
  -[AUUIAlert dealloc](&v3, sel_dealloc);
}

- (void)prepareToShow
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AUSetupCodeUIAlert;
  -[AUTextFieldUIAlert prepareToShow](&v12, sel_prepareToShow);
  self->_selectionRange = 0;
  v5 = (void *)objc_msgSend_textField(self, v3, v4);
  objc_msgSend_setKeyboardType_(v5, v6, 4);
  v7 = sub_21A690C10((uint64_t)CFSTR("kSetupCodePlaceholder"), (uint64_t)CFSTR("SetupRecommendations"));
  objc_msgSend_setPlaceholder_(v5, v8, v7);
  objc_msgSend_setDelegate_(v5, v9, (uint64_t)self);
  objc_msgSend_addTarget_action_forControlEvents_(v5, v10, (uint64_t)self, sel_formatSetupCodeWithSender_, 0x20000);
  objc_msgSend_enableOKAction_(self, v11, 0);
}

- (void)formatSetupCodeWithSender:(id)a3
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  _BOOL8 v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  UITextRange *selectionRange;

  v5 = (void *)MEMORY[0x24BDD16A8];
  v6 = (void *)objc_msgSend_text(a3, a2, (uint64_t)a3);
  v9 = (void *)objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v7, v8);
  v12 = objc_msgSend_invertedSet(v9, v10, v11);
  v14 = (void *)objc_msgSend_componentsSeparatedByCharactersInSet_(v6, v13, v12);
  v16 = objc_msgSend_componentsJoinedByString_(v14, v15, (uint64_t)&stru_24DD08368);
  v18 = (void *)objc_msgSend_stringWithString_(v5, v17, v16);
  if ((unint64_t)objc_msgSend_length(v18, v19, v20) >= 9)
  {
    v23 = (void *)MEMORY[0x24BDD16A8];
    v24 = objc_msgSend_substringToIndex_(v18, v21, 7);
    v18 = (void *)objc_msgSend_stringWithString_(v23, v25, v24);
  }
  v26 = objc_msgSend_length(v18, v21, v22) == 8;
  objc_msgSend_enableOKAction_(self, v27, v26);
  if (objc_msgSend_length(v18, v28, v29) == 3)
  {
    objc_msgSend_appendFormat_(v18, v30, (uint64_t)CFSTR("-"));
  }
  else if ((unint64_t)objc_msgSend_length(v18, v30, v31) >= 4)
  {
    objc_msgSend_insertString_atIndex_(v18, v32, (uint64_t)CFSTR("-"), 3);
  }
  if (objc_msgSend_length(v18, v32, v33) == 6)
  {
    objc_msgSend_appendFormat_(v18, v34, (uint64_t)CFSTR("-"));
  }
  else if ((unint64_t)objc_msgSend_length(v18, v34, v35) >= 7)
  {
    objc_msgSend_insertString_atIndex_(v18, v36, (uint64_t)CFSTR("-"), 6);
  }
  objc_msgSend_setText_(a3, v36, (uint64_t)v18);
  selectionRange = self->_selectionRange;
  if (selectionRange)
    MEMORY[0x24BEDD108](a3, sel_setSelectedTextRange_, selectionRange);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger location;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  UITextRange *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;

  location = a4.location;
  v9 = (void *)objc_msgSend_text(a3, a2, (uint64_t)a3, a4.location, a4.length);

  self->_selectionRange = 0;
  if (objc_msgSend_isEqualToString_(a5, v10, (uint64_t)&stru_24DD08368))
  {
    v13 = (void *)objc_msgSend_selectedTextRange(a3, v11, v12);
    v16 = objc_msgSend_start(v13, v14, v15);
    v18 = objc_msgSend_positionFromPosition_offset_(a3, v17, v16, -1);
    v21 = (void *)objc_msgSend_selectedTextRange(a3, v19, v20);
    v24 = objc_msgSend_start(v21, v22, v23);
    v26 = objc_msgSend_positionFromPosition_offset_(a3, v25, v24, -1);
    v28 = (void *)objc_msgSend_textRangeFromPosition_toPosition_(a3, v27, v18, v26);
    self->_selectionRange = (UITextRange *)objc_msgSend_copy(v28, v29, v30);
    LOBYTE(v31) = 1;
    return v31;
  }
  if (location != objc_msgSend_length(v9, v11, v12))
  {
    v34 = (void *)objc_msgSend_substringFromIndex_(v9, v32, location);
    v35 = 1;
    v37 = (void *)objc_msgSend_substringToIndex_(v34, v36, 1);
    if (objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("-")))
    {
      if (location + 1 == objc_msgSend_length(v9, v32, v33))
      {
        v39 = 0;
LABEL_9:
        self->_selectionRange = v39;
        goto LABEL_10;
      }
      v35 = 2;
    }
    v40 = (void *)objc_msgSend_selectedTextRange(a3, v32, v33);
    v43 = objc_msgSend_start(v40, v41, v42);
    v45 = objc_msgSend_positionFromPosition_offset_(a3, v44, v43, v35);
    v48 = (void *)objc_msgSend_selectedTextRange(a3, v46, v47);
    v51 = objc_msgSend_end(v48, v49, v50);
    v53 = objc_msgSend_positionFromPosition_offset_(a3, v52, v51, v35);
    v55 = (void *)objc_msgSend_textRangeFromPosition_toPosition_(a3, v54, v45, v53);
    v39 = (UITextRange *)objc_msgSend_copy(v55, v56, v57);
    goto LABEL_9;
  }
LABEL_10:
  v58 = (void *)objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v32, v33);
  v61 = objc_msgSend_invertedSet(v58, v59, v60);
  v63 = (void *)objc_msgSend_componentsSeparatedByCharactersInSet_(v9, v62, v61);
  v65 = (void *)objc_msgSend_componentsJoinedByString_(v63, v64, (uint64_t)&stru_24DD08368);
  v68 = (void *)objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v66, v67);
  v71 = objc_msgSend_invertedSet(v68, v69, v70);
  v73 = (void *)objc_msgSend_componentsSeparatedByCharactersInSet_(a5, v72, v71);
  v75 = (void *)objc_msgSend_componentsJoinedByString_(v73, v74, (uint64_t)&stru_24DD08368);
  v31 = objc_msgSend_length(v75, v76, v77);
  if (v31)
  {
    v80 = objc_msgSend_length(v65, v78, v79);
    LOBYTE(v31) = (unint64_t)(objc_msgSend_length(v75, v81, v82) + v80) < 9;
  }
  return v31;
}

@end
