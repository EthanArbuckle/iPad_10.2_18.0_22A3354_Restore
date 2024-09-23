@implementation IATextInputActionsSessionSelectionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
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
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;

  v4 = a3;
  v9 = objc_msgSend_source(self, v5, v6, v7, v8);
  if (v9 == objc_msgSend_source(v4, v10, v11, v12, v13)
    && (v18 = objc_msgSend_flagOptions(self, v14, v15, v16, v17), v18 == objc_msgSend_flagOptions(v4, v19, v20, v21, v22)))
  {
    objc_msgSend_asSelection(v4, v23, v24, v25, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31
      && ((objc_msgSend_rangeAfter(self, v27, v28, v29, v30), !v32)
       && (objc_msgSend_relativeRangeBefore(self, 0, v33, v34, v35), !v32)
       && (objc_msgSend_rangeAfter(v31, 0, v33, v34, v35), !v32)
       || (objc_msgSend_rangeAfter(self, v32, v33, v34, v35), v36)
       && (objc_msgSend_relativeRangeBefore(self, v36, v37, v38, v39), v40)
       && (objc_msgSend_rangeAfter(v31, v40, v41, v42, v43), v32)))
    {
      v44 = objc_msgSend_rangeAfter(v31, v32, v33, v34, v35);
      objc_msgSend_setRangeAfter_(self, v45, v44, (uint64_t)v45, v46);
      v51 = objc_msgSend_inputActionCount(v31, v47, v48, v49, v50);
      v56 = objc_msgSend_inputActionCountFromMergedActions(self, v52, v53, v54, v55);
      objc_msgSend_setInputActionCountFromMergedActions_(self, v57, v56 + v51, v58, v59);
      v60 = 1;
    }
    else
    {
      v60 = 0;
    }

  }
  else
  {
    v60 = 0;
  }

  return v60;
}

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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v31;
  NSRange v32;

  v31.receiver = self;
  v31.super_class = (Class)IATextInputActionsSessionSelectionAction;
  -[IATextInputActionsSessionAction description](&v31, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v32.location = objc_msgSend_rangeAfter(self, v10, v11, v12, v13);
  NSStringFromRange(v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v15, (uint64_t)CFSTR("rangeAfter=%@"), v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_componentsJoinedByString_(v8, v22, (uint64_t)CFSTR(", "), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v26, (uint64_t)CFSTR(", %@"), v27, v28, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (int64_t)textInputActionsType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_rangeAfter(self, a2, v2, v3, v4);
  if (v5)
    return 9;
  else
    return 8;
}

- (_NSRange)rangeAfter
{
  _NSRange *p_rangeAfter;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeAfter = &self->_rangeAfter;
  location = self->_rangeAfter.location;
  length = p_rangeAfter->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeAfter:(_NSRange)a3
{
  self->_rangeAfter = a3;
}

- (IATextInputActionsSessionSelectionAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionSelectionAction *v5;
  IATextInputActionsSessionSelectionAction *v6;
  _NSRange *p_rangeAfter;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IATextInputActionsSessionSelectionAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v27, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_rangeAfter = &v5->_rangeAfter;
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("rangeAfter_location"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_unsignedLongValue(v11, v12, v13, v14, v15);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("rangeAfter_length"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_unsignedLongValue(v20, v21, v22, v23, v24);
    p_rangeAfter->location = v16;
    v6->_rangeAfter.length = v25;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _NSRange *p_rangeAfter;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IATextInputActionsSessionSelectionAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  p_rangeAfter = &self->_rangeAfter;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v6, self->_rangeAfter.location, v7, v8, v18.receiver, v18.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("rangeAfter_location"), v11);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v12, p_rangeAfter->length, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, (uint64_t)CFSTR("rangeAfter_length"), v17);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
