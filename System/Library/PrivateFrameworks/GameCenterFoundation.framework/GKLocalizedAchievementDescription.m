@implementation GKLocalizedAchievementDescription

- (id)_localizedStringFromKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[GKLocalizedAchievementDescription game](self, "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameDescriptorDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKContentPropertyList localPropertyListForGameDescriptor:](GKContentPropertyList, "localPropertyListForGameDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)title
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  -[GKLocalizedAchievementDescription title](&v6, sel_title);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalizedAchievementDescription _localizedStringFromKey:](self, "_localizedStringFromKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)achievedDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  -[GKLocalizedAchievementDescription achievedDescription](&v6, sel_achievedDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalizedAchievementDescription _localizedStringFromKey:](self, "_localizedStringFromKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unachievedDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  -[GKLocalizedAchievementDescription unachievedDescription](&v6, sel_unachievedDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalizedAchievementDescription _localizedStringFromKey:](self, "_localizedStringFromKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (GKGame)game
{
  return (GKGame *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGame:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)iconImageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIconImageName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_game, 0);
}

@end
