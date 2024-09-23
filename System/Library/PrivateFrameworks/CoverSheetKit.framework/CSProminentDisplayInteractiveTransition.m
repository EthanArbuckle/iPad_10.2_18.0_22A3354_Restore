@implementation CSProminentDisplayInteractiveTransition

- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6 cachingVibrancyTransitionProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CSProminentDisplayInteractiveTransition *v17;
  CSProminentDisplayInteractiveTransition *v18;
  uint64_t v19;
  BSUIVibrancyConfiguration *fromVibrancyConfiguration;
  uint64_t v21;
  BSUIVibrancyConfiguration *toVibrancyConfiguration;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CSProminentDisplayInteractiveTransition;
  v17 = -[CSProminentDisplayInteractiveTransition init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_viewController, v12);
    objc_storeStrong((id *)&v18->_baseFont, a4);
    v19 = objc_msgSend(v14, "copy");
    fromVibrancyConfiguration = v18->_fromVibrancyConfiguration;
    v18->_fromVibrancyConfiguration = (BSUIVibrancyConfiguration *)v19;

    v21 = objc_msgSend(v15, "copy");
    toVibrancyConfiguration = v18->_toVibrancyConfiguration;
    v18->_toVibrancyConfiguration = (BSUIVibrancyConfiguration *)v21;

    objc_storeStrong((id *)&v18->_cachingVibrancyTransitionProvider, a7);
  }

  return v18;
}

- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6
{
  return -[CSProminentDisplayInteractiveTransition initWithViewController:baseFont:fromVibrancyConfiguration:toVibrancyConfiguration:cachingVibrancyTransitionProvider:](self, "initWithViewController:baseFont:fromVibrancyConfiguration:toVibrancyConfiguration:cachingVibrancyTransitionProvider:", a3, a4, a5, a6, 0);
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5;

  -[CSProminentDisplayInteractiveTransition viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactiveTransition:didUpdate:", self, a3);

}

- (void)finishInteractiveTransition
{
  id v3;

  -[CSProminentDisplayInteractiveTransition viewController](self, "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveTransition:didFinishSuccessfully:", self, 1);

}

- (void)cancelInteractiveTransition
{
  id v3;

  -[CSProminentDisplayInteractiveTransition viewController](self, "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveTransition:didFinishSuccessfully:", self, 0);

}

- (CSProminentDisplayViewController)viewController
{
  return (CSProminentDisplayViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (BSUIVibrancyConfiguration)fromVibrancyConfiguration
{
  return self->_fromVibrancyConfiguration;
}

- (BSUIVibrancyConfiguration)toVibrancyConfiguration
{
  return self->_toVibrancyConfiguration;
}

- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider
{
  return self->_cachingVibrancyTransitionProvider;
}

- (void)setCachingVibrancyTransitionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, 0);
  objc_storeStrong((id *)&self->_toVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_fromVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
