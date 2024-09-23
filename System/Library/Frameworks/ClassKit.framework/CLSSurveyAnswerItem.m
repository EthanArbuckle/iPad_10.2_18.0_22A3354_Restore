@implementation CLSSurveyAnswerItem

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40842A8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB640 != -1)
    dispatch_once(&qword_1ED0FB640, block);
  return (id)qword_1ED0FB638;
}

+ (id)identifierForSurveyID:(id)a3 questionID:(id)a4 responderID:(id)a5
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@:%@:%@"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha224(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CLSSurveyAnswerItem)initWithSurveyID:(id)a3 questionID:(id)a4 responderID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  CLSSurveyAnswerItem *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *surveyID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *questionID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *responderPersonID;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CLSSurveyAnswerItem;
  v12 = -[CLSObject _init](&v28, sel__init);
  if (v12)
  {
    objc_msgSend_identifierForSurveyID_questionID_responderID_(CLSSurveyAnswerItem, v11, (uint64_t)v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectID_(v12, v14, (uint64_t)v13);

    v17 = objc_msgSend_copy(v8, v15, v16);
    surveyID = v12->_surveyID;
    v12->_surveyID = (NSString *)v17;

    v21 = objc_msgSend_copy(v9, v19, v20);
    questionID = v12->_questionID;
    v12->_questionID = (NSString *)v21;

    v25 = objc_msgSend_copy(v10, v23, v24);
    responderPersonID = v12->_responderPersonID;
    v12->_responderPersonID = (NSString *)v25;

    v12->_state = 1;
    v12->_action = 1;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSurveyAnswerItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSSurveyAnswerItem *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *questionID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *surveyID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *responderPersonID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *textResponse;
  const char *v23;
  const char *v24;
  double v25;
  const char *v26;
  const char *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSSurveyAnswerItem;
  v6 = -[CLSObject initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_answerType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("answerType"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("questionID"));
    v9 = objc_claimAutoreleasedReturnValue();
    questionID = v6->_questionID;
    v6->_questionID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("surveyID"));
    v13 = objc_claimAutoreleasedReturnValue();
    surveyID = v6->_surveyID;
    v6->_surveyID = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("responderPersonID"));
    v17 = objc_claimAutoreleasedReturnValue();
    responderPersonID = v6->_responderPersonID;
    v6->_responderPersonID = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("textResponse"));
    v21 = objc_claimAutoreleasedReturnValue();
    textResponse = v6->_textResponse;
    v6->_textResponse = (NSString *)v21;

    v6->_selectedIndex = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("selectedIndex"));
    objc_msgSend_decodeDoubleForKey_(v4, v24, (uint64_t)CFSTR("continuousSliderValue"));
    v6->_continuousSliderValue = v25;
    v6->_state = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("state"));
    v6->_action = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("action"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSSurveyAnswerItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_answerType, CFSTR("answerType"), v14.receiver, v14.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_questionID, CFSTR("questionID"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_surveyID, CFSTR("surveyID"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_responderPersonID, CFSTR("responderPersonID"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_textResponse, CFSTR("textResponse"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_selectedIndex, CFSTR("selectedIndex"));
  objc_msgSend_encodeDouble_forKey_(v4, v11, (uint64_t)CFSTR("continuousSliderValue"), self->_continuousSliderValue);
  objc_msgSend_encodeInteger_forKey_(v4, v12, self->_state, CFSTR("state"));
  objc_msgSend_encodeInteger_forKey_(v4, v13, self->_action, CFSTR("action"));

}

- (int64_t)answerType
{
  uint64_t v2;
  int64_t answerType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  answerType = self->_answerType;
  objc_msgSend_unlock(self, v5, v6);
  return answerType;
}

- (void)setAnswerType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_answerType != a3)
  {
    self->_answerType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)questionID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_questionID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setQuestionID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *questionID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  questionID = self->_questionID;
  v12 = (id)v8;
  if (v8 | (unint64_t)questionID
    && (!v8 || !questionID || (objc_msgSend_isEqualToString_(questionID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_questionID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)surveyID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_surveyID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setSurveyID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *surveyID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  surveyID = self->_surveyID;
  v12 = (id)v8;
  if (v8 | (unint64_t)surveyID
    && (!v8 || !surveyID || (objc_msgSend_isEqualToString_(surveyID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_surveyID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)responderPersonID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_responderPersonID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setResponderPersonID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *responderPersonID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  responderPersonID = self->_responderPersonID;
  v12 = (id)v8;
  if (v8 | (unint64_t)responderPersonID
    && (!v8 || !responderPersonID || (objc_msgSend_isEqualToString_(responderPersonID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_responderPersonID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)textResponse
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_textResponse;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTextResponse:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *textResponse;
  const char *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  textResponse = self->_textResponse;
  v14 = (id)v8;
  if (v8 | (unint64_t)textResponse
    && (!v8 || !textResponse || (objc_msgSend_isEqualToString_(textResponse, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_textResponse, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

  objc_msgSend__answerUpdated(self, v12, v13);
}

- (int64_t)selectedIndex
{
  uint64_t v2;
  int64_t selectedIndex;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  selectedIndex = self->_selectedIndex;
  objc_msgSend_unlock(self, v5, v6);
  return selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, a3);
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
  objc_msgSend__answerUpdated(self, v7, v8);
}

- (double)continuousSliderValue
{
  uint64_t v2;
  double continuousSliderValue;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  continuousSliderValue = self->_continuousSliderValue;
  objc_msgSend_unlock(self, v5, v6);
  return continuousSliderValue;
}

- (void)setContinuousSliderValue:(double)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_lock(self, a2, v3);
  if (self->_continuousSliderValue != a3)
  {
    self->_continuousSliderValue = a3;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
  objc_msgSend__answerUpdated(self, v8, v9);
}

- (int64_t)state
{
  uint64_t v2;
  int64_t state;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  state = self->_state;
  objc_msgSend_unlock(self, v5, v6);
  return state;
}

- (void)setState:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_state != a3)
  {
    self->_state = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)action
{
  uint64_t v2;
  int64_t action;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  action = self->_action;
  objc_msgSend_unlock(self, v5, v6);
  return action;
}

- (void)setAction:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_action != a3)
  {
    self->_action = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)_answerUpdated
{
  const char *v3;

  objc_msgSend_setState_(self, a2, 1);
  objc_msgSend_setAction_(self, v3, 2);
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSSurveyAnswerItem;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("textResponse");
  v22[1] = CFSTR("selectedIndex");
  v22[2] = CFSTR("continuousSliderValue");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 3);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CLSSurveyAnswerItem;
  v5 = -[CLSObject validateObject:](&v27, sel_validateObject_);
  if (v5)
  {
    if (!self->_answerType)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16 = (void *)MEMORY[0x1E0CB34D0];
      v17 = objc_opt_class();
      objc_msgSend_bundleForClass_(v16, v18, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v19, (uint64_t)CFSTR("ERROR_DESCRIPTION_UNKNOWN_SURVEY_ANSWER_ITEM_TYPE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_10;
    }
    if (!objc_msgSend_length(self->_questionID, v6, v7))
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v20 = (void *)MEMORY[0x1E0CB34D0];
      v21 = objc_opt_class();
      objc_msgSend_bundleForClass_(v20, v22, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v23, (uint64_t)CFSTR("ERROR_DESCRIPTION_SURVEY_ANSWER_ITEM_NO_QUESTION_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_10;
    }
    if (self->_answerType == 3 && (unint64_t)objc_msgSend_length(self->_textResponse, v8, v9) >= 0x1389)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = (void *)MEMORY[0x1E0CB34D0];
      v12 = objc_opt_class();
      objc_msgSend_bundleForClass_(v11, v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("ERROR_DESCRIPTION_SURVEY_ANSWER_TEXT_LENGTH_EXCEEDED"), &stru_1E974C8A0, CFSTR("ClassKit"));
LABEL_10:
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_errorObject_description_(v10, v25, (uint64_t)a3, 2, self, v24);

      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];

  v4 = a3;
  if (objc_msgSend_type(v4, v5, v6) != 3)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  if (objc_msgSend_answerType(self, v7, v8) == 3)
  {
    objc_msgSend_becomeChildOf_(v4, v9, (uint64_t)self);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogMultimedia;
    if (os_log_type_enabled((os_log_t)CLSLogMultimedia, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "Cannot add asset to this type of answer item", v12, 2u);
    }
  }

}

- (void)removeAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];

  v4 = a3;
  if (objc_msgSend_type(v4, v5, v6) != 3)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  if (objc_msgSend_answerType(self, v7, v8) == 3)
  {
    objc_msgSend_removeChild_changedPropertyName_(self, v9, (uint64_t)v4, CFSTR("assets"));
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogMultimedia;
    if (os_log_type_enabled((os_log_t)CLSLogMultimedia, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "Cannot remove asset from this type of answer item", v12, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_textResponse, 0);
  objc_storeStrong((id *)&self->_questionID, 0);
  objc_storeStrong((id *)&self->_responderPersonID, 0);
  objc_storeStrong((id *)&self->_surveyID, 0);
}

@end
