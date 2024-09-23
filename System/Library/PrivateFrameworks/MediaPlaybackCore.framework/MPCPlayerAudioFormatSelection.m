@implementation MPCPlayerAudioFormatSelection

- (MPCPlayerAudioFormatSelection)initWithExplanation:(id)a3 justification:(id)a4
{
  id v6;
  id v7;
  MPCPlayerAudioFormatSelection *v8;
  uint64_t v9;
  NSString *explanation;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlayerAudioFormatSelection;
  v8 = -[MPCPlayerAudioFormatSelection init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    explanation = v8->_explanation;
    v8->_explanation = (NSString *)v9;

    objc_storeStrong((id *)&v8->_justification, a4);
  }

  return v8;
}

- (MPCPlayerAudioFormatSelection)initWithFormat:(id)a3 explanation:(id)a4 justification:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPCPlayerAudioFormatSelection *v12;
  MPCPlayerAudioFormatSelection *v13;
  uint64_t v14;
  NSString *explanation;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCPlayerAudioFormatSelection;
  v12 = -[MPCPlayerAudioFormatSelection init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_format, a3);
    v14 = objc_msgSend(v10, "copy");
    explanation = v13->_explanation;
    v13->_explanation = (NSString *)v14;

    objc_storeStrong((id *)&v13->_justification, a5);
  }

  return v13;
}

- (MPCPlayerAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)justification
{
  return self->_justification;
}

- (void)setJustification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justification, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
