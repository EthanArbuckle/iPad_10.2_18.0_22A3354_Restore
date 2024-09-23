@implementation CUIKDeleteCalendarsConfirmationInfo

- (CUIKDeleteCalendarsConfirmationInfo)initWithType:(unint64_t)a3 prompt:(id)a4 dialog:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  CUIKDeleteCalendarsConfirmationInfo *v13;
  CUIKDeleteCalendarsConfirmationInfo *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CUIKDeleteCalendarsConfirmationInfo;
  v13 = -[CUIKDeleteCalendarsConfirmationInfo init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CUIKDeleteCalendarsConfirmationInfo setType:](v13, "setType:", a3);
    -[CUIKDeleteCalendarsConfirmationInfo setPrompt:](v14, "setPrompt:", v10);
    -[CUIKDeleteCalendarsConfirmationInfo setDialog:](v14, "setDialog:", v11);
    -[CUIKDeleteCalendarsConfirmationInfo setOptions:](v14, "setOptions:", v12);
  }

  return v14;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
}

@end
