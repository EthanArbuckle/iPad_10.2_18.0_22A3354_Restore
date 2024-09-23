@implementation PKPaletteAttributeViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 0);
  -[PKPaletteAttributeViewController setDidSendDismissStatistics:](self, "setDidSendDismissStatistics:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteAttributeViewController;
  -[PKPaletteAttributeViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteAttributeViewController;
  -[PKPaletteAttributeViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (!-[PKPaletteAttributeViewController didSendDismissStatistics](self, "didSendDismissStatistics"))
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewController toolIdentifier](self, "toolIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewController didExperienceUserInteraction](self, "didExperienceUserInteraction");
    -[PKStatisticsManager recordToolAttributePopoverAppearedForTool:hadInteraction:]((uint64_t)v4, v5);

    -[PKPaletteAttributeViewController setDidSendDismissStatistics:](self, "setDidSendDismissStatistics:", 1);
  }
}

- (BOOL)didExperienceUserInteraction
{
  return self->_didExperienceUserInteraction;
}

- (void)setDidExperienceUserInteraction:(BOOL)a3
{
  self->_didExperienceUserInteraction = a3;
}

- (NSString)toolIdentifier
{
  return self->_toolIdentifier;
}

- (void)setToolIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_toolIdentifier, a3);
}

- (BOOL)didSendDismissStatistics
{
  return self->_didSendDismissStatistics;
}

- (void)setDidSendDismissStatistics:(BOOL)a3
{
  self->_didSendDismissStatistics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolIdentifier, 0);
}

@end
