@implementation PKIndexableContent

- (PKIndexableContent)initWithIndexableContent:(id)a3
{
  CHRecognitionSessionIndexableContent *v4;
  PKIndexableContent *v5;
  CHRecognitionSessionIndexableContent *chIndexableContent;
  objc_super v8;

  v4 = (CHRecognitionSessionIndexableContent *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIndexableContent;
  v5 = -[PKIndexableContent init](&v8, sel_init);
  chIndexableContent = v5->_chIndexableContent;
  v5->_chIndexableContent = v4;

  return v5;
}

- (NSString)indexableTextRepresentation
{
  void *v2;
  void *v3;

  -[PKIndexableContent chIndexableContent](self, "chIndexableContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexableTextRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)presentableTextRepresentation
{
  void *v2;
  void *v3;

  -[PKIndexableContent chIndexableContent](self, "chIndexableContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentableTextRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CHRecognitionSessionIndexableContent)chIndexableContent
{
  return (CHRecognitionSessionIndexableContent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChIndexableContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chIndexableContent, 0);
}

@end
