@implementation FBKInformationCell

+ (id)reuseIdentifier
{
  return CFSTR("FBKInformationCell");
}

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKInformationCell;
  -[FBKInformationCell awakeFromNib](&v4, sel_awakeFromNib);
  -[FBKInformationCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKInformationCell;
  -[FBKInformationCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setQuestion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (objc_msgSend(v5, "answerType") == 6)
  {
    objc_storeStrong((id *)&self->_question, a3);
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKInformationCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBKInformationCell setQuestion:].cold.1(v5, v8);

  }
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (FBKQuestion)question
{
  return self->_question;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

- (void)setQuestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "integerValue");
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Tried to load Information Cell with a non-information type question, question id: %ld", (uint8_t *)&v4, 0xCu);

}

@end
