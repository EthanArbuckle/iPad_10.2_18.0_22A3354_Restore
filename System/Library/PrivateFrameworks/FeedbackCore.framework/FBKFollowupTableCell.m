@implementation FBKFollowupTableCell

- (UILabel)promptLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_promptLabel);
}

- (void)setPromptLabel:(id)a3
{
  objc_storeWeak((id *)&self->_promptLabel, a3);
}

- (UILabel)responseLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_responseLabel);
}

- (void)setResponseLabel:(id)a3
{
  objc_storeWeak((id *)&self->_responseLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responseLabel);
  objc_destroyWeak((id *)&self->_promptLabel);
}

@end
