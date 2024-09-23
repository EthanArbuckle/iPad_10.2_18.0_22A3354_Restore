@implementation AAUIOBContactSelectorViewModel

- (AAUIOBContactSelectorViewModel)initWithFlow:(unint64_t)a3
{
  AAUIOBContactSelectorViewModel *v4;
  AAUIOBContactSelectorViewModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIOBContactSelectorViewModel;
  v4 = -[AAUIOBContactSelectorViewModel init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_contentViewLayout = 2;
    -[AAUIOBContactSelectorViewModel _prepareModelForFlow:](v4, "_prepareModelForFlow:", a3);
    v5->_adoptTableViewScrollView = 1;
    v5->_tableViewStyle = 2;
  }
  return v5;
}

- (void)_prepareModelForFlow:(unint64_t)a3
{
  AAOBWelcomeControllerModelProtocol *v4;
  AAOBWelcomeControllerModelProtocol *model;
  NSString *v6;
  NSString *primaryButton;
  NSString *v8;
  NSString *secondaryButton;
  NSString *v10;
  NSString *title;
  NSString *v12;
  NSString *detailText;

  -[AAUIOBContactSelectorViewModel _modelForFlow:](self, "_modelForFlow:", a3);
  v4 = (AAOBWelcomeControllerModelProtocol *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v4;

  -[AAOBWelcomeControllerModelProtocol primaryButton](self->_model, "primaryButton");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  primaryButton = self->_primaryButton;
  self->_primaryButton = v6;

  -[AAOBWelcomeControllerModelProtocol secondaryButton](self->_model, "secondaryButton");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = v8;

  -[AAOBWelcomeControllerModelProtocol title](self->_model, "title");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v10;

  -[AAOBWelcomeControllerModelProtocol detailText](self->_model, "detailText");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailText = self->_detailText;
  self->_detailText = v12;

}

- (id)_modelForFlow:(unint64_t)a3
{
  if (a3 > 1)
    return 0;
  else
    return (id)objc_opt_new();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (BOOL)adoptTableViewScrollView
{
  return self->_adoptTableViewScrollView;
}

- (void)setAdoptTableViewScrollView:(BOOL)a3
{
  self->_adoptTableViewScrollView = a3;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
