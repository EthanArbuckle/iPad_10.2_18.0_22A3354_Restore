@implementation FBAInformationCell

+ (id)reuseIdentifier
{
  return CFSTR("FBAInformationCell");
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBAInformationCell;
  -[FBAInformationCell awakeFromNib](&v2, "awakeFromNib");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBAInformationCell;
  -[FBAInformationCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
}

- (void)setQuestion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (objc_msgSend(v5, "answerType") == (id)6)
  {
    objc_storeStrong((id *)&self->_question, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInformationCell textLabel](self, "textLabel"));
    objc_msgSend(v7, "setText:", v6);

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10009ADF4(v5, v8);

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

@end
