@implementation ASReportAConcernConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration title](self, "title"));
  objc_msgSend(v4, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration backTitle](self, "backTitle"));
  objc_msgSend(v4, "setBackTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration cancelTitle](self, "cancelTitle"));
  objc_msgSend(v4, "setCancelTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration submitTitle](self, "submitTitle"));
  objc_msgSend(v4, "setSubmitTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration reportConcernExplanation](self, "reportConcernExplanation"));
  objc_msgSend(v4, "setReportConcernExplanation:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration selectReasonTitle](self, "selectReasonTitle"));
  objc_msgSend(v4, "setSelectReasonTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration selectReasonSubtitle](self, "selectReasonSubtitle"));
  objc_msgSend(v4, "setSelectReasonSubtitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration privacyNote](self, "privacyNote"));
  objc_msgSend(v4, "setPrivacyNote:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernConfiguration reasons](self, "reasons"));
  objc_msgSend(v4, "setReasons:", v13);

  return v4;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (void)setBackTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (void)setCancelTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)submitTitle
{
  return self->_submitTitle;
}

- (void)setSubmitTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void)setReportConcernExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_submitTitle, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_backTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
