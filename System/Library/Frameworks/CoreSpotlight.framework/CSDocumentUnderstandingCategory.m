@implementation CSDocumentUnderstandingCategory

- (void)encodeWithCSCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "beginType:", "CSDocumentUnderstandingCategory");
  -[CSExternalAnalysisTag label](self, "label");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  -[CSExternalAnalysisTag synonyms](self, "synonyms");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "encodeObject:", v7);

  -[CSExternalAnalysisTag confidence](self, "confidence");
  objc_msgSend(v8, "encodeDouble:");
  objc_msgSend(v8, "endType");

}

- (CSDocumentUnderstandingCategory)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSDocumentUnderstandingCategory;
  return -[CSExternalAnalysisTag initWithLabel:synonyms:confidence:](&v6, sel_initWithLabel_synonyms_confidence_, a3, a4, a5);
}

@end
