@implementation GKLoadingCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLoadingCell;
  -[GKLoadingCell awakeFromNib](&v6, sel_awakeFromNib);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLoadingCell loading](self, "loading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UILabel)loading
{
  return self->_loading;
}

- (void)setLoading:(id)a3
{
  objc_storeStrong((id *)&self->_loading, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loading, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
