@implementation SGQuickResponse

- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12
{
  id v17;
  id v18;
  SGQuickResponse *v19;
  void *v21;
  uint64_t v22;
  void *v23;

  v17 = a3;
  v18 = a4;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text.length"));

  }
  if (!objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lang.length"));

  }
  BYTE2(v22) = a12;
  LOWORD(v22) = __PAIR16__(a11, a10);
  v19 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:](self, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:", v17, v18, a5, a6, a7, a8, a9, v22, 0);

  return v19;
}

- (SGQuickResponse)initWithProactiveTrigger:(id)a3 isConfident:(BOOL)a4
{
  uint64_t v5;

  BYTE2(v5) = a4;
  LOWORD(v5) = 0;
  return -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:](self, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:", &stru_24DDC5810, &stru_24DDC5810, 0, 0, 0, 0, 0, v5, a3);
}

- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12 proactiveTrigger:(id)a13
{
  id v19;
  id v20;
  id v21;
  SGQuickResponse *v22;
  unint64_t v23;
  NSString *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSString *text;
  id v30;
  id obj;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a4;
  v21 = a13;
  v33.receiver = self;
  v33.super_class = (Class)SGQuickResponse;
  v22 = -[SGQuickResponse init](&v33, sel_init);
  if (v22)
  {
    v30 = v21;
    obj = a4;
    v32 = v20;
    if (a10)
    {
      v23 = a8;
      v24 = (NSString *)v19;
    }
    else
    {
      SGNormalizeEmojisInString(v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v19);

      if ((v26 & 1) == 0)
      {
        sgLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v20;
          _os_log_fault_impl(&dword_21ABF4000, v27, OS_LOG_TYPE_FAULT, "A (lang: %@) canned response includes emojis with skin-tone modifiers!", buf, 0xCu);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
      }
      v23 = a8;
      SGPersonalizeEmojisInString(v19);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    text = v22->_text;
    v22->_text = v24;

    objc_storeStrong((id *)&v22->_lang, obj);
    v22->_replyTextId = a5;
    v22->_styleGroupId = a6;
    v22->_semanticClassId = a7;
    v22->_modelId = v23;
    v22->_categoryId = a9;
    v22->_isCustomResponse = a10;
    v22->_isRobotResponse = a11;
    v22->_isConfident = a12;
    objc_storeStrong((id *)&v22->_proactiveTrigger, a13);
    v20 = v32;
    v21 = v30;
  }

  return v22;
}

- (id)description
{
  NSDictionary *proactiveTrigger;
  NSString *v4;

  proactiveTrigger = self->_proactiveTrigger;
  if (proactiveTrigger)
  {
    -[NSDictionary description](proactiveTrigger, "description");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_text;
  }
  return v4;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)lang
{
  return self->_lang;
}

- (unint64_t)replyTextId
{
  return self->_replyTextId;
}

- (unint64_t)styleGroupId
{
  return self->_styleGroupId;
}

- (unint64_t)semanticClassId
{
  return self->_semanticClassId;
}

- (unint64_t)modelId
{
  return self->_modelId;
}

- (unint64_t)categoryId
{
  return self->_categoryId;
}

- (BOOL)isCustomResponse
{
  return self->_isCustomResponse;
}

- (BOOL)isRobotResponse
{
  return self->_isRobotResponse;
}

- (NSDictionary)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
