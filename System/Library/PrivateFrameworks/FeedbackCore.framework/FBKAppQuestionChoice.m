@implementation FBKAppQuestionChoice

- (FBKInstalledApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
}

+ (NSString)otherAppChoiceValue
{
  return (NSString *)(id)sub_21DAC4810();
}

@end
