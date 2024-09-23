@implementation CKMentionAutoCompleteAttribute

- (CKMentionAutoCompleteAttribute)initWithMentionEntityNode:(id)a3 originalText:(id)a4 displayText:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKMentionAutoCompleteAttribute *v12;
  CKMentionAutoCompleteAttribute *v13;
  uint64_t v14;
  NSString *originalText;
  uint64_t v16;
  NSString *displayText;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKMentionAutoCompleteAttribute;
  v12 = -[CKMentionAutoCompleteAttribute init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mentionEntityNode, a3);
    v14 = objc_msgSend(v10, "copy");
    originalText = v13->_originalText;
    v13->_originalText = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    displayText = v13->_displayText;
    v13->_displayText = (NSString *)v16;

  }
  return v13;
}

- (CKMentionEntityNode)mentionEntityNode
{
  return self->_mentionEntityNode;
}

- (void)setMentionEntityNode:(id)a3
{
  objc_storeStrong((id *)&self->_mentionEntityNode, a3);
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setOriginalText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_mentionEntityNode, 0);
}

@end
