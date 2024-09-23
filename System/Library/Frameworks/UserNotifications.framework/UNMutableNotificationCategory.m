@implementation UNMutableNotificationCategory

- (void)setOptions:(unint64_t)a3
{
  self->super._options = a3;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->super._backgroundStyle = a3;
}

- (void)setMinimalActions:(id)a3
{
  NSArray *v4;
  NSArray *minimalActions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  minimalActions = self->super._minimalActions;
  self->super._minimalActions = v4;

}

- (void)setIntentIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *intentIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  intentIdentifiers = self->super._intentIdentifiers;
  self->super._intentIdentifiers = v4;

}

- (void)setHiddenPreviewsBodyPlaceholder:(id)a3
{
  NSString *v4;
  NSString *hiddenPreviewsBodyPlaceholder;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  hiddenPreviewsBodyPlaceholder = self->super._hiddenPreviewsBodyPlaceholder;
  self->super._hiddenPreviewsBodyPlaceholder = v4;

}

- (void)setCategorySummaryFormat:(id)a3
{
  NSString *v4;
  NSString *categorySummaryFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  categorySummaryFormat = self->super._categorySummaryFormat;
  self->super._categorySummaryFormat = v4;

}

- (void)setActions:(id)a3
{
  NSArray *v4;
  NSArray *actions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  actions = self->super._actions;
  self->super._actions = v4;

}

- (UNMutableNotificationCategory)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UNMutableNotificationCategory;
  return (UNMutableNotificationCategory *)-[UNNotificationCategory _initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:](&v4, sel__initWithIdentifier_actions_minimalActions_alternateAction_intentIdentifiers_hiddenPreviewsBodyPlaceholder_categorySummaryFormat_actionsMenuTitle_options_backgroundStyle_listPriority_, a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], &stru_1E57F06A0, &stru_1E57F06A0, 0, 0, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  UNNotificationCategory *v14;

  v14 = +[UNNotificationCategory allocWithZone:](UNNotificationCategory, "allocWithZone:", a3);
  -[UNNotificationCategory identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory minimalActions](self, "minimalActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory alternateAction](self, "alternateAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory actionsMenuTitle](self, "actionsMenuTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UNNotificationCategory _initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:](v14, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v13, v4, v5, v6, v7, v8, v9, v10, -[UNNotificationCategory options](self, "options"), -[UNNotificationCategory backgroundStyle](self, "backgroundStyle"), -[UNNotificationCategory listPriority](self, "listPriority"));

  return v11;
}

- (void)setAlternateAction:(id)a3
{
  objc_storeStrong((id *)&self->super._alternateAction, a3);
}

- (void)setActionsMenuTitle:(id)a3
{
  NSString *v4;
  NSString *actionsMenuTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  actionsMenuTitle = self->super._actionsMenuTitle;
  self->super._actionsMenuTitle = v4;

}

- (void)setListPriority:(unint64_t)a3
{
  self->super._listPriority = a3;
}

@end
